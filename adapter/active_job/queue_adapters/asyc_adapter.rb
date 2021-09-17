module ActiveJob
  module QueueAdapters
    class AsyncAdapter
      def initialize(**executor_optoins)
        @scheduler = Scheduler.new(**executor_optoins)
      end

      def enqueue(job)
        @scheduler.enqueue JobWrapper.new(job), queue_name: job.queue_name
      end

      def enqueue_at(job, timestamp)
        @scheduler.enqueue_at JobWrapper.new(job), timestamp, queue_name: job.queue_name
      end

      def shutdown(wait: true)
        @scheduler.shutdown wait: wait
      end

      def immediate=(immediate)
        @scheduler.immediate = immediate
      end

      class JobWrapper
        def initialize(job)
          job.provider_job_id = SecureRandom.uuid
          @job_data = job.serialize
        end

        def perform
          Base.execute @job_data
        end
      end

      class Scheduler
        DEFAULT_EXECUTOR_OPTIONS = {
          min_threads:     0,
          max_threads:     Concurrent.processor_count,
          auto_terminate:  true,
          idletime:        60, # 1 minute
          max_queue:       0, # unlimited
          fallback_policy: :caller_runs # shouldn't matter -- 0 max queue
        }.freeze

        attr_accessor :immediate

        def initialize(**options)
          self.immediate = false
          @immediate_executor = Concurrent::ImmediateExecutor.new
          @async_executor = Concurrent::ThreadPoolExecutor.new(DEFAULT_EXECUTOR_OPTIONS.merge(options))
        end

        def enqueue(job, queue_name:)
          executor.post(job, &:perform)
        end

        def enqueue_at(job, timestamp, queue_name:)
          delay = timestamp - Time.current.to_f
          if delay > 0
            Concurrent::ScheduledTask.execute(delay, args: [job], executor: executor, &:perform)
          else
            enqueue(job, queue_name: queue_name)
          end
        end

        def shutdown(wait: true)
          @async_executor.shutdown
          @async_executor.wait_for_termination if wait
        end

        def executor
          immediate ? @immediate_executor : @async_executor
        end
      end
    end
  end
end
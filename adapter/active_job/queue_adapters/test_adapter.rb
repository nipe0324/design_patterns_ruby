module ActiveJob
  module QueueAdapters
    class TestAdapter
      attr_accessor :perform_enqueued_jobs, :perform_enqueued_at_jobs, :filter, :reject, :queue, :at
      attr_writer :enqueued_jobs, :performed_jobs

      # Store enqueued jobs for test
      def enqueued_jobs
        @enqueued_jobs ||= []
      end

      # Store performed jobs for test
      def performed_jobs
        @performed_jobs ||= []
      end

      # must define
      def enqueue(job)
        job_data = job_to_hash(job)
        perform_or_enqueue(perform_enqueued_jobs && !filtered?(job), job, job_data)
      end

      # must define
      def enqueue_at(job, timestamp)
        job_data = job_to_hash(job, at: timestamp)
        perform_or_enqueue(perform_enqueued_at_jobs && !filtered?(job), job, job_data)
      end

      private

      def job_to_hash(job, extras = {})
        job.serialize.tap do |job_data|
          job_data[:job] = job.class
          job_data[:args] = job_data.fetch("arguments")
          job_data[:queue] = job_data.fetch("queue_name")
        end.merge(extras)
      end

      def perform_or_enqueue(perform, job, job_data)
        if perform
          performed_jobs << job_data
          Base.execute(job.serialize)
        else
          enqueued_jobs << job_data
        end
      end

      def filtered?(job)
        filtered_queue?(job) || filtered_job_class?(job) || filtered_time?(job)
      end

      def filtered_time?(job)
        job.scheduled_at > at.to_f if at && job.scheduled_at
      end

      def filtered_queue?(job)
        if queue
          job.queue_name != queue.to_s
        end
      end

      def filtered_job_class?(job)
        if filter
          !filter_as_proc(filter).call(job)
        elsif reject
          filter_as_proc(reject).call(job)
        end
      end

      def filter_as_proc(filter)
        return filter if filter.is_a?(Proc)

        ->(job) { Array(filter).include?(job.class) }
      end
    end
  end
end
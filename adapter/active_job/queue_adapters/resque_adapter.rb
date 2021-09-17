require 'resque'

module ActiveJob
  module QueueAdapters
    class ResqueAdapter
      def enqueue(job)
        JobWrapper.instance_variable_set(:@queue, job.queue_name)
        Resque.enqueue_to job.queue_name, JobWrapper, job.serialize
      end

      def enqueue_at(job, timestamp)
        unless Resque.respond_to?(:enqueue_at_with_queue)
          raise NotImplementedError, "To be able to schedule jobs with Resque you need the " \
            "resque-scheduler gem. Please add it to your Gemfile and run bundle install"
        end
        
        Resque.enqueue_at_with_queue job.queue_name, timestamp, JobWrapper, job.serialize
      end

      class JobWrapper
        class << self
          def perform(job_data)
            Base.execute job_data
          end
        end
      end
    end
  end
end
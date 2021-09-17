require 'sidekiq'

module ActiveJob
  module QueueAdapters
    class SidekiqAdapter
      def enqueue(job)
        job.provider_job_id = Sidekiq::Client.push \
          "class"   => JobWrapper,
          "wrapped" => job.class,
          "queue"   => job.queue_name,
          "args"    => [ job.serialize ]
      end

      def enqueue_at(job, timestamp)
        job.provider_job_id = Sidekiq::Client.push \
          "class"   => JobWrapper,
          "wrapped" => job.class,
          "queue"   => job.queue_name,
          "args"    => [ job.serialize ]
          "at"      => timestamp
      end

      class JobWrapper
        include Sidekiq::Worker

        def perform(job_data)
          Base.execute job_data.merge("provider_job_id" => jid)
        end
      end
    end
  end
end
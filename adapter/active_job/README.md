## ActiveJob::QueueAdapters

### Adapterクラスの実装

* `ActiveJob::QueueAdapters`配下に`enqueue(job)`と`enqueue_at(job, timestampt)`のメソッド（インターフェース）を実装した`Adapter`クラスを用意する

```rb
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
```

### Adapterクラスの利用

* `ActiveJob.perform_later`が呼びだされたときに、`Adapter`クラスを使うことで`enqueue`や`enqueue_at`が呼びだせばよいのでシンプル

```rb
module ActiveJob
  module Enqueuing
    extend ActiveSupport::Concern

    module ClassMethods
      def perform_later(*args)
        job_or_instantinate(*args).enqueue
      end

      private

      def job_or_instantinate(*args)
        args.first.is_a?(self) ? args.first : new(*args)
      end
    end

    def enqueue(options = {})
      self.scheduled_at = options[:wait].seconds.from_now.to_f if options[:wait]
      self.scheduled_at = options[:wait_until].to_f if options[:wait_until]
      self.queue_name   = self.class.queue_name_from_part(options[:queue]) if options[:queue]
      self.priority     = options[:priority].to_i if options[:priority]
      successfully_enqueued = false

      run_callbacks :enqueue do
        # NOTE: Adapterを使うことでインターフェース（メソッド）を統一している
        if scheduled_at
          queue_adapter.enqueue_at self, scheduled_at
        else
          queue_adapter.enqueue self
        end

        successfully_enqueued = true
      end

      if successfully_enqueued
        self
      else
        false
      end
    end
  end
end
```
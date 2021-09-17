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
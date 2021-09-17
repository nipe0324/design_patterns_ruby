module ActiveJob
  module QueueAdapters
    class InlineAdapter
      def enqueue(job)
        Base.execute(job.serialize)
      end

      def enqueue_at(*)
        raise NotImplementedError
      end
    end
  end
end
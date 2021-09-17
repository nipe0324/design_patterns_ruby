module ActiveJob
  module QueueAdapters
    class InlineAdapter
      # must define
      def enqueue(job)
        Base.execute(job.serialize)
      end

      # must define
      def enqueue_at(*)
        raise NotImplementedError
      end
    end
  end
end
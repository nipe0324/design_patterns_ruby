module ActiveJob
  module Execution
    extend ActiveSupport::Concern

    module ClassMethods
      def perform_now(*args)
        job_or_instantinate(*args).perform_now
      end

      def execute(job_data)
        ActiveJob::Callbacks.run_callbacks(:execute) do
          job = deserialize(job_data)
          job.perform_now
        end
      end
    end

    def perform_now
      self.executions = (executions || 0) + 1

      deserialize_arguments_if_needed

      run_callbacks :perform do
        perform(*arguments)
      end
    rescue => exception
      rescue_with_handler(exception) || raise
    end

    def perform(*)
      fail NotImplementedError
    end
  end
end
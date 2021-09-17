module ActiveJob
  module QueueAdapter
    module ClassMethods
      extend ActiveSupport::Concern

      included do
        class_attribute :_queue_adapter_name, instance_accessor: false, instance_predicate: false
        class_attribute :_queue_adapter, instance_accessor: false, instance_predicate: false
  
        delegate :queue_adapter, to: :class
  
        self.queue_adapter = :async
      end
      
      # Specify the backend queue provier
      def queue_adapter=(name_or_adapter)
        case name_or_adapter
        when Symbol, String
          queue_adapter = ActiveJob::QueueAdapters.lookup(name_or_adapter).new
          assign_adapter(name_or_adapter.to_s, queue_adapter)
        else
          if queue_adapter?(name_or_adapter)
            adapter_name = "#{name_or_adapter.class.name.demodulize.remove('Adapter').underscore}"
            assign_adapter(adapter_name, name_or_adapter)
          else
            raise ArgumentError
          end
        end

        private

        def assign_adapter(adapter_name, queue_adapter)
          self._queue_adapter_name = adapter_name
          self._queue_adapter = queue_adapter
        end

        QUEUE_ADAPTER_METHODS = [:enqueue, :enqueue_at].freeze

        def queue_adapter?(object)
          QUEUE_ADAPTER_METHODS.all? { |meth| object.respond_to?(meth) }
        end
      end
    end
  end
end
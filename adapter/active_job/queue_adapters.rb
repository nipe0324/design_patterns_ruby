module ActiveJob
  module QueueAdapters
    extend ActiveSupport::Autoload

    autoload :AsyncAdapter
    autoload :InlineAdapter
    autoload :TestAdapter

    ADAPTER = "Adapter"
    private_constant :ADAPTER

    class << self
      # Returns adapter for specified name
      def lookup(name)
        const_get(name.to_s.camelize << ADAPTER)
      end
    end
  end
end

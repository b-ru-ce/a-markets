module Database
  class Base
    @instance = new
    private_class_method :new
    attr_reader :db_provider

    def self.instance
      @instance
    end

    def connect(config)
      adapter_name = config[:adapter]
      adapter_file = "#{__dir__}/lib/database/providers/#{adapter_name}.rb"

      if File.exist?(adapter_file)
        require adapter_file
        @@db_provider = Module"Database::Providers::#{adapter_name.to_s.camelize}".constantize.new(config)
      else
        raise "Database provider not found"
      end
      @db_provider
    end

    def query(query_object)
      db_provider.query(query_object)
    end
  end
end
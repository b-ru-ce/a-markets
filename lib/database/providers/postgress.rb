require 'pg'

module DbAdapters
  class Postgress
    attr_reader :connection

    def initialize(config)
      @connection = connect!
    end

    def query(query_object)
      sql = query_builder.call(query_object)

      connection.exec(sql) do |result|
        # TODO: need add result handler
        result.each do |row|
          row
        end
      end
    end

    private

    def connect!(config)
      PG.connect(config)
    end

    def datatype_adapter
      Database::Providers::Postgress::DatatypeAdapter
    end

    def query_builder
      Database::Providers::Postgress::QueryBuilder
    end
  end
end
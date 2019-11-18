module WebRepresentation
  module Repository
    class Poster
      class << self
        def all
          connection.query(query_object)
        end

        def find(id)
          query_object.set_condition(:where, id: id)
          connection.query(query_object)
        end

        def find_by_range(range)
          query_object.set_condition(:where, range: range)
          connection.query(query_object)
        end

        def insert(poster)
          query_object.request_type = :insert
          query_object.set_condition(:data, mapper.to_source(poster))
          query_object.set_condition(:fields, mapper.column_map.keys)
          connection.query(query_object)
        end

        def delete(id)
          query_object.request_type = :delete
          query_object.set_condition(:where, id: id)
          connection.query(query_object)
        end
        private

        def connection
          Database::Base.instance
        end

        def mapper
          Mapper::Poster
        end

        def query_object
          @query_object ||= Database::QueryObject.new(mapper)
        end
      end
    end
  end
end
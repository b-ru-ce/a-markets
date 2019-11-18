module Database
  module Providers
    module Postgress
      class QueryBuilder
        TEMPLATES = {
            select: "SELECT %{select} FROM %{table_name} %{where} %{order} %{group_by} %{limit}",
            delete: "DELETE FROM %{table_name} %{where}",
            insert: "INSERT INTO %{table_name} (%{insert_values)"
        }
        class << self
          def call(query_object)
            conditions = build_conditions(query_object)

            sql = TEMPLATES[query_object.request_type] % conditions
            sql
          end

          private

          def datatype_adapter
            Database::Providers::Postgress::DatatypeAdapter
          end

          def build_where_condition(condition, mapper)
            condition.map do |key, value|
              "#{key} = " + datatype_adapter.to_db(mapper.column_map[key][:type], value)
            end.join(' AND ')
          end

          def build_conditions(query_object)
            conditions = query_object.conditions
            conditions[:where] = build_where_condition(conditions[:where], query_object.mapper) if(conditions[:where])

            conditions[:from] = query_object.mapper.table_name
            conditions
          end

          def select(conditions)
            'SELECT %{select} FROM %{table_name} %{where} %{order} %{group_by} %{limit}' % conditions
          end

          def delete(conditions)
            '' % conditions
          end

          def insert(conditions)
            @sql = '' % conditions
          end
        end

      end
    end
  end
end
module WebRepresentation
  module Mapper
    class Poster
      MAP = {
          id: { type: :integer },
          name: { type: :string },
          date_range: { type: :date_range }
      }

      class << self
        def to_source(entity)
          column_map.map do |name, options|
            entity.send(name).to_s
          end
        end

        def from_source(row)
          hash = {}
          column_map.each do |name, options|
            hash[name.to_sym] = row[name.to_s]
          end
          hash
        end

        def column_map
          MAP
        end

        def table_name
          "posters"
        end
      end
    end
  end
end
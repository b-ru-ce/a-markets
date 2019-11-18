module Database
  module Providers
    module Postgress
      class DatatypeAdapter
         def self.to_db(type, value)
            case type
            when :date_range
              value = value.split('..')
              "[#{value.first.to_s},#{value.last.to_s}]"
            else
              value.to_s
            end
         end

         def self.from_db(type, value)
            case type
            when :integer
              value.to_i
            when :date_range
              value.strip[1..-2].gsub(',', '..')
            else
              value.to_s
            end
         end
      end
    end
  end
end
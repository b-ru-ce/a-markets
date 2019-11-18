module WebRepresentation
  module Entity
    class Poster
      attr_accessor :name, :date_range, :id

      def initialize(name:, date_range:, id: nil)
        @name = name
        @date_range = date_range
        @id = id
      end

      def date_range=(date_range)
        if date_range.is_a?(WebRepresentation::Values::DateRange)
          @date_range = date_range
        else
          @date_range = WebRepresentation::Values::DateRange.new(date_range)
        end
      end
    end
  end
end
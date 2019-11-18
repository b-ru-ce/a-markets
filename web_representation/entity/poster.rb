module WebRepresentation
  module Entity
    class Poster
      attr_accessor :name, :date_range

      def initialize(name:, date_range:)
        @name = name
        @date_range = date_range
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
require 'date'

module WebRepresentation
  module Values
    class DateRange
      attr_reader :range

      def initialize(value)
        if value.is_a?(String)
          dates = value.split('..')
          start_date = ::Date.parse(dates[0])
          end_date = ::Date.parse(dates[1])
          @range = (start_date..end_date)
        else
          @range = value
        end
      end

      def in?(value)
        if value.is_a?(String)
          value = Date.parse(value)
        end

        range.cover? value
      end

      def to_s
        range.to_s
      end

    end
  end
end
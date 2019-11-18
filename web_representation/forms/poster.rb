module WebRepresentation
  module Forms
    class Poster
      attr_accessor :poster

      def initialize(params)
        date_range = Values::DateRange.new(params['date_range'])
        @poster = Entity::Poster(name: params["name"], date_range: date_range)
      end

      def submit!
        if validator.valid?
          Repository::Poster.insert(poster)
        else
          validator.errors
        end
      end

      private

      def validator
        Validations::Poster.new(poster)
      end
    end
  end
end
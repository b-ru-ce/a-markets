module WebRepresentation
  module Validations
    class Poster
      attr_reader :errors
      def initialize(poster)
        @poster = poster
        @errors = []
      end

      def valid?
        if poster.range
          errors << ['range already exist'] if Repository::Poster.find_by_range(poster.range)
        else
          errors << ['range is not set']
        end

        errors << ['name is too long'] if poster.name.length > 256
        errors.empty?
      end
    end
  end
end
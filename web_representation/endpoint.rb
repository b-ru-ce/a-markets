module WebRepresentation
  class Endpoint
    attr_accessor :params

    def initialize(params)
      @params = params
    end

    def create
      form = Forms::Poster.new(params)
      if form.submit!
        { success: true }
      else
        form.errors
      end
    end

    def index
      Repository::Poster.all.map do |poster|
        Mapper::Poster.to_source(poster)
      end
    end

    def delete
      if Repository::Poster.delete(params['id'])
        { success: true }
      else
        { success: false }
      end
    end
  end
end
module Router
  class Base
    attr_accessor :routes

    def initialize(routes)
      @routes = routes
    end

    def resolve(path)
      route = routes_recognizer.call(path, routes)
      if route
        module_name = route[:module].split('_').collect(&:capitalize).join
        route[:endpoint_class_name] = module_name + "::Endpoint"
        route
      else
        nil
      end
    end

    private

    def routes_recognizer
      ::Router::Recognizer
    end
  end
end
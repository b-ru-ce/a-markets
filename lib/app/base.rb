module App
  class Base
    def call(env)
      req = Rack::Request.new(env)
      route = router.resolve(req.path)

      autoloader.call(route[:module])

      if route
        set_connection!
        endpoint = Module.const_get(route[:endpoint_class_name]).new(req.params)
        body = endpoint.send(route[:action])
        ['200', {'Content-Type' => 'text/plain'}, [body]]
      else
        body = "Not found\n"
        headers = {"Content-Type" => "text/html", "Content-Length" => body.size.to_s}
        ['404', headers, [body]]
      end
    end

    private

    def set_connection!
      Database::Base.instance.connect(Config::Base.instance.database)
    end

    def router
      @router ||= ::Router::Base.new(Config::Base.instance.routes)
    end

    def autoloader
      ::Autoloader::Base
    end

  end
end
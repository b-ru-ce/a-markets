module Router
  class Recognizer
    def self.call(path, routes)
      routes.find{|route| route[:path] == path }
    end
  end
end
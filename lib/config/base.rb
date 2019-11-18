require 'yaml'

module Config
  class Base
    @instance = new
    private_class_method :new
    attr_accessor :config

    def self.instance
      @instance
    end

    def database
      @database ||= symbolize_keys(get_config('database')['database'])
    end

    def routes
      @routes ||= get_config('routes')["routes"].map{|hash| symbolize_keys(hash) }
    end

    private

    def get_config(name)
      ::YAML.load(File.read("#{config_path}/#{name}.yml"))
    end

    def config_path
      # require 'pp'

      ENV['CONFIG_PATH'] || "config"

    end

    def symbolize_keys(hash)
      hash.keys.each do |key|
        hash[(key.to_sym rescue key) || key] = hash.delete(key)
      end
      hash
    end

  end
end

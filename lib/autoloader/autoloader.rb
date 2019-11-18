module Autoloader
  class Base
    def self.call(module_name)
      # TODO write correct autoloader
      Dir[Dir.pwd + "/#{module_name}/**/*.rb"].each{|filename| require filename }
    end
  end
end
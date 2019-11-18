require "spec_helper"

describe Config::Base do
  let(:config) {
    Config::Base.instance
  }

  describe '#routes' do
    let(:routes) {
      [
          { path: "/test/create", module: "module_1", action: "create" },
          { path: "/test_2/delete", module: "module_2", action: "delete" }
      ]
    }

    it('should return routes config'){
      expect(config.routes).to eql(routes)
    }
  end

  describe '#database' do
    let(:database_config){
      {
          adapter: "postgres",
          database: "test_db",
          host:"localhost"
      }
    }

    it('should return database config'){
      expect(config.database).to eql(database_config)
    }
  end

end
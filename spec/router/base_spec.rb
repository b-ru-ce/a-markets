require "spec_helper"

describe Router::Base do
  let(:router) {
    described_class.new(routes)
  }

  let(:route_1) {
     { path: "/test/create", module: "module_name", action: "create" }
  }

  let(:routes) {
    [
       route_1
    ]
  }

  describe '#reslove' do
    it('should correct resolve endpoint class name') {
      expect(router.resolve(route_1[:path])[:endpoint_class_name]).to eql("ModuleName::Endpoint")
    }

    it('should return nil if route not found') {
      expect(router.resolve('bad/route/path')).to eql(nil)
    }
  end


end
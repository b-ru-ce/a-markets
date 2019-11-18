require "spec_helper"

describe Router::Recognizer do
  let(:recognizer) {
    described_class
  }

  let(:route_1) {
    { path: "/test/create", module: "module_1", action: "create" }
  }

  let(:route_2) {
    { path: "/test/create", module: "module_1", action: "create" }
  }

  let(:routes) {
    [
        route_1,
        route_2
    ]
  }

  it('should return route') {
    expect(recognizer.call(route_1[:path], routes)).to eql(route_1)
  }

  it('should return nil it route not found') {
    expect(recognizer.call('bad/route/path', routes)).to eql(nil)
  }

end
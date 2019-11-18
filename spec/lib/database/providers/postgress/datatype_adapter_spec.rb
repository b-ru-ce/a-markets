require "spec_helper"

describe Database::Providers::Postgress::DatatypeAdapter do
  let(:adapter) {
    described_class
  }

  describe "#to_db" do
    it "date_range type" do
      expect(adapter.to_db(:date_range, "2009.10.01..2009.10.02")).to eql("[2009.10.01,2009.10.02]")
    end

    it "integer type" do
      expect(adapter.to_db(:integer, 123)).to eql("123")
    end

    it "string type" do
      expect(adapter.to_db(:string, "string")).to eql("string")
    end

  end


  describe "#from_db" do
    it "date_range type" do
      expect(adapter.from_db(:date_range, "[2009.10.01,2009.10.02]")).to eql("2009.10.01..2009.10.02")
    end

    it "integer type" do
      expect(adapter.from_db(:integer, "123")).to eql(123)
    end

    it "string type" do
      expect(adapter.from_db(:string, "string")).to eql("string")
    end

  end


end
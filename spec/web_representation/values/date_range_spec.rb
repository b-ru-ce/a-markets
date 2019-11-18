require_relative  "../../web_representation_helper"

describe WebRepresentation::Values::DateRange do
  let(:date_range) {
    described_class.new(init_value)
  }

  let(:start_date){
    Date.parse("2019-11-01")
  }

  let(:end_date){
    Date.parse("2019-11-25")
  }

  describe "init by string" do
    let(:init_value) {
      "#{start_date}..#{end_date}"
    }

    it('#to_s') {
      expect(date_range.to_s).to eql(init_value)
    }
    it('#date_range') {
      expect(date_range.range).to eql((start_date..end_date))
    }

    it('#in? should found date') {
      expect(date_range.in?(start_date)).to be true
      expect(date_range.in?(end_date.to_s)).to be true
      expect(date_range.in?(end_date + 2)).to be false
    }
  end


  describe "init by range" do
    let(:init_value) {
      (start_date..end_date)
    }

    it('#date_range') {
      expect(date_range.range).to eql(init_value)
    }
  end
end
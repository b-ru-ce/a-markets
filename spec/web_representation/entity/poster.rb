require_relative  "../../web_representation_helper"

describe WebRepresentation::Entity::Poster do
  let(:date_range) {
    WebRepresentation::Values::DateRange.new("2019-11-01..2019-11-25")
  }

  let(:poster){
    described_class.new(name: name, date_range: date_range, id: 123)
  }

  let(:name){
    "seven kids"
  }

  it('should correct init date_range') {
    expect(poster.date_range).to eql(date_range)
  }

  it('should correct init name') {
    expect(poster.name).to eql(name)
  }

  it('should correct init id') {
    expect(poster.id).to eql(id)
  }

  it('#date_range= should work with WebRepresentation::Values::DateRange') {
    new_date_range =  WebRepresentation::Values::DateRange.new("2019-11-01..2019-11-15")
    poster.date_range = new_date_range
    expect(poster.date_range).to eql(new_date_range)
  }

  it('#date_range= should work with string') {
    new_date_range =  WebRepresentation::Values::DateRange.new("2019-11-01..2019-11-15")
    poster.date_range = "2019-11-01..2019-11-15"
    expect(poster.date_range.range).to eql(new_date_range.range)
  }


end
require_relative  "../../web_representation_helper"

describe WebRepresentation::Mapper::Poster do
  let(:mapper) {
    described_class
  }

  describe "#to_source" do
    let(:date_range) {
      WebRepresentation::Values::DateRange.new("2019-11-01..2019-11-25")
    }

    let(:poster) {
      WebRepresentation::Entity::Poster.new(name: name, date_range: date_range)
    }

    let(:name) {
      "seven kids"
    }

    it('should return array ') {
      expect(mapper.to_source(poster)).to eql(["", "seven kids", "2019-11-01..2019-11-25"])
    }
  end

  describe "#from_source" do
    let(:source) {
      { "id" => 123, "name" => "seven kids", "date_range" => "2019-11-01..2019-11-25", "something_else" => "test"}
    }

    it('should return array ') {
      expect(mapper.from_source(source)).to eql({id: 123, name: "seven kids", date_range: "2019-11-01..2019-11-25"})
    }
  end

  it('#coulmn_map should return map') {
    expect(mapper.column_map).to eql({ id: { type: :integer }, name: { type: :string }, date_range: { type: :date_range } })
  }

  it('#table_name should posters') {
    expect(mapper.table_name).to eql('posters')
  }

end
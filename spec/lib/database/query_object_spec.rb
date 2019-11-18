require "spec_helper"

describe Database::QueryObject do
  let(:mapper_mock) {
    OpenStruct.new(
        table_name: "tests",
        column_map: {} )
  }
  let(:query_object) {
    described_class.new(mapper_mock)
  }

  let(:default_condition){
     []
  }

  it "should return default condition" do
    expect(query_object.conditions).to eql(default_condition)
  end

  it "#table_name" do
    expect(query_object.mapper.table_name).to eql("tests")
  end

  describe '#add_condition' do
    let(:additional_conditions) {
      [
          { name: "where", params: {id: 123} }
      ]
    }

    let(:expected_condition){
      [ { name: "where", params: {id: 123} } ]
    }

    it "#add_condition should save condition" do
      additional_conditions.each do |condition|
        query_object.set_condition(condition[:name], condition[:params] )
      end
      expect(query_object.conditions).to eql(expected_condition)
    end
  end


end
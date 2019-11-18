require "spec_helper"

describe Database::QueryObject do
  let(:column_map){
    {
        id: { type: :integer },
        name: { type: :string },
        date_range: { type: :date_range }
    }
  }

  let(:mapper_mock) {
    OpenStruct.new(
        table_name: "tests",
        column_map: column_map )
  }

  let(:query_object) {
    described_class.new(mapper_mock)
  }

  # TODO: Tests here


end
module Database
  class QueryObject
    attr_accessor :mapper, :request_type

    def initialize(mapper)
      @mapper = mapper
    end

    def conditions
      @conditions ||= []
    end

    def request_type
      @request_type ||= :select
    end

    def set_condition(name, params)
      conditions << {name: name, params: params}
    end

  end
end
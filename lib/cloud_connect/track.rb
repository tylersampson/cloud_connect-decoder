module CloudConnect
  class Track
    attr_accessor :asset,
                  :id,
                  :id_str,
                  :recorded_at,
                  :recorded_at_ms,
                  :received_at,
                  :loc,
                  :fields

    def initialize(payload)
      @asset = payload['asset']
      @id = payload['id']
      @id_str = payload['id_str']
      @recorded_at = Time.parse(payload['recorded_at'])
      @recorded_at_ms = Time.parse(payload['recorded_at_ms'])
      @received_at = Time.parse(payload['received_at'])
      @loc = payload['loc']
      @fields = payload['fields'].collect { |k,v| [k, CloudConnect::Field.new(k, v['b64_value'])] }.to_h
    end

    def method_missing(method_name, *arguments, &block)
      key = method_name.to_s.upcase
      if @fields.has_key? key
        @fields[key]
      else
        nil
      end
    end

    def respond_to?(method_name, include_private = false)
      true
    end
  end
end

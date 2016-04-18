module CloudConnect
  class Field
    attr_accessor :name, :b64_value

    def initialize(name, b64_value)
      @name = name
      @b64_value = b64_value
      @decoded = Base64.decode64(@b64_value)
    end

    def to_i
      @decoded.unpack('N').first
    end

    def to_s
      @decoded
    end

    def to_f
      @decoded.to_f
    end

    def to_b
      @decoded.unpack('C').first == 1
    end
  end
end

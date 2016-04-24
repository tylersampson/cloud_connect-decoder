module CloudConnect
  class Track
    attr_accessor :asset,
                  :id,
                  :id_str,
                  :recorded_at,
                  :recorded_at_ms,
                  :received_at,
                  :loc,
                  :connection_id,
                  :index,
                  :next_index,
                  :fields

    def initialize(payload)
      @asset = payload['asset']
      @id = payload['id']
      @id_str = payload['id_str']
      @recorded_at = Time.parse(payload['recorded_at'])
      @recorded_at_ms = Time.parse(payload['recorded_at_ms'])
      @received_at = Time.parse(payload['received_at'])
      @loc = payload['loc']
      @connection_id = payload['connection_id']
      @index = payload['index']
      @next_index = (@index || 0) + payload['fields'].count + 1
      @fields = payload['fields'].collect { |k,v| [k, CloudConnect::Field.new(k, v['b64_value'])] }.to_h
    end

    def speed
      @speed ||= ((@fields['GPS_SPEED'].try(:to_i) || 0) * 1.852 / 1000.0).round(2)
    end

    def total_kms
      @total_kms ||= @fields['ODO_FULL'].try(:to_i) || 0
    end

    def driver_id
      @driver_id ||= @fields['DRIVER_ID'].try(:to_s)
    end

    def ignition
      @ignition ||= @fields['DIO_IGNITION'].try(:to_b) || false
    end

    def valid_fix
      @valid_fix ||= @fields['GPRMC_VALID'].try(:to_s) == 'A'
    end

    def acceleration
      @acceleration ||= \
      case @fields['BEHAVE_ID'].try(:to_i)
      when 11
        :braking
      when 12
        :acceleration
      when 13
        :left_turn
      when 14
        :right_turn
      end
    end

    def crash_level
      if @fields.has_key? 'MDI_CRASH_DETECTED'
        severity,status = @fields['MDI_CRASH_DETECTED'].to_s.split(":")
        status == '2' ? severity.to_i : false
      end
    end

    def battery_discharge
      @battery_discharge ||= @fields['BATT'].try(:to_b)
    end

    def battery_voltage
      @battery_voltage ||= @fields['BATT_VOLT'].try(:to_i)
    end

    def power_voltage
      @power_voltage ||= @fields['MDI_EXT_BATT_VOLTAGE'].try(:to_f)
    end

    def direction
      @direction ||= (@fields['GPS_DIR'].try(:to_i) || 0) / 100.0
    end

    def panic_button
      @panic_button ||= @fields['MDI_PANIC_STATE'].try(:to_b)
    end

    def inputs
      @inputs ||= @fields['DIO_IN_TOR'].try(:to_i)
    end

    def satellite_fixes
      @satellite_fixes ||= @fields['GPS_FIXED_SAT_NUM'].try(:to_i)
    end

    def gprs_header
      @gprs_header ||= @fields['GPRS_HEADER'].try(:to_s)
    end

    def rssi
      @rssi ||= @fields['RSSI'].try(:to_i)
    end

    def movement
      @movement ||= @fields['MVT_STATE'].try(:to_b)
    end

    def max_speed
      @max_speed ||= @fields['MDI_MAX_SPEED_JOURNEY'].try(:to_i)
    end

  end
end

require 'spec_helper'

describe CloudConnect::Track do

  before { @track = CloudConnect::Track.new(JSON.parse("{\"id\":833327889830134209,\"connection_id\":833327874105672129,\"id_str\":\"833327889830134209\",\"connection_id_str\":\"833327874105672129\",\"index\":6,\"asset\":\"351732051095381\",\"recorded_at\":\"2016-04-18T13:06:39Z\",\"recorded_at_ms\":\"2016-04-18T13:06:39.000Z\",\"received_at\":\"2016-04-18T13:07:31Z\",\"fields\":{\"GPS_FIXED_SAT_NUM\":{\"b64_value\":\"AAAAAA==\"},\"RSSI\":{\"b64_value\":\"AAAAYw==\"},\"GPRMC_VALID\":{\"b64_value\":\"Vg==\"},\"EVENT\":{\"b64_value\":\"Qjoy\"},\"DIO_IGNITION\":{\"b64_value\":\"AQ==\"},\"MDI_RECORD_REASON\":{\"b64_value\":\"MDox\"}}}")) }

  it 'should map fields to dynamic methods' do
    expect(@track).to respond_to :gps_fixed_sat_num
  end

  it 'should correcly parse recorded_at as timestamp' do
    expect(@track.recorded_at.class).to eq Time
  end

end

require 'spec_helper'

describe CloudConnect::Decoder do
  before { @notification = "[{\"meta\":{\"account\":\"pegasus\",\"event\":\"track\"},\"payload\":{\"id\":833327889830134209,\"connection_id\":833327874105672129,\"id_str\":\"833327889830134209\",\"connection_id_str\":\"833327874105672129\",\"index\":6,\"asset\":\"351732051095381\",\"recorded_at\":\"2016-04-18T13:06:39Z\",\"recorded_at_ms\":\"2016-04-18T13:06:39.000Z\",\"received_at\":\"2016-04-18T13:07:31Z\",\"fields\":{\"GPS_FIXED_SAT_NUM\":{\"b64_value\":\"AAAAAA==\"},\"RSSI\":{\"b64_value\":\"AAAAYw==\"},\"GPRMC_VALID\":{\"b64_value\":\"Vg==\"},\"EVENT\":{\"b64_value\":\"Qjoy\"},\"DIO_IGNITION\":{\"b64_value\":\"AQ==\"},\"MDI_RECORD_REASON\":{\"b64_value\":\"MDox\"}}}},{\"meta\":{\"account\":\"pegasus\",\"event\":\"track\"},\"payload\":{\"id\":833327889834312129,\"connection_id\":833327874105672129,\"id_str\":\"833327889834312129\",\"connection_id_str\":\"833327874105672129\",\"index\":13,\"asset\":\"351732051095381\",\"recorded_at\":\"2016-04-18T13:06:39Z\",\"recorded_at_ms\":\"2016-04-18T13:06:39.001Z\",\"received_at\":\"2016-04-18T13:07:31Z\",\"fields\":{\"DIO_IGNITION\":{\"b64_value\":\"AA==\"}}}},{\"meta\":{\"account\":\"pegasus\",\"event\":\"track\"},\"payload\":{\"id\":833327889834328513,\"connection_id\":833327874105672129,\"id_str\":\"833327889834328513\",\"connection_id_str\":\"833327874105672129\",\"index\":15,\"asset\":\"351732051095381\",\"recorded_at\":\"2016-04-18T13:06:39Z\",\"recorded_at_ms\":\"2016-04-18T13:06:39.002Z\",\"received_at\":\"2016-04-18T13:07:31Z\",\"fields\":{\"DIO_IGNITION\":{\"b64_value\":\"AQ==\"}}}},{\"meta\":{\"account\":\"pegasus\",\"event\":\"track\"},\"payload\":{\"id\":833327889834344897,\"connection_id\":833327874105672129,\"id_str\":\"833327889834344897\",\"connection_id_str\":\"833327874105672129\",\"index\":17,\"asset\":\"351732051095381\",\"recorded_at\":\"2016-04-18T13:06:40Z\",\"recorded_at_ms\":\"2016-04-18T13:06:40.000Z\",\"received_at\":\"2016-04-18T13:07:31Z\",\"fields\":{\"DIO_IGNITION\":{\"b64_value\":\"AA==\"},\"MDI_RECORD_REASON\":{\"b64_value\":\"MDow\"}}}},{\"meta\":{\"account\":\"pegasus\",\"event\":\"track\"},\"payload\":{\"id\":833327889838506433,\"connection_id\":833327874105672129,\"id_str\":\"833327889838506433\",\"connection_id_str\":\"833327874105672129\",\"index\":20,\"asset\":\"351732051095381\",\"recorded_at\":\"2016-04-18T13:06:41Z\",\"recorded_at_ms\":\"2016-04-18T13:06:41.000Z\",\"received_at\":\"2016-04-18T13:07:31Z\",\"fields\":{\"DIO_IGNITION\":{\"b64_value\":\"AQ==\"},\"MDI_RECORD_REASON\":{\"b64_value\":\"MDox\"}}}},{\"meta\":{\"account\":\"pegasus\",\"event\":\"track\"},\"payload\":{\"id\":833327889838522817,\"connection_id\":833327874105672129,\"id_str\":\"833327889838522817\",\"connection_id_str\":\"833327874105672129\",\"index\":23,\"asset\":\"351732051095381\",\"recorded_at\":\"2016-04-18T13:06:47Z\",\"recorded_at_ms\":\"2016-04-18T13:06:47.000Z\",\"received_at\":\"2016-04-18T13:07:31Z\",\"fields\":{\"DIO_IGNITION\":{\"b64_value\":\"AA==\"},\"MDI_RECORD_REASON\":{\"b64_value\":\"MDow\"},\"DRIVER_ID\":{\"b64_value\":\"MDAwMDAwMDAwMDAwMDAwMA==\"}}}},{\"meta\":{\"account\":\"pegasus\",\"event\":\"track\"},\"payload\":{\"id\":833327889838539201,\"connection_id\":833327874105672129,\"id_str\":\"833327889838539201\",\"connection_id_str\":\"833327874105672129\",\"index\":27,\"asset\":\"351732051095381\",\"recorded_at\":\"2016-04-18T13:06:48Z\",\"recorded_at_ms\":\"2016-04-18T13:06:48.000Z\",\"received_at\":\"2016-04-18T13:07:31Z\",\"fields\":{}}},{\"meta\":{\"account\":\"pegasus\",\"event\":\"track\"},\"payload\":{\"id\":833327889842700737,\"connection_id\":833327874105672129,\"id_str\":\"833327889842700737\",\"connection_id_str\":\"833327874105672129\",\"index\":28,\"asset\":\"351732051095381\",\"recorded_at\":\"2016-04-18T13:06:49Z\",\"recorded_at_ms\":\"2016-04-18T13:06:49.000Z\",\"received_at\":\"2016-04-18T13:07:31Z\",\"fields\":{\"DIO_IGNITION\":{\"b64_value\":\"AQ==\"},\"MDI_RECORD_REASON\":{\"b64_value\":\"MDox\"}}}},{\"meta\":{\"account\":\"pegasus\",\"event\":\"track\"},\"payload\":{\"id\":833327889842717121,\"connection_id\":833327874105672129,\"id_str\":\"833327889842717121\",\"connection_id_str\":\"833327874105672129\",\"index\":31,\"asset\":\"351732051095381\",\"recorded_at\":\"2016-04-18T13:06:52Z\",\"recorded_at_ms\":\"2016-04-18T13:06:52.000Z\",\"received_at\":\"2016-04-18T13:07:31Z\",\"fields\":{\"DIO_IGNITION\":{\"b64_value\":\"AA==\"}}}}]" }

  it 'has a version number' do
    expect(CloudConnect::Decoder::VERSION).not_to be nil
  end

  it 'should decode tracks correctly' do
    tracks,messages = CloudConnect::Decoder.decode(@notification)
    expect(tracks.count).to eq 9
  end

  it 'should decode messages correctly' do
    tracks,messages = CloudConnect::Decoder.decode(@notification)
    expect(messages.count).to eq 0
  end
end
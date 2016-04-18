require 'spec_helper'

describe CloudConnect::Field do

  it 'correctly decodes string' do
    field = CloudConnect::Field.new(nil, "Vg==")
    expect(field.to_s).to eq "V"
  end

  it 'correctly decodes integer' do
    field = CloudConnect::Field.new(nil, "AAAAYw==")
    expect(field.to_i).to eq 99
  end

  it 'correctly decodes boolean' do
    field = CloudConnect::Field.new(nil, "AQ==")
    expect(field.to_b).to eq true
  end

end

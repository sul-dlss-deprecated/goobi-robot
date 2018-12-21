# frozen_string_literal: true

require 'spec_helper'

describe Robots::DorRepo::Goobi::GoobiNotify do
  it 'makes the web service call to notify goobi' do
    druid = 'druid:aa222cc3333'
    stub_request(:post, "https://example.com/dor/v1/objects/#{druid}/notify_goobi")
      .with(:headers =>
        {'Accept' => '*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Authorization' => 'Basic VVNFUk5BTUU6UEFTU1dPUkQ='})
      .to_return(status: 200, body: "", headers: {})
    r = Robots::DorRepo::Goobi::GoobiNotify.new
    response = r.perform(druid)
    expect(response).to eq(true)
  end
end

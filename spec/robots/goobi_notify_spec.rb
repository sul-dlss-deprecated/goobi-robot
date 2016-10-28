require 'spec_helper'

describe Robots::DorRepo::DpgImage::GoobiNotify do

  it "makes the web service call to notify goobi" do
    druid='druid:aa222cc3333'
    stub_request(:post, "https://example.com/dor/v1/objects/#{druid}/notify_goobi").
      with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip, deflate', 'Authorization'=>'Basic VVNFUk5BTUU6UEFTU1dPUkQ=', 'Content-Length'=>'0', 'Content-Type'=>'application/x-www-form-urlencoded', 'Host'=>'example.com'}).
      to_return(:status => 200, :body => "", :headers => {})
    r = Robots::DorRepo::DpgImage::GoobiNotify.new
    response = r.perform(druid)
    expect(response).to eq(200)
  end
  
end
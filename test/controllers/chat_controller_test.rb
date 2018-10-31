require 'test_helper'


describe ChatController do


  it "can get the index path" do
    VCR.use_cassette('list_channels_file') do
      get root_path

      must_respond_with :ok
    end
  end

  it "can get the new message form" do
    get chat_new_path("nodes-api-testing")
    must_respond_with :ok
  end

  it "can send a message" do
    VCR.use_cassette('send_message') do
      post chat_create_path("nodes-api-testing"), params: { message: 'Happy Halloween' }

      must_redirect_to root_path
    end
  end
end

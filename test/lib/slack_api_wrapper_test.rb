require 'test_helper'

describe SlackApiWrapper do

  describe "send message" do

    it "returns true when a valid channel and message were successful" do
      VCR.use_cassette("channels") do
        message = "How many times does this actually send to the internet?"
        is_successful = SlackApiWrapper.send_message("edges-api-testing", message)
        expect(is_successful).must_equal true
      end
    end

    it "is successful when sending a message to a fake channel" do
      VCR.use_cassette("channels") do
        is_successful = SlackApiWrapper.send_message("this-channel-does-not-exist", "test message")
        expect(is_successful).must_equal true
      end
    end

  end

end

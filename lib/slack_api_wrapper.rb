require 'httparty'

class SlackApiWrapper
  BASE_URL = "https://slack.com/api/"
  TOKEN = ENV["SLACK_TOKEN"]


  def self.list_channels
    url = BASE_URL + "channels.list?" + "token=#{TOKEN}" + "&exclude_archived=1"

    data = HTTParty.get(url)

    channel_list = []

    if data["channels"]
      data["channels"].each do |channel_data|
        channel_list << create_channel(channel_data)
      end
    end

    return channel_list
  end

  def self.send_message(channel, message)
    url = BASE_URL + "chat.postMessage?" + "token=#{TOKEN}"

    response = HTTParty.post( url,
      body: {
        "text" => message,
        "channel" => channel,
        "username" => "Roberts-Robit",
        "icon_emoji" => ":robot_face:",
        "as_user" => "false"
      },
      headers: {
        'Content-Type' => 'application/x-www-form-urlencoded'
      }
    )

    # In this specific implementation, this method returns a boolean on if the post request was successful! Cool.
    # Does it always have to be like this? Nope! I can return whatever I want!
    return response.success?
  end

  private

  def self.create_channel(api_params)
    return Channel.new(
      api_params["name"],
      api_params["id"],
      {
        purpose: api_params["purpose"],
        is_archived: api_params["is_archived"],
        members: api_params["members"]
      }
    )
  end

end

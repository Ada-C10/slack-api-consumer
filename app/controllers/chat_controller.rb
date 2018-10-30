class ChatController < ApplicationController
  def index
    @channels = SlackApiWrapper.list_channels
  end

  def new
    @channel = params[:channel]
  end

  def create
    SlackApiWrapper.send_message( params[:channel], params[:message] )

    redirect_to root_path
  end
end

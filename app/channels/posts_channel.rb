class PostsChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    #the channel to be used in the stream
    stream_from 'PostsChannel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

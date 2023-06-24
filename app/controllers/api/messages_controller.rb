class Api::MessagesController < ApplicationController
  def random_greeting
    message = Message.order('RANDOM()').first

    if message.nil?
      render json: { error: 'No messages found' }, status: :not_found
    else
      render json: { greeting: message.text }
    end
  end
end

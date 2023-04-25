require './app/controllers/telegram_messages_controller.rb'

class TelegramController < ApplicationController
  skip_before_action :verify_authenticity_token

  def webhook
    response = process_telegram(params)
    render json: response.to_json
  end

  private

  def process_telegram(params)
    telegram_params = params.permit!.to_h
    message = telegram_params[:telegram][:message]

    if helpers.timeout? message[:date], Time.now
      user = helpers.user message
      unless user.nil?
        TelegramMessagesController.new.message_handler user
      end
    end

    { ok: true }
  end
end

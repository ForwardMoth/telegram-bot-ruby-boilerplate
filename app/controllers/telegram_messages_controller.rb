class TelegramMessagesController < ApplicationController
  def message_handler(user)
    if user.state.nil?
      case user.text
      when "/start"
        send_message(user.user_id, "START")
      when "/help"
        send_message(user.user_id, "HELP")
    end
  end
end



class ApplicationController < ActionController::Base
  private
  def send_message(user_id, message, buttons=nil)
    Rails.application.config.bot.api.send_message(chat_id: user_id, text: message, reply_markup: buttons,
                                                  parse_mode: 'Markdown')
    Rails.application.config.logger.info "Send message to user: #{user_id}"
  end

end

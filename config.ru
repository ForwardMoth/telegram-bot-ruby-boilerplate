# This file is used by Rack-based servers to start the application.

require_relative "config/environment"
require 'telegram/bot'

URL = Rails.application.secrets.url + "/telegram/webhook"
TOKEN = Rails.application.secrets.telegram_bot_token

Telegram::Bot::Client.run(TOKEN) do |bot|
  bot.api.deleteWebhook()
  bot.api.setWebhook(url: URL)
end


run Rails.application
Rails.application.load_server

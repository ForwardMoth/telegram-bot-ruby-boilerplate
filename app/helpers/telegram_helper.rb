module TelegramHelper
  def timeout?(time, current_time, timeout=300)
    current_time - Time.at(time) <= timeout ? true : false
  end

  def validate_name(first_name)
    symbols = %w(_ * ` [ ~)
    symbols.each do |symbol|
      replace_str =  symbol == "`" ? "" : "\\#{symbol}"
      first_name.gsub!(symbol, replace_str)
    end
    first_name
  end

  def update_params(user, message)
    user.message_id = message[:message_id]
    user.text = message[:text]
    user.first_name = validate_name message[:from][:first_name]
    user.save
  end

  def user(message)
    user_id = message[:from][:id]
    if User.exists?(user_id)
      user = User.find_by(user_id: user_id)
    else
      user = User.create(user_id: user_id)
    end
    update_params(user, message) ? user : nil
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :current_user_object


  def current_user
    user_id = session["user_id"]
    @current_user ||= User.find_by(id: user_id)
    return @current_user ? @current_user.username : nil
  end

  def current_user_object
    user_id = session["user_id"]
    @current_user ||= User.find_by(id: user_id)
    return @current_user ? @current_user : nil
  end
end

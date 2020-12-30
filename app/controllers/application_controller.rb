class ApplicationController < ActionController::Base
  before_action :set_cookies

  private

  def set_cookies
    cookies[:actions] = cookies[:actions].present? ? cookies[:actions].to_i + 1 : 1
  end

  def current_user
    @current_user ||= Author.find(session[:author_id]) if session[:author_id]
  end
  helper_method :current_user

  def authorize
    redirect_to login_path, alert: "Not authorized" if current_user.nil?
  end
end

class ApplicationController < ActionController::Base
  private

  def current_user
    @current_user ||= Author.find(session[:author_id]) if session[:author_id]
  end
  helper_method :current_user

  def authorize
    redirect_to login_path, alert: "Not authorized" if current_user.nil?
  end
end

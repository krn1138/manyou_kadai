class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :login_required
  private
  def login_required
    unless current_user
      redirect_to new_session_path, notice: "ログインしてください" 
    end
  end

  def log_in_now
    if current_user.logger
      redirect_to new_session__path, request.referer
    end
  end

end

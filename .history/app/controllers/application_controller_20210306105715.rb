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

  def login_not_new
    if current_user.present?
      redirect_to new_user_path request.referer
    end
  end

end

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

  def admin_user
    unless current_user.admin?
    redirect_to root_path, notice: "管理者以外はアクセスできません"
  end

end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  class Forbidden < ActionController::ActionControllerError
  end

  rescue_from Forbidden, with: :rescue403

  include SessionsHelper
  before_action :login_required
  private
  def login_required
    unless current_user
      redirect_to new_session_path, notice: "ログインしてください" 
    end
  end

  # def admin_user
    # unless current_user.admin?
    # redirect_to root_path, notice: "管理者以外はアクセスできません"
    # end
  def admin_user
    raise Forbidden unless current_user.admin?
  end

    # unless current_user.admin == true
    #   redirect_to root_path, notice: "管理者以外はアクセスできません"
    #   end
  
  def rescue403(e)
    # binding.pry
    @exception = e
    render template: 'errors/forbidden', status: 403
  end

end

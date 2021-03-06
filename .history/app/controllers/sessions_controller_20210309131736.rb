class SessionsController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]
  # before_action :login_not_new
  before_action :admin_user


  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      # binding.pry
      redirect_to user_path(user.id)
    else
      flash[:danger] = 'ログインに失敗しました'
      render :new
    end
  end

  def destroy
    session.clear
    flash[:notice] = 'ログアウトしました'
    redirect_to new_session_path
  end

end

class UsersController < ApplicationController
    skip_before_action :login_required, only: [:new, :create]
    # before_action :login_not_new
    before_action :different_user_check, only: [:show]
    # before_action :admin_user


    def new
      if current_user.present?
        flash[:notice] = "閲覧権限がありません"
        redirect_to tasks_path
      else
        @user = User.new
      end
    end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show 
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :admin,
                                 :password,:password_confirmation)
  end

end

  def different_user_check
    @user = User.find(params[:id])
    if current_user.id != @user.id
        redirect_to tasks_path
    end
  end
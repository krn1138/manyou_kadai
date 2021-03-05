class UsersController < ApplicationController
    skip_before_action :login_required, only: [:new, :create]
    # before_action :not_login, only: [:show]

  def new
    @user = User.new
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
    # binding.pry
    @user = User.find(params[:id])
    if current_user.id != @user.id
        redirect_to tasks_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

#   def not_login
#     # binding.pry
#     if current_user.id != params[:id].to_i(あんまり良くない書き方)
#        redirect_to tasks_path
#     end
#   end

end

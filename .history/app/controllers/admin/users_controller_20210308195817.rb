class Admin::UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  # before_action :require_admin

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # session[:user_id] = @user.id
      redirect_to user_path(@user.id), notice:"ユーザー#{@user.name}を登録しました"
      # redirect_to admin_user_path, notice:"ユーザー#{@user.name}を登録しました"
    else
      render :new
    end
  end

  def show
    # @user = User.find(params[:id])
    # @tasks = Task.all
    # binding.pry
    # @tasks = @user.tasks
    # @user = User.find(params[:id])

    # tasks = Task.where(user_id: current_user.id).pluck(:picture_id)  # ログイン中のユーザーのお気に入りのpost_idカラムを取得
    # @favorite_list = Picture.find(favorites)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path, notice: "ユーザー#{@user.name}を更新しました"
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path, notice: "ユーザー#{@user.name}を削除しました"
  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :admin, :password,
                                 :password_confirmation)
  end
  
  # def require_admin
  #   redirect_to root_path unless current_user.admin?
  # end

  def set_user
    @user = User.find(params[:id])
  end

end

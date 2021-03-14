class Admin::UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :admin_user, only: %i[index new show edit destroy]


  def index
    @users = User.includes(:tasks).all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # session[:user_id] = @user.id
      redirect_to admin_users_path(@user.id), notice:"ユーザー#{@user.name}を登録しました"
      # redirect_to admin_user_path, notice:"ユーザー#{@user.name}を登録しました"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path, notice: "ユーザー#{@user.name}を更新しました"
    else
      # render :edit
      # flash.now[:notice] = "更新できません"
      redirect_to admin_users_path, notice: "更新できません"
    end
  end

  def destroy
    if @user.destroy
      redirect_to admin_users_path, notice: "ユーザー#{@user.name}を削除しました"
    else 
      redirect_to admin_users_path, notice: "#{@user.name}を削除できませんでした"
    end
  end


  private
  def user_params
    params.require(
      :user
    ).permit(
      :name, 
      :email, 
      :admin, 
      :password,
      :password_confirmation
    )
  end
  
  def set_user
    @user = User.find(params[:id])
  end

  def admin_user
    unless current_user.admin?
    redirect_to root_path, notice: "管理者以外はアクセスできません"
  end

end

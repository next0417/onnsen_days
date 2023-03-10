class Admin::UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
  end

  def update_without
    @user = User.find(params[:id])
    @user.update(is_deleted: true)
    redirect_to admin_user_path(@user)
  end

  def update_within
    @user = User.find(params[:id])
    @user.update(is_deleted: false)
    redirect_to admin_user_path(@user)
  end
end

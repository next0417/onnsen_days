class Public::UsersController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to users_mypage_path(@user)
    else
      render :edit
    end
  end

  def no_membership
    @user = current_user
  end

  def update_without
    @user = current_user
    @user.update(is_deleted: true)
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end
end

class Admin::UsersController < ApplicationController

  layout 'admin'

  before_action :set_user, only:  [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "User was successfully updated"
      redirect_to admin_user_path(@user)
    else
      flash.now[:alert] = "User was failed to update"
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:alert] = "User was deleted"
    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :postal_code, :birth_date, :gender, :marital_status, :children)
  end

  def set_user
    @user = User.find(params[:id])
  end

end

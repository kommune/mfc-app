class UsersController < ApplicationController

  before_action :authenticate_user!

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Profile successfully updated"
      redirect_to agencies_path
    else
      flash.now[:alert] = "Profile failed to update"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :postal_code, :birth_date, :gender, :marital_status, :children)
  end

end

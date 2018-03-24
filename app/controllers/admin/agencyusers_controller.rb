class Admin::AgencyusersController < ApplicationController

  layout 'admin'

  before_action :set_agencyuser, only:  [:show, :edit, :update, :destroy]

  def index
    @agencyusers = Agencyuser.all
  end

  def new
    @agencyuser = Agencyuser.new
  end

  def show
  end

  def edit
  end

  def update
    if @agencyuser.update(agencyuser_params)
      flash[:notice] = "Agencyuser was successfully updated"
      redirect_to admin_agencyusers_path
    else
      flash[:alert] = "Agencyuser was failed to update"
      render :edit
    end
  end

  def destroy
    @agencyuser.destroy
    flash[:alert] = "Agencyuser was deleted"
    redirect_to admin_agencyusers_path
  end

  private

  def agencyuser_params
    params.require(:agencyuser).permit(:username, :email, :agency_id)
  end

  def set_agencyuser
    @agencyuser = Agencyuser.find(params[:id])
  end

end

class Admin::AgenciesController < ApplicationController

  before_action :authenticate_admin
  before_action :authenticate_user!
  before_action :set_agency, only:  [:show, :edit, :update, :destroy]

  def index
    @agencies = Agency.all
  end

  def new
    @agency = Agency.new
  end

   def create
    @agency = Agency.new(agency_params)
    if @agency.save
      flash[:notice] = "Agency was successfully created"
      redirect_to admin_agencies_path
    else
      flash.now[:alert] = "Agency was failed to create"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @agency.update(agency_params)
      flash[:notice] = "rAgency was successfully updated"
      redirect_to admin_ragency_path(@agency)
    else
      flash.now[:alert] = "Agency was failed to update"
      render :edit
    end
  end

  def destroy
    @agency.destroy
    flash[:alert] = "Agency was deleted"
    redirect_to admin_agencies_path
  end

  private

  def authenticate_admin
    unless current_user.admin?
      flash[:alert] = "Not allowed"
      redirect_to root_path
  end

  def agency_params
    params.require(:agency).permit(:name, :office_number, :fax_number, :address, :email, :website, :opening_hours, :category, :criteria, :description)
  end

  def set_agency
    @agency = Agency.find(params[:id])
  end
  
end

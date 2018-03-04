class AgenciesController < ApplicationController

  def index
    @agencies = Agency.page((params[:page])).per(5)
  end

  def show
    @agency = Agency.find(params[:id])
  end

end

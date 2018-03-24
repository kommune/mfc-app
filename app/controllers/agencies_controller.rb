class AgenciesController < ApplicationController

  def index
    @agencies = Agency.page((params[:page])).per(5)
  end

  def show
    @agency = Agency.find(params[:id])
  end

  def search
    if params[:search]
      @agencies = Agency.search ThinkingSphinx::Query.escape(params[:search])
    else
      @agencies = Agency.all
    end
  end

  def home
    @contact = Contact.new
  end

end

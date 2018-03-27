class AgenciesController < ApplicationController

  def index
    @agencies = Agency.page((params[:page])).per(5)
  end

  def show
    @agency = Agency.find(params[:id])
  end

  def search
    if params[:search]
      # @agencies = Agency.search ThinkingSphinx::Query.escape(params[:search])
      @agencies = Agency.search(params[:search], aggs: [:area], smart_aggs: true, page: params[:page], per_page: 5)
    else
      @agencies = Agency.all
    end
  end

  def home
    @contact = Contact.new
  end

end

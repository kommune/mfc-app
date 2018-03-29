class AgenciesController < ApplicationController

  def index
    @agencies = Agency.page((params[:page])).per(5)
  end

  def show
    @agency = Agency.find(params[:id])
  end

  def search
    if params[:search]
      @agencies = Agency.search(
        params[:search],
        fields: ["name^10", "street_name^2", "description^1"],
        match: :word_start,
        misspellings: {
                        edit_distance:  2,
                        transpositions: true
                      },
        operator: "or",
        page: params[:page],
        per_page: 5
      )
    else
      @agencies = Agency.all
    end
  end

  def home
    @contact = Contact.new
  end

  def area_filters
    allowed_filters = %w(area)
    filters = params.select{|k, v| allowed_filters.include?(k) }
  end
  helper_method :area_filters

end

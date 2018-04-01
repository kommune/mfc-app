class AgenciesController < ApplicationController

  def index

    search = params[:search].presence || "*"
    conditions = {}
    conditions[:area] = params[:area] if params[:area].present?
    conditions[:categories_name] = params[:categories_name] if params[:categories_name].present?

    @agencies = Agency.search(
      search,
      where: conditions,
      aggs: [:area, :categories_name],
      smart_aggs: false,
      order: {name: :asc},
      page: params[:page],
      per_page: 7,
      track: true
    )
  end

  def filter
    search = params[:search].presence || "*"
    conditions = {}
    conditions[:area] = params[:area] if params[:area].present?
    conditions[:categories_name] = params[:categories_name] if params[:categories_name].present?

    @agencies = Agency.search(
      search,
      where: conditions,
      aggs: [:area, :categories_name],
      smart_aggs: false,
      order: {name: :asc},
      track: true
    )
  end

  def show
    @agency = Agency.find(params[:id])
    @other_user = @agency.user.agency_id
    ahoy.track "Viewed agencies", agency_id: @agency.id
  end

  def search

    user_id = nil

    if current_user
      user_id = current_user.id
    end

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
        per_page: 7,
        track: true
      )
    else
      @agencies = Agency.all
    end
  end

  def home
    @contact = Contact.new
  end

end

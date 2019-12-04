class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @agencies = @category.agencies.all.page((params[:page])).per(7)
  end
end

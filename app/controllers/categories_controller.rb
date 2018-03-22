class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @agencies = @category.agencies.all
  end
end

class Admin::CategoriesController < ApplicationController
  before_action :is_admin

protected

  def category_params
      params.permit(:name)
  end

public
  def index
    @categories = Category.all().paginate(:page => params[:page], :per_page => 15 )
  end

  def create
    @category = Category.new(category_params)
    @category.save
    flash[:notice] = "Catégorie crée"
    redirect_to action: 'index'
  end

end

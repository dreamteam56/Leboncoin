class AnnoncesController < ApplicationController
  def index
    @annonces = Annonce.all
  end

  def show
    @annonces = Annonce.where(id: params[:id])
  end

  def new
  end

  def create
    @annonce = Annonce.new(title: params[:title], description: params[:description], price: params[:price], user_id: params[:user_id])
    @annonce.save
    redirect_to action: 'index'
  end

  def mine
    @annonces = Annonce.where(user_id: current_user.id)
  end
end

class AnnoncesController < ApplicationController
  def index
    @annonces = Annonce.all
  end

  def show
    @annonces = Annonce.where(id: params[:id])
  end

  def new
    @annonces = Annonce.new()
  end
end

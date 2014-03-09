class AnnoncesController < ApplicationController
  def index
    @annonces = Annonce.all
  end

  def show
    @annonces = Annonce.where(id: params[:id])
    @prop = User.where(id: @annonces[0]['user_id'])
    puts @prop[0]['email']
  end

  def new
  end

  def create
    @annonce = Annonce.new(title: params[:title], description: params[:description], price: params[:price], user_id: params[:user_id])
    @annonce.save
    redirect_to action: 'index'
  end
  
  def destroy
    # TODO
    # Verifier que c'est l'utilisateur qui suuprime
    Annonce.destroy(params[:id])
    redirect_to action: 'mine'
  end

  def mine
    @annonces = Annonce.where(user_id: current_user.id)
  end

  def archiver
    @annonce = Annonce.where(id: params[:id])
    @annonce.update_attributes("archive",true)
    @annonce.save
    redirect_to action: 'mine'
  end
end

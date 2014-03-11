class AnnoncesController < ApplicationController
  def index
    @annonces = Annonce.where(archive: false)
  end

  def show
    @annonces = Annonce.where(id: params[:id])
    @prop = User.where(id: @annonces[0]['user_id'])
    puts @prop[0]['email']
  end

  def new
  end

  def create
    @annonce = Annonce.new(title: params[:title], description: params[:description], price: params[:price], user_id: params[:user_id], archive: false)
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
    @annonce = Annonce.find_by(id: params[:id])
    @annonce.update_attributes(archive: true)
    @annonce.save
    redirect_to action: 'mine'
  end

  def activer
    @annonce = Annonce.find_by(id: params[:id])
    @annonce.update_attributes(archive: false)
    @annonce.save
    redirect_to action: 'mine'
  end
  
  def modify  
    @annonce = Annonce.find_by(id: params[:id])
  end

  def update
    @annonce = Annonce.find(params[:id])
    @annonce.update_attributes(title: params[:title])
    @annonce.update_attributes(description: params[:description])
    @annonce.update_attributes(price: params[:price])
    redirect_to action: 'index'
  end

  def signaler 
    @admins = User.where(admin: true)
    puts @admins[0]["email"]
    ModelMailer.signal_annonce(@admins).deliver
    redirect_to action: 'index'
    
  end
end

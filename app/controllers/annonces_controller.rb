class AnnoncesController < ApplicationController

  before_action :authenticate_user!, only: %w(mine destroy archiver activer modify contact signaler)

protected

  def annonce_params
    params.require(:annonce).permit(:picture,:title,:description,:user_id,:price)
  end

public

  def index
    @annonces = Annonce.where(archive: false)
  end

  def show
    @annonce = Annonce.find params[:id]
    @owner = @annonce.user
    @displayed_by_owner = @annonce.is_owned_by?(current_user)
  end

  def new
  end

  def create
    @annonce = Annonce.new(annonce_params)
    5.times {@annonce.assets.build}
   # @annonce.archive = false
   # @annonce.user_id = params[:user_id]
   # @annonce.save
    redirect_to action: 'mine'
  end
  
  def destroy
    Annonce.destroy(params[:id])
    redirect_to action: 'index'
  end

  def mine
    # @annonces = Annonce.where(user_id: current_user.id)

    @annonces = current_user.annonces
  end

  def archiver
    @annonce = current_user.annonces.find params[:id]
    @annonce.update_attributes(archive: true)
    redirect_to action: 'mine'
  end

  def activer
    @annonce = Annonce.find_by(id: params[:id])
    @annonce.update_attributes(archive: false)
    @annonce.save
    redirect_to action: 'mine'
  end
  
  def modify 
    @annonce = Annonce.find_by(id: params[:annonce_id])
    puts @annonce
  end

  def update
    @annonce = Annonce.find(params[:id])
    @annonce.update_attributes(title: params[:title])
    @annonce.update_attributes(description: params[:description])
    @annonce.update_attributes(price: params[:price])
    @annonce.update_attributes(picture: params[:picture])
    redirect_to action: 'index'
  end

  def signaler 
    @admins = User.where(admin: true)
    puts @admins[0]["email"]
    ModelMailer.signal_annonce(@admins).deliver
    redirect_to action: 'index'
    
  end

  def chercher
    @annonces = Annonce.where("title like ?",'%'+params[:title]+'%')
    render :action => :index
  end

  def contact
    @receiver = User.find_by(id: params[:user_id])
    current_user.send_message(@receiver,params["message"],'nom de annonce')
    redirect_to action: 'index'
  end
end

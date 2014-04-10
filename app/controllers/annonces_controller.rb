class AnnoncesController < ApplicationController

  before_action :authenticate_user!, only: %w(mine destroy modify contact signaler show)

protected

  def annonce_params
    params.require(:annonce).permit(:picture,:title,:description,:category_id,:user_id,:price,:uploads_attributes => [:picture])
  end

public

  def index
    @annonces = Annonce.where(archive: false).paginate(:page => params[:page], :per_page => 9)
  end

  def show
    @annonce = Annonce.find params[:id]
    @category = Category.find @annonce.category_id
    @owner = @annonce.user
    @pictures = @annonce.uploads
    @displayed_by_owner = @annonce.is_owned_by?(current_user)
  end

  def new

    @categories = Category.all
    puts @categories
    @annonce = Annonce.new()
    @annonce.uploads.build

  end

  def create
    @annonce = Annonce.new(annonce_params)
    puts annonce_params
    
    @annonce.archive = false
    @annonce.user_id = params[:user_id]
    @annonce.category_id = params[:category_id]
    if @annonce.save
        params[:uploads_attributes].to_a.each do |picture|      
          puts picture
          @annonce.uploads.create(:picture => picture)
      end
    end
    flash[:notice] = "Annonce crée"
    redirect_to action: 'mine'
  end
  
  def destroy
    Annonce.find(params[:id]).destroy()
    flash[:notice] = "Annonce supprimé"
    redirect_to action: 'mine'
  end

  def mine
    @annonces = current_user.annonces
  end
  
  def modify 
    @annonce = Annonce.find_by(id: params[:id])
    puts @annonce
  end

  def update
    @annonce = Annonce.find(params[:id])
    if params[:archive].present?
      @annonce.update_attributes(archive: params[:archive])
    else
      @annonce.update_attributes(title: params[:title], description: params[:description], price: params[:price])
    end
    # @annonce.update_attributes(picture: params[:picture])
    flash[:notice] = "Annonce modifié"
    redirect_to status: 303
  end

  def signaler 
    #Recuperer l'annonce signaler
    annonce = Annonce.find(params[:id])
    @titre = annonce["title"]
    #Envoie du mail à l'admin
    @admins = User.where(admin: true)
    puts @admins[0]["email"]
    ModelMailer.signal_annonce(@admins).deliver
    annonce.update_attributes(signaler: true)
    flash[:notice] = "Annonce signalé"
    redirect_to action: 'index'
    
  end

  def chercher
    id_category = Category.where("name like ?",'%'+params[:categ]+'%')
    @annonces = Annonce.where("title like ? AND category_id = ?",'%'+params[:title]+'%',id_category[0]['id']).paginate(:page => params[:page], :per_page => 9)
    render :action => :index
  end

  def contact
    @receiver = User.find_by(id: params[:user_id])
    current_user.send_message(@receiver,params["message"],'nom de annonce')
    flash[:notice] = "Message délivré"
    redirect_to action: 'index'
  end
end

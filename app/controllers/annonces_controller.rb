class AnnoncesController < ApplicationController

  before_action :authenticate_user!, only: %w(mine destroy modify contact signaler show)

protected

  def annonce_params
    params.require(:annonce).permit(:picture,:title,:description,:user_id,:price,:uploads_attributes => [:picture])
  end

public

  def index
    @annonces = Annonce.where(archive: false).paginate(:page => params[:page], :per_page => 9)
  end

  def show
    @annonce = Annonce.find params[:id]
    @owner = @annonce.user
    @pictures = @annonce.uploads
    #puts @annonce.uploads[0].picture
    @displayed_by_owner = @annonce.is_owned_by?(current_user)
  end

  def new
    @annonce = Annonce.new()
    @annonce.uploads.build

  end

  def create
    @annonce = Annonce.new(annonce_params)
    puts annonce_params
    
    @annonce.archive = false
    @annonce.user_id = params[:user_id]
    if @annonce.save
        params[:uploads_attributes].to_a.each do |picture|      
          puts picture
          @annonce.uploads.create(:picture => picture)
        #@user.images.create(:avatar=> picture)
        # Don't forget to mention :avatar(field name)

      end
    end
    redirect_to action: 'mine'
  end
  
  def destroy
    Annonce.find(params[:id]).destroy()
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
    redirect_to status: 303
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

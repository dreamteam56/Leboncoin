class Admin::AnnoncesController < ApplicationController

  before_action :is_admin

  def index
    @annonces = Annonce.all().paginate(:page => params[:page], :per_page => 15 )
  end

end

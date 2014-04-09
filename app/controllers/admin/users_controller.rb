class Admin::UsersController < ApplicationController
  before_action :is_admin

  def index
    @users = User.all().paginate(:page => params[:page], :per_page => 15 )
  end

  def destroy
    User.find(params[:id]).destroy()
    redirect_to action: 'index'
  end
end

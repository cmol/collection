class UsersController < ApplicationController
  before_filter :require_user
  before_filter :is_admin, :only => :index
  
  def index
    @users = User.all
  end
  
  def show
    @user = get_user
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Successfully created user."
      redirect_to @user
    else
      render :action => 'new'
    end
  end
  
  def edit
    @user = get_user
  end
  
  def update
    @user = get_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated user."
      redirect_to @user
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @user = get_user
    @user.destroy
    flash[:notice] = "Successfully destroyed user."
    redirect_to users_url
  end
  
  private
  
  def get_user # This method should make the user getting a little more DRY
  	if User.find(params[:id]).id == current_user.id || is_admin
    	return User.find(params[:id]) # Shows user if requested user is current_user, or current_user is admin
    else
    	return User.find(current_user)
    end
  end
end

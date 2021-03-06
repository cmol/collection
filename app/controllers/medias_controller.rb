class MediasController < ApplicationController
  before_filter :require_user
  before_filter :is_admin
  
  def index
    @medias = Media.paginate :page => params[:page], :order => "name"
  end
  
  def show
    @media = Media.find(params[:id])
  end
  
  def new
    @media = Media.new
  end
  
  def create
    @media = Media.new(params[:media])
    if @media.save
      flash[:notice] = "Successfully created media."
      redirect_to @media
    else
      render :action => 'new'
    end
  end
  
  def edit
    @media = Media.find(params[:id])
  end
  
  def update
    @media = Media.find(params[:id])
    if @media.update_attributes(params[:media])
      flash[:notice] = "Successfully updated media."
      redirect_to @media
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @media = Media.find(params[:id])
    @media.destroy
    flash[:notice] = "Successfully destroyed media."
    redirect_to medias_url
  end
end

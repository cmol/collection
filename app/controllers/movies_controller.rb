class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end
  
  def show
    @movie = Movie.find(params[:id])
  end
  
  def new
    @movie = Movie.new
    @movie_ss = Imdb::Movie.new("1630254")
  end
  
  def create
    @movie = Movie.new(params[:movie])
    if @movie.save
      flash[:notice] = "Successfully created movie."
      redirect_to @movie
    else
      render :action => 'new'
    end
  end
  
  def edit
    @movie = Movie.find(params[:id])
  end
  
  def update
    @movie = Movie.find(params[:id])
    if @movie.update_attributes(params[:movie])
      flash[:notice] = "Successfully updated movie."
      redirect_to @movie
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Successfully destroyed movie."
    redirect_to movies_url
  end
  
  def imdb_search
  	@imdb_search = Imdb::Search.new(params[:id])
   	respond_to do | format | # Making sure people without javascript can use the site
    	format.html { redirect_to "/movies" }
    	format.js { render :template => "movies/imdb_search.js.rjs" } # Renders ajax actions
    end
  end
  
  def imdb_fetch
  	@imdb_fetch = Imdb::Movie.new(params[:id])
  	respond_to do | format | # Making sure people without javascript can use the site
    	format.html { redirect_to "/movies" }
    	format.js { render :template => "movies/imdb_fetch.js.rjs" } # Renders ajax actions
    end
  end

end

class MoviesController < ApplicationController
  before_filter :require_user
  
  INDEX_SORT = SortIndex::Config.new(
    {'title' => 'title'},
    {
      'rating' => 'rating',
      'genre' => 'genre',
      'imdb' => 'imdb',
      'media_id' => 'media_id',
      'loaned_to' => 'loaned_to'
    }
    #SortIndex::SORT_KEY_ASC
  )
  
  def index
  	@sortable = SortIndex::Sortable.new(params, INDEX_SORT)
	  #sort = params[:sort] ? sort = params[:sort]+", movies.title" : sort = "movies.title"
    @movies = current_user.movies.paginate :conditions => ["movies.wishlist = ?", false], :order => @sortable.order, :page => params[:page]
  end
  
  def wishlist
	  @sortable = SortIndex::Sortable.new(params, INDEX_SORT)
  	#sort = params[:sort] ? sort = params[:sort]+", movies.title" : sort = "movies.title"
  	@movies = current_user.movies.paginate :conditions => ["movies.wishlist = ?", false], :order => @sortable.order, :page => params[:page]
  end
  
  def show
    @movie = get_movie
  end
  
  def new
    @movie = Movie.new
  end
  
  def create
    @movie = Movie.new(params[:movie])
    @movie.user = current_user
    if @movie.save
      flash[:notice] = "Successfully created movie."
      redirect_to @movie
    else
      render :action => 'new'
    end
  end
  
  def edit
    @movie = get_movie
  end
  
  def update
    @movie = get_movie
    @movie.user = current_user
    if @movie.update_attributes(params[:movie])
      flash[:notice] = "Successfully updated movie."
      redirect_to @movie
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @movie = get_movie
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

	private
	
	def get_movie # This method should make the vm getting a little more DRY
  	if Movie.find(params[:id]).user_id == current_user.id
    	return Movie.find(params[:id]) # Shows movieif current_user owns movie
    else
    	flash[:error] = "You should not mess with other peoples movies!"
    	redirect_to root_url # redirect people to root_url, if they should not see this movie.
    end
  end
end

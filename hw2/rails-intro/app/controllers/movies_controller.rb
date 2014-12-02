class MoviesController < ApplicationController
  attr_accessor :all_ratings  
  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @all_ratings = Movie.get_ratings
    @movies = Movie.scoped
    sort_column = sort_by_column((params[:sort_by] || session[:sort_by]))
    @movies = @movies.order(sort_column) if !sort_column.nil?

    ratings = (params[:ratings] || session[:ratings])
    if params[:commit] == "Refresh"
      if !ratings.nil?
        @movies = @movies.where(rating: params[:ratings].keys)
      else
        @movies = @movies.where(rating: @all_ratings)
      end
      session[:ratings] = params[:ratings]
    else
      is_param_empty = (params[:ratings].nil?) ? true : false
      @movies = @movies.where(sort_by_ratings(ratings, is_param_empty)) 
    end
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

  private
    def sort_by_column(sort_column)
      sort_by = Movie.column_names.include?(sort_column) ? sort_column : nil
      if !sort_by.nil?
        params[:sort_by] = session[:sort_by] = sort_by
      end
      return sort_by
    end
    
    def sort_by_ratings(ratings, is_param_empty)
      if is_param_empty == true
        params[:ratings] = session[:ratings]
        flash.keep
        redirect_to movies_path(:ratings => params[:ratings], :commit => "Refresh", 
                                :sort_by => params[:sort_by])
      else
        session[:ratings] = params[:ratings] = ratings
        return ratings.keys
      end
    end

end

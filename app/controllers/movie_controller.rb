class MovieController < ApplicationController
  before_action :authenticate_user!
  before_action :set_movie, only: %i[ show edit update destroy ]

  def index
    @pagy, @movies = pagy(Movie.order(:rating).all)

    render
  end

  def show
    @movie = Movie.find_by id: params[:id]
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      flash[:success] = "Movie was successfully added."
      redirect_to movie_path(@movie)
    else
      flash[:success] = @movie.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
    if @movie.update(movie_params)
      flash[:success] = "Movie was successfully updated."
      redirect_to movie_url(@movie)
    else
      #  TODO
    end
  end

  def destroy
    @movie.destroy
    flash[:success] = "Movie was successfully destroyed."
    redirect_to root_url
  end

  private

  def set_movie
    begin
      @movie = Movie.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      @movie = nil
    end
  end

  def movie_params
    params.require(:movie).permit(:title, :desc, :poster, :year, :rating)
  end

end

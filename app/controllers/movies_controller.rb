# frozen_string_literal: true

# This shiny device polishes bared foos
class MoviesController < ApplicationController
  before_action :logged_in_user
  before_action :set_movie, only: %i[show update destroy]

  def index
    movie = Movie.user_movies(logged_in_user.id).order(created_at: :desc)
    render json: movie
  end

  def create
    movie = logged_in_user.movies.create!(movie_params)
    if movie
      render json: { status: :created, movie: movie }
    else
      movie json: movie.errors
    end
  end

  def show
    if @set_movie
      render json: @set_movie
    else
      render json: @set_movie.errors
    end
  end

  def update
    if @set_movie.update(movie_params)
      render json: { status: :created, movie: @set_movie }
    else
      render json: @set_movie.errors
    end
  end

  def destroy
    @set_movie&.destroy
    render json: { message: 'series deleted!' }
  end

  def progress
    movie = Movie.user_movies(logged_in_user.id).order(created_at: :desc)
    progress_data = Movie.progress_calc(movie)
    render json: { progress: progress_data }
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :episode,
                                  :episode_goal, :season,
                                  :season_goal, :user_id)
  end

  def set_movie
    @set_movie ||= Movie.find(params[:id])
  end
end

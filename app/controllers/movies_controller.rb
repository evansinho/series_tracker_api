class MoviesController < ApplicationController
  before_action :logged_in_user
  before_action :set_movie, only: %i[show update destroy]

  def create
    movie = logged_in_user.movies.create!(movie_params)
    if movie
      render json: { status: :created, movie: movie }
    else
      movie json: movie.errors
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :episode, :episode_goal, :season, :season_goal, :user_id)
  end

  def set_movie
    @set_movie ||= Movie.find(params[:id])
  end
end

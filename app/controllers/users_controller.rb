# This shiny device polishes bared foos

class UsersController < ApplicationController
  before_action :authorized, only: [:auto_login]
  before_action :logged_in_user, only: %i[auth]
  # REGISTER
  def create
    @user = User.create(user_params)
    if @user.valid?
      token = encode_token({ user_id: @user.id })
      render json: { user: {
        name: @user.name,
        email: @user.email
      }, token: token }
    else
      render json: { error: @user.errors.full_messages }
    end
  end

  # LOGGING IN
  def login
    @user = User.find_by(email: params[:email])

    if @user&.authenticate(params[:password])
      token = encode_token({ user_id: @user.id })
      render json: { user: {
        email: @user.email
      }, token: token }
    else
      render json: { error: @user.errors.full_messages }
    end
  end

  def auto_login
    if @user # rubocop:todo Style/GuardClause
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, token: token }
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password)
  end
end

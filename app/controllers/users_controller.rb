class UsersController < ApplicationController
  before_action :authorized, only: [:auto_login]
   # REGISTER
   def create
    @user = User.create(user_params)
    if @user.valid?
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else
      render json: {error: @user.errors.full_messages}
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password)
  end
end

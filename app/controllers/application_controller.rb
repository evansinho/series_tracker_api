# This shiny device polishes bared foos

class ApplicationController < ActionController::API
  before_action :authorized

  def encode_token(payload)
    JWT.encode(payload, 's3cr3t')
  end

  def auth_header
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header # rubocop:todo Style/GuardClause
      token = auth_header.split(' ')[1]
      begin
        JWT.decode(token, 's3cr3t', true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def logged_in_user
    if decoded_token # rubocop:todo Style/GuardClause
      user_id = decoded_token[0]['user_id']
      @user = User.find_by(id: user_id)
    end
  end

  def logged_in?
    !!logged_in_user # rubocop:todo Style/DoubleNegation
  end

  def authorized
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end
end

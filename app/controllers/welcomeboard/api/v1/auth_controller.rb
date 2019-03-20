class Welcomeboard::Api::V1::AuthController < ApplicationController

  skip_before_action :authorized, only: [:create]

  def create
    # byebug
    @user = User.find_by(full_name: user_login_params[:full_name])
    if @user && @user.authenticate(user_login_params[:password])
      @token = JWT.encode({ full_name: @user.full_name }, 'isd3nK')
      # @token = encode_token({ user_id: @user.id })
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :accepted
    else
      render json: { message: 'Invalid username or password' }, status: :unauthorized
    end
  end

  private

  def user_login_params
    # params.require(:user).permit(:full_name, :password)
    params.require(:auth).permit(:full_name, :password)
  end

end

class Welcomeboard::Api::V1::UsersController < ApplicationController

    skip_before_action :authorized, only: [:index, :create]

    def index
        @users = User.all
        render json: @users
    end

    def profile
        render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end

    def create
        # byebug
        @user = User.create(full_name: params[:full_name], password: params[:password], mod_id: params[:mod_id])
        if @user.valid?
          @token = issue_token({full_name: @user.full_name})
          render json: { user: @user, jwt: @token }, status: :created
        else
          render json: { error: 'failed to create user' }, status: :not_acceptable
        end
    end

    def update
        @user = User.find(params[:id])
        @user.update(full_name: params[:full_name], password: params[:password], mod_id: params[:mod_id])
        render json: @user
        # if @user.save
        #     render json: @user, status: :accepted
        # else
        #     render json: {errors: @user.errors.full_messages }, status: :unprocessible_entity
        # end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        render json: { message: "removed" }, status: :ok
    end

    private
    def user_params
        params.require(:user).permit(:full_name, :password, :mod_id)
    end

    def find_user
        @user = User.find(params[:id])
    end    
end

class Welcomeboard::Api::V1::LikesController < ApplicationController
    skip_before_action :authorized, only: [:index]
    
    def index
        @likes = Like.all
        render json: @likes
    end

    def create
        @like = Like.create(like_params)
        render json: @like, status: :accepted
    end

    def update
        @like.update(like_params)
        if @like.save
            render json: @like, status: :accepted
        else
            render json: {errors: @like.errors.full_messages }, status: :unprocessible_entity
        end
    end

    def destroy
        @like = Like.find(params[:id])
        @like.destroy
        render json: { message: "removed" }, status: :ok
    end

    private
    def like_params
        params.require(:like).permit(:user_id, :post_id)
    end

    def find_like
        @like = Like.find(params[:id])
    end
end

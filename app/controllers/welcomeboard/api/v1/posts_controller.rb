class Welcomeboard::Api::V1::PostsController < ApplicationController
    skip_before_action :authorized, only: [:index]
    def index
        @posts = Post.all
        render json: @posts
    end

    def create
        @post = Post.create(post_params)
        render json: @post, status: :accepted
    end

    def update
        @post = find_post
        @post.update(post_params)
        if @post.save
            render json: @post, status: :accepted
        else
            render json: {errors: @post.errors.full_messages }, status: :unprocessible_entity
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        render json: { message: "removed" }, status: :ok
    end

    private
    def post_params
        params.require(:post).permit(:content, :mod_id, :user_id)
    end

    def find_post
        @post = Post.find(params[:id])
    end
end

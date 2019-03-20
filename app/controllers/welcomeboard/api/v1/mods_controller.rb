class Welcomeboard::Api::V1::ModsController < ApplicationController
    skip_before_action :authorized, only: [:index]
    
    def index
        @mods = Mod.all
        render json: @mods
    end

    # def create
    #     @mod = Mod.create(user_params)
    #     render json: @mod, status: :accepted
    # end

    def update
        @mod.update(mod_params)
        if @mod.save
            render json: @mod, status: :accepted
        else
            render json: {errors: @mod.errors.full_messages }, status: :unprocessible_entity
        end
    end

    def destroy
        @mod = Mod.find(params[:id])
        @mod.destroy
        render json: { message: "removed" }, status: :ok
    end

    private
    def mod_params
        params.permit(:mod)
    end

    def find_mod
        @mod = Mod.find(params[:id])
    end
end

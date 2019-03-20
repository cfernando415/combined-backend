class Femmecubator::Api::V1::Like1sController < ApplicationController
    def index
        @likes = Like1.all
        render json: @likes
    end
end

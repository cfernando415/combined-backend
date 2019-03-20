class Diseases::Api::V1::DiseasesController < ApplicationController
    skip_before_action :authorized, only: [:index, :show, :create, :update, :destroy]
    def index
        @diseases = Disease.select("id, year, leading_cause, sum(deaths) AS deaths, sex").group("year, leading_cause, sex, id")
        render json: @diseases
    end
    def show
        @disease = Disease.find(params[:id])
        render json: @disease
    end
    def create
        @disease = Disease.create(year: params[:year], leading_cause: params[:leading_cause], sex: params[:sex], deaths: params[:deaths])
        render json: @disease
    end
    def update
        @disease = Disease.find(params[:id])
        @disease.update(year: params[:year], leading_cause: params[:leading_cause], sex: params[:sex], deaths: params[:deaths])
        render json: @disease
    end
    def destroy
        Disease.find(params[:id]).destroy
        # head: no_content
        # render json: @disease
    end
end

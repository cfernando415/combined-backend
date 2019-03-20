class Welcomeboard::Api::V1::ReportsController < ApplicationController
    skip_before_action :authorized, only: [:index, :create]
    def index
        @reports = Report.all
        render json: @reports
    end

    def create
        @report = report.create(report_params)
        render json: @report, status: :accepted
    end

    def update
        @report.update(report_params)
        if @report.save
            render json: @report, status: :accepted
        else
            render json: {errors: @report.errors.full_messages }, status: :unprocessible_entity
        end
    end

    def destroy
        @report = Report.find(params[:id])
        @report.destroy
        render json: { message: "removed" }, status: :ok
    end

    private
    def report_params
        params.permit(:report)
    end

    def find_report
        @report = Report.find(params[:id])
    end
end

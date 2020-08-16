class StationsController < ApplicationController

    def index
        @stations = Station.all
    end

    def new
        @station = Station.new
    end

    def create
        @station = Station.new(station_params)
        if @station.save
            redirect_to station_path(@station)
        else
            render 'new'
        end
    end

    def show
        @station = Station.find(params[:id])
    end

    def edit

    end

    private

    def station_params
        params.require(:station).permit(
            :station_number,
            :activity,
            :baited
        )
    end
end

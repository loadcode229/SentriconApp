class StationsController < ApplicationController

    def index

    end

    def new

    end

    def create

    end

    def show

    end

    def edit

    end

    private

    def station_params
        params.require(:station).permit(
            :station_number,
            :activity
        )
    end

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end
end

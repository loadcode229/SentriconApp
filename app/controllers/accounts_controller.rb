class AccountsController < ApplicationController

    def index

    end

    def new

    end

    def create

    end

    def show

    end

    private

    def account_params
        params.require(:event).permit(
            :name,
            :address,
            :phone_number,
            :instructions
        )
    end
end

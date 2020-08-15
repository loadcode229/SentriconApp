class AccountsController < ApplicationController

    def index
        @accounts = Account.all
    end

    def new
        @account = Account.new
    end

    def create
        @account = Account.new(account_params)
        if @account.save
            redirect_to account_path(@account)
        else
            render 'new'
        end
    end

    def show
        @account = Account.find_by(id:params[:id])
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

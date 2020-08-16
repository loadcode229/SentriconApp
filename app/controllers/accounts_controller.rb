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
            flash[:notice] = "Account creation was unsuccessful."
            render new_account_path
        end
    end

    def edit
        @account = Account.find(params[:id])
    end

    def show
        @account = Account.find(params[:id])
    end

    def update
        @account = Account.find(params[:id])
        if @account.update(account_params)
            redirect_to account_path(@account)
        else
            flash[:notice] = "Something went wrong."
            redirect_to edit_account_path(@account)
        end
    end

    private

    def account_params
        params.require(:account).permit(
            :name,
            :address,
            :phone_number,
            :instructions
        )
    end
end

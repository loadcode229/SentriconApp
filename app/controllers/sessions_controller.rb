class SessionsController < ApplicationController

    def new
    end

    def create

    end

    def destroy
        session.delete("user_id")
        redirect_to '/'
    end

    private

    def authenticates
        request.env['omniauth.auth']
    end
end
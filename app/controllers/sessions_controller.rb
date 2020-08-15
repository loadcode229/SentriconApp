class SessionsController < ApplicationController
    skip_before_action :verify_user_is_authenticated, only: [:new, :create]

    def new
    end

    def create
        flash[:notice] = "Email or password is incorrect."
        if auth
            @user = User.find_or_create_by(uid: auth['uid']) do |u|
                u.username = auth['info']['username']
                u.email = auth['info']['email'].downcase
            end
        else
            @user = User.find_by(username: params[:user][:username], email: params[:user][:email])
            @user = @user.try(:authenticate, params[:user][:password])
            return redirect_to login_path unless @user
        end

        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    def destroy
        session[:user_id] = nil
        redirect_to '/'
    end

    private

    def auth
        request.env['omniauth.auth']
    end
end
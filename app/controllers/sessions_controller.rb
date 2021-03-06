class SessionsController < ApplicationController

    def new
    end

    def create
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
        else
            render :new
        end
    end

    def destroy
        session.clear
        redirect_to '/signup'
    end

end
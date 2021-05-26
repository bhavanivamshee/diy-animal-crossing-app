class UsersController < ApplicationController

    def index
        @users = User.all
    end

    def show
        @user = User.find_by_id(params[:id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to users_path
        else
            render :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:island_name, :username, :email, :dream_address, :password, :password_confirmation)
    end


end

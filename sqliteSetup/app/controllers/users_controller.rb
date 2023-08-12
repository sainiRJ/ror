class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:addUser, :deleteUser]
        
        def addUser
            @user = User.new(user_params)
          if @user.save
            render json: @user, status: 200;
            
          else
            render json: {message: "Please fill full details"}
          end
        end

        def allUser
            user = User.all
            render json: user;

        end

        def deleteUser
            @user = User.where('age >= ?', params[:id]).delete_all
            if !@user
                render json: {message: "user is not existes  "} 
            else
            render json: @user;
            end
        end

        def avg
            averageAge = User.average(:age).to_f
            render json: {message: "average age is #{averageAge}"}
        end

        


        private

        def user_params
            params.require(:user).permit(:name, :age, :email, :address)
          end
end

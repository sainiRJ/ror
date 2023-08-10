class Api::UsersController < ApplicationController

    skip_before_action :verify_authenticity_token, only: [:addUser, :deleteUser]

    def addUser
        user = User.new(name: params[:name], age: params[:age], email: params[:email], address: params[:address])
        if user.save()
            render json: user, status: 200;
        else
            render json: {message: "user not saved"}
        end
    end

    def avg       
    averageAge = User.collection.aggregate([
    { "$group" => { "_id" => nil, "averageAge" => { "$avg" => "$age" } } }
    ]).to_a.first["averageAge"]
  
  render json: averageAge
 end

    def deleteUser
        removeUser = User.where(:age.gt=>25).delete_all
        render json: {message: "user delete successfully"}
    end

end

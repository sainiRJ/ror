class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :login, :deletAll]

  def new
  end

  def create
    @user=User.new(user_params)
    if @user.save
      render json: {message: "User registered successfully", status: :ok}
    end
  end

  def allUser
  page_number = params[:page] || 1
  @users = User.paginate(page: page_number, per_page: 1)
    if @users
      render json: @users
    end
  end

  def deletAll
    @users = User.delete_all
    render json: {message: "all users deleted"}
    
  end

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :email, :firstname, :lastname)
  end

  def login
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: {id: user.id}, status: :ok
    else
      render json: {error: "Invalid Username or Password"},status: :bad_request
    end
  end


  def get_user
    user = User.find_by(id: params[:id])
    if user
      render json: user
    else
      render json: {error: "Unauthorized", message: "you are not authorized user"},status: :bad_request
    end
  end

end

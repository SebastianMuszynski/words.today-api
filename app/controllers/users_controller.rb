class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: [:create, :create_and_login]

  def show
    render json: @current_user
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def create_and_login
    @user = User.new(user_params)

    if @user.save
      command = AuthenticateUser.call(@user.email, @user.password)

      if command.success?
        render json: { auth_token: command.result }
      else
        render json: { error: command.errors }, status: :unauthorized
      end
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    authenticate = AuthenticateUser.call(params[:email], params[:password])

    if authenticate.success?
      if @current_user.update(user_params)
        render json: @current_user
      else
        render json: @current_user.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'Wrong password.' }, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end

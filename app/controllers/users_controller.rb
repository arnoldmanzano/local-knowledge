class UsersController < ApplicationController
  def index
    users = User.all
    render json: users.to_json(include: [:requests], methods: [:avatar_url])
  end

  def c_user
    if current_user
      c_user = User.find(current_user.id)
      render json: c_user.to_json(methods: [:avatar_url])
    else
      flash[:alert] = 'Please sign in '
      redirect_to '/'
    end
  end

  def show
    @user = current_user
  end

  def profile
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:id)
  end

end

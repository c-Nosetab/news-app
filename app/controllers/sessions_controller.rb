class SessionsController < ApplicationController
  def new
    if current_user
      redirect_to '/'
    end
  end

  def create
    p params[:email]
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Successfully Logged In"
      redirect_to '/'
    else
      flash[:warning] = "Something went wrong. Please try again."
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Successfully logged out"
    redirect_to '/'
  end
end

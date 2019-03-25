class SessionsController < ApplicationController
  def new
  end

  def create
    username = params[:username]
    user = User.find_by(username: username)
    if user && user.authenticate(params[:password])
      session["user_id"] = user.id
      redirect_to posts_path
    else
      flash[:notice] = "No username or password with that combination found"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end

end

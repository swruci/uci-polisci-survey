class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    puts '--------'
    puts params[:session]
    puts params[:session][:username]
    puts params[:session][:password]
    # puts user
    # puts user.authenticate(params[:session][:password])
    puts '--------'
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in user
      redirect_to surveys_path
      flash[:success] = 'Login successful.'
    else
      # Create an error message.
      flash.now[:danger] = 'Invalid username/password combination'
      render 'new'
    end
  end

end

class AccessController < ApplicationController

 skip_before_action :confirm_logged_in, only: [:new, :create] 

  # display menu
  def menu
    # render(plain: "just render text")
    # render(html: "<strong>HtmL text</strong>")
    # render(json: Task.first)
    # render(xml: ['dog', 'cat', 'mouse'])
    # render(plain: 'OK', status: 200)
    # path_to_404 = Rails.root.join('public', '404.html')
    # render(file: path_to_404)
    # send_file(path_to_404)
    # string = render_to_string(path_to_404)
    # logger.debug(string)
  end

  # display login form
  def new
    if logged_in?
      redirect_to(menu_path)
    end
  end

  # processs login form
  def create
    logger.info("*** Login User #{params[:username]} ***")
    # do login process here
    cookies[:username] = params[:username]
    session[:user_id] = 1483
    flash[:notice] = "log in succesful"
    redirect_to(menu_path)
  end

  # logout user
  def destroy
    logger.info("*** Logout User #{cookies[:username]} ***")
    # do logout process here
    cookies[:username] = nil 
    session[:user_id] = nil
    flash[:notice] = "logout succesful"
    redirect_to(login_path)
  end

 
end

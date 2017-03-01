class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authenticate_user!
  protect_from_forgery with: :exception

    def check_if_logged_in_user_is_admin
      if ( (current_user.nil?)? false : (current_user.admin?) )
        #you are admin enjoy
      else
      	redirect_to new_user_session_path
        # render :file => 'public/not_admin.html', :layout => false
      end
    end

    def check_user_logged_in
    	if user_signed_in?
    		return
      	else
    		redirect_to new_user_session_path
    	end
    end
end

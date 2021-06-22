class ApplicationController < ActionController::Base
    def current_user
      redirect_to '/' if(session['authentication'].blank?)
      return User.find(session['authentication']['id'])
    end

end

class HomesController < ApplicationController
  layout 'externo'

  # GET /homes or /homes.json
  def index
    if(session['authentication'].blank?)
    elsif( User.where(email: session['authentication']['email']).present?)
      redirect_to '/dashboards'
    end
  end

  def authentication
    user = User.new(get_params)
    check_user = User.where(email: user.email).first

    if(user.dominio == '')
      redirect_to('/homes')
    elsif(check_user.blank?)
      user.permission = User.permissions[:user]
      user.save!
    else
      user = check_user
    end
    session[:authentication] = user
    redirect_to('/dashboards')
  end

  def get_params
    user = Hash.new
    user['email'] = request.env['omniauth.auth']['info']['email']
    user['last_name'] = request.env['omniauth.auth']['info']['last_name']
    user['first_name'] = request.env['omniauth.auth']['info']['first_name']
    user['image'] = request.env['omniauth.auth']['info']['image']
    user['dominio'] = request.env['omniauth.auth']['extra']['raw_info']['hd']
    user
  end

end

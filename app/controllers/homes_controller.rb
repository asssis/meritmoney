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
    session['omniauth.state'] = SecureRandom.hex
    user = User.new(get_params)
    check_user = User.where(email: user.email).first

    if(user.dominio != 'visagio.com')
      respond_to do |format|
        user = nil
        format.html { redirect_to '/homes', notice: "Vocẽ não possui permissão." }
      end
    elsif(check_user.blank?)
      user.permission = User.permissions[:user]
      user.save!
    else
      user = check_user
    end

    if(user.present?)
      session[:authentication] = user
      redirect_to('/dashboards')
    end
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

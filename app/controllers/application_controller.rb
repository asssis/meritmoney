class ApplicationController < ActionController::Base
  def current_user
    if(session['authentication'].blank?)
      redirect_to '/'
    else
      @user = User.find(session['authentication']['id'])
    end
  end

  def check_saldo
    user = current_user
    date = Date.today
    donations = MeritMoney.where(:created_at => date.beginning_of_month...date.end_of_month, deposit_id: user.id)
    return 100 - donations.inject(0) { |sum, product| sum += product.value }
  end
end

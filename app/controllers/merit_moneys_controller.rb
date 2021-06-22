class MeritMoneysController < ApplicationController
   before_action :get_users


  def new
    @merit_money = MeritMoney.new
  end

  def create
    @merit_money = MeritMoney.new(merit_money_params)
    @merit_money.received_id = params[:merit_money][:received_id]
    @merit_money.deposit_id = params[:merit_money][:received_id]

    respond_to do |format|
      if @merit_money.save
        format.html { redirect_to dashboard_deposit_path, notice: "Donation was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @merit_money.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def merit_money_params
      params.require(:merit_money).permit(:value, :reason, :reference)
    end
    def get_users
      @users = User.all.collect {|x| [x.email_name, x.id]}
    end
end
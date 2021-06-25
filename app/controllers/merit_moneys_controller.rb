class MeritMoneysController < ApplicationController
  before_action :current_user
  before_action :get_users

  def new
    @saldo = check_saldo
    @merit_money = MeritMoney.new
  end

  def create
    @merit_money = MeritMoney.new(merit_money_params)
    @merit_money.received_id = params[:merit_money][:received_id]
    @saldo = check_saldo
    @merit_money.deposit_id = @user.id
    respond_to do |format|
      if @merit_money.save
        format.html { redirect_to dashboards_path, notice: "Donation successfully." }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @merit_money.errors, status: :unprocessable_entity }
      end
    end
  end

  def view_resume
    date = Date.today
    receiveds = []
    user = User.find(params[:user_id])
    MeritMoney.where(:created_at => date.beginning_of_month...date.end_of_month, received_id: params[:user_id]).each do |item|
      item.deposit.name
      receiveds << {"DONATION" =>  item.deposit.name, "VALUE" => item.value, "REASON" => item.reason}
    end
    total = receiveds.inject(0) { |sum, product| sum += product["VALUE"] }
    render json: {receiveds: receiveds, total: total, name: user.email_name}
  end

  private
    def merit_money_params
      params.require(:merit_money).permit(:value, :reason, :reference)
    end

    def get_users
      @users = User.all.select{|x| x.id != @user.id}.collect {|x| [x.email_name, x.id]}
    end
end
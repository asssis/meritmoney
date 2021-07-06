class DashboardsController < ApplicationController
  before_action :set_donation, only: %i[ show edit update destroy ]
  before_action :current_user

  def index
    date = Date.today
    @donations = MeritMoney.where(:created_at => date.beginning_of_month...date.end_of_month, deposit_id: @user.id)
    @saldo = check_saldo
  end

  def received
    date = Date.today
    @receiveds = MeritMoney.where(:created_at => date.beginning_of_month...date.end_of_month, received_id: @user.id)
    @received = @receiveds.inject(0) { |sum, product| sum += product.value }
  end

  def rank
    begin
      @date = Date.today
      @date = Date.strptime(params[:date], '%Y%m') if(params[:date].present?)
    rescue
    end

    users = User.all
    @ranks = []
    users.each do |item|
      rank = Hash.new
      rank[:email_name] = item.email_name
      merit_money = MeritMoney.where(:created_at =>  @date.beginning_of_month...@date.end_of_month, received_id: item.id)
      rank[:total] = merit_money.inject(0) { |sum, product| sum += product.value }
      rank[:user_id] = item.id
      rank[:image] = item.image
      @ranks << rank
    end
    @ranks = @ranks.sort {|a, b| a[:total] <=> b[:total]}.reverse
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_donation
      @donation = Donation.find(params[:id])
    end
end

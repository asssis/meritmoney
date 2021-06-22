class DashboardsController < ApplicationController
  before_action :set_donation, only: %i[ show edit update destroy ]

  # GET /donations or /donations.json
  def index
    date = Date.today
    @receiveds = MeritMoney.where(:created_at => date.beginning_of_month...date.end_of_month, received_id: current_user.id)
    @received = @receiveds.inject(0) { |sum, product| sum += product.value }
  end
  def deposit
    @donations = MeritMoney.where(deposit_id: current_user.id)
    @saldo = 100 - @donations.inject(0) { |sum, product| sum += product.value }
  end
  def rank
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_donation
      @donation = Donation.find(params[:id])
    end
end

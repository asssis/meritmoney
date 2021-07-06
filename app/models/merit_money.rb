class MeritMoney < ApplicationRecord
    belongs_to :received, class_name: 'User'
    belongs_to :deposit , class_name: 'User'


    validates :value, presence: true
    validates :reason, presence: true
    validate :check_saldo, on: :create

    def check_saldo
      return if(self.deposit_id.blank?)
      date = Date.today
      donations = MeritMoney.where(:created_at => date.beginning_of_month...date.end_of_month, deposit_id: self.deposit_id)
      saldo = 100 - donations.inject(0) { |sum, product| sum += product.value }
      saldo = saldo - self.value
      if(self.value > 100)
        errors.add(:value, "you can't donate more than 100 (cem)")
      elsif(self.value <= 0)
        errors.add(:value, "you can't donate less than 0 (zero)")
      elsif(saldo < 0)
        errors.add(:value, "you can donated maximum #{saldo}")
      end
    end
end

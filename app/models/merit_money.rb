class MeritMoney < ApplicationRecord
    belongs_to :received, class_name: 'User'
    belongs_to :deposit , class_name: 'User'


    validates :value, presence: true
    validates :reason, presence: true
end

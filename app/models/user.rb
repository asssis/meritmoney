class User < ApplicationRecord
    has_many :receiveds, class_name: 'User'   , foreign_key: :received_id
    has_many :deposits, class_name: 'User' , foreign_key: :deposit_id

    enum permission: [:user, :admin]
    def email_name
        "#{self.first_name} #{self.last_name} | #{self.email}"
    end
    def name
        "#{self.first_name} #{self.last_name}"
    end
end

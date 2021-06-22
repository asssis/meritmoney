class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email, limit: 50
      t.string :first_name, limit: 100
      t.string :last_name, limit: 100
      t.string :dominio, limit: 100
      t.string :image, limit: 100
      t.integer :permission, limit: 5

      t.timestamps
    end
  end
end

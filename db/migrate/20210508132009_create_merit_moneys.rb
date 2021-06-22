class CreateMeritMoneys < ActiveRecord::Migration[6.1]
  def change
    create_table :merit_moneys do |t|
      t.integer :value, limit: 5
      t.text :reason, limit: 200
      t.string :reference, limit: 100
      t.references :deposit, class_name: 'User', foreign_key: { to_table: 'users' }
      t.references :received, class_name: 'User', foreign_key: { to_table: 'users' }

      t.timestamps
    end
  end
end

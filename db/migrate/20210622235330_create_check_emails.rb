class CreateCheckEmails < ActiveRecord::Migration[6.1]
  def change
    create_table :check_emails do |t|
      t.references :user

      t.timestamps
    end
  end
end

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :user_id
      t.integer :message_id
      t.timestamp :query_date
      t.string :text
      t.boolean :is_auth
      t.datetime :date_uath
      t.string :state
      t.timestamp :date_state

      t.timestamps
    end
  end
end

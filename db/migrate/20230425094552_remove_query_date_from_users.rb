class RemoveQueryDateFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :query_date, :datetime
  end
end

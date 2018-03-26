class AddTwitterHandleToUsers < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.string :twitter_handle
    end
  end
end

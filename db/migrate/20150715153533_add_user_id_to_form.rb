class AddUserIdToForm < ActiveRecord::Migration
  def change
  	 add_column :forms, :user_id, :integer
  end
end

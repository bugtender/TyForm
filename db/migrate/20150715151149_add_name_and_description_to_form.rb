class AddNameAndDescriptionToForm < ActiveRecord::Migration
  def change
  	add_column :forms, :name, :string
    add_column :forms, :description, :text
  end
end

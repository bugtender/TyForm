class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.string :name
      t.string :default_type
      t.string :field_type
      t.boolean :required
      t.belongs_to :form, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

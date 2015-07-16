class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :content
      t.belongs_to :field, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

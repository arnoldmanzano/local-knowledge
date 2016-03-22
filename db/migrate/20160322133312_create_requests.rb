class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :location
      t.text :description
      t.references :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
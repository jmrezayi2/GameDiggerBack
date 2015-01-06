class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :app_name
      t.string :path
      t.string :name
      t.string :category
      t.string :price

      t.timestamps null: false
    end
  end
end

class CreateSubs < ActiveRecord::Migration
  def change
    create_table :subs do |t|
      t.string :sub_name
      t.string :description
      t.string :score
      t.string :integer
      t.string :icon_path

      t.timestamps null: false
    end
  end
end

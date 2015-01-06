class CreateAppSubs < ActiveRecord::Migration
  def change
    create_table :app_subs do |t|
      t.string :app_name
      t.string :sub_name
      t.string :description
      t.string :score
      t.string :integer
      t.string :comment_count
      t.string :hot_score
      t.string :uid
      t.integer :flag
      t.integer :app_id
      t.integer :sub_id

      t.timestamps null: false
    end
    add_index :app_subs, :app_id
    add_index :app_subs, :sub_id
  
  end
end

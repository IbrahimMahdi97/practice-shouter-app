class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :shout, null: false, foreign_key: true

      t.timestamps
    end

    add_index :likes, [:user_id, :shout_id], unique: true
    #Ex:- add_index("admin_users", "username")
  end
end

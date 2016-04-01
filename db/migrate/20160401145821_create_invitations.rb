class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :from_user_id, index: true, foreign_key: true, null: false
      t.integer :to_user_id, index: true, foreign_key: true, null: false
      t.references :game, index: true, foreign_key: true, null:false
      t.boolean :accepted, null: false, default: false

      t.timestamps null: false
    end
  end
end

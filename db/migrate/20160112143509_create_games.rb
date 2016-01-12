class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.text :content
      t.string :status
      t.boolean :owner

      t.timestamps null: false
    end
  end
end

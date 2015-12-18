class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.datetime :uploaded
      t.string :url
      t.integer :score

      t.timestamps null: false
    end
  end
end

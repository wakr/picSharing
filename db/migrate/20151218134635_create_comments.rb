class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.datetime :date_commented
      t.string :text

      t.timestamps null: false
    end
  end
end

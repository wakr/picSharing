class AddColumnDataToPicture < ActiveRecord::Migration
  def change
    add_column :pictures, :data, :text
  end
end

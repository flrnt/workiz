class AddAvailableToCollection < ActiveRecord::Migration
  def change
    add_column :collections, :available, :boolean, null: false, default: true
  end
end

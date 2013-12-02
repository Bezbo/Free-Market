class AddDraftColumnToItems < ActiveRecord::Migration
  def change
    add_column :items, :draft, :boolean, default: false
  end
end

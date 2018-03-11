class AddDefaultCategoryToResources < ActiveRecord::Migration[5.1]
  def change
    change_column :resources, :category_id, :bigint, :default => 1
  end
end

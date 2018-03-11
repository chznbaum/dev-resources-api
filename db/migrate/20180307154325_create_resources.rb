class CreateResources < ActiveRecord::Migration[5.1]
  def change
    create_table :resources do |t|
      t.string :name
      t.text :url
      t.text :credit
      t.text :description
      t.belongs_to :category, foreign_key: true

      t.timestamps
    end
  end
end

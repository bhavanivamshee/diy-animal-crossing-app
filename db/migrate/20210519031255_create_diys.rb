class CreateDiys < ActiveRecord::Migration[6.1]
  def change
    create_table :diys do |t|
      t.string :name
      t.string :url
      t.string :image_url
      t.integer :recipes_to_unlock
      t.jsonb :materials_diy
      t.timestamps
    end
  end
end

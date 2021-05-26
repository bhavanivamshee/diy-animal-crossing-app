class CreateMaterials < ActiveRecord::Migration[6.1]
  def change
    create_table :materials do |t|
      t.string :name
      t.integer :count
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :diy, null: false, foreign_key: true

      t.timestamps
    end
  end
end

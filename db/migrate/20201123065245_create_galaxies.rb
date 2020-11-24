class CreateGalaxies < ActiveRecord::Migration[6.0]
  def change
    create_table :galaxies do |t|
      t.string :name
      t.text :description
      t.integer :rate
      t.references :owner, null: false, index: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end

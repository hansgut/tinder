class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.text :description
      t.string :sex
      t.string :name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

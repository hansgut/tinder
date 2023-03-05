class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.references :profile1, null: false
      t.references :profile2, null: false

      t.timestamps
    end

    add_foreign_key :matches, :profiles, column: :profile1_id
    add_foreign_key :matches, :profiles, column: :profile2_id
  end
end

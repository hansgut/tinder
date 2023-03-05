class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :sender_profile, null: false
      t.references :receiver_profile, null: false

      t.timestamps
    end

    add_foreign_key :likes, :profiles, column: :sender_profile_id
    add_foreign_key :likes, :profiles, column: :receiver_profile_id
  end
end

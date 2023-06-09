class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.text :content, null: false
      t.belongs_to :profile, null: false, foreign_key: true
      t.belongs_to :match, null: false, foreign_key: true

      t.timestamps
    end
  end
end

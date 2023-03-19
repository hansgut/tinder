class CreateSearchPreferences < ActiveRecord::Migration[7.0]
  def change
    create_table :search_preferences do |t|
      t.string :sex
      t.integer :min_age, default: 18
      t.integer :max_age, default: 100
      t.belongs_to :profile

      t.timestamps
    end
  end
end

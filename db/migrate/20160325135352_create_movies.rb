class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.string :thumbnail
      t.string :prominent_bg_color
      t.text :tags, array: true, default: []
      t.text :actors, array: true, default: []
      t.datetime :release_date
      t.decimal :rate
      t.text :description
      t.string :trailer
      t.string :director

      t.timestamps null: false
    end
  end
end

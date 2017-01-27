class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :year
      t.string :runtime
      t.string :director
      t.text :description
      t.string :netflix
      t.string :hulu
      t.string :amazon

      t.timestamps null: false
    end
  end
end

class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.text :title
      t.text :desc
      t.float :rating
      t.integer :year

      t.timestamps
    end
  end
end

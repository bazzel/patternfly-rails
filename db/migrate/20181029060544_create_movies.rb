class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year
      t.string :plot_summary, limit: 500
      t.decimal :gross_takings, precision: 13, scale: 2
      t.boolean :available_on_dvd

      t.timestamps
    end
  end
end

class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :name
      t.string :surname
      t.date :born_on
      t.date :died_on

      t.timestamps
    end
  end
end

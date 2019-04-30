class CreateDirectors < ActiveRecord::Migration[5.1]
  def change
    create_table :directors do |t|
      t.string :name
      t.integer :age
      t.string :city

      t.timestamps
    end
  end
end

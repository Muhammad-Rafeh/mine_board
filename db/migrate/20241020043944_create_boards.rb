class CreateBoards < ActiveRecord::Migration[7.1]
  def change
    create_table :boards do |t|
      t.string :email
      t.string :name
      t.integer :height
      t.integer :width
      t.integer :number_of_mines
      t.jsonb :grid

      t.timestamps
    end
  end
end

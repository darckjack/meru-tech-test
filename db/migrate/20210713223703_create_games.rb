class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.integer :status
      t.integer :rows
      t.integer :cols
      t.integer :mines
      t.json :board, array: true, default: []

      t.timestamps
    end
  end
end

class CreateEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :entries do |t|
      t.references :user, foreign_key: true
      t.references :song, foreign_key: true
      t.integer :number

      t.timestamps
    end
  end
end

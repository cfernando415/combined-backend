class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.date :year
      t.integer :population
      t.string :gender
      t.integer :hired

      t.timestamps
    end
  end
end

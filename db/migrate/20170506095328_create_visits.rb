class CreateVisits < ActiveRecord::Migration[5.1]
  def change
    create_table :visits do |t|
      t.date :visit_date
      t.references :station, foreign_key: true

      t.timestamps
    end
  end
end

class CreateVisits < ActiveRecord::Migration[5.1]
  def change
    create_table :visits do |t|
      t.integer :station_id
      t.string :visit_date
    end
    add_foreign_key :stations, :visits, column: :station_id
  end
end

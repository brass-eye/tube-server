class CreateVisits < ActiveRecord::Migration[5.1]
  def change
    create_table :visits do |t|
      t.string :station_id
      t.string :visit_date
      add_foreign_key :stations, :stations
    end
  end
end

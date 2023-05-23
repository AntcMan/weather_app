class CreateWeathers < ActiveRecord::Migration[7.0]
  def change
    create_table :weathers do |t|
      t.string :city
      t.float :temperature
      t.string :description
      t.float :feels_like
      t.float :humidity
      t.datetime :sunrise
      t.datetime :sunset
      t.string :icon

      t.timestamps
    end
  end
end

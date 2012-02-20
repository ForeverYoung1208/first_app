class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.string :price
      t.integer :description

      t.timestamps
    end
  end
end

class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.integer :position
      t.integer :office
      t.integer :age
      t.string :start_date

      t.timestamps
    end
  end
end

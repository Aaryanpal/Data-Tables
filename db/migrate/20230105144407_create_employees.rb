class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :position
      t.string :office
      t.string :age
      t.string :start_date

      t.timestamps
    end
  end
end

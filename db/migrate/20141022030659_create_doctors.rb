class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :actor
      t.integer :number
    end
  end
end

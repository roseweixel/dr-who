class CreateCompanions < ActiveRecord::Migration
  def change
    create_table :companions do |t|
      t.string :name
    end
  end
end

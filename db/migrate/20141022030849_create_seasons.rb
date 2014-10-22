class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.integer :number
      t.datetime :begin_year
      t.datetime :end_year
    end
  end
end

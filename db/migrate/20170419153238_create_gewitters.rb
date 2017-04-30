class CreateGewitters < ActiveRecord::Migration
  def change
    create_table :gewitters do |t|
      t.text :content
      t.timestamps null: false
    end
  end
end

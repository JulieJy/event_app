class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.date :date
      t.text :description
      t.string :email

      t.timestamps
    end
  end
end

class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.string :race
      t.string :image_url
      t.date :date
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :county
      t.string :agency
      t.string :cause
      t.text :description
      t.string :disposition
      t.string :charges
      t.string :link_url
      t.string :mental_illness
      t.string :armed

      t.timestamps
    end
  end
end

class CreateNationalities < ActiveRecord::Migration[5.2]
  def change
    create_table :nationalities do |t|
      t.string :description 
      t.string :country
      t.string :country_int 
      t.string  :initials
      t.timestamps
    end
  end
end
class CreateZdjecies < ActiveRecord::Migration[5.0]
  def up
    create_table :zdjecies do |t|
      t.integer "galerie_id"
      t.string "nazwa"
      t.integer "pozycja"
      t.boolean "widoczne", :defoult=>true
      t.string "opis"
      t.attachment "zdjecie"

      t.timestamps
    end
  end

  def down
    drop_table :zdjecies

  end
end

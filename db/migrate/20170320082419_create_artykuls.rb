class CreateArtykuls < ActiveRecord::Migration[5.0]
  def up
    create_table :artykuls do |t|
        t.integer "strona_id"
        t.string "nazwa"
        t.integer "pozycja"
        t.boolean "widoczny", :default=>true
        t.text "zawartosc"


      t.timestamps
    end
  end

  def down
    drop_table :artykuls

  end
end

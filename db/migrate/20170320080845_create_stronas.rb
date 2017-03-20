class CreateStronas < ActiveRecord::Migration[5.0]
  def up
    create_table :stronas do |t|
        t.integer "kategorie_id"
        t.string "nazwa"
        t.integer "pozycja"
        t.boolean "widoczna", :default=>true

      t.timestamps
    end
  end

  def down
    drop_table :stronas
  end
end

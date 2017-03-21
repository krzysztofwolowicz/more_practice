class AddZdjecieColumnsToGaleries < ActiveRecord::Migration[5.0]

  def up
    add_attachment :galeries, :zdjecie
  end

  def down
    remove_attachment :galeries, :zdjecie
  end

end

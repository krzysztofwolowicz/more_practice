class AddZdjecieColumnsToArtykuls < ActiveRecord::Migration[5.0]
  def up
    add_attachment :artykuls, :zdjecie
  end

  def down
    remove_attachment :artykuls, :zdjecie
  end
end

class AddZdjecieColumnsToZdjecies < ActiveRecord::Migration[5.0]
    def up
    add_attachment :zdjecies, :zdjecie
  end

  def down
    remove_attachment :zdjecies, :zdjecie
  end
end

class Galerie < ApplicationRecord

  has_many :zdjecies, class_name: "Zdjecie"

  has_attached_file :zdjecie, styles: { medium: "600x600>", thumb: "200x200>" }

  validates_attachment_content_type :zdjecie, content_type: /\Aimage\/.*\z/

  scope :widoczna, lambda{where(:widoczny =>true)}
  scope :niewidoczna, lambda{where(:widoczny =>false)}
  scope :sortuj, lambda{order("galeries.pozycja ASC")}
  scope :najnowsza, lambda {order("galeries.created_at DESC")}

end

class Zdjecie < ApplicationRecord
  belongs_to :galerie

  has_attached_file :zdjecie, styles: { medium: "600x600>", thumb: "200x200>" }

  validates_attachment_content_type :zdjecie, content_type: /\Aimage\/.*\z/

  scope :widoczne, lambda{where(:widoczne =>true)}
  scope :niewidoczne, lambda{where(:widoczne =>false)}
  scope :sortuj, lambda{order("zdjecies.pozycja ASC")}
  scope :najnowsza, lambda {order("zdjecies.created_at DESC")}

end

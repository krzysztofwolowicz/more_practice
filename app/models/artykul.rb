class Artykul < ApplicationRecord
  belongs_to :strona

  has_attached_file :zdjecie, styles: { medium: "600x600>", thumb: "200x200>" }

  validates_attachment_content_type :zdjecie, content_type: /\Aimage\/.*\z/


  scope :widoczny, lambda{where(:widoczny =>true)}
  scope :niewidoczny, lambda{where(:widoczny =>false)}
  scope :sortuj, lambda{order("artykuls.pozycja ASC")}
  scope :najnowszy, lambda {order("artykuls.created_at DESC")}

end

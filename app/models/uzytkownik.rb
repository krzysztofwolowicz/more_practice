class Uzytkownik < ApplicationRecord
  has_secure_password

  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i


  validates :imie, :presence => {:in => true, message: "Pole nie może być puste"}
  validates :nazwisko, :presence => true
  validates :uzytkownik, length: {within: 4..25, message: "Nazwa użytkownika powinna zawierać miedzy 4 a 25 znaków"}, :uniqueness => true
  validates :email, :presence => true, length: {maximum: 100}, :format => EMAIL_REGEX, :confirmation => true

  scope :sortuj, lambda{order("nazwisko ASC, imie ASC")}
end

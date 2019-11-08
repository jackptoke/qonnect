class Client < ApplicationRecord
  has_many :locations
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :contact_name, :organisation_name, :acn, :mobile_no, :telephone_no, presence: true

  validates :contact_name, format: {
    with: /\A([a-zA-Z]+[-]?[a-zA-Z]+[.]?\s?)+\z/,
    message: "Alphabet and some symbols ('.', '-') only"
  }

  validates :organisation_name, format: {
    with: /\A([a-zA-Z]+[-]?[a-zA-Z]+[.]?\s?)+\z/,
    message: "Alphabet and some symbols ('.', '-') only"
  }

  validates :acn, format: {
    with: /\A([0-9]{9}|[0-9]{3}[-][0-9]{3}[-][0-9]{3})\z/,
    message: "9 digits number only or xxx-xxx-xxx"
  }

  validates :telephone_no, :mobile_no, format: {
    with: /[0][2-9][0-9]{8}/,
    message: "Contact number starts with '0' and has a length of 10 digits"
  }

end

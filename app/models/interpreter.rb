class Interpreter < ActiveRecord::Base
  enum sex: { male: 0, female: 1, unspecified: 2 }
  has_one :address
  has_many :available_interpreters
  has_many :booked_interpreters
  accepts_nested_attributes_for :address
  
  validates :first_name, :last_name, :abn, :mobile, :sex, :payment_rate, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar    
  
  validates :contact_person, format: {
    with: /\A([a-zA-Z]+[-]?[a-zA-Z]+[.]?\s?)+\z/,
    message: "Alphabet and some symbols ('.', '-') only"
  }

  validates :abn, format: {
    with: /^[0-9]{11}|([0-9]{2}[-][0-9]{3}[-][0-9]{3}[-][0-9]{3})$/,
    message: "Alphabet and some symbols ('.', '-') only"
  }
end

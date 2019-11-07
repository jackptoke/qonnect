class Location < ApplicationRecord
  belongs_to :client, optional: false
  has_many :job_bookings
  enum state: { NT: 0, NSW: 1, ACT: 2, VIC: 3, QLD: 4, SA: 5, WA: 6, TAS: 7}
  validates :suburb, format: { 
        with: /\A[a-zA-Z]+(\s)*[a-zA-Z]*\z/, 
        message: "Only letters and white spaces allowed" 
    }
    validates :postcode, format: {
        with: /\A[0-9]{4}\z/,
        message: "Only numbers allowed and must be 4 digits"
    }
    validates :street_address, format: {
        with: /\A[1-9]*\S?[1-9]*\s[A-Za-z]+\s*[A-Za-z]+[.]*\z/,
        message: "Only alphanumerical characters, and '.' are allowed"
    }
end

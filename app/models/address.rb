class Address < ApplicationRecord
    enum state: { NT: 0, NSW: 1, ACT: 2, VIC: 3, QLD: 4, SA: 5, WA: 6, TAS: 7}
    belongs_to :interpreter, optional: false
    validates :suburb, format: { 
        with: /\A[a-zA-Z]+(\s)*[a-zA-Z]*\z/, 
        message: "Only letters and white spaces allowed" 
    }
    validates :postcode, format: {
        with: /\A[0-9]{4}\z/,
        message: "Only numbers allowed"
    }

    validates :street_address, format: {
        with: /\A[1-9]*\S?[1-9]*\s[A-Za-z]+\s*[A-Za-z]+\S*\z/,
        message: "Only numbers allowed"
    }
end

require 'rails_helper'

RSpec.describe Supplier, type: :model do
  describe Supplier do
    it "is valid with valid attributes" do
      supplier = Supplier.new(
        corporate_name: "ACME",
        brand_name: "ACME",
        registration_number: "12345",
        full_address: "123 Main St",
        city: "City",
        state: "State",
        email: "acme@example.com"
      )
      expect(supplier).to be_valid
    end
  end
  
end

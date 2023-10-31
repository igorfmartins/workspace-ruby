class Warehouse < ApplicationRecord
    validates :name, :code, :description, :address, :cep, :city, :area, presence: true
    validates :code, uniqueness: true
    
   # validates( atributos, tipo da validação : true)
end

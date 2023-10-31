require 'rails_helper'

RSpec.describe Warehouse, type: :model do
    describe '#valid?'  do
    
        it 'false when name is empty' do
          #Arrange
          e = Warehouse.new(name:'', code:'RIO', address: 'Endereço', cep:'25000-000', city:'Rio', area: 1000, description:'Alguma descrição.')
                      
          #Act
          result = e.valid?

          #Assert
         expect(result).to eq false
          
        end

        it 'false when code is empty' do
            e = Warehouse.new(name:'Rio', code:'', address: 'Endereço', cep:'25000-000', city:'Rio', area: 1000, description:'Alguma descrição.')
                      
          #Act
          result = e.valid?

          #Assert
          expect(result).to eq false
            
        end

        it 'false when address is empty' do
            e = Warehouse.new(name:'Rio', code:'RIO', address: '', cep:'25000-000', city:'Rio', area: 1000, description:'Alguma descrição.')
                      
            #Act
            result = e.valid?
  
            #Assert
            expect(result).to eq false
        end

        it 'false when code is already in use' do
            #Arrange
            first_warehouse = Warehouse.create(name:'Rio', code:'RIO', address: 'Endereço', cep:'25000-000', city:'Rio', area: 1000, description:'Alguma descrição.')
            
            second_warehouse= Warehouse.new(name:'Buzios', code:'RIO', address: 'Armação de Buzios', cep:'45000-000', city:'Rio', area: 3000, description:'Um aeroporto bem pequeno.')
            
            #Act
            result = second_warehouse.valid?
  
            #Assert
            expect(result).to eq false
        end


    end








end

require 'rails_helper'

describe 'Usúario vê os fornecedores' do 

    it 'a partir do menu' do 
        #Arrange

        #Act
        visit root_path
        within ('nav') do
         click_on 'Fornecedores'
        end
        
        #Assert
        expect(current_path).to eq suppliers_path
    end

    it 'com sucesso' do 
        #Arrange
        Supplier.create!(corporate_name:'ACME LTDA', brand_name:'ACME', registration_number:'434454234', full_address:'Av. das Palmas 1100', city:'Bauru', state:'SP', email:'contatoacme@outlook.com')
        
        Supplier.create!(corporate_name:'Spark Industries Company LTDA', brand_name:'Spark', registration_number:'3245676514', full_address:'Av. da Torre, 1', city:'Teresina', state:'PI', email:'sparkindustries@outlook.com')

        #Act
        visit root_path
         within ('nav') do
        click_on 'Fornecedores'
        end
        
        #Assert
        expect(page).to have_content 'ACME LTDA'
        expect(page).to have_content 'Spark Industries Company LTDA'
        expect(page).to have_content 'Bauru'
        expect(page).to have_content 'Teresina'
        expect(page).to have_content 'Spark'
    end 


    it 'e não existem fornecedores cadastrados' do 
        #Arrange

        #Act
        visit root_path
        within ('nav') do
        click_on 'Fornecedores'
        end
        
        #Assert
        expect(page).to have_content 'Não existem fornecedores cadastrados.'        
    end 
end

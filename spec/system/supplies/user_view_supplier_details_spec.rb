require 'rails_helper'

describe 'Usuário vê detalhes de um fornecedor' do

    it 'a partir da tela inicial' do 
        #Arrange
        supplier = Supplier.create!(corporate_name:'ACME LTDA', brand_name:'ACME', registration_number:'434454234', full_address:'Av. das Palmas, 1100', city:'Bauru', state:'SP', email:'contatoacme@outlook.com')
        
        #Act
        visit root_path
        click_on 'Fornecedores'
        click_on 'ACME'      

        #Assert
        expect(page).to have_content('ACME LTDA')
        expect(page).to have_content('Av. das Palmas, 1100')
        expect(page).to have_content('Bauru')
        expect(page).to have_content('contatoacme@outlook.com')
        expect(page).to have_content('434454234')
    end

    it 'e volta para tela inicial' do         
     #Arrange
     supplier = Supplier.create!(corporate_name:'ACME LTDA', brand_name:'ACME', registration_number:'434454234', full_address:'Av. das Palmas, 1100', city:'Bauru', state:'SP', email:'contatoacme@outlook.com')
        
     #Act
     visit root_path
     click_on 'Fornecedores'
     click_on 'ACME'
     click_on 'Voltar'

     #Assert
     expect(current_path).to eq(root_path)
    end

end

require 'rails_helper'

describe 'Usuário edita um fornecedor' do 

    it ' na página de detalhes' do 
     #Arrange
     supplier = Supplier.create!(corporate_name:"ACME LTDA", brand_name:"NASA", registration_number:'434454234', full_address:'Av. das Palmas, 1100', city:'Bauru', state:'SP', email:'contatoacme@outlook.com')
        
     #Act
     visit root_path
     click_on 'Fornecedores'
     click_on "NASA"
     click_on 'Editar'

     #Assert
     expect(page).to have_field("Razão Social", with:"ACME LTDA")
     expect(page).to have_field("Nome Fantasia", with:"NASA")
     expect(page).to have_field("CNPJ", with:'434454234')
     expect(page).to have_field("Endereço")
     expect(page).to have_field("Cidade")
     
    end

    it 'com sucesso' do 
      #Arrange
      supplier = Supplier.create!(corporate_name:'ACME LTDA', brand_name:"ACME", registration_number:'434454234', full_address:'Av. das Palmas, 1100', city:'Bauru', state:'SP', email:'contatoacme@outlook.com')
      
      #Act
      visit root_path
      click_on 'Fornecedores'
      click_on "ACME"
      click_on 'Editar'
      fill_in "Razão Social", with: 'Nestlé'
      fill_in 'Cidade', with: 'Floripa'
      fill_in 'Endereço', with: 'Av da Praia Grande, 1300'
      click_on 'Enviar'

      #Assert      
      expect(page).to have_content 'Nestlé'
      expect(page).to have_content 'Floripa'
      expect(page).to have_content 'Av da Praia Grande, 1300'
      expect(page).to have_content 'Fornecedor atualizado com sucesso.'
    end
   
end

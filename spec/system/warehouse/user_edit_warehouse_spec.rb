require 'rails_helper'

describe 'Usuário edita um galpão' do 

    it ' a partir da página de detalhes' do 

     #Arrange
     edit_warehouse = Warehouse.create!(name:'Rio', code:'RIO', address: 'Endereço', cep:'25000-000', city:'Rio', area: 1000, description:'Alguma descrição.')
            
     #Act
     visit root_path
     click_on 'Rio'
     click_on 'Editar'

     #Assert
     expect(page).to have_content 'Editar Galpão'
     expect(page).to have_field("Nome", with: 'Rio')
     expect(page).to have_field("Descrição")
     expect(page).to have_field("Código")
     expect(page).to have_field("Endereço")
     expect(page).to have_field("Cidade")
     expect(page).to have_field("CEP")
     expect(page).to have_field("Área")

    end

    it 'com sucesso' do 

      #Arrange
      edit_warehouse = Warehouse.create!(name:'Rio', code:'RIO', address: 'Endereço', cep:'25000-000', city:'Rio', area: 1000, description:'Alguma descrição.')
    
      #Act
      visit root_path
      click_on 'Rio'
      click_on 'Editar'
      fill_in 'Nome', with: 'Galpão Internacional'
      fill_in 'Cidade', with: 'Niteroi'
      fill_in 'Endereço', with: 'Av da Praia Grande, 1300'
      click_on 'Enviar'


      #Assert
      
      expect(page).to have_content 'Galpão Internacional'
      expect(page).to have_content 'Niteroi'
      expect(page).to have_content 'Av da Praia Grande, 1300'
      expect(page).to have_content 'Galpão atualizado com sucesso.'
      


    end

    it ' e mantém os campos obrigatórios' do 

     #Arrange
     edit_warehouse = Warehouse.create!(name:'Rio', code:'RIO', address: 'Endereço', cep:'25000-000', city:'Rio', area: 1000, description:'Alguma descrição.')
    

     #Act
      visit root_path
      click_on 'Rio'
      click_on 'Editar'
      fill_in 'Nome', with: 'Galpão Internacional'
      fill_in 'Cidade', with: 'Niteroi'
      fill_in 'Endereço', with: 'Av da Praia Grande, 1300'
      click_on 'Enviar'

     #Assert
     expect(page).to have_content 'Endereço'
     


    end







end

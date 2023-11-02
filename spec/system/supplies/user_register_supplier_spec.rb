require 'rails_helper'

describe 'Usuário cadastra novo fornecedor' do 

    it 'a partir do menu' do 
        #Arrange

        #Act
        visit root_path
        click_on 'Fornecedores'
        click_on 'Cadastrar novo fornecedor'     

        #Assert
        expect(page).to have_field ('Nome Fantasia')
        expect(page).to have_field ('Razão Social')
        expect(page).to have_field ('CNPJ')
        expect(page).to have_field ('Endereço')
        expect(page).to have_field ('Cidade')
        expect(page).to have_field ('Estado')
        expect(page).to have_field ('email')
    end

    it 'com sucesso' do 
        #Arrange

        #Act
        visit root_path
        click_on 'Fornecedores'
        click_on 'Cadastrar novo fornecedor' 
        fill_in 'Razão Social', with: 'Nestle Chocolatinhos e Guloseimas LTDA.' 
        fill_in 'Nome Fantasia', with: 'Nestlé'
        fill_in 'CNPJ', with: '8925413679-0001'
        fill_in 'Endereço', with: 'Rua da Fábrica, 1500'
        fill_in 'Cidade', with: 'Floripa'
        fill_in 'Estado', with: 'Santa Catarina'
        fill_in 'email', with: 'nestlenestle@outlook.com'
        click_on 'Enviar'

        #Assert
        expect(page).to have_content 'Fornecedor cadastrado com sucesso.'
        expect(page).to have_content 'Nestlé'
        expect(page).to have_content 'Floripa'
        expect(page).to have_content '8925413679-0001'       
    end

    it 'com dados incompletos' do 
        #Arrange

        #Act
        visit root_path
        click_on 'Fornecedores'
        click_on 'Cadastrar novo fornecedor' 
        fill_in 'Nome Fantasia', with: ''
        fill_in 'Cidade', with: ''
        fill_in 'CNPJ', with: ''
        click_on 'Enviar'
       
        #Assert
        expect(page).to have_content 'Fornecedor não cadastrado.'
        expect(page).to have_content 'Razão Social não pode ficar em branco'
        expect(page).to have_content 'Nome Fantasia não pode ficar em branco'
        expect(page).to have_content 'CNPJ não pode ficar em branco'   
        expect(page).to have_content 'Endereço não pode ficar em branco'   
        expect(page).to have_content 'CNPJ não pode ficar em branco'   
        expect(page).to have_content 'Cidade não pode ficar em branco'   
        expect(page).to have_content 'Estado não pode ficar em branco'   
        expect(page).to have_content 'email não pode ficar em branco'       
    end
end
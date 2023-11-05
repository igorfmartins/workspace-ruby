require 'rails_helper'

describe 'Usuário visita tela inicial' do
    it 'e vê o nome do app' do
        # Arrange
        
        #Act
        visit (root_path)
        #Assert
        expect(page).to have_content('Galpões & Estoque')
    end

    it 'e vê os galpões cadastrados' do 
        #Arrange
        Warehouse.create(name:"Rio" , code:"SDU" , city:"Rio de Janeiro" , area:"60_000", address:'Avenida de Porto, 1200', cep:'20000-000', description: 'Galpão pequeno próximo a praia')

        #Act
        visit('/')

        #Assert
        expect(page).not_to have_content('Não existem galpões cadastrados')
        expect(page). to have_content('Rio')
        expect(page). to have_content('SDU')
        expect(page). to have_content('Rio de Janeiro')
        expect(page). to have_content('60000 m²')
    end

    it 'e não exitem galpões cadastrados' do 
        #Arrange

        #Act
        visit(root_path)
        #
        expect(page).to have_content('Não existem galpões cadastrados')
    end
end
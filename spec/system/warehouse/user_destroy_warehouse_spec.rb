require 'rails_helper'

describe "Usuário remove um galpão" do 

  it ' apaga um galpão selecionado' do
    #Arrange
    
    warehouse = Warehouse.create!(name:'Rio', code:'RIO', address: 'Endereço', cep:'25000-000', city:'Rio', area: 1000, description:'Alguma descrição.')
          
    #Act
    visit root_path
    click_on 'Rio'
    click_on 'Remover'

    #Assert
    expect(current_path).to eq root_path
    expect(page).to have_content "Galpão removido com sucesso."
    expect(page).not_to have_content 'Rio'
    expect(page).not_to have_content 'RIO'      
  end

  it 'não apaga outros galpões' do
    #Arrange        
    first_warehouse = Warehouse.create!(name:'Aeroporto-SP', code:'GRU', address: 'Av. Bem longe, 1500', cep:'25000-000', city:'São Paulo', area: 100000, description:'Alguma descrição.')
    second_warehouse = Warehouse.create!(name:'Belo Horizonte', code:'BHZ', address: 'Av.Tiradentes, 350', cep:'45000-000', city:'Belo Horizonte', area: 8000, description:'Galpão para cargas mineiras.')
          
    #Act
    visit root_path
    click_on 'Aeroporto-SP'
    click_on 'Remover'

    #Assert
    expect(current_path).to eq root_path
    expect(page).to have_content "Galpão removido com sucesso."
    expect(page).not_to have_content 'Aeroporto-SP'
    expect(page).to have_content 'Belo Horizonte'       
  end
end
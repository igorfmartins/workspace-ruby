require 'rails_helper'

describe 'Usuário vê modelos de produtos' do
  it ' 'do 
  #Arrange

  #Act
  visit root_path
  within('nav') do
    click_on 'Modelos de Produtos'
  end

  #Assert
  expect(current_path).to eq product_models_path

  end

  it ' ' do 
    #Arrange
    produt = Supplier.create!(brand_name: 'Samsung', corporate_name: 'Samsung Eletronicos LTDA', registration_number: '345431220-0001', full_address: 'Av. das Nações Unidas, 1000', city: 'São Paulo', state: 'SP', email: 'sac@samsung.com.br')
    ProductModel.create!(name:'TV-32', weight: 8000, width: 70, height: 45, depth: 10, sku: 'TV32-SAMSU-XPTO90', supplier: produt)
    ProductModel.create!(name: 'SoundBar 8.1 Surrond', weight: 3000, width: 80, height: 15, depth: 20, sku: 'SOU71-SAMSU-NOIZ77', supplier: produt)

    #Act
    visit root_path
    within('nav') do
      click_on 'Modelos de Produtos'
    end

    #Assert
    expect(page).to have_content 'TV-32'
    expect(page).to have_content 'Samsung'
    expect(page).to have_content 'TV32-SAMSU-XPTO90'
    expect(page).to have_content 'SoundBar 8.1 Surrond'
    expect(page).to have_content 'SOU71-SAMSU-NOIZ77'    
  end

  it 'e não existem produtos cadastrados' do 

    #Arrange

    #Act
    visit root_path
    within('nav') do
      click_on 'Modelos de Produtos'
    end

    #Assert
    expect(page).to have_content 'Nenhum modelo de produto cadastrado.'

  end
end

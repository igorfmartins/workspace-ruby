require'rails_helper'

describe 'Usuário cadastra um modelo de prouto' do 
  it 'com sucesso' do 

    #Arrange
    supplier = Supplier.create!(brand_name: 'Samsung', corporate_name: 'Samsung Eletronicos LTDA', registration_number: '094567753-0001', full_address:'Av.Nações Unidas, 1239', city: 'São Paulo', state:'SP', email: 'sac@samsung.com.br')
    other_supplier = Supplier.create!(brand_name: 'HP', corporate_name: 'HP Eletronicos LTDA', registration_number: '09346753-0001', full_address:'Av.do Pão de Queijo, 19', city: 'Minas Gerais', state:'MG', email: 'sac@hpcomputadores.com.br')    
    User.create!(email: 'devdeve@outlook.com', password:'password')

    #Act
    visit root_path
    click_on 'Entrar'                       
    fill_in 'E-mail', with: 'devdeve@outlook.com'
    fill_in 'Senha', with: 'password'
    click_on 'Log in' 
    click_on 'Modelos de Produtos'
    click_on 'Cadastrar novo'
    fill_in 'Nome', with: 'TV 40 polegadas'
    fill_in 'Peso', with: 10_000
    fill_in 'Altura', with: 60
    fill_in 'Largura', with: 90
    fill_in 'Profundidade', with: 10
    fill_in 'SKU', with: 'TV40-SAMS-XPTO'
    select 'Samsung', from: 'Fornecedor'
    click_on 'Enviar'

    #Assert
    expect(page).to have_content 'Modelo de produto cadastrado com sucesso.'
    expect(page).to have_content 'TV 40 polegadas'
    expect(page).to have_content 'TV40-SAMS-XPTO'
    expect(page).to have_content 'Dimensão: 60cm x 90cm x 10cm'
    expect(page).to have_content 'Peso: 10000g'
    expect(page).to have_content 'Fornecedor: Samsung'

  end

  it 'deve preencher todos os campos' do 

    #Arrange
    User.create!(email: 'devdeve@outlook.com', password:'password')
    supplier = Supplier.create!(brand_name: 'Samsung', corporate_name: 'Samsung Eletronicos LTDA', registration_number: '094567753-0001', full_address:'Av.Nações Unidas, 1239', city: 'São Paulo', state:'SP', email: 'sac@samsung.com.br')
    
    #Act
    visit root_path
    click_on 'Entrar'                       
    fill_in 'E-mail', with: 'devdeve@outlook.com'
    fill_in 'Senha', with: 'password'
    click_on 'Log in' 
    click_on 'Modelos de Produtos'
    click_on 'Cadastrar novo'
    fill_in 'Nome', with: ''    
    fill_in 'SKU', with: ''    
    click_on 'Enviar'

    #Assert
    expect(page).to have_content 'Não foi possível cadastrar o modelo de produto.'
  end


end

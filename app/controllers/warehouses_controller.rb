class  WarehousesController < ApplicationController

  before_action :set_warehouse, only: [:show, :edit, :update, :destroy]

  def show    
  end

  def new
    @warehouse = Warehouse.new       
  end

  def create
    @warehouse = Warehouse.new(warehouse_params)
    if @warehouse.save()
      flash[:notice] = "Galpão cadastrado com sucesso."
      redirect_to root_path
    else
      flash[:notice] = 'Galpão não cadastrado.'
      redirect_to root_path
      #render (atualiza a própria pagina sem perder os dados anteriores)

    end  
  end
      
  def edit
  end
   

  def update    
    
    if @warehouse.update!(warehouse_params)
      flash[:notice] = 'Galpão atualizado com sucesso.'
      redirect_to root_path
      
    else
      flash.now[:notice] = 'Galpão não atualizado.'
      redirect_to warehouse_path(@warehouse.id)
    end   

  end

  def destroy  
    @warehouse.destroy
    redirect_to root_path, notice: 'Galpão removido com sucesso.'
  end

  private    
  def set_warehouse
    @warehouse = Warehouse.find(params[:id])  
  end

  def  warehouse_params
    params.require(:warehouse).permit(:name, :code, :city, :description, :address, :cep, :area)
  end


end
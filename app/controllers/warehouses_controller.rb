class  WarehousesController < ApplicationController

  def show
    @warehouse = Warehouse.find(params[:id])
  end

  def new
    @warehouse = Warehouse.new       
  end

  def create
    warehouse_params = params.require(:warehouse).permit(:name, :code, :city, :description, :address, :cep, :area)
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
    @warehouse = Warehouse.find(params[:id])
  end


  def update
    @warehouse = Warehouse.find(params[:id])
    warehouse_params = params.require(:warehouse).permit(:name, :code, :city, :description, :address, :cep, :area)    
    
    if @warehouse.update!(warehouse_params)
      flash[:notice] = 'Galpão atualizado com sucesso.'
      redirect_to root_path
      
    else
      flash.now[:notice] = 'Galpão não atualizado.'
      redirect_to warehouse_path(@warehouse.id)
    end   

  end
    


end
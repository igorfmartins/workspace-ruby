class RenameCorporateNameInSuppliers1 < ActiveRecord::Migration[7.1]
  def change
    rename_column :suppliers, :corporate__name, :corporate_name 
  end
 
end

class AddPagenumToPages < ActiveRecord::Migration[5.2]
  def change
    add_column :pages, :pagenum, :integer
  end
end

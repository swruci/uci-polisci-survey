class AddAfterwordToSurveys < ActiveRecord::Migration[5.2]
  def change
    add_column :surveys, :afterword, :text
  end
end

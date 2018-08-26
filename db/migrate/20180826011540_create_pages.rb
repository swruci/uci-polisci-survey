class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.references :survey, foreign_key: true

      t.timestamps
    end

    remove_foreign_key :questions, :surveys
    remove_column :questions, :survey_id

    add_reference :questions, :page, index: true
    add_foreign_key :questions, :pages
  end
end

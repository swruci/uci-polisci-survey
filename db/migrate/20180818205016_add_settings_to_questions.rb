class AddSettingsToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :settings, :json
  end
end

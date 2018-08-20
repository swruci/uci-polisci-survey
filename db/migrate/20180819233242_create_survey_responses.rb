class CreateSurveyResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :survey_responses do |t|
      t.references :survey, foreign_key: true

      t.timestamps
    end

    change_table :answers do |r|
      r.references :survey_response, foreign_key: true
    end
  end
end

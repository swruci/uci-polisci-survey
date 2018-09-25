class AddParticipantToSurveyResponses < ActiveRecord::Migration[5.2]
  def change
    add_column :survey_responses, :participant, :text
  end
end

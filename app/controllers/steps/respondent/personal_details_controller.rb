module Steps
  module Respondent
    class PersonalDetailsController < Steps::RespondentStepController
      def edit
        @form_object = PersonalDetailsForm.build(
          current_record, c100_application: current_c100_application
        )
      end

      def update
        update_and_advance(
          PersonalDetailsForm,
          record: current_record,
          as: :personal_details
        )
      end
    end
  end
end

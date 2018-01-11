module Steps
  module Miam
    class AcknowledgementForm < BaseForm
      attribute :miam_acknowledgement, Boolean

      private

      def persist!
        raise C100ApplicationNotFound unless c100_application

        c100_application.update(
          miam_acknowledgement: miam_acknowledgement
        )
      end
    end
  end
end

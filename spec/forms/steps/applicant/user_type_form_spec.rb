require 'spec_helper'

RSpec.describe Steps::Applicant::UserTypeForm do
  let(:arguments) { {
    c100_application: c100_application,
    user_type: user_type
  } }
  let(:c100_application) { instance_double(C100Application, user_type: nil) }
  let(:user_type) { nil }

  subject { described_class.new(arguments) }

  describe '.choices' do
    it 'returns the relevant choices' do
      expect(described_class.choices).to eq(%w(
        themself
        representative
      ))
    end
  end

  describe '#save' do
    it_behaves_like 'a value object form', attribute_name: :user_type, example_value: 'themself'

    context 'when user_type is valid' do
      let(:user_type) { 'themself' }

      it 'saves the record' do
        expect(c100_application).to receive(:update).with(
          user_type: UserType::THEMSELF
        ).and_return(true)
        expect(subject.save).to be(true)
      end
    end

    context 'when user_type is already the same on the model' do
      let(:c100_application) {
        instance_double(
          C100Application,
          user_type: UserType::THEMSELF
        )
      }
      let(:user_type) { 'themself' }

      it 'does not save the record but returns true' do
        expect(subject).to receive(:user_type_value).and_call_original
        expect(c100_application).to_not receive(:update)
        expect(subject.save).to be(true)
      end
    end
  end
end

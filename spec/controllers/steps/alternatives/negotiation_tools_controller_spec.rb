require 'rails_helper'

RSpec.describe Steps::Alternatives::NegotiationToolsController, type: :controller do
  it_behaves_like 'an intermediate step controller', Steps::Alternatives::NegotiationToolsForm, C100App::AlternativesDecisionTree
end

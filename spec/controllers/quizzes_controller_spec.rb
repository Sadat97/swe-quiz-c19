# frozen_string_literal: true

require 'rails_helper'

RSpec.describe QuizzesController, type: :controller do
  let(:valid_attributes) do
    {
      "title": 'ana hamada',
      "pass_score": 20,
      "duration": 10,
      "skill_type": 'anwar',
      "questions_attributes": [
        {
          "question_title": 'haamama',

          "choices_attributes": [
            {
              "title": 'choice 1',
              "correct_choice": true
            },
            {
              "title": 'choice 2',
              "correct_choice": false
            },
            {
              "title": 'choice 3',
              "correct_choice": false
            }
          ]
        }
      ]
    }
  end

  let(:invalid_attributes) do
   {"pass_score": 20,
    "duration": 10,
    "skill_type": 'anwar'
   }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # QuestionsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      quiz = Quiz.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      quiz = Quiz.create! valid_attributes
      get :show, params: { id: quiz.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Quiz' do
        expect do
          post :create, params: { quiz: valid_attributes }, session: valid_session
        end.to change(Quiz, :count).by(1)
      end

      it 'renders a JSON response with the new quiz' do
        post :create, params: { quiz: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new quiz' do
        post :create, params: { quiz: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested quiz' do
        quiz = Quiz.create! valid_attributes
        put :update, params: { id: quiz.to_param, quiz: new_attributes }, session: valid_session
        quiz.reload
        skip('Add assertions for updated state')
      end

      it 'renders a JSON response with the quiz' do
        quiz = Quiz.create! valid_attributes

        put :update, params: { id: quiz.to_param, quiz: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end
end


  describe 'DELETE #destroy' do
    it 'destroys the requested quiz' do
      quiz = Quiz.create! valid_attributes
      expect do
        delete :destroy, params: { id: quiz.id.to_param }, session: valid_session
      end.to change(Quiz, :count).by(-1)
    end
  end
end

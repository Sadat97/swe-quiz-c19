# frozen_string_literal: true

require 'swagger_helper'

describe 'Quizzes Api' do
  path '/quizzes' do
    post 'Creates a quiz' do
      tags 'Quizzes'
      consumes 'application/json'
      parameter name: :quiz, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          skill_type: { type: :string },
          pass_score: { type: :integer },
          duration: { type: :integer }
        },
        required: %w[title skill_type pass_score duration]
      }

      response '201', 'quiz_created' do
        let(:quiz) { { title: 'quiz title', skill_type: 'machine learning', pass_score: 20, duration: 120 } }
        run_test!
      end

      response '422', 'unprocessable entity' do
        let(:quiz) { { title: 'quiz title' } }
        run_test!
      end
    end
  end

  path '/quizzes/{id}' do
    get 'Retrieves the quiz' do
      tags 'Quizzes'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'quiz found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 title: { type: :string },
                 skill_type: { type: :string },
                 pass_score: { type: :integer },
                 duration: { type: :integer }
               },
               required: %w[id title skill_type pass_score duration]
        let(:id) do
          Quiz.create(title: 'quiz title',
                      skill_type: 'machine learning',
                      pass_score: 20,
                      duration: 120).id
        end
        run_test!
      end

      response '404', 'pet not found' do
        let(:id) { 'invalid' }
        run_test!
      end

    end
  end
end

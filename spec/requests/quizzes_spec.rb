require 'swagger_helper'

RSpec.describe 'quizzes', type: :request do

  path '/quizzes' do
    get(summary: 'list quizzes') do
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
    post(summary: 'create quiz') do
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end

  path '/quizzes/{id}' do
    # You'll want to customize the parameter types...
    parameter 'id', in: :path, type: :string
    # ...and values used to make the requests.
    let(:id) { '123' }

    get(summary: 'show quiz') do
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
    patch(summary: 'update quiz') do
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
    put(summary: 'update quiz') do
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
    delete(summary: 'delete quiz') do
      response(200, description: 'successful') do
        # You can add before/let blocks here to trigger the response code
      end
    end
  end
end

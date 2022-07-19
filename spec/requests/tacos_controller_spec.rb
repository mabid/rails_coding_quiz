# spec/controllers/api/v1/tacos_controller_spec.rb

require 'rails_helper'
RSpec.describe Api::V1::TacosController do
  describe 'GET /index' do

    before do
      FactoryBot.create_list(:taco, 10)
      get '/api/v1/tacos'
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it 'returns all tacos' do
      expect(json.size).to eq(10)
    end

  end

  describe 'POST /create' do
    context 'with valid params' do
      let!(:taco) { FactoryBot.create(:taco) }

      before do
        post '/api/v1/tacos', params: { 
          taco: {
                  meat: taco.meat,
                  rice: taco.rice,
                  salsa: taco.salsa,
                  cheese: taco.cheese,
                  notes: taco.notes
                } 
        } 
      end

      it 'returns the meat' do
        expect(json['meat']).to eq(taco.meat)
      end

      it 'returns the rice' do
        expect(json['rice']).to eq(taco.rice)
      end

      it 'returns the salsa' do
        expect(json['salsa']).to eq(taco.salsa)
      end

      it 'returns the notes' do
        expect(json['notes']).to eq(taco.notes)
      end
      it 'returns a created status' do
        expect(response).to have_http_status(:created)
      end
    end

    context do
      before do
        post '/api/v1/tacos', params: { 
          taco: {
                  meat: 'fish'
                } 
        } 
      end
      it 'returns a unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    let!(:taco) { FactoryBot.create(:taco) }

    before do
      delete "/api/v1/tacos/#{taco.id}"
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end

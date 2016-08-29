require 'rails_helper'

RSpec.describe TagsController, type: :controller do

  describe "POST #create" do 
    context 'authenticated user' do
      sign_in_user   
      it "returns http success" do
        post :create, tag:{name: 'SomeText'}, format: :js
        expect(response).to have_http_status(:success)
      end

      it "saves tag to db" do
        expect{ post :create, tag:{name: 'SomeText'}, format: :js}.to change(Tag, :count).by 1
      end 
    end
    context 'non authenticated user' do
      it "saves tag to db" do
        expect{ post :create, tag:{name: 'SomeText'}, format: :js}.to_not change(Tag, :count)
      end 
    end 

  end
end

require 'rails_helper'

RSpec.describe ProfileController, type: :controller do

  describe 'GET#index' do
    let!(:user){ create :user }
    context 'Authenticated user' do      
      sign_in_user
      it 'should render view index' do
        get :index
        expect(response).to render_template :index
      end
    end

    context 'Non authenticated user' do
      it 'should not render view index' do
        get :index
        expect(response).to_not render_template :index
      end
    end
  end

end

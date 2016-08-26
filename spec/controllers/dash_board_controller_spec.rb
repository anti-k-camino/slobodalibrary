require 'rails_helper'

RSpec.describe Admin::DashBoardController, type: :controller do

  describe 'Get#index' do  

    context 'Authenticated user' do

      context 'admin' do
        sign_in_admin

        it 'should render index view' do
          get :index
          expect(response).to render_template :index
        end
      end

      context 'non-admin' do
        sign_in_user

        it 'should not render index view' do
          get :index
          expect(response).to_not render_template :index
        end
      end
    end

    context 'Non authenticated user' do

      it 'should not render index view' do
        get :index
        expect(response).to_not render_template :index
      end
    end
  end

end

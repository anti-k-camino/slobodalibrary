require 'rails_helper'

RSpec.describe Admin::DashBoardController, type: :controller do

  describe 'Get#index' do  

    context 'Authenticated user' do

      context 'admin' do
        sign_in_admin
        before do
          get :index
        end

        it 'should render index view' do          
          expect(response).to render_template :index
        end

        it 'render layout admin' do          
          expect(response).to render_template("layouts/admin")
        end
      end

      context 'non-admin' do
        sign_in_user
        before do
          get :index
        end

        it 'should not render index view' do          
          expect(response).to_not render_template :index
        end

        it 'does not render layout admin' do                    
          expect(response).to_not render_template("layouts/admin")
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

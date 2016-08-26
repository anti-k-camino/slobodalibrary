module ControllerMacros
  def sign_in_user
    before do
      @user = create(:user)
      @request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in @user
    end
  end

  def sign_in_admin
    before do
      @admin = create(:admin)
      @request.env['devise.mapping'] = Devise.mappings[:admin]
      sign_in @admin
    end
  end
end
include Warden::Test::Helpers
Warden.test_mode!

# Feature: Password reset
#   As a user
#   I want to reset my password
#   So I can change my password
feature 'Password reset', :devise do

  after(:each) do
    Warden.test_reset!
  end

  # Scenario: User can delete own account
  #   Given I am signed in
  #   When I delete my account
  #   Then I should see an account deleted message
  scenario 'user can reset his password' do
    user = FactoryGirl.create(:user)
    visit new_user_session_url
    click_on 'Forgot password?'
    fill_in 'Email', :with => user.email
    click_on 'Reset Password'
    expect(page).to have_content I18n.t 'devise.passwords.send_instructions'
  end

  scenario 'user cannot reset password if he did not sign_up' do
    user = FactoryGirl.create(:user)
    visit new_user_session_url
    click_on 'Forgot password?'
    fill_in 'Email', :with => "gg@invalid.com"
    click_on 'Reset Password'
    expect(page).to have_content I18n.t 'errors.messages.not_saved.one', resource: 'user'
  end
end

module SessionHelpers
def sign_up
  visit new_user_registration_path

  fill_in :user_username, with: 'wow3odf2'
  fill_in :user_email, with: 'ee3e@asd.com'
  fill_in :user_password, with: 'nigfigdfi231nf'
  fill_in :user_password_confirmation, with: 'nigfigdfi231nf'

  click_button 'Sign up'
end
end
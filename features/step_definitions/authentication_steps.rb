Given /^I am a new, authenticated user$/ do
  email = "user_1@example.com"
  password = "password"
  User.create(email: email, password: password, password_confirmation: password)

  visit "/users/sign_in"
  fill_in "user_email", with: email
  fill_in "user_password", with: password
  click_button "Log in"

end
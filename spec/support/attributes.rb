def sign_up
visit new_user_registration_path
fill_in  'Email', with:'user2@exemple.com'
fill_in  'Username', with:'user2'
fill_in  'Password', with:'secret'
fill_in  :user_password_confirmation, with: 'secret'
click_button 'Sign up'


end


def sign_in user

  visit new_user_session_path

  fill_in :user_email, with: user.email
  fill_in 'Username', with: user.username
  fill_in "Password", with: user.password
  click_button "Log in"

end




def user_attributes(overrides = {})
{
email:'admin@exemple.com',
password:'secret',
username:'admin',

}.merge(overrides)

end

def create_article

  fill_in "Title", with: 'new comment for article'
  
  fill_in "Description", with: 'description for the comment'
  click_button "Create Article"
  end


  ######################
  def add_comment 
 fill_in :comment_body, with: 'new comment body for the article'
 click_button "Submit"
  end
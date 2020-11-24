require "rails_helper"
#require 'rails_helper'
# RSpec


##################################
 describe 'new session and new user' do 
  before do 
@user = User.find_by email: 'user2@exemple.com'
visit root_path
sign_in @user
expect(page).to have_text 'new comment for article'
  end
end
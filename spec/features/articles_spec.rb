require "rails_helper"
#require 'rails_helper'
# RSpec


##################################
 describe 'new session and new user' do 
  before do 
@user = User.create(user_attributes)
@article=Article.create! title: 'first title of article',description: 'descrtiption of the article', user_id: @user.id, user_name: @user.username
@comment1 =Comment.create! user_name: @user.username, body: 'body descrtiption and text', article_id:@article.id, user_id: @user.id
  end

########################
  it 'sign_up' do 
   
   sign_up

expect(page).to have_text I18n.t('devise.registrations.signed_up')
 
  end
############################   
 

  it 'sign in and create article' do
 

  # article = FactoryGirl.create(:article, title:'Send Lorem ipsum dolor sit amet, consectetur adipisicing elit, sned do eiusmod tempor incididunt ut labore et dolore magna aliqua.
  #   Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris visi ut aliquip ex ea commodo consequat.')


sign_in @user

  
  expect(@article.get_title).to eq('first title of article')
  expect(Article.past_articles).to eq([@article])

  visit article_path(@article)
 expect(page).to have_text @article.title
  end
#######################################
it 'sign in and create article' do 
  sign_in @user
  click_link 'Add New Article'
 create_article

expect(page).to have_text('Article successfully created!')
  end
#######################################

it 'add comment and edit' do 
#  @user=User.find_by(username: 'user2')

#article =Article.find_by(title: 'first title of article' )
sign_in @user
visit root_path
click_link 'first title of article'
expect(page).to have_text @article.title
#expect(page).to have_text 'dada'
 click_link 'add comment'
 add_comment
 expect(page).to have_text 'Comment successfully created!'
click_link 'Edit comment'
fill_in :comment_body, with: 'new comment and new test'
click_button 'Submit'
expect(page).to have_text 'Comment successfully updated!'
end

 end


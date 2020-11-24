class Article < ApplicationRecord
  
  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :title, presence:true, length: {minimum: 10}
  validates :description, presence:true, length: {minimum: 10}

  scope :past_articles, ->{where('created_at < ?',Time.now)}

  def get_title 
  title
  end
end

require "rails_helper"
#require 'rails_helper'
# RSpec

RSpec.describe Comment, type: :model do

  it { should validate_length_of :body}


  end

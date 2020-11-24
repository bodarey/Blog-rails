require "rails_helper"
#require 'rails_helper'
# RSpec

RSpec.describe Article, type: :model do

  it { should validate_length_of :title}
  it { should validate_length_of :description}

it 'describe title' do 

end
end
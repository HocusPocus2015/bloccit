require 'rails_helper'
include RandomData

RSpec.describe Favorite, type: :model do
  let(:topic) { create(:topic) }
  let(:user) { create(:user) }
  let(:post) { create(:post) }
  let(:favorite) { Favorite.create!(post: post, user: user) }
  
  it { should belong_to(:post)}
  it { should belong_to(:user)}
  
  describe "factories" do
   before do
   current_user = FactoryGirl.create(:user)
   session[:user_id] = current_user.id
   end
  end
  
end

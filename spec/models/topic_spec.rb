require 'rails_helper'
include RandomData

RSpec.describe Topic, type: :model do
  let(:topic) { create(:topic) }
  
  it { should have_many(:posts) }
  it { should have_many(:labelings) }
  it { should have_many(:labels).through(:labelings) }
  
  describe "factories" do
   before do
   current_user = FactoryGirl.create(:user)
   session[:user_id] = current_user.id
   end
  end
  
  
  describe "attributes" do
    it "should respons to name" do
      expect(topic). to respond_to(:name)
    end
    
    it "should respond to description" do
      expect(topic).to respond_to(:description)
    end
    
    it "should respons to public" do
      expect(topic).to respond_to(:public)
    end
    
    it "should be public by default" do
      expect(topic.public).to be(true)
    end
  end
end

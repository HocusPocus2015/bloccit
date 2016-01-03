require 'rails_helper'
include RandomData

RSpec.describe Rating, type: :model do
 
  describe "attributes" do
    it "should respond to post" do
      expect(rating).to respond_to(:post)
    end

    it "should respond to topic" do
      expect(rating).to respond_to(:topic)
    end
    
    it "should have a rating" do
      expect(rating.update_rating("PG" || "PG13" || "R")).to_not be_nil
      #expect(rating.update_rating(severity).to_not be_nil
    end
  end
end


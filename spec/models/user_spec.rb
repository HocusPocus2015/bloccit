require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "password") }
  
  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_least(1) }
  
  it { should validate_presence_of(:email) }
  it { should valisate_uniqueness_of(:email) }
  it { should validate_length_of(:email).is_at_least(3) }
  it { should allow_value("user@bloccit.com").for(:email) }
  it { should_not allow_value("userbloccit.com").for(:email) }
  
  
end

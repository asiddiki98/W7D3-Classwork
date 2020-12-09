require 'rails_helper'

RSpec.describe User, type: :model do
  
  it { should validate_presence_of(:username)}
  it { should validate_presence_of(:password_digest)}
  it { should validate_presence_of(:session_token)} 
  it { should validate_length_of(:password).is_at_least(6) }

  describe "uniqueness" do 
    before(:each) do 
      create(:user)
    end
    it { should validate_uniqueness_of(:username) }
    it {should validate_uniqueness_of(:session_token)}
  end

  describe "#is_password?" do
    let!(:user) {create(:user)}
    context "valid_password" do
      it "should return true" do
        expect(user.is_password?("dragonball")).to be true
      end
    end
    context "invalid_password" do 
      it "should return false" do
        expect(user.is_password?("wrongpassword")).to be false
      end
    end
  end

  describe "User::find_by_credentials" do
    let!(:user) {create(:user)}
    context "with valid cred" do 
      it "should return user" do 
        expect(User.find_by_credentials(User.last.username, "dragonball")).to eq User.last
      end
    end
    context "with invalid cred" do 
      it "should return nil" do 
        expect(User.find_by_credentials(User.last.username, "wrongpasfd")).to eq nil
      end
    end
  end

  describe "#reset_session_token!" do 
    let!(:user) {create(:user)} 
    context "when it works" do 
      it "should return a new session token" do 
        bob = User.last
        old_session_token = bob.session_token
        expect(bob.reset_session_token!).to_not eq(old_session_token)
        expect(User.last.session_token).to_not eq(old_session_token)
        expect(User.last.reset_session_token!).to eq(User.last.session_token)
      end 
    end 
  end 

end

require 'spec_helper'

describe User do
  
  let(:user) { User.new }
  let(:user2) { User.new }
  describe "#initialize" do

    context "happy data" do
      it "should save to the database" do
        user.username = "someuser"
        user.password = "password"
        user.save.should eq true
      end
    end

    context "bad data" do
      it "should not save with empty data" do
        user.save.should eq false
      end

      it "should not save with a non-unique username" do
        user.username = "someuser"
        user.password = "password"
        user.save

        user2.username = "someuser"
        user2.password = "password"
        user2.save.should eq false
      end
    end
  end
end

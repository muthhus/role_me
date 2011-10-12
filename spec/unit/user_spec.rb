require 'spec_helper'

describe User do


  describe "Model" do
    it "should have a valid factory" do
      Factory.build(:user).should be_valid
    end

    it {should have_and_belong_to_many :roles}
  end

  describe "Role assignment" do

    before(:each) do
      @admin_role = Factory.create(:role, :name => :admin)
      @user       = Factory.create(:user)
    end

    it "should assign a role that exists with has_role!" do
      @user.roles.should be_empty
      @user.has_role!(:admin)
      @user.roles.should_not be_empty
      @user.has_role?(:admin).should be_true
    end

    it "should assign a role that doesnt exist with has_role!" do
      @user.roles.should be_empty
      @user.has_role!(:guest)
      @user.roles.should_not be_empty
      @user.has_role?(:guest).should be_true
    end

    it "should assign role for string" do
      @user.has_role!("admin")
      @user.has_role?(:admin).should be_true
    end

    it "could have many roles" do
      @user.has_role!(:admin)
      @user.has_role?(:admin).should be_true
      @user.has_role!(:guest)
      @user.has_role?(:guest).should be_true
      @user.has_role!(:weird)
      @user.has_role?(:weird).should be_true
      @user.roles.size.should == 3
    end

  end

end

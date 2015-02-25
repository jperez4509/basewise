require 'test_helper'

class UserTest < ActiveSupport::TestCase
  context "validations" do
    should "not allow a first name with numbers" do
      user = Fabricate.build(:user, first_name: "foo1")
      assert_not user.valid?
    end

    should "not allow a first name of less than 2 characters" do
      user = Fabricate.build(:user, first_name: "f")
      assert_not user.valid?
    end

    should "not allow a first name of more than 100 characters" do
      user = Fabricate.build(:user, first_name: "f" * 101)
      assert_not user.valid?
    end

    should "not allow a last name of less than 2 characters" do
      user = Fabricate.build(:user, last_name: "")
      assert_not user.valid?
    end

    should "not allow a last name of more than 100 characters" do
      user = Fabricate.build(:user, last_name: "f" * 101)
      assert_not user.valid?
    end

    should "not allow a last name with numbers" do
      user = Fabricate.build(:user, last_name: "foo1")
      assert_not user.valid?
    end

    should "not allow special characters other than !@- in first name" do
      user = Fabricate.build(:user, first_name: "foo&")
      assert_not user.valid?
    end

    should "not allow special characters other than !@- in last name" do
      user = Fabricate.build(:user, last_name: "foo&")
      assert_not user.valid?
    end

    should "not allow a blank email address" do
      user = Fabricate.build(:user, email: "")
      assert_not user.valid?
    end

    should "only allow valid email addresses" do
      user = Fabricate.build(:user, email: "foo@")
      assert_not user.valid?
    end

    should "only allow unique email addresses" do
      Fabricate(:user, email: "foo@bar.com")
      user = Fabricate.build(:user, email: "foo@bar.com")
      assert_not user.valid?
    end

    should "require at least 1 number in the password" do
      user = Fabricate.build(:user, password: "foobar&")
      assert_not user.valid?
      assert_equal ["Password must contain at least one number"], user.errors.full_messages
    end

    should "require at least one letter" do
      user = Fabricate.build(:user, password: "$$$$$$12")
      assert_not user.valid?
      assert_equal ["Password must contain at least one letter"], user.errors.full_messages
    end

    should "require at least one special character" do
      user = Fabricate.build(:user, password: "foobar1")
      assert_not user.valid?
      assert_equal ["Password must contain one special character (!, @, #, $, &, %, ^)"], user.errors.full_messages
    end

    should "require the password to be at least 6 characters long" do
      user = Fabricate.build(:user, password: "f1@")
      assert_not user.valid?
      assert_equal ["Password must be at least 6 characters long"], user.errors.full_messages
    end
  end
end

require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    @user = users(:one)
  end

  test "should not save when younger then 18 yo" do
    @user.birthday = "2010-10-10"
    assert_not @user.save
  end
end

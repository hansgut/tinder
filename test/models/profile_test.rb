require "test_helper"

class ProfileTest < ActiveSupport::TestCase
  setup do
    @profile = profiles(:one)
  end

  test "should return false when incompleted" do
    @profile.sex = nil
    assert_not @profile.complete?
  end
end

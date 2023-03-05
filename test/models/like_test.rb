require "test_helper"

class LikeTest < ActiveSupport::TestCase
  def setup
    @profile1 = profiles(:one)
    @profile2 = profiles(:two)
  end

  test "get_sent returns likes sent by current user" do
    assert_equal [likes(:one)], Like.get_sent(@profile1).to_a
  end

  test "match? returns true when there is a match" do
    Like.create(sender_profile: @profile1, receiver_profile: @profile2)
    Like.create(sender_profile: @profile2, receiver_profile: @profile1)

    assert Like.last.match?
  end
end

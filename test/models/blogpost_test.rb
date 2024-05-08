require "test_helper"

class BlogpostTest < ActiveSupport::TestCase
  test "draft? returns true for draft blogpost" do
    assert blogposts(:draft).draft?
  end

  test "draft? returns false for a published blogpost" do
    refute blogposts(:published).draft?
  end

  test "draft? returns false for a scheduled blogpost" do
    refute blogposts(:scheduled).draft?
  end

  test "published? returns true for a published blogpost" do
    assert blogposts(:published).published?
  end

  test "published? returns false for a draft blogpost" do
    refute blogposts(:draft).published?
  end

  test "published? returns false for a scheduled blogpost" do
    refute blogposts(:scheduled).published?
  end

  test "scheduled? returns true for a scheduled blogpost" do
    assert blogposts(:scheduled).scheduled?
  end

  test "scheduled? returns false for a draft blogpost" do
    refute blogposts(:draft).scheduled?
  end

  test "scheduled? returns false for a published blogpost" do
    refute blogposts(:published).scheduled?
  end
end

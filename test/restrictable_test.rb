require "test_helper"

class RestrictableTest < ActiveSupport::TestCase
  def test_that_it_has_a_version_number
    refute_nil ::Restrictable::VERSION
  end

  def test_it_load_fixtures
    assert users(:admin).present?
  end
end

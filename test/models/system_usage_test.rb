require 'test_helper'

class SystemUsageTest < ActiveSupport::TestCase
  test "creating system usage data from api" do
    assert_equal(0, SystemUsage.count)
    Station.update_info
    assert_equal(1, SystemUsage.count)
  end

  test "won't create other entry in less than a minute" do
    Station.update_info
    assert_equal(1, SystemUsage.count)
    Station.update_info
    assert_equal(1, SystemUsage.count)
  end

  test "it will create other entry in more than a minute" do
    Station.update_info
    assert_equal(1, SystemUsage.count)
    travel 1.minute
    Station.update_info
    assert_equal(2, SystemUsage.count)
  end
end

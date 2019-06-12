require 'test_helper'

class StationTest < ActiveSupport::TestCase
  test "Creating stations from api" do
    assert_equal(Station.count, 0)
    Station.update_info
    assert_not_equal(Station.count, 0)
  end

  test "update_info doesn't duplicate stations" do
    Station.update_info
    c = Station.count
    Station.update_info
    assert_equal(Station.count, c)
  end
end

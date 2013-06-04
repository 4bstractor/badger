require 'test_helper'

class BillTest < ActiveSupport::TestCase
  # Validations
  test "should not create an empty bill" do
    bill = Bill.new
    assert !bill.save
  end

  test "should create a valid bill" do
    bill = bills(:one)
    assert bill.save
    assert_equal bill.source, "Water"
    assert_equal bill.amount, 75.00
    assert bill.recurring
    assert_equal bill.recur_period, 1
    assert_equal bill.due_date, Date.new(2012, 12, 04)
  end
end

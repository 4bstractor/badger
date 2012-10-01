require 'test_helper'

class EntityTest < ActiveSupport::TestCase
  # Validations
  test "should not create a entity without a name" do
    entity = Entity.new
    assert !entity.save
  end

  test "should create a valid entity" do
    entity = entities(:one)
    assert entity.save
    assert_equal entity.name, "TestEntity"
    assert_equal entity.address, "123 Test St."
  end
end

require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  def setup
    @product = Product.new(name: "Keyboard")
  end

  test "product should be valid" do
    assert @product.valid?
  end

  test "name should be present" do
    @product.name = " "
    assert_not @product.valid?
  end

  test "name should be unique" do
    @product.save
    @product2 = Product.new(name: "Keyboard")
    assert_not @product2.valid?
  end

  test "name should not be too long" do
    @product.name = "a" * 26
    assert_not @product.valid?
  end

  test "name should not be too short" do
    @product.name = "aa"
    assert_not @product.valid?
  end

end
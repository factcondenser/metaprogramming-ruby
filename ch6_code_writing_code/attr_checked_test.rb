require 'test/unit'
require_relative 'attr_checked'

# Tests for Step 5
class Person
  include CheckedAttributes

  attr_checked :age do |v|
    v >= 18
  end
end

class TestCheckedAttribute < Test::Unit::TestCase
  def setup
    @bob = Person.new
  end

  def test_accepts_valid_values
    @bob.age = 20
    assert_equal 20, @bob.age
  end

  def test_refuses_invalid_values
    assert_raises RuntimeError, 'Invalid attribute' do
      @bob.age = 17
    end
  end
end

# Tests for Step 4
# class Person
#   attr_checked :age do |v|
#     v >= 18
#   end
# end
#
# class TestCheckedAttribute < Test::Unit::TestCase
#   def setup
#     @bob = Person.new
#   end
#
#   def test_accepts_valid_values
#     @bob.age = 20
#     assert_equal 20, @bob.age
#   end
#
#   def test_refuses_invalid_values
#     assert_raises RuntimeError, 'Invalid attribute' do
#       @bob.age = 17
#     end
#   end
# end

# Tests for Step 3
# class Person; end
#
# class TestCheckedAttribute < Test::Unit::TestCase
#   def setup
#     add_checked_attr(Person, :age) { |v| v >= 18 }
#     @bob = Person.new
#   end
#
#   def test_accepts_valid_values
#     @bob.age = 20
#     assert_equal 20, @bob.age
#   end
#
#   def test_refuses_invalid_values
#     assert_raises RuntimeError, 'Invalid attribute' do
#       @bob.age = 17
#     end
#   end
# end

# Tests for Step 1 and Step 2
# class Person; end
#
# class TestCheckedAttribute < Test::Unit::TestCase
#   def setup
#     add_checked_attr(Person, :age)
#     @bob = Person.new
#   end
#
#   def test_accepts_valid_values
#     @bob.age = 20
#     assert_equal 20, @bob.age
#   end
#
#   def test_refuses_nil_values
#     assert_raises RuntimeError, 'Invalid attribute' do
#       @bob.age = nil
#     end
#   end
#
#   def test_refuses_false_values
#     assert_raises RuntimeError, 'Invalid attribute' do
#       @bob.age = false
#     end
#   end
# end

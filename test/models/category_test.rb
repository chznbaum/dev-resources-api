require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'should have name' do
    refute categories(:no_name).valid?
  end

  test 'should have unique name' do
    category1 = categories(:uncategorized)
    category2 = Category.new(name: categories(:uncategorized).name, description: 'A duplicated category name')
    refute category2.save, 'Saved a category with the same name'
  end
end

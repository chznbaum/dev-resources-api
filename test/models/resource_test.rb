require 'test_helper'

class ResourceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'should have name' do
    refute resources(:no_name).valid?
  end

  test 'should have unique name' do
    resource1 = resources(:sample)
    resource2 = Resource.new(name: resources(:sample).name, url: 'https://example.com', credit: 'Duplicate', description: 'A resource with a duplicated name')
    refute resource2.save, 'Saved a resource with the same name'
  end

  test 'should have url' do
    refute resources(:no_url).valid?
  end

  test 'should have unique url' do
    resource1 = resources(:sample)
    resource2 = Resource.new(name: 'Duplicated Url', url: resources(:sample).url, credit: 'Duplicate', description: 'A resource with a duplicated URL')
    refute resource2.save, 'Saved a resource with the same URL'
  end
end

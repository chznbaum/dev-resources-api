require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  test 'should get index' do
    get :index

    json_response = JSON.parse(response.body)
    assert_equal 'Success', json_response['status']
  end
end
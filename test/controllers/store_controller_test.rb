require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_select '.navbar .navbar-inner a', minimum: 4
    assert_select '#main .row', 4
    assert_select 'h3', 'Poppy'
    assert_select '.price', /\$[,\d]+\.\d\d/
  end
end
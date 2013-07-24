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
  test "markup needed for store.js.coffee is in place" do
    get :index
    assert_select '.store .span2 > img', 4
    assert_select '.row input[type=submit]', 4
  end
end
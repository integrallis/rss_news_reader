require 'test_helper'

class FeedsControllerTest < ActionController::TestCase
  include Authlogic::TestCase
  
  setup :activate_authlogic
  
  test "should get login page if not logged in" do
    get :index
    assert_redirected_to new_user_session_url
  end
  
  test "it should get index if logged in" do
    login
    get :index
    assert_response :success
  end
  
  test "should get new" do
    login
    get :new
    assert_response :success
  end
  
  test "should create feed" do
    login
    assert_difference('Feed.count') do
      post :create, :feed => { :title => "Sample Feed",
                               :uri => "http://samples.com/feed.xml",
                               :title_xpath => "//titles" }
    end
  
    assert_redirected_to user_feeds_path(users(:stephan))
  end
  
  test "should show feed" do
    login
    get :show, :id => feeds(:one).id
    assert_response :success
  end
  
  test "should get edit" do
    login
    get :edit, :id => feeds(:bbc).id
    assert_response :success
  end
  
  test "should update feed" do
    login
    put :update, :id => feeds(:one).id, :feed => { :title => "Sample Feed",
                                                   :uri => "http://samples.com/feed.xml",
                                                   :title_xpath => "//titles" }
    assert_redirected_to user_feeds_path(users(:stephan))
  end
  
  test "should destroy feed" do
    login
    assert_difference('Feed.count', -1) do
      delete :destroy, :id => feeds(:one).id
    end
  
    assert_redirected_to user_feeds_path(users(:stephan))
  end
  
  private
  
  protected
    def login(options = {})
      valid_attributes = {
        :email => "snscaimito@gmail.com",
        :password => "panama"
      }
      user_session = UserSession.new(valid_attributes.merge(options))
      user_session.save
      user_session
    end
end

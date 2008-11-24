require 'test_helper'

class PostsControllerTest < ActionController::TestCase
	
	def test_display_new_post_form
		get :new
		assert_template "new"
	end

	def test_new_post_form_should_have_a_form_that_posts_to_create
		
		get :new
		assert_select "form[action=?][method=post]", posts_path
	end

	def test_new_post_form_should_have_title_code_and_private_fields 
		get :new
		assert_select "form" do
			assert_select "input[type=text][name=?]", "post[title]"
			assert_select "textarea[name=?]", "post[code]"
		end
	end
	
	def test_should_redirect_to_show_page_if_creation_is_successful
		Post.any_instance.stubs(:save).returns(true)
		Post.any_instance.stubs(:id).returns(1)
		post "create"
		assert_redirected_to post_url(1)
	end
	
	def test_should_show_the_create_form_page_if_creation_fails
	  Post.any_instance.stubs(:save).returns(false)
	  post "create"
	  assert_template "new"
	end

	def test_should_display_the_show_page
	    @post = mock_post
		Post.expects(:find).with("1").returns(@post)	
		get :show, :id => "1"
		assert_template "show"
	end
	
	def test_should_find_record_when_displaying_post
	    @post = mock_post
		Post.expects(:find).with("1").returns(@post)
		get :show, :id => "1"
	end	
	
	def test_code_should_be_sanitized_on_show_page
	    @post = mock_post
		ActionView::Base.any_instance.expects(:h).with(@post.code)
		Post.expects(:find).with("1").returns(@post)
		get :show, :id => "1"
		
	end 
	
  	def mock_post
		post = mock("test") do
			stubs(:title).returns("test")
			stubs(:code).returns("<b>win!</b>")
			stubs(:id).returns(1) 
		end
	end
	
    def test_default_route_should_map_to_new_post
		opts = {:controller => "posts", :action => "new"}
		assert_recognizes opts, ""
    end
	
	
	        def test_new_post_form_should_have_submit_button
				get :new
				assert_select "form" do
					assert_select "input[type=submit]"
				end
			end
end

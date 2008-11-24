require 'test_helper'



# in order to share a snippet with others on the web
# a guest user
# can create a code snippet

# When I display the new snippet form
#  and I enter a title
#  and I enter the code
#  and I click Submit
# Then a new public snippet is saved
#   and I see the new snippet

class PostTest < ActiveSupport::TestCase

	def test_should_create_new_post_when_all_requirements_have_been_fullfilled
		post = Post.new
		post.title = "My test"
		post.code = %Q{
		def test
		  puts "Hello world"
		end}
	    assert post.save
	end

	def test_should_set_private_to_false_by_default
		p = Post.create :title => "foo", :code => "bar"
		assert p.private == false  # because Ruby treats nil and false as false
	end
	

  	def test_should_require_presence_of_title
		p = Post.create
		assert p.errors.on(:title).include? "can't be blank"
	end
	
  	def test_should_require_presence_of_code
		p = Post.create
		assert p.errors.on(:code).include? "can't be blank"
	end
  
  
end

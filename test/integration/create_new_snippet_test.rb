require 'test_helper'
require 'webrat'
class CreateNewSnippetTest < ActionController::IntegrationTest
  # fixtures :your, :models

  # Replace this with your real tests.
  def test_should_create_new_snippet
	 visits "/"
	 fills_in "post[title]", :with => "hello world"
	 fills_in "post[code]", :with => "<b>Test</b>"
	 clicks_button "Post it"
	 clicks_link "Create a new post"
  end
end

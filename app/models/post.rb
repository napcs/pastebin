class Post < ActiveRecord::Base
	
	
	before_create :set_privacy_off_by_default
	validates_presence_of :title, :code
	
	private
	  def set_privacy_off_by_default
		  self.private = false
		  return true
	  end
end

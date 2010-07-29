# == Schema Information
#
# Table name: posts
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  post       :text
#  created_at :datetime
#  updated_at :datetime
#  author_id  :integer         indexed
#

require 'spec_helper'

describe Post do
  context "validations" do
    it "should not be valid if title is blank" do
      post = Post.create
      post.should_not be_valid
      post.should have(1).error_on(:title)
    end
  end
end

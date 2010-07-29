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

class Post < ActiveRecord::Base
  validates_presence_of :title
  belongs_to :author
end

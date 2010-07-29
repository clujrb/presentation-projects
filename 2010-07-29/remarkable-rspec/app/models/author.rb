# == Schema Information
#
# Table name: authors
#
#  id         :integer         not null, primary key
#  created_at :datetime
#  updated_at :datetime
#

class Author < ActiveRecord::Base
  has_many :posts
end

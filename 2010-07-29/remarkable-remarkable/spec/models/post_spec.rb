require 'spec_helper'

describe Post do
  it { should have_column :title, :type => :string }
  it { should have_index :author_id }
  it { should validate_presence_of :title }
  it { should belong_to :author }
end

class Comment < ActiveRecord::Base
  belongs_to :post
  attr_accessible :content, :name, :post_id
end

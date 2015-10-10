class Comment < ActiveRecord::Base
  
  validates :commenter, :body, presence: true
  belongs_to :post

  belongs_to :commenter, class_name: "User", foreign_key: "user_id"

end

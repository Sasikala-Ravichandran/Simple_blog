class Profile < ActiveRecord::Base

  validates :uname, :about, presence: true

  belongs_to :user
  
end

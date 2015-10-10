class Post < ActiveRecord::Base
	validates :title, :body, presence: true

	belongs_to :user

	has_many :comments

	has_many :taggings
	has_many :tags, through: :taggings


	def tag_list=(str)
		tag_names = str.split(",")
        new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
        self.tags = new_or_found_tags
	end

	def tag_list
		self.tags.collect do |tag|
			tag.name
		end.join(", ")
	end
end

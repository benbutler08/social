class Assignment < ApplicationRecord
	has_many :tasks
	has_rich_text :description
end

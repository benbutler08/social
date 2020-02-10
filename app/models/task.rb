class Task < ApplicationRecord
	has_rich_text :description
	belongs_to :assignment
end

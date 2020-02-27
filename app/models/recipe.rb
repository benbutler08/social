class Recipe < ApplicationRecord
	has_rich_text :procedure
	has_rich_text :description
end

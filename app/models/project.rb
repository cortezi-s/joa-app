class Project < ApplicationRecord
	has_one_attached :hero_image
	has_one_attached :team_image
end

class Restaurant < ApplicationRecord
  mount_uploader :image, FoodImageUploader
end

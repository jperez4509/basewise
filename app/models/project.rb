class Project < ActiveRecord::Base
  validates :title, length: { minimum: 5 }
end

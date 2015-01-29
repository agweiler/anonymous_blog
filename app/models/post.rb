class Post < ActiveRecord::Base
  # Remember to create a migration!
   has_and_belongs_to_many :tags
   validates :title, presence: true
   validates :content, presence: true
end

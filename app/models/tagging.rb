class Tagging < ActiveRecord::Base
  belongs_to :tag
  belongs_to :item
  # attr_accessible :title, :body
end

class Item < ActiveRecord::Base
  
  belongs_to :user
  has_many   :taggings, dependent: :destroy
  has_many   :tags, through: :taggings

  after_save :toggle_draft

  def self.tagged_with(name)
    Tag.find_by_name!(name).items
  end

  def self.tag_counts
    Tag.select("tags.*, count(taggings.tag_id) as count").joins(:taggings).group("taggings.tag_id")
  end

  def tag_list
    tags.map(&:name).join(", ")
  end

  def tag_list=(names)
    self.tags = names.split(",").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end

  def toggle_draft
    if self.draft == true
      self.toggle!(:draft)
    end
  end
end

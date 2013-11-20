class Post < ActiveRecord::Base
  attr_accessible :title, :content, :is_published

  scope :recent, order: "created_at DESC", limit: 5

  before_save :slugify
  before_save :titleize_title


  validates_presence_of :title, :content

  private

  def titleize_title
    self.title = title.titleize

  end

  def slugify
    self.title.gsub!(/!/, '')
    self.title.gsub!(/ /, '-')
    self.slug = self.title.downcase
  end

end
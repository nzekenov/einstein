# == Schema Information
#
# Table name: lessons
#
#  id               :integer          not null, primary key
#  title            :string
#  body             :text
#  description      :text
#  slug             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  banner_image_url :string
#  author_id        :integer
#  published        :boolean          default(FALSE)
#  pulished_at      :datetime
#

class Lesson < ApplicationRecord

  has_many :categorizings, dependent: :delete_all
  has_many :categories, through: :categorizings
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :author, optional: :true﻿

  scope :most_recent, -> { order(published_at: :desc)}
  scope :published, -> { where(published: true)}
  def should_generate_new_friendly_id?
    title_changed?
  end

  def display_day_published
    if published_at?.present?
    "Published #{published_at.strftime('%-b %-d, %Y')}"
    else
      "Not published yet."
    end
  end

  def publish
    update(published: true, published_at: Time.now)
  end
  def unpublish
    update(published: false, published_at: nil)
  end
  def all_categories
    self.categories.map(&:name).join(', ')
  end
  def all_categories=(names)
    self.categories = names.split(', ').map do |name|
      Category.where(name: name.strip).first_or_create!
    end
  end
end

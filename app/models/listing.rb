class Listing < ActiveRecord::Base
	belongs_to :user

	has_many :details
	has_many :specs

	accepts_nested_attributes_for :details,
  															reject_if: proc { |attributes| attributes['name'].blank? },
  															allow_destroy: true
 	accepts_nested_attributes_for :specs,
  															reject_if: proc { |attributes| attributes['status'].blank? },
  															allow_destroy: true

  validates :title, :description, :image, presence: true

	has_attached_file :image, styles: { :medium => "400x400#" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end

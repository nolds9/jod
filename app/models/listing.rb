class Listing < ActiveRecord::Base
	belongs_to :user

	has_many :contact_information
	has_many :aircraft_specs

	accepts_nested_attributes_for :contact_information,
  															reject_if: proc { |attributes| attributes['name'].blank? },
  															allow_destroy: true
 	accepts_nested_attributes_for :aircraft_specs,
  															reject_if: proc { |attributes| attributes['ask_price'].blank? },
  															allow_destroy: true

  validates :title, :description, :image, presence: true

	has_attached_file :image, styles: { :medium => "400x400#" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end

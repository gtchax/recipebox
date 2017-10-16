class Recipe < ApplicationRecord
    belongs_to :user
    has_many :ingredients
    has_many :directions

    accepts_nested_attributes_for :ingredients,
                                 reject_if: proc { |attributes| attributes['name'].blank? }, 
                                 allow_destroy: true

    accepts_nested_attributes_for :directions,
                                 reject_if: proc { |attributes| attributes['step'].blank? },
                                 allow_destroy: true
    
    has_attached_file :image, styles: { medium: "250x250#"}, default_url: "/images/:style/noimage.jpeg"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
    validates :title, length: {minimum: 4}, presence: true
    validates :description, length: {minimum: 4}, presence: true
    validates :image, presence: true
end

class Product < ActiveRecord::Base
  default_scope :order => 'title' #orders our products by title
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
  validates :title, :description, :image_url, :presence => true #checks if all fields have something in them / not empty
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01} # checks if the price field is a number and it is greater or equal to 0.01
  validates :title, :uniqueness => true #checks if title is unique
  validates :image_url, :format => {
    :with => %r{\.(gif|png|jpg)$}i, 
    :message => 'must be a URL for GIF, JPG or PNG image.' #checks if the image_url matches the regex expression / has .jpg,.gif, or .png in the address
  }
  private
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items Present')
      return false
    end
  end
end

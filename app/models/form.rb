class Form < ActiveRecord::Base
	has_many :replies  , dependent: :destroy
	has_many :fields , dependent: :destroy
	accepts_nested_attributes_for :fields, allow_destroy: true
end

# == Schema Information
# Schema version: 20101018223225
#
# Table name: stypes
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Stype < ActiveRecord::Base

  has_many :answers
  has_many :people, :through => :answers
  
  validates :title, :uniqueness => true
end

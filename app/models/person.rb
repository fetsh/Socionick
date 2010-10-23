# == Schema Information
# Schema version: 20101023090646
#
# Table name: people
#
#  id         :integer         not null, primary key
#  content    :text
#  title      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#  login      :
#

class Person < ActiveRecord::Base

  has_many :answers, :dependent => :destroy
  belongs_to :user

  validates :title,   :presence => true, :length => { :maximum => 140 }
  validates :content, :presence => true

  default_scope :order => 'people.created_at DESC'
    
  attr_accessible :content, :title, :answers_attributes

end

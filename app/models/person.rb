# == Schema Information
# Schema version: 20101104173614
#
# Table name: people
#
#  id         :integer         not null, primary key
#  content    :text
#  title      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#  gender     :string(255)
#

class Person < ActiveRecord::Base

  has_many :answers, :dependent => :destroy, :inverse_of => :person
  has_many :photos, :dependent => :destroy
  has_many :videos, :dependent => :destroy
  belongs_to :user, :inverse_of => :people

  accepts_nested_attributes_for :photos, :reject_if => proc { |a| a.all? { |k, v| v.blank? }}
  accepts_nested_attributes_for :videos, :reject_if => lambda { |a| a[:video_code].blank? }, :allow_destroy => true
  
  validates :title,   :presence => true, :length => { :maximum => 140 }
  validates :content, :presence => true
  validates :gender, :presence => true

  default_scope :order => 'people.created_at DESC'

  attr_accessible :content, :title, :answers_attributes, :gender, :photos_attributes, :videos_attributes
  GENDERS = {'male' => 'Мужчина', 'female' => 'Женщина'}
  
end

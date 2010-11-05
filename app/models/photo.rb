# == Schema Information
# Schema version: 20101104173614
#
# Table name: photos
#
#  id                :integer         not null, primary key
#  person_id         :integer
#  created_at        :datetime
#  updated_at        :datetime
#  data_file_name    :string(255)
#  data_content_type :string(255)
#  data_file_size    :integer
#  data_updated_at   :datetime
#

class Photo < ActiveRecord::Base

  belongs_to :person
  has_attached_file :data, :styles => {
                              :original => "590x590>",
                              :thumb => "150x150>" },
                           :url => "/images/:attachment/:id_:style.:extension",
                           :path => ":rails_root/public/images/:attachment/:id_:style.:extension"
  attr_protected :logo_file_name, :logo_content_type, :logo_size
  
  validates_attachment_presence :data
  validates_attachment_size :data, :less_than => 3.megabytes
  validates_attachment_content_type :data,
                                    :content_type => [ 'image/bmp',
                                                       'image/gif',
                                                       'image/png',
                                                       'image/jpeg'
                                                     ]
  after_save :save_geometry

  def save_geometry
    unless @geometry_saved
      self.geometry = get_geometry(:original)
      @geometry_saved = true
      self.save
    end
  end

  def get_geometry(style = :original)
    begin
      Paperclip::Geometry.from_file(data.path(style)).to_s
    rescue
      nil
    end
  end

end

class Contact < ActiveRecord::Base
  validates :id_id, presence: true
  validates :number, presence: true
  validates :type, presence: true

  belongs_to :phone
end

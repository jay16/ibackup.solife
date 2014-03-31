class Sm < ActiveRecord::Base
  validates :id_id, presence: true
  validates :number, presence: true
  validates :content, presence: true
  validates :sms_type, presence: true
  validates :date, presence: true

  belongs_to :phone
end

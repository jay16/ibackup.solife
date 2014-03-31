class Phone < ActiveRecord::Base
  validates :serial, presence: true
  validates :manufacturer, presence: true
  validates :model, presence: true

  belongs_to :user
  has_many :contacts, dependent: :destroy
  has_many :sms, dependent: :destroy
end

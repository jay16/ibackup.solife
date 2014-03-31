class Phone < ActiveRecord::Base
  validates :serial, presence: true
  validates :manufacturer, presence: true
  validates :model, presence: true

  belongs_to :user
end

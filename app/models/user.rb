#encoding: utf-8
require "base64"
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, presence: true, uniqueness: { case_sensitive: false }

  def self.validate(token)
    str = Base64.decode64(token)
    n1, n2 = str[0].to_i, str[1..n1]
    str = str[n1+n2.length-1..str.length-1]

    email = str[0..n2.to_i-1]
    pwd   = str[n2.to_i..str.length-1]
    if user = User.find_by(email: email)
       return user if user.valid_password?(pwd)
    end
  end
end

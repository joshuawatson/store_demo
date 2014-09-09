# == Schema Information
#
# Table name: users
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  email          :string(255)
#  stripe_card_id :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#
require 'digest/md5'

class User < ActiveRecord::Base
  has_many :orders
  has_many :reviews

  validates :email, format: { with: /.+@.+(.).+/, message: "not a valid email" }

  before_save :downcase_email

  def avatar_url
    hash = Digest::MD5.hexdigest(email)
    return "http://www.gravatar.com/avatar/#{hash}"
  end

  def reset_password
    # Email the user with a password reset link
    return "#{name} has been emailed at #{email} with a link to reset their password."
  end

  def downcase_email
    self.email = email.downcase
  end
end

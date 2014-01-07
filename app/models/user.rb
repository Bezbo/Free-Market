class User < ActiveRecord::Base
  include Clearance::User
  attr_accessible :email, :password
  has_many :items
  ROLES = %w[admin moderator user]

  def save_role
    self.role = !self.role
    save
  end



end

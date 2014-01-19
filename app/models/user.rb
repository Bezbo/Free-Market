class User < ActiveRecord::Base
  include Clearance::User
  include ActiveModel::ForbiddenAttributesProtection
  has_many :items
  ROLES = %w[admin moderator user]

end

class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable,
  :jwt_authenticatable, jwt_revocation_strategy: self

  def jwt_revoked?
    return true if self.jwt_blacklisted?
    false
  end

  def jwt_payload 
    super.merge('foo' => 'bar')
  end

  def self.find_for_jwt_authentication(sub)
    find(sub)
  end
end

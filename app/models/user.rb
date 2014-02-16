class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_secure_password
  after_destroy :ensure_at_least_one_user

  private

  def ensure_at_least_one_user
    if User.count.zero?
      raise "Can't delete last user"
    end
  end
end

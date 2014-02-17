class User < ActiveRecord::Base
  has_one :todo_list

  has_secure_password
  after_destroy :ensure_at_least_one_user

  validates :name, presence: true, uniqueness: true

  private

  def ensure_at_least_one_user
    if User.count.zero?
      raise "Can't delete last user"
    end
  end
end

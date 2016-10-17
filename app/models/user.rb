class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :jobs, dependent: :destroy
  has_many :messages
  has_many :conversations, dependent: :destroy
  has_many :businesses, dependent: :destroy
  acts_as_messageable
  # instead of deleting, indicate the user requested a delete & timestamp it
   def soft_delete
     update_attribute(:deleted_at, Time.current)
   end

   # ensure user account is active
   def active_for_authentication?
     super && !deleted_at
   end

   # provide a custom message for a deleted account
   def inactive_message
     !deleted_at ? super : :deleted_account
   end

   acts_as_messageable

  def mailboxer_email(object)
    email
  end

end

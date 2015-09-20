class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  default_scope { order('created_at DESC') }
  default_scope { order('updated_at ASC') }

  validates :body, length: { minimum: 5 }
  validates :body, presence: true
  validates :user_id, presence: true

after_create :send_favorite_emails
 
   private
 
   def send_favorite_emails
     post.favorites.each do |favorite|
       if should_receive_update_for?(favorite)
         FavoriteMailer.new_comment(favorite.user, self.post, self).deliver_now
       end
     end
   end

   def should_receive_update_for?(favorite)
     user_id != favorite.user_id && favorite.user.email_favorites?
   end
end

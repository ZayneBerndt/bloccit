class Topic < ActiveRecord::Base
 has_many :posts, dependent: :destroy

   validates :title, length: { minimum: 5 }, presence: true
   
end

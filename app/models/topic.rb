class Topic < ActiveRecord::Base
 has_many :posts, dependent: :destroy

   validates :title, length: { minimum: 5 }, presence: true

  WillPaginate.per_page = 50
   
end

class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  scope :visible_to, -> (user) {user ? all : :publicly_viewable}
  validates :name, length: { minimum: 5 }, presence: true

  WillPaginate.per_page = 50

  def publicly_viewable(user)
    if user
      topic_collection.all
    else
      topic_collection.where(public: true)
    end
  end

  def privately_viewable
    topic_collection.where(public: false)
    end
  end

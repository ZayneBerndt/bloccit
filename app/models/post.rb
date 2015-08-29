class Post < ActiveRecord::Base
    has_many :comments, dependent: :destroy
    has_many :votes, dependent: :destroy
    has_one :summary 
    belongs_to :user
    belongs_to :topic

    default_scope { order('rank DESC') }
    validates :title, length: { minimum: 5 }, presence: true
    validates :body, length: { minimum: 20 }, presence: true
    validates :topic, presence: true
    validates :user, presence: true
    
    scope :ordered_by_title, -> {reorder(title: :asc)}
    scope :ordered_by_reverse_created_at, -> { reorder(created_at: :asc) }



   after_create :create_vote 

   def points
        votes.sum(:value).to_i
    end

    def up_votes
        votes.where(value: 1).count
    end

    def down_votes
        votes.where(value: -1).count
    end

def update_rank
    age_in_days = (created_at - Time.new(1970,1,1)) / (60 * 60 * 24) # 1 day in seconds
    new_rank = points + age_in_days
 
    update_attribute(:rank, new_rank)
  end

  def update_rank
    age = (created_at - Time.new(1970,1,1)) / (60 * 60 * 24) # 1 day in seconds
    new_rank = points + age

    update_attribute(:rank, new_rank)
  end

  private
 
  def create_vote
    user.votes.create(value: 1, post: self)
  end

  

  def save_with_initial_vote
  end
 
 def markdown_to_html

  render_as_markdown(self.title)
  end
  
  def markdown_to_html
   render_as_markdown(self.body)
  end

private 

    def markdown_to_html
        renderer = Redcarpet::Render::HTML.new
        extensions = {fenced_code_blocks: true}
        redcarpet = Redcarpet::Markdown.new(renderer, extensions)
        (redcarpet.render markdown).html_safe
    end

end

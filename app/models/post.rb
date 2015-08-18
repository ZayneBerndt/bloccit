class Post < ActiveRecord::Base
    has_many :comments, dependent: :destroy
    belongs_to :user
    belongs_to :topic

    default_scope { order('created_at DESC') }
    validates :title, length: { minimum: 5 }, presence: true
    validates :body, length: { minimum: 20 }, presence: true
    validates :topic, presence: true
    validates :user, presence: true
    
    scope :ordered_by_title, -> {reorder(title: :asc)}
    scope :ordered_by_reverse_created_at, -> { reorder(created_at: :asc) }

def markdown_title
        markdown_to_html(title)
    end

    def markdown_body
        markdown_to_html(body)
    end

    def points
        votes.sum(:value).to_i
    end

    def up_votes
        votes.where(value: 1).count
    end

    def down_votes
        votes.where(value: -1).count
    end




  

  def create_vote
    user.votes.create(value: 1, post: self)
  end

  def update_rank
    age_in_days = (created_at - Time.new(1970,1,1)) / (60 * 60 * 24) # 1 day in seconds
    new_rank = points + age_in_days
 
    update_attribute(:rank, new_rank)
  end

  def save_with_initial_vote
  end


    private
    def markdown_to_html(markdown)
        renderer = Redcarpet::Render::HTML.new
        extensions = {fenced_code_blocks: true}
        redcarpet = Redcarpet::Markdown.new(renderer, extensions)
        (redcarpet.render markdown).html_safe
    end

end

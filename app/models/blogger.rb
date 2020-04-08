class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts 

    validates :name, uniqueness: true 
    validates :age, numericality: { greater_than: 0}
    validates :bio, length: { minimum: 30}

    
    def most_likes
        most_like = []
        most_like = Blogger.posts.each do |post|
            post.likes 
        end 
        most_like.find 
    end
end

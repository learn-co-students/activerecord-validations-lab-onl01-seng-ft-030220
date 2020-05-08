class Post < ActiveRecord::Base
    
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :validator

    def validator
        if title != nil && !title.include?("Won't Believe" || "Secret" || "Top [number]" || "Guess")
            errors.add(:title, "clickbaity")
        end
    end

end

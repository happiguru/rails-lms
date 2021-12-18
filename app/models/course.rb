class Course < ApplicationRecord
    validates :title, :short_description, :language, :price, :level, presence: true
    validates :description, presence: true, length: { :minimum => 5 }
    
    belongs_to :user
    def to_s
        title
    end
    has_rich_text :description
    
    extend FriendlyId
    friendly_id :title, use: :slugged
    
    # This is use for transactions
    # friendly_id :generated_slug, use: :slugged
    # def generated_slug
    #     require 'securerandom'
    #     @random_slug ||= persisted? ? friendly_id : SecureRandom.hex(4)
    # end
    
    # def to_s
    #     slug
    # end

    LANGUAGES = [:"English", :"French", :"Latin", :"Arabic"]
    def self.languages
        LANGUAGES.map { |language| [language, language] }
    end

    LEVELS = [:"Beginner", :"Intermediate", :"Advance"]
    def self.levels
        LEVELS.map { |level| [level, level] }
    end
end

class Category < ApplicationRecord
    has_many :company_categories
    has_many :companies, through: :company_categories

    # def self.all
    #     categories = []
    #     category_hashes = Unirest.get("#{ ENV["API_HOST"] }/categories?token=#{ ENV["OAUTH_TOKEN"] }").body["categories"]
        
    #     category_hashes.each do |category_hash|
    #         categories << Category.new(category_hash)
    #     end
    #     categories
    # end
end

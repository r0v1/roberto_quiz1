class Support < ActiveRecord::Base
  validates :email, presence: true
  validates :name,  presence: true

  def self.search(query)
    # where("name ILIKE :query OR email ILIKE :query OR message ILIKE :query",
    #         {query: "%#{query}%"})
    where("name ILIKE ? OR email ILIKE ? OR message ILIKE ?",
            "%#{query}%", "%#{query}%", "%#{query}%")
  end


end

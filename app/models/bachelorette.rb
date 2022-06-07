class Bachelorette <ApplicationRecord
  has_many :contestants

  def average_age_of_contestants
    contestants.average(:age)
  end
end

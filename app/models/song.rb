class Song < ActiveRecord::Base

  validates :title, presence: true
  validates :released, inclusion: { in: [ true, false ] }
  validates :artist_name, presence: true
  validate :release_year_confirm

  def release_year_confirm
    if (released == true) && !release_year
      errors.add(:release_year, "release year cannot be blank")
    elsif !!release_year && release_year > Date.current.year
      errors.add(:release_year, "release year cannot be in the future")
    end
  end
end

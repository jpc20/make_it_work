class Project <ApplicationRecord
  validates_presence_of :name, :material
  belongs_to :challenge
  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects

  def num_contestants
    contestants.count
  end

  def average_contestant_exp
    contestants.average(:years_of_experience)
  end

end

class Entrepreneur < ActiveRecord::Base
  enum legal_nature: [ :limited_company , :business_corporation, :sole_proprietor, :sole_proprietorship ]
  #limited_company = sociedade por quotas , :business_corporation =sociedade anonima, :sole_proprietor =unipessoal, :sole_proprietorship = empresario em nome individual
  belongs_to :user
  
  validates :full_name, presence: true
  validates :address, presence: true
  validates :zip_code, presence: true
  validates :town, presence: true
  validates :country, presence: true
  validates :fiscal_number, presence: true
  
  has_many :projects
  accepts_nested_attributes_for :projects

  validates_format_of :zip_code,
    :with => /\A\d{4}-\d{3}?\z/,
    :message => "O codigo postal deve ter o formato 1234-123"
  
  validates_numericality_of :fiscal_number, :message => "O número fiscal tem de ser numérico"

  def totalProjectsValue
    # o valor investido inclui o valor pretendido de projecto que ainda não foram concluidos
    totalValue = 0
    @Projects=Project.where("entrepreneur_id=" + self.id.to_s)
    @Projects.each do |project|
      totalValue = totalValue + project.value
    end
    totalValue
  end

  def totalProjectsN
    totalN = 0
    @Projects=Project.where("entrepreneur_id=" + self.id.to_s)
    @Projects.each do |project|
      totalN = totalN + 1
    end
    totalN
  end

  def financedProjectsValue
    totalValue = 0
    @Projects=Project.where("entrepreneur_id=" + self.id.to_s + " and (status=1 or status=2)")
    @Projects.each do |project|
      totalValue = totalValue + project.value
    end
    totalValue 
  end

  def financedProjectsN
    totalN = 0
    @Projects=Project.where("entrepreneur_id=" + self.id.to_s + " and (status=1 or status=2)")
    @Projects.each do |project|
      totalN = totalN + project.value
    end
    totalN 
  end

  def openBalance
    totalBalance = 0
    @Projects=Project.where("entrepreneur_id=" + self.id.to_s + " and (status=3)")
    @Projects.each do |project|
      totalBalance = totalBalance + project.value
    end
    totalBalance 
  end
  
  def openProjectsN
    totalN = 0
    @Projects=Project.where("entrepreneur_id=" + self.id.to_s + " and (status=3)")
    @Projects.each do |project|
      totalN = totalN + project.value
    end
    totalN 
  end
  
end

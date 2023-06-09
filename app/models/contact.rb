class Contact < ApplicationRecord
  # Validations
  validates_presence_of :kind, :email
  validates :email, uniqueness: true
  # validates_presence_of :address

  # Kaminari
  paginates_per 5

  # Associations
  belongs_to :kind # , optional: true
  has_many :phones
  has_one :address

  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :address, update_only: true

  def as_json(options = {})
    h = super(options)
    h[:birthdate] = (I18n.l(birthdate) unless birthdate.blank?)
    h
  end

  # def birthdate_br
  # I18n.l(self.birthdate_br) unless self.birthdate.blank?
  # end

  # def to_br
  # {
  # name: self.name,
  # email: self.email,
  # birthdate: (I18n.l(self.birthdate) unless self.birthdate.blank?)
  # }
  # end

  # def author
  # "Rodrigo Gastardo"
  # end

  # def kind_description
  # self.kind.kind.description
  # end

  # def as_json(options={})
  # super(
  # root: true,
  # methods: [:kind_description, :author]
  # include: {kind: {only: :description}}
  # )
  # end
  # def hello
  # I18n.t('hello')
  # end

  # def I18n
  # I18n.default_locale
  # end
end

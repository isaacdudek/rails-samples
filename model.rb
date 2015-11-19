class Contact < ActiveRecord::Base
  # 1. Configuration

  # 2. Associations

    belongs_to :department, inverse_of: :contacts

    has_many :contact_users, dependent: :destroy, inverse_of: :contact
    has_many :users, inverse_of: :contacts, through: :contact_users

  # 3. Attributes

  # 4. Validations

    validates :department, presence: true
    validates :name, presence: true, uniqueness: {scope: :department_id}

  # 5. Scopes

  # 6. Callbacks

end

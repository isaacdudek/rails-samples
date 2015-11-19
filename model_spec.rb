require 'spec_helper'

describe Contact do
  describe '1. Configuration' do
  end

  describe '2. Associations' do
    it {is_expected.to belong_to(:department).inverse_of(:contacts)}

    it {is_expected.to have_many(:contact_users).dependent(:destroy).inverse_of(:contact)}
    it {is_expected.to have_many(:users).inverse_of(:contacts).through(:contact_users)}
  end

  describe '3. Attributes' do
  end

  describe '4. Validations' do
    it {is_expected.to validate_presence_of(:department)}
    it {is_expected.to validate_presence_of(:name)}
    it {FactoryGirl.create :contact; is_expected.to validate_uniqueness_of(:name).scoped_to(:department_id)}
  end

  describe '5. Scopes' do
  end

  describe '6. Callbacks' do
  end
end

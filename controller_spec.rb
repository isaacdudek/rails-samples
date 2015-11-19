require 'spec_helper'

describe ContactsController do
  let(:current_user) {FactoryGirl.create :user}

  before {sign_in current_user}

  describe 'GET #index' do
    let!(:marketing) {FactoryGirl.create :department, id: 12, name: 'Marketing'}

    let!(:marketing_director) {FactoryGirl.create :contact, id: 12, department: marketing, name: 'Director'}
    let!(:marketing_supervisor) {FactoryGirl.create :contact, id: 34, department: marketing, name: 'Supervisor'}
    let!(:marketing_manager) {FactoryGirl.create :contact, id: 56, department: marketing, name: 'Manager'}

    let!(:finance) {FactoryGirl.create :department, id: 34, name: 'Finance'}

    let!(:finance_director) {FactoryGirl.create :contact, id: 78, department: finance, name: 'Director'}
    let!(:finance_supervisor) {FactoryGirl.create :contact, id: 90, department: finance, name: 'Supervisor'}

    before {get :index}

    it 'should return status 200' do
      expect(response.status).to eq(200)
    end

    it 'should render the index template' do
      expect(response).to render_template(:index)
    end

    it 'should set @contacts to an ActiveRecord::Relation' do
      expect(assigns(:contacts)).to be_an(ActiveRecord::Relation)
    end

    it 'should order @contacts by department name then contact name' do
      expect(assigns(:contacts)).to eq([finance_director, finance_supervisor, marketing_director, marketing_manager, marketing_supervisor])
    end
  end
end

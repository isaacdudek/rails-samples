require 'spec_helper'

describe 'contacts/index' do
  subject {JSON.parse rendered}

  let(:marketing) {FactoryGirl.create :department, id: 12, name: 'Marketing'}

  let(:marketing_director) {FactoryGirl.create :contact, id: 12, department: marketing, name: 'Director'}
  let(:marketing_supervisor) {FactoryGirl.create :contact, id: 34, department: marketing, name: 'Supervisor'}
  let(:marketing_manager) {FactoryGirl.create :contact, id: 56, department: marketing, name: 'Manager'}

  let(:finance) {FactoryGirl.create :department, id: 34, name: 'Finance'}

  let(:finance_director) {FactoryGirl.create :contact, id: 78, department: finance, name: 'Director'}
  let(:finance_supervisor) {FactoryGirl.create :contact, id: 90, department: finance, name: 'Supervisor'}

  it 'should render the contacts' do
    assign :contacts, [marketing_director, marketing_supervisor, marketing_manager, finance_director, finance_supervisor]

    render

    marketing = {'id' => 12, 'name' => 'Marketing'}
    finance = {'id' => 34, 'name' => 'Finance'}

    expect(subject['contacts'].first).to eq({'id' => 12, 'department' => marketing, 'name' => 'Director'})
    expect(subject['contacts'].second).to eq({'id' => 34, 'department' => marketing, 'name' => 'Supervisor'})
    expect(subject['contacts'].third).to eq({'id' => 56, 'department' => marketing, 'name' => 'Manager'})
    expect(subject['contacts'].fourth).to eq({'id' => 78, 'department' => finance, 'name' => 'Director'})
    expect(subject['contacts'].fifth).to eq({'id' => 90, 'department' => finance, 'name' => 'Supervisor'})
  end
end

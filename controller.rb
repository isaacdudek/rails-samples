class ContactsController < ApplicationController
  def index
    @contacts = Contact.includes(:department).order('departments.name, contacts.name').references(:departments)
  end
end

json.contacts @contacts do |contact|
  json.id contact.id
  json.department do
    json.id contact.department.id
    json.name contact.department.name
  end
  json.name contact.name
end

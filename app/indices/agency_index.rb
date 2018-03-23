ThinkingSphinx::Index.define :agency, :with => :real_time do
  # fields
  indexes name, :sortable => true
  indexes office_number, :sortable => true
  indexes street_name, :sortable => true
  indexes unit_number, :sortable => true
  indexes postal_code, :sortable => true
  indexes email, :sortable => true
  indexes criteria
  indexes description

  # attributes
  has created_at, :type => :timestamp
  has updated_at, :type => :timestamp
end
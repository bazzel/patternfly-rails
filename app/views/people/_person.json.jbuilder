json.extract! person, :id, :name, :surname, :born_on, :died_on, :created_at, :updated_at
json.url person_url(person, format: :json)

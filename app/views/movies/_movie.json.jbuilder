json.extract! movie, :id, :title, :year, :plot_summary, :gross_takings, :available_on_dvd, :created_at, :updated_at
json.url movie_url(movie, format: :json)

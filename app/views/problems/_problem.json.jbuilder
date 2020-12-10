# frozen_string_literal: true

json.extract! problem, :id, :content, :user_id, :created_at, :updated_at
json.url problem_url(problem, format: :json)

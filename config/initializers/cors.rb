# frozen_string_literal: true

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins ["http://127.0.0.1:4200", "http://127.0.0.1:1025", "http://localhost:1025", "10.71.23.106:8000",
             "http://localhost:8000", "http://localhost:5173"]
    resource "*", headers: :any, methods: %i[get post patch put delete options]
  end
end

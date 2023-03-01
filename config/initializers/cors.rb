Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins ['http://127.0.0.1:4200', 'http://localhost:4200', 'http://192.168.1.39:4200', 'http://127.0.0.1:1025', 'http://localhost:1025', 'http://192.168.1.39:1025']
    resource '*', headers: :any, methods: [:get, :post, :patch, :put, :delete, :options, :head]
  end
end
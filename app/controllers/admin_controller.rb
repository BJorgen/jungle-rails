class AdminController < ApplicationController
  http_basic_authenticate_with name: ENV['BASIC_ADMIN_AUTH_USERNAME'], password: ENV['BASIC_ADMIN_AUTH_PASSWORD']
end

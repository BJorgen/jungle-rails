class AdminController < ApplicationController
  http_basic_authenticate_with name: "abc", password: "123"
end

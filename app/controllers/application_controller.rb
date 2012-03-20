class ApplicationController < ActionController::Base
  protect_from_forgery
  ::FILE_SERV='https://s3-eu-west-1.amazonaws.com/fyfirsttest/'
end

require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html, :atom
  respond_to :json, except: [:create, :update, :destroy]

  protect_from_forgery
end

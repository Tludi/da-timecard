# admin_controller.rb

class Admin::AdminController < ApplicationController

  layout 'admin'
  before_filter :require_login

end

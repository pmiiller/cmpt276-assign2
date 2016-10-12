class SayController < ApplicationController
  def hello
    @form_name = params['name']
    @form_statement = params['statement']
    @time = Time.now
  end

  def goodbye
    @form_name = params['name']
    @form_statement = params['statement']
    @time = Time.now
  end

  def index
  end
end

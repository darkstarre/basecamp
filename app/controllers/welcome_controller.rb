require 'basecamp'

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, js_errors: false)
end

Capybara.default_driver = :poltergeist

class WelcomeController < ApplicationController
  def index
  end

  def connect
    Basecamp.establish_connection('nogginlabs.basecamphq.com', 'GETYOUROWNAPIKEY', 'X', true)
  end

  def get_data_as_json
    @data = Basecamp::Company.all
    @data.as_json
  end

  def return_company_name_and_id
    @list = @data[i].attributes[:id]
    @list2 = @data[i].attributes[:name]
  end


end

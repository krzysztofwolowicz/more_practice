class TestController < ApplicationController
  def index
    #odwołanie do pliku index.html.erb
    @testowa = "witam w kursie ruby on rails"
  end
end

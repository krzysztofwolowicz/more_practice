class TestController < ApplicationController
  def index
    #odwołanie do pliku index.html.erb
    @testowa = "witam w kursie ruby on rails"
    @imiona = ["Ala", "Ewa", "Ola"]
  end

  def test
    render('witaj')

  end

  def kurs
    redirect_to('http://appchance.com/')

  end
end

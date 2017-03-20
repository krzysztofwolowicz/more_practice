class KategoriesController < ApplicationController

  def index

    @kategorie = Kategorie.sortuj

  end

  def pokaz
  end

  def nowa
# @kategoria to nazwa formularza a nie zmiennej
    @kategoria = Kategorie.new({:nazwa => 'Nazwa'})
    @licznik = Kategorie.count + 1

  end

  def utworz

    @kategorie = Kategorie.new(kategorie_parametry)

    if @kategorie.save
      redirect_to(:action=>'index')
    else
      @licznik = Kategorie.count + 1
      render('nowa')
    end

  end

  def edycja
  end

  def usun
  end

  def kategorie_parametry

    params.require(:kategoria).permit(:nazwa, :pozycja, :widoczna)

  end

end

class StronasController < ApplicationController
  layout 'admin'

  before_action :sprawdz_logowanie

  def index
    @stronas = Strona.sortuj
  end

  def pokaz
    @strona = Strona.find(params[:id])
  end

  def nowa
    @strona = Strona.new({:nazwa => 'Nazwa'})
    @licznik = Strona.count + 1
    @kategoria = Kategorie.order('pozycja ASC')
  end

  def utworz

    @strona = Strona.new(strona_parametry)

    if @strona.save
      flash[:notice]="Strona została pomyślnie utworzona"
      redirect_to(:action=>'index')
    else
      @licznik = Strona.count + 1
      @kategoria = Kategorie.order('pozycja ASC')
      render('nowa')
    end

  end

  def edycja
    @strona = Strona.find(params[:id])
    @licznik = Strona.count
    @kategoria = Kategorie.order('pozycja ASC')
  end

  def aktualizuj
    @strona = Strona.find_by(id: params[:id])
    if @strona.update_attributes(strona_parametry)
      flash[:notice]="Strona została pomyślnie zaktualizowana"
      redirect_to(:action => 'pokaz', :id => @strona.id)
    else
      @licznik = Strona.count
      @kategoria = Kategorie.order('pozycja ASC')
      render('edycja')

    end
  end

  def usun
    @strona = Strona.find(params[:id])
  end

  def kasuj

    strona = Strona.find(params[:id]).destroy
    flash[:notice]="Strona #{strona.nazwa} została pomyślnie usunięta"
    redirect_to(:action=>'index')

  end

    def strona_parametry

    params.require(:strona).permit(:nazwa, :pozycja, :widoczna, :created_at, :kategorie_id)

  end

end
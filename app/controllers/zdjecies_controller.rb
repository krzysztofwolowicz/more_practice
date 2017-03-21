class ZdjeciesController < ApplicationController
  layout 'admin'

  before_action :sprawdz_logowanie

  def index
    @zdjecia = Zdjecie.sortuj
  end

  def nowe
    @zdjecia = Zdjecie.new({:nazwa => "Wprowadź nazwę zdjcia"})
    @licznik = Zdjecie.count + 1
    @galeria = Galerie.order('pozycja ASC')

  end

  def utworz

    @zdjecia = Zdjecie.new(zdjecia_parametry)

    if @zdjecia.save
      flash[:notice]="Zdjęcie zostało pomyślnie utworzone"
      redirect_to(:action=>'index')
    else
      @licznik = Zdjęcie.count + 1
      @galeria = Galerie.order('pozycja ASC')
      render('nowe')
    end

  end

  def pokaz
    @zdjecia = Zdjecie.find(params[:id])
  end

  def edycja
    @zdjecia = Zdjecie.find(params[:id])
    @licznik = Zdjecie.count
    @galeria = Galerie.order('pozycja ASC')
  end

  def aktualizuj
    @zdjecia = Zdjecie.find(params[:id])

    if @zdjecia.update_attributes(zdjecia_parametry)
      flash[:notice]="Zdjęcie zostało pomyślnie edytowane"
      redirect_to(:action=>'pokaz', :id => @zdjecia.id)
    else
      @licznik = Zdjęcie.count
      @galeria = Galerie.order('pozycja ASC')
      render('edycja')
    end

  end

  def usun

    @zdjecia = Zdjecie.find(params[:id])

  end

  def kasuj
    zdjecia = Zdjecie.find(params[:id]).destroy
    flash[:notice]="Zdjęcie #{zdjecia.nazwa} zostało usunięte"
    redirect_to(:action =>'index')

  end

  def zdjecia_parametry

    params.require(:zdjecia).permit(:nazwa, :pozycja, :widoczne, :opis, :zdjecie, :galerie_id, :created_at)

  end
end

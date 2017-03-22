class ArtykulsController < ApplicationController
  layout 'admin'

  before_action :sprawdz_logowanie
  before_action :szukaj_strony

  def index
    @artykuly = @strony.artykuls.sortuj
  end

  def nowy
    @artykuly = Artykul.new({:strona_id => @strony.id, :nazwa=>"Tytuł?"})
    # @strona = Strona.order('pozycja ASC')
    # poniżej Tabela @strony kontroler kategorie
    @strona = @strony.kategorie.stronas.sortuj
    @licznik = Artykul.count + 1
  end

  def utworz

    @artykuly = Artykul.new(artykuly_parametry)

    if @artykuly.save
      flash[:notice]="Artykuł został pomyślnie utworzony"
      redirect_to(:action=>'index', :strona_id => @strony.id)
    else
      @licznik = Artykul.count + 1
      @artykuly = Strona.order('pozycja ASC')
      render('nowy')
    end

  end

  def edycja
    @artykuly = Artykul.find(params[:id])
    @strona = Strona.order('pozycja ASC')
    @licznik = Artykul.count + 1
  end

  def aktualizuj
    @artykuly = Artykul.find_by(id: params[:id])
    if @artykuly.update_attributes(artykuly_parametry)
      flash[:notice]="Artykuł został pomyślnie zaktualizowana"
      redirect_to(:action => 'pokaz', :id => @artykuly.id, :strona_id => @strony.id)
    else
      @licznik = Artykul.count
      @strona = Strona.order('pozycja ASC')
      render('edycja')
    end
  end

  def usun
    @artykuly = Artykul.find(params[:id])
  end

  def kasuj

    artykuly = Artykul.find(params[:id]).destroy
    flash[:notice]="Artykuł #{artykuly.nazwa} została pomyślnie usunięta"
    redirect_to(:action=>'index', :strona_id => @strony.id)

  end

  def pokaz
    @artykuly = Artykul.find(params[:id])
  end

  private

    def artykuly_parametry

      params.require(:artykuly).permit(:nazwa, :pozycja, :widoczny, :created_at, :strona_id, :zdjecie, :zawartosc)
    end


    def szukaj_strony

      if params[:strona_id]

      @strony = Strona.find(params[:strona_id])
      end
    end
end



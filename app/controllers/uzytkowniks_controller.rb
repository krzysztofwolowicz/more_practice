class UzytkowniksController < ApplicationController

  layout 'admin'
  def index
    @uzytkownik = Uzytkownik.sortuj
  end

  def nowy
    @uzytkownik = Uzytkownik.new
  end

  def utworz

    @uzytkownik = Uzytkownik.new(uzytkownik_parametry)

    if @uzytkownik.save
      flash[:notice] = "Użytkownik został założony"
      redirect_to(:action => 'index')
    else
      render('nowy')
    end

  end

  def edycja
    @uzytkownik = Uzytkownik.find(params[:id])
  end

  def aktualizuj
    @uzytkownik = Uzytkownik.find(params[:id])
    if @uzytkownik.update_attributes(uzytkownik_parametry)
      flash[:notice] = "Dane użytkownika zostały pomyślnie edytowane"
      redirect_to(:action => 'index')
    else
      render('edycja')
    end

  end

  def usun
    @uzytkownik = Uzytkownik.find(params[:id])
  end

  def kasuj

    uzytkownik = Uzytkownik.find(params[:id]).destroy
    flash[:notice] = "Konto użytkownika zostało usunięte"
    redirect_to(:action =>'index')

  end

  private

  def uzytkownik_parametry
    params.require(:uzytkownik).permit(:imie, :nazwisko, :email, :uzytkownik, :password, :password_confirmation)

  end
end

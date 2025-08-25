unit ContactosPanel;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Grids, StdCtrls;

type

  { TContactosPanel }

  TContactosPanel = class(TForm)
    btnContactoAnterior: TButton;
    btnContactoSiguiente: TButton;
    tblMostrsarContactos: TStringGrid;
    procedure btnContactoAnteriorClick(Sender: TObject);
    procedure btnContactoSiguienteClick(Sender: TObject);
  private

  public

  end;

var
  Contactos: TContactosPanel;

implementation

{$R *.lfm}

{ TContactosPanel }

procedure TContactosPanel.btnContactoAnteriorClick(Sender: TObject);
begin

end;

procedure TContactosPanel.btnContactoSiguienteClick(Sender: TObject);
begin

end;

end.


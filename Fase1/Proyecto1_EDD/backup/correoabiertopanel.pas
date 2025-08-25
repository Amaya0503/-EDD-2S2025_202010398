unit CorreoAbiertoPanel;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Grids, StdCtrls;

type

  { TCorreoAbiertoPanel }

  TCorreoAbiertoPanel = class(TForm)
    btnEliminarCorreo: TButton;
    tblCorreoAbierto: TStringGrid;
    procedure btnEliminarCorreoClick(Sender: TObject);
  private

  public

  end;

var
  CorreoAbierto: TCorreoAbiertoPanel;

implementation

{$R *.lfm}

{ TCorreoAbiertoPanel }

procedure TCorreoAbiertoPanel.btnEliminarCorreoClick(Sender: TObject);
begin

end;

end.


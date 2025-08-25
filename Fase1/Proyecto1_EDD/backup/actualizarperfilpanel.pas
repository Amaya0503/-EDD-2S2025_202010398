unit ActualizarPerfilPanel;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Grids, StdCtrls;

type

  { TActualizarPerfilPanel }

  TActualizarPerfilPanel = class(TForm)
    btnActualizar: TButton;
    tblActualizarPerfil: TStringGrid;
    procedure btnActualizarClick(Sender: TObject);
  private

  public

  end;

var
  ActualizarPerfil: TActualizarPerfilPanel;

implementation

{$R *.lfm}

{ TActualizarPerfilPanel }

procedure TActualizarPerfilPanel.btnActualizarClick(Sender: TObject);
begin

end;

end.


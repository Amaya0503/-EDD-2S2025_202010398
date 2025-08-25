unit BandejaEntradaPanel;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Grids;

type

  { TBandejaEntradaPanel }

  TBandejaEntradaPanel = class(TForm)
    btnOrdenarAZ: TButton;
    tblBandejaEntrada: TDrawGrid;
    txtMensajesNoLeidos: TEdit;
    Label1: TLabel;
    procedure btnOrdenarAZClick(Sender: TObject);
    procedure tblBandejaEntradaClick(Sender: TObject);
    procedure txtMensajesNoLeidosChange(Sender: TObject);
  private

  public

  end;

var
  BandejaEntrada: TBandejaEntradaPanel;

implementation

{$R *.lfm}

{ TBandejaEntradaPanel }

procedure TBandejaEntradaPanel.txtMensajesNoLeidosChange(Sender: TObject);
begin

end;

procedure TBandejaEntradaPanel.btnOrdenarAZClick(Sender: TObject);
begin

end;

procedure TBandejaEntradaPanel.tblBandejaEntradaClick(Sender: TObject);
begin

end;

end.


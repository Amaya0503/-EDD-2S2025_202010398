unit PapeleraPanel;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Grids;

type

  { TPapeleraPanel }

  TPapeleraPanel = class(TForm)
    btnBuscarPapelera: TButton;
    btnEliminardePapelera: TButton;
    Label1: TLabel;
    StringGrid1: TStringGrid;
    procedure btnBuscarPapeleraClick(Sender: TObject);
    procedure btnEliminardePapeleraClick(Sender: TObject);
  private

  public

  end;

var
  Papelera: TPapeleraPanel;

implementation

{$R *.lfm}

{ TPapeleraPanel }

procedure TPapeleraPanel.btnBuscarPapeleraClick(Sender: TObject);
begin

end;

procedure TPapeleraPanel.btnEliminardePapeleraClick(Sender: TObject);
begin

end;

end.


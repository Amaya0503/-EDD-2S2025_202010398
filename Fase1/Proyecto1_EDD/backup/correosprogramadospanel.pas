unit CorreosProgramadosPanel;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Grids;

type

  { TCorreosProgramadosPanel }

  TCorreosProgramadosPanel = class(TForm)
    btnEnviarTodos: TButton;
    Label1: TLabel;
    tblCorreosProgramados: TStringGrid;
    procedure btnEnviarTodosClick(Sender: TObject);
  private

  public

  end;

var
  CorreosProgramados: TCorreosProgramadosPanel;

implementation

{$R *.lfm}

{ TCorreosProgramadosPanel }

procedure TCorreosProgramadosPanel.btnEnviarTodosClick(Sender: TObject);
begin

end;

end.


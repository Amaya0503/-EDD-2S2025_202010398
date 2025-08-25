unit RootPanel;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TRootPanel }

  TRootPanel = class(TForm)
    btnCargaMasivaRoot: TButton;
    btnReporteUsuariosRoot: TButton;
    btnReporteRelacionesRoot: TButton;
    Label1: TLabel;
    procedure btnCargaMasivaRootClick(Sender: TObject);
    procedure btnReporteUsuariosRootClick(Sender: TObject);
    procedure btnReporteRelacionesRootClick(Sender: TObject);
  private

  public

  end;

var
  Root: TRootPanel;

implementation

{$R *.lfm}

{ TRootPanel }

procedure TRootPanel.btnCargaMasivaRootClick(Sender: TObject);
begin

end;

procedure TRootPanel.btnReporteUsuariosRootClick(Sender: TObject);
begin

end;

procedure TRootPanel.btnReporteRelacionesRootClick(Sender: TObject);
begin

end;

end.


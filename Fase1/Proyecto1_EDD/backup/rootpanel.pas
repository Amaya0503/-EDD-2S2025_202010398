unit RootPanel;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
  usuarios;

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
var
  OpenDialog: TOpenDialog;
begin
  OpenDialog := TOpenDialog.Create(Self);
  try
    OpenDialog.Filter := 'Archivos JSON|*.json';
    OpenDialog.Title := 'Seleccionar archivo de usuarios';
    if OpenDialog.Execute then
    begin
      CargarUsuariosDesdeJSON(ListaGlobalUsuarios, OpenDialog.FileName);
      ShowMessage('Usuarios cargados exitosamente desde: ' + OpenDialog.FileName);
    end;
  finally
    OpenDialog.Free;
  end;
end;

procedure TRootPanel.btnReporteUsuariosRootClick(Sender: TObject);
begin
  // Aquí más adelante generaremos el reporte de usuarios
end;

procedure TRootPanel.btnReporteRelacionesRootClick(Sender: TObject);
begin
  // Aquí más adelante generaremos el reporte de relaciones
end;

end.


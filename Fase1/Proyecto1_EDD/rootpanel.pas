unit RootPanel;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
  LCLType;

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
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Root: TRootPanel;

implementation

{$R *.lfm}

uses LoginPanel, usuarios;

{ TRootPanel }

procedure TRootPanel.btnCargaMasivaRootClick(Sender: TObject);
var
  OpenDialog: TOpenDialog;
begin
  OpenDialog := TOpenDialog.Create(Self);
  try
    // Configurar el filtro para solo mostrar archivos JSON
    OpenDialog.Filter := 'Archivos JSON (*.json)|*.json|Todos los archivos (*.*)|*.*';
    OpenDialog.Title := 'Seleccionar archivo de usuarios';

    // Ejecutar el diálogo
    if OpenDialog.Execute then
    begin
      try
        // Llamar a la función de carga masiva
        CargarUsuariosDesdeJSON(ListaGlobalUsuarios, OpenDialog.FileName);
        // Ahora el contador de ID ha vuelto, así que podemos mostrar el total de usuarios
        ShowMessage('Usuarios cargados exitosamente desde: ' + OpenDialog.FileName);
        ShowMessage('Total de usuarios cargados: ' + IntToStr(ListaGlobalUsuarios.ultimoId));
      except
        on E: Exception do
          ShowMessage('Error al cargar el archivo JSON: ' + E.Message);
      end;
    end;
  finally
    OpenDialog.Free;
  end;
end;

procedure TRootPanel.btnReporteUsuariosRootClick(Sender: TObject);
begin
  // Aquí va la lógica para generar el reporte de usuarios
  ShowMessage('Función de reporte de usuarios por implementar.');
end;

procedure TRootPanel.btnReporteRelacionesRootClick(Sender: TObject);
begin
  // Aquí va la lógica para generar el reporte de relaciones
  ShowMessage('Función de reporte de relaciones por implementar.');
end;

procedure TRootPanel.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  // Regresar al LoginPanel cuando se cierra la ventana
  Login.Show;
end;

end.

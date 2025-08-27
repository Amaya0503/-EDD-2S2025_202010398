unit ContactosPanel;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Grids, StdCtrls, usuarios,
  LCLType;

type

  { TContactosPanel }

  TContactosPanel = class(TForm)
    btnContactoAnterior: TButton;
    btnContactoSiguiente: TButton;
    tblMostrsarContactos: TStringGrid;
    btnCerrar: TButton;
    lblInfo: TLabel;
    procedure btnContactoAnteriorClick(Sender: TObject);
    procedure btnContactoSiguienteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure btnCerrarClick(Sender: TObject);
  private
    FContactoActual: PContacto;
    procedure MostrarContactoActual;
  public

  end;

var
  Contactos: TContactosPanel;

implementation

{$R *.lfm}

uses LoginPanel, UserPanel; // <-- ¡El cambio vital está aquí!

{ TContactosPanel }

procedure TContactosPanel.MostrarContactoActual;
var
  usuario_completo: PUsuario;
begin
  if Assigned(FContactoActual) then
  begin
    // Buscamos el usuario completo en la lista global
    usuario_completo := BuscarUsuario(ListaGlobalUsuarios, FContactoActual^.email);

    if Assigned(usuario_completo) then
    begin
      tblMostrsarContactos.Cells[0, 0] := 'Nombre:';
      tblMostrsarContactos.Cells[1, 0] := usuario_completo^.nombre;
      tblMostrsarContactos.Cells[0, 1] := 'Usuario:';
      tblMostrsarContactos.Cells[1, 1] := usuario_completo^.usuario;
      tblMostrsarContactos.Cells[0, 2] := 'Correo:';
      tblMostrsarContactos.Cells[1, 2] := usuario_completo^.email;
      tblMostrsarContactos.Cells[0, 3] := 'Teléfono:';
      tblMostrsarContactos.Cells[1, 3] := usuario_completo^.telefono;
    end
    else
    begin
      // En caso de que el contacto ya no exista como usuario
      tblMostrsarContactos.Cells[0, 0] := 'Contacto no válido';
      tblMostrsarContactos.Cells[1, 0] := '';
      tblMostrsarContactos.Cells[0, 1] := '';
      tblMostrsarContactos.Cells[1, 1] := '';
      tblMostrsarContactos.Cells[0, 2] := '';
      tblMostrsarContactos.Cells[1, 2] := '';
      tblMostrsarContactos.Cells[0, 3] := '';
      tblMostrsarContactos.Cells[1, 3] := '';
    end;
  end;
end;

procedure TContactosPanel.FormShow(Sender: TObject);
begin
  // Verificamos si el usuario tiene contactos al abrir el formulario
  if not Assigned(LoginPanel.UsuarioActivo^.contactos) then
  begin
    lblInfo.Caption := 'Aún no tienes contactos agregados.';
    btnContactoAnterior.Enabled := False;
    btnContactoSiguiente.Enabled := False;
  end
  else
  begin
    lblInfo.Caption := '';
    btnContactoAnterior.Enabled := True;
    btnContactoSiguiente.Enabled := True;
    // Establecemos el puntero en el primer contacto de la lista circular
    FContactoActual := LoginPanel.UsuarioActivo^.contactos;
    MostrarContactoActual;
  end;
end;

procedure TContactosPanel.btnContactoSiguienteClick(Sender: TObject);
begin
  if Assigned(FContactoActual) then
  begin
    FContactoActual := FContactoActual^.siguiente;
    MostrarContactoActual;
  end;
end;

procedure TContactosPanel.btnContactoAnteriorClick(Sender: TObject);
var
  actual: PContacto;
begin
  if Assigned(FContactoActual) then
  begin
    // Recorremos la lista para encontrar el nodo anterior en la lista circular
    actual := FContactoActual;
    while Assigned(actual^.siguiente) and (actual^.siguiente <> FContactoActual) do
    begin
      actual := actual^.siguiente;
    end;
    // El puntero 'actual' ahora es el nodo anterior
    FContactoActual := actual;
    MostrarContactoActual;
  end;
end;

procedure TContactosPanel.btnCerrarClick(Sender: TObject);
begin
  User.Show;
  Self.Close;
end;

procedure TContactosPanel.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  User.Show;
end;

end.

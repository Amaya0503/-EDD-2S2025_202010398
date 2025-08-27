unit CreatePanel;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
  usuarios;

type

  { TCreatePanel }

  TCreatePanel = class(TForm)
    btnCuentaCreada: TButton;
    Edit1: TEdit; // Nombre
    Edit2: TEdit; // Usuario
    Edit3: TEdit; // Email
    Edit4: TEdit; // Telefono
    Edit5: TEdit; // Password
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure btnCuentaCreadaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  CreateUser: TCreatePanel;

implementation

{$R *.lfm}

uses LoginPanel;

procedure TCreatePanel.btnCuentaCreadaClick(Sender: TObject);
var
  nombre, user, email, telefono, password: string;
begin
  // Obtener los datos de los campos de texto
  nombre := Edit1.Text;
  user := Edit2.Text;
  email := Edit3.Text;
  telefono := Edit4.Text;
  password := Edit5.Text;

  // Validar que los campos no estén vacíos
  if (nombre = '') or (user = '') or (email = '') or (telefono = '') or (password = '') then
  begin
    ShowMessage('Todos los campos deben ser completados.');
    Exit;
  end;

  // Llamar a la función para agregar el usuario
  AgregarUsuario(ListaGlobalUsuarios, nombre, user, email, telefono, password);

  ShowMessage('Cuenta creada exitosamente.');

  // Limpiar los campos para un nuevo registro
  Edit1.Text := '';
  Edit2.Text := '';
  Edit3.Text := '';
  Edit4.Text := '';
  Edit5.Text := '';

  // Regresar al formulario de Login
  Login.Show;
end;

procedure TCreatePanel.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  // Esto asegura que si el usuario cierra la ventana, se regrese al Login
  Login.Show;
end;

end.

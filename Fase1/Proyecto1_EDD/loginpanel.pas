unit LoginPanel;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
  CreatePanel, RootPanel, UserPanel, usuarios;

type

  { TLoginPanel }

  TLoginPanel = class(TForm)
    btnIniciarSesion: TButton;
    btnCrearCuenta: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    txtLoginEmail: TEdit;
    txtLoginPassword: TEdit;
    procedure btnCrearCuentaClick(Sender: TObject);
    procedure btnIniciarSesionClick(Sender: TObject);
    procedure txtLoginEmailChange(Sender: TObject);
    procedure txtLoginPasswordChange(Sender: TObject);
  private

  public

  end;

var
  Login: TLoginPanel;

implementation

{$R *.lfm}

{ TLoginPanel }

procedure TLoginPanel.txtLoginEmailChange(Sender: TObject);
begin
  // Aquí puedes agregar validación en tiempo real si lo deseas
end;

procedure TLoginPanel.txtLoginPasswordChange(Sender: TObject);
begin
  // Aquí también
end;

procedure TLoginPanel.btnIniciarSesionClick(Sender: TObject);
var
  actual: PUsuario;
  encontrado: Boolean;
begin
  // Caso 1: Root
  if (txtLoginEmail.Text = 'root@edd.com') and (txtLoginPassword.Text = 'root123') then
  begin
    ShowMessage('Inicio de sesión exitoso como ROOT.');
    Root := TRootPanel.Create(Self);
    Root.Show;
    Exit;
  end;

  // Caso 2: Usuarios registrados en la lista
  encontrado := False;
  actual := ListaGlobalUsuarios.cabeza;

  while actual <> nil do
  begin
    if (actual^.email = txtLoginEmail.Text) and (actual^.password = txtLoginPassword.Text) then
    begin
      encontrado := True;
      Break;
    end;
    actual := actual^.siguiente;
  end;

  if encontrado then
  begin
    ShowMessage('Inicio de sesión exitoso como usuario: ' + actual^.nombre);
    User := TUserPanel.Create(Self);
    User.Show;
  end
  else
  begin
    ShowMessage('Correo o contraseña incorrectos.');
  end;
end;

procedure TLoginPanel.btnCrearCuentaClick(Sender: TObject);
begin
  CreateUser := TCreatePanel.Create(Self);  // Crear el formulario de crear cuenta
  CreateUser.Show;                          // Mostrarlo
end;

end.


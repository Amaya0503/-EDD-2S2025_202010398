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
  UsuarioActivo: PUsuario;

implementation

{$R *.lfm}

{ TLoginPanel }

procedure TLoginPanel.txtLoginEmailChange(Sender: TObject);
begin
  //
end;

procedure TLoginPanel.txtLoginPasswordChange(Sender: TObject);
begin
  //
end;

procedure TLoginPanel.btnIniciarSesionClick(Sender: TObject);
var
  actual: PUsuario;
  encontrado: Boolean;
begin
  // Validación para el usuario ROOT con sus credenciales predeterminadas
  if (txtLoginEmail.Text = 'root@edd.com') and (txtLoginPassword.Text = 'root123') then
  begin
    ShowMessage('Inicio de sesión exitoso como ROOT.');
    Root := TRootPanel.Create(Self);
    Root.Show;
    Self.Hide;
    Exit;
  end;

  // Validación para usuarios registrados en la lista
  encontrado := False;
  actual := ListaGlobalUsuarios.cabeza;

  while actual <> nil do
  begin
    // Compara el email y la contraseña de la lista con los ingresados
    if (actual^.email = txtLoginEmail.Text) and (actual^.password = txtLoginPassword.Text) then
    begin
      encontrado := True;
      break;
    end;
    actual := actual^.siguiente;
  end;

  if encontrado then
  begin
    // Asigna el usuario encontrado a la variable global
    UsuarioActivo := actual;

    ShowMessage('Inicio de sesión exitoso como usuario: ' + UsuarioActivo^.nombre);

    // Crea el formulario del usuario y lo muestra
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
  // Crea el formulario para registrar un nuevo usuario y lo muestra
  CreateUser := TCreatePanel.Create(Self);
  CreateUser.Show;
end;

end.

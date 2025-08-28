unit LoginPanel;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
  usuarios; // <-- ¡Correcto: para poder declarar 'PUsuario' en el interface!

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
    UsuarioActivo: PUsuario;
  end;

var
  Login: TLoginPanel;

implementation

{$R *.lfm}

uses CreatePanel, RootPanel, UserPanel; // <-- Correcto: para evitar referencias circulares

{ TLoginPanel }

procedure TLoginPanel.txtLoginEmailChange(Sender: TObject);
begin
end;

procedure TLoginPanel.txtLoginPasswordChange(Sender: TObject);
begin
end;

procedure TLoginPanel.btnIniciarSesionClick(Sender: TObject);
var
  actual: PUsuario;
  encontrado: Boolean;
begin
  if (txtLoginEmail.Text = 'root@edd.com') and (txtLoginPassword.Text = 'root123') then
  begin
    ShowMessage('Inicio de sesión exitoso como ROOT.');
    Root := TRootPanel.Create(Self);
    Root.Show;
    Exit;
  end;

  encontrado := False;
  actual := ListaGlobalUsuarios.cabeza;

  while actual <> nil do
  begin
    if (actual^.email = txtLoginEmail.Text) and (actual^.password = txtLoginPassword.Text) then
    begin
      encontrado := True;
      break;
    end;
    actual := actual^.siguiente;
  end;

  if encontrado then
  begin
    UsuarioActivo := actual;
    ShowMessage('Inicio de sesión exitoso como usuario: ' + UsuarioActivo^.nombre);
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
  CreateUser := TCreatePanel.Create(Self);
  CreateUser.Show;
end;

end.

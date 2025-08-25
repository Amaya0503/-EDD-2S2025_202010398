unit LoginPanel;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, CreatePanel, RootPanel, UserPanel;

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
begin
  if (txtLoginEmail.Text = 'root@edd.com') and (txtLoginPassword.Text = 'root123') then
  begin
    Self.Hide;
    ShowMessage('Inicio de sesión exitoso.');
    Root := TRootPanel.Create(Self);  // Se debe dirigir acá
    Root.Show;
  end
  else if (txtLoginEmail.Text = '123') and (txtLoginPassword.Text = '123') then
  begin
    Self.Hide;
    ShowMessage('Inicio de sesión exitoso.');
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
  Self.Hide;                                // Ocultar login
end;

end.


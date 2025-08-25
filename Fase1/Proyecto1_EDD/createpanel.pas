unit CreatePanel;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, usuarios;

type

  { TCreatePanel }

  TCreatePanel = class(TForm)
    btnCuentaCreada: TButton;
    Edit1: TEdit; //Nombre
    Edit2: TEdit; //Usuario
    Edit3: TEdit; //Email
    Edit4: TEdit; //Telefono
    Edit5: TEdit; //Contraseña
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure btnCuentaCreadaClick(Sender: TObject);
  private

  public

  end;

var
  CreateUser: TCreatePanel;

implementation

{$R *.lfm}

uses LoginPanel;

{ TCreatePanel }

procedure TCreatePanel.btnCuentaCreadaClick(Sender: TObject);
begin
  // Guardamos el usuario en la lista global
  AgregarUsuario(
    ListaGlobalUsuarios,
    Edit1.Text, // Nombre
    Edit2.Text, // Usuario
    Edit3.Text, // Email
    Edit4.Text, // Telefono
    Edit5.Text  // Contraseña
  );

  ShowMessage('Cuenta creada exitosamente.');
  Login.Show;  // Mostramos el login
  Self.Close;  // Cerramos el formulario actual
end;

end.

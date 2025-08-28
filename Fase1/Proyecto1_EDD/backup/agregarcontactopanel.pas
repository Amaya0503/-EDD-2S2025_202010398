unit AgregarContactoPanel;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TAgregarContacto }

  TAgregarContacto = class(TForm)
    btnAgregarContacto: TButton;
    txtContactoaAgregar: TEdit;
    Label1: TLabel;
    procedure btnAgregarContactoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure txtContactoaAgregarChange(Sender: TObject);
  private

  public

  end;

var
  AgregarContacto: TAgregarContacto;

implementation

{$R *.lfm}

uses LoginPanel, usuarios, UserPanel; // <-- ¡Se agregó UserPanel aquí!

{ TAgregarContacto }

procedure TAgregarContacto.btnAgregarContactoClick(Sender: TObject);
var
  email_contacto: String;
  usuario_a_agregar: PUsuario;
begin
  email_contacto := txtContactoaAgregar.Text;

  // Validación para que el campo no esté vacío
  if Trim(email_contacto) = '' then
  begin
    ShowMessage('Por favor, ingrese el correo del contacto.');
    Exit;
  end;

  // Buscar el usuario por email
  usuario_a_agregar := BuscarUsuario(ListaGlobalUsuarios, email_contacto);

  if Assigned(usuario_a_agregar) then
  begin
    // La llamada a la función renombrada 'AgregarContactoAUsuario'
    AgregarContactoAUsuario(LoginPanel.UsuarioActivo^, usuario_a_agregar^.nombre, usuario_a_agregar^.email);
    ShowMessage('Contacto ' + usuario_a_agregar^.nombre + ' (' + usuario_a_agregar^.email + ') agregado exitosamente.');
  end
  else
  begin
    ShowMessage('El correo ingresado no pertenece a un usuario registrado en el sistema.');
  end;

  // Limpiar el campo de texto
  txtContactoaAgregar.Clear;
end;

procedure TAgregarContacto.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  // Ahora la variable 'User' es conocida y se puede usar
  User.Show;
end;

procedure TAgregarContacto.txtContactoaAgregarChange(Sender: TObject);
begin
end;

end.

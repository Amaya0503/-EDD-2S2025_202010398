unit usuarios;

{$mode objfpc}{$H+}

interface

type
  PUsuario = ^TUsuario;
  TUsuario = record
    id: Integer;
    nombre: String;
    usuario: String;
    email: String;
    telefono: String;
    password: String;
    siguiente: PUsuario;
  end;

  TListaUsuarios = record
    cabeza: PUsuario;
    ultimoId: Integer; // contador de IDs
  end;

procedure InicializarLista(var lista: TListaUsuarios);
procedure AgregarUsuario(var lista: TListaUsuarios; nombre, usuario, email, telefono, password: String);
function BuscarUsuario(var lista: TListaUsuarios; usuario: String): PUsuario;

var
  ListaGlobalUsuarios: TListaUsuarios; // lista global accesible desde todos los formularios

implementation

procedure InicializarLista(var lista: TListaUsuarios);
begin
  lista.cabeza := nil;
  lista.ultimoId := 0;
end;

procedure AgregarUsuario(var lista: TListaUsuarios; nombre, usuario, email, telefono, password: String);
var
  nuevo: PUsuario;
begin
  New(nuevo);
  lista.ultimoId += 1;
  nuevo^.id := lista.ultimoId;
  nuevo^.nombre := nombre;
  nuevo^.usuario := usuario;
  nuevo^.email := email;
  nuevo^.telefono := telefono;
  nuevo^.password := password;

  nuevo^.siguiente := lista.cabeza;
  lista.cabeza := nuevo;
end;

function BuscarUsuario(var lista: TListaUsuarios; usuario: String): PUsuario;
var
  actual: PUsuario;
begin
  actual := lista.cabeza;
  while actual <> nil do
  begin
    if actual^.usuario = usuario then
    begin
      BuscarUsuario := actual;
      Exit;
    end;
    actual := actual^.siguiente;
  end;
  BuscarUsuario := nil;
end;

initialization
  InicializarLista(ListaGlobalUsuarios); // lista inicializada al arrancar el programa

end.

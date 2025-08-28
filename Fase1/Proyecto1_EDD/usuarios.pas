unit usuarios;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpjson, jsonparser;

type
  // Estructura de Correo (Lista Doblemente Enlazada)
  PCorreo = ^TCorreo;
  TCorreo = record
    id: Integer;
    remitente: String;
    destinatario: String;
    asunto: String;
    mensaje: String;
    estado: String; // Puede ser 'No Leído' o 'Leído'
    siguiente: PCorreo;
    anterior: PCorreo;
  end;

  // Estructura de Contacto (Lista Circular)
  PContacto = ^TContacto;
  TContacto = record
    id_contacto: Integer;
    nombre: String;
    email: String;
    siguiente: PContacto;
  end;

  // Estructura de Usuario (con la lista de correos y la lista de contactos)
  PUsuario = ^TUsuario;
  TUsuario = record
    id: Integer;
    nombre: String;
    usuario: String;
    email: String;
    telefono: String;
    password: String;
    siguiente: PUsuario;

    // Listas de datos del usuario
    correos: PCorreo;
    contactos: PContacto; // <- Lista circular de contactos
  end;

  TListaUsuarios = record
    cabeza: PUsuario;
    ultimoId: Integer;
  end;

// Procedimientos y funciones de la lista de usuarios
procedure InicializarLista(var lista: TListaUsuarios);
procedure AgregarUsuario(var lista: TListaUsuarios; nombre, usuario, email, telefono, password: String);
function BuscarUsuario(var lista: TListaUsuarios; usuario: String): PUsuario;
procedure CargarUsuariosDesdeJSON(var lista: TListaUsuarios; rutaArchivo: String);

// Procedimientos para agregar un correo
procedure AgregarCorreo(var usuario: TUsuario; remitente, destinatario, asunto, mensaje: String);

// Procedimiento para agregar un contacto a un usuario
procedure AgregarContactoAUsuario(var usuario: TUsuario; nombre, email: String);

var
  ListaGlobalUsuarios: TListaUsuarios;

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
  lista.ultimoId := lista.ultimoId + 1;
  nuevo^.id := lista.ultimoId;
  nuevo^.nombre := nombre;
  nuevo^.usuario := usuario;
  nuevo^.email := email;
  nuevo^.telefono := telefono;
  nuevo^.password := password;
  nuevo^.siguiente := lista.cabeza;

  // Inicializamos la lista de correos y contactos para el nuevo usuario
  nuevo^.correos := nil;
  nuevo^.contactos := nil;

  lista.cabeza := nuevo;
end;

procedure CargarUsuariosDesdeJSON(var lista: TListaUsuarios; rutaArchivo: String);
var
  JSONData: TJSONData;
  JSONObject, UsuarioObj: TJSONObject;
  JSONArray: TJSONArray;
  i: Integer;
  archivo: TStringList;
  jsonText: String;
begin
  if not FileExists(rutaArchivo) then
  begin
    WriteLn('Archivo no encontrado: ', rutaArchivo);
    Exit;
  end;

  archivo := TStringList.Create;
  try
    archivo.LoadFromFile(rutaArchivo);
    jsonText := archivo.Text;

    JSONData := GetJSON(jsonText);
    try
      JSONObject := TJSONObject(JSONData);
      JSONArray := JSONObject.Arrays['usuarios'];

      for i := 0 to JSONArray.Count - 1 do
      begin
        UsuarioObj := JSONArray.Objects[i];

        AgregarUsuario(
          lista,
          UsuarioObj.Strings['nombre'],
          UsuarioObj.Strings['usuario'],
          UsuarioObj.Strings['email'],
          UsuarioObj.Strings['telefono'],
          '1234'
        );
      end;
    finally
      JSONData.Free;
    end;
  finally
    archivo.Free;
  end;
end;

function BuscarUsuario(var lista: TListaUsuarios; usuario: String): PUsuario;
var
  actual: PUsuario;
begin
  actual := lista.cabeza;
  while actual <> nil do
  begin
    if (actual^.usuario = usuario) or (actual^.email = usuario) then
    begin
      Result := actual;
      Exit;
    end;
    actual := actual^.siguiente;
  end;
  Result := nil;
end;

procedure AgregarCorreo(var usuario: TUsuario; remitente, destinatario, asunto, mensaje: String);
var
  nuevo: PCorreo;
begin
  New(nuevo);

  nuevo^.remitente := remitente;
  nuevo^.destinatario := destinatario;
  nuevo^.asunto := asunto;
  nuevo^.mensaje := mensaje;
  nuevo^.estado := 'No Leído';
  nuevo^.siguiente := nil;
  nuevo^.anterior := nil;

  if Assigned(usuario.correos) then
  begin
    nuevo^.siguiente := usuario.correos;
    usuario.correos^.anterior := nuevo;
  end;
  usuario.correos := nuevo;
end;

procedure AgregarContactoAUsuario(var usuario: TUsuario; nombre, email: String);
var
  nuevo: PContacto;
  actual: PContacto;
begin
  New(nuevo);
  nuevo^.nombre := nombre;
  nuevo^.email := email;

  // Implementación de la lista circular
  if not Assigned(usuario.contactos) then
  begin
    usuario.contactos := nuevo;
    nuevo^.siguiente := nuevo; // Apunta a sí mismo
  end
  else
  begin
    actual := usuario.contactos;
    while Assigned(actual^.siguiente) and (actual^.siguiente <> usuario.contactos) do
    begin
      actual := actual^.siguiente;
    end;

    nuevo^.siguiente := usuario.contactos;
    actual^.siguiente := nuevo;
  end;
end;

initialization
  InicializarLista(ListaGlobalUsuarios);

end.

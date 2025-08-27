unit usuarios;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpjson, jsonparser;

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
    ultimoId: Integer; // Contador de IDs
  end;

procedure InicializarLista(var lista: TListaUsuarios);
procedure AgregarUsuario(var lista: TListaUsuarios; nombre, usuario, email, telefono, password: String);
function BuscarUsuario(var lista: TListaUsuarios; usuario: String): PUsuario;
procedure CargarUsuariosDesdeJSON(var lista: TListaUsuarios; rutaArchivo: String);

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
  nuevo^.id := lista.ultimoId; // Asigna un ID secuencial
  nuevo^.nombre := nombre;
  nuevo^.usuario := usuario;
  nuevo^.email := email;
  nuevo^.telefono := telefono;
  nuevo^.password := password;

  nuevo^.siguiente := lista.cabeza;
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

        // El ID no se lee, se genera de forma secuencial
        AgregarUsuario(
          lista,
          UsuarioObj.Strings['nombre'],
          UsuarioObj.Strings['usuario'],
          UsuarioObj.Strings['email'],
          UsuarioObj.Strings['telefono'],
          '1234' // Contraseña por defecto
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
  InicializarLista(ListaGlobalUsuarios);

end.

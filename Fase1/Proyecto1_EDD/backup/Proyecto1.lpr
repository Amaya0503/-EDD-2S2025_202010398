program Proyecto1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, LoginPanel, CreatePanel, RootPanel, UserPanel, bandejaentradapanel,
  CorreoAbiertoPanel, EnviarCorreoPanel, PapeleraPanel, CorreosProgramadosPanel,
  ProgramarCorreosPanel, AgregarContactoPanel, ContactosPanel,
ActualizarPerfilPanel;

{$R *.res}

begin
  RequireDerivedFormResource := True;
  Application.Scaled := True;
  Application.Initialize;
  Application.CreateForm(TLoginPanel, Login); //Siempre se inicia con el Login
  Application.CreateForm(TRootPanel, Root);
  Application.CreateForm(TUserPanel, User);
  Application.CreateForm(TBandejaEntradaPanel, BandejaEntrada);
  Application.CreateForm(TCorreoAbiertoPanel, CorreoAbierto);
  Application.CreateForm(TEnviarCorreoPanel, EnviarCorreo);
  Application.CreateForm(TPapeleraPanel, Papelera);
  Application.CreateForm(TCorreosProgramadosPanel, CorreosProgramados);
  Application.CreateForm(TProgramarCorreosPanel, ProgramarCorreos);
  Application.CreateForm(TAgregarContacto, AgregarContacto);
  Application.CreateForm(TContactosPanel, Contactos);
  Application.CreateForm(TActualizarPerfilPanel, ActualizarPerfil);
  Application.Run;
end.


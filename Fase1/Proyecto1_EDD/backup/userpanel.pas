unit UserPanel;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, BandejaEntradaPanel, ContactosPanel, AgregarContactoPanel,
  ActualizarPerfilPanel, CorreosProgramadosPanel, EnviarCorreoPanel, PapeleraPanel, ProgramarCorreosPanel, usuarios;

type

  { TUserPanel }

  TUserPanel = class(TForm)
    btnBandejaEntrada: TButton;
    btnEnviarCorreo: TButton;
    btnPapelera: TButton;
    btnProgramarCorreo: TButton;
    btnCorreosProgramados: TButton;
    btnAgregarContacto: TButton;
    btnContactos: TButton;
    btnActualizarPerfil: TButton;
    btnGenerarReportesUsuario: TButton;
    Label1: TLabel;
    AsignarNombreUsuario: TLabel;
    procedure AsignarNombreUsuarioClick(Sender: TObject);
    procedure btnActualizarPerfilClick(Sender: TObject);
    procedure btnAgregarContactoClick(Sender: TObject);
    procedure btnBandejaEntradaClick(Sender: TObject);
    procedure btnContactosClick(Sender: TObject);
    procedure btnCorreosProgramadosClick(Sender: TObject);
    procedure btnEnviarCorreoClick(Sender: TObject);
    procedure btnGenerarReportesUsuarioClick(Sender: TObject);
    procedure btnPapeleraClick(Sender: TObject);
    procedure btnProgramarCorreoClick(Sender: TObject);
  private

  public

  end;

var
  User: TUserPanel;

implementation

{$R *.lfm}

{ TUserPanel }

procedure TUserPanel.btnBandejaEntradaClick(Sender: TObject);
begin
    BandejaEntrada := TBandejaEntradaPanel.Create(self);
    BandejaEntrada.Show;
end;

procedure TUserPanel.btnContactosClick(Sender: TObject);
begin
    Contactos := TContactosPanel.Create(self);
    Contactos.Show;
end;

procedure TUserPanel.btnAgregarContactoClick(Sender: TObject);
begin
    AgregarContacto := TAgregarContacto.Create(self);
    AgregarContacto.Show;
end;

procedure TUserPanel.btnActualizarPerfilClick(Sender: TObject);
begin
    ActualizarPerfil := TActualizarPerfilPanel.Create(self);
    ActualizarPerfil.Show;
end;

procedure TUserPanel.AsignarNombreUsuarioClick(Sender: TObject);
begin
end;

procedure TUserPanel.btnCorreosProgramadosClick(Sender: TObject);
begin
    CorreosProgramados := TCorreosProgramadosPanel.Create(self);
    CorreosProgramados.Show;
end;

procedure TUserPanel.btnEnviarCorreoClick(Sender: TObject);
begin
    EnviarCorreo := TEnviarCorreoPanel.Create(self);
    EnviarCorreo.Show;

end;

procedure TUserPanel.btnGenerarReportesUsuarioClick(Sender: TObject);
begin
end;

procedure TUserPanel.btnPapeleraClick(Sender: TObject);
begin
    Papelera := TPapeleraPanel.Create(self);
    Papelera.Show;

end;

procedure TUserPanel.btnProgramarCorreoClick(Sender: TObject);
begin
    ProgramarCorreos := TProgramarCorreosPanel.Create(self);
    ProgramarCorreos.Show;
end;

end.


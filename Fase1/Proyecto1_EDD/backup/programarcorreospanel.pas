unit ProgramarCorreosPanel;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TProgramarCorreosPanel }

  TProgramarCorreosPanel = class(TForm)
    btnProgramarCorreo: TButton;
    txtDestinatarioaProgramar: TEdit;
    txtAsuntoaProgramar: TEdit;
    txtMensajeaProgramar: TEdit;
    txtFechaaProgramar: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure btnProgramarCorreoClick(Sender: TObject);
    procedure txtDestinatarioaProgramarChange(Sender: TObject);
    procedure txtAsuntoaProgramarChange(Sender: TObject);
    procedure txtMensajeaProgramarChange(Sender: TObject);
    procedure txtFechaaProgramarChange(Sender: TObject);
  private

  public

  end;

var
  ProgramarCorreos: TProgramarCorreosPanel;

implementation

{$R *.lfm}

{ TProgramarCorreosPanel }

procedure TProgramarCorreosPanel.txtDestinatarioaProgramarChange(Sender: TObject);
begin

end;

procedure TProgramarCorreosPanel.btnProgramarCorreoClick(Sender: TObject);
begin

end;

procedure TProgramarCorreosPanel.txtAsuntoaProgramarChange(Sender: TObject);
begin

end;

procedure TProgramarCorreosPanel.txtMensajeaProgramarChange(Sender: TObject);
begin

end;

procedure TProgramarCorreosPanel.txtFechaaProgramarChange(Sender: TObject);
begin

end;

end.


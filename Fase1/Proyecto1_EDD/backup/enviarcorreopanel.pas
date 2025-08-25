unit EnviarCorreoPanel;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TEnviarCorreoPanel }

  TEnviarCorreoPanel = class(TForm)
    btnEnviarCorreo: TButton;
    txtDestinatario: TEdit;
    txtAsunto: TEdit;
    txtMensaje: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure btnEnviarCorreoClick(Sender: TObject);
    procedure txtAsuntoChange(Sender: TObject);
    procedure txtDestinatarioChange(Sender: TObject);
  private

  public

  end;

var
  EnviarCorreo: TEnviarCorreoPanel;

implementation

{$R *.lfm}

{ TEnviarCorreoPanel }

procedure TEnviarCorreoPanel.btnEnviarCorreoClick(Sender: TObject);
begin

end;

procedure TEnviarCorreoPanel.txtAsuntoChange(Sender: TObject);
begin

end;

procedure TEnviarCorreoPanel.txtDestinatarioChange(Sender: TObject);
begin

end;

end.


unit CreatePanel;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TCreatePanel }

  TCreatePanel = class(TForm)
    btnCuentaCreada: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
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

// Aquí puedes usar LoginPanel sin problema
uses LoginPanel;

{ TCreatePanel }

procedure TCreatePanel.btnCuentaCreadaClick(Sender: TObject);
begin
  ShowMessage('Cuenta creada exitosamente.');
  Login.Show;  // Mostramos el login
  Self.Close;  // Cerramos el formulario actual
end;

end.


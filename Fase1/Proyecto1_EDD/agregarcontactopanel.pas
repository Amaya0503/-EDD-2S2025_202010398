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
    procedure txtContactoaAgregarChange(Sender: TObject);
  private

  public

  end;

var
  AgregarContacto: TAgregarContacto;

implementation

{$R *.lfm}

{ TAgregarContacto }

procedure TAgregarContacto.txtContactoaAgregarChange(Sender: TObject);
begin

end;

end.


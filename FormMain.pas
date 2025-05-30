unit FormMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    btnPasteCurrKP: TButton;
    btnCalculate: TButton;
    cboDirection: TComboBox;
    edtCurrKP: TEdit;
    edtFJSep: TEdit;
    edtNextKP: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure btnCalculateClick(Sender: TObject);
    procedure btnPasteCurrKPClick(Sender: TObject);
  private

  public

  end;

var
  frmMain: TfrmMain;

implementation

Uses Clipbrd;

{$R *.lfm}

{ TfrmMain }

procedure TfrmMain.btnCalculateClick(Sender: TObject);
var
  iDirection: integer;
  dSep, dCurr, dNext: extended;
begin
  if cboDirection.ItemIndex = 0 then
    iDirection := 1
  else
    iDirection := -1;

  dSep := StrToFloatDef(edtFJSep.Text, 12.1);
  dCurr := StrToFloatDef(edtCurrKP.Text, 0);
  dNext := dCurr + (iDirection * dSep)/1000;

  edtNextKP.Text := Format('%0.3f', [dNext]);
  Clipboard.Clear;
  Clipboard.AsText := edtNextKP.Text;
end;

procedure TfrmMain.btnPasteCurrKPClick(Sender: TObject);
begin
  edtCurrKP.Text := Clipboard.AsText;
  btnCalculate.Click;
end;

end.

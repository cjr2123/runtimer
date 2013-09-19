unit MainCode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    lbUser: TLabel;
    lbTimeL: TLabel;
    lbTimeRem: TLabel;
    tMT: TTimer;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure tMTTimer(Sender: TObject);

  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  i,TimeR,TimeL:integer;

implementation

{$R *.dfm}

function GetUserFromWindows: string;
var
  UserName : string;
  UserNameLen : Dword;
begin
  UserNameLen := 255;
  SetLength(userName, UserNameLen);
  if GetUserName(PChar(UserName), UserNameLen) then
    Result := Copy(UserName,1,UserNameLen - 1)
  else
    Result := 'Unknown';
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  tMT.Enabled:=true;
  lbUser.Caption:=GetUserFromWindows;
  TimeL:=0;
  TimeR:=3600;
  lbTimeL.Caption:=inttostr(TimeL);
  lbTimeRem.Caption:=inttostr(TimeR);
//  lbTimeRem.caption:=timetostr(TimeR);
  i:=0;
  form1.Width:=lbuser.Width+35;
  form1.Left:=screen.Height-form1.Height;
  form1.Top:=screen.Width-form1.Width;
end;

procedure TForm1.tMTTimer(Sender: TObject);

begin
  TimeL:=TimeL+1;
  TimeR:=TimeR-1;
//  i:=i+1;
  lbTimeL.Caption:=inttostr(TimeL);
  lbTimeRem.Caption:=inttostr(TimeR);
  label1.Caption:=inttostr(i);
end;

end.

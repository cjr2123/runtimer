unit MainCode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Registry;

type
  TForm1 = class(TForm)
    lbUser: TLabel;
    lbTimeL: TLabel;
    lbTimeRem: TLabel;
    tMT: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure tMTTimer(Sender: TObject);

  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  TimeR,TimeL: integer;

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
var
  Registry: TRegistry;
begin
  Registry := TRegistry.Create;
  Registry.RootKey := hkey_current_user;
  Registry.OpenKey('software\cjr2123\PCT4K',true);
  tMT.Enabled:=true;
  lbUser.Caption:=GetUserFromWindows;
  TimeL:=0;
  Registry.KeyExists('DayFull');
  if Registry.ReadBool('DayFull')=true then
    if Registry.ReadString('LastDay')=dateToStr(Date) then
//  ExitWindowsEx(EWX_LOGOFF,EWX_FORCE);
      ShowMessage('Сегодня уже все');
  if Registry.KeyExists('TimeRem')=true then
  Registry.WriteString('TimeRem','3600');
  lbTimeRem.Caption:=Registry.ReadString('TimeRem');
  lbTimeL.Caption:=IntToStr(TimeL);
  TimeR:=StrToInt(Registry.ReadString('TimeRem'));
  form1.Width:=lbuser.Width+35;
  form1.Left:=screen.width-form1.width;
  form1.Top:=20;
  form1.Height:=lbTimeRem.Top+lbTimerem.Height+15;
  Registry.CloseKey;
  Registry.Free;
end;

procedure TForm1.tMTTimer(Sender: TObject);
var
  Registry: TRegistry;
begin
  Registry := TRegistry.Create;
  Registry.RootKey := hkey_current_user;
  Registry.OpenKey('software\cjr2123\PCT4K',true);
  if TimeR=1 then begin
    tMT.Enabled:=false;
    Registry.KeyExists('DayFull');
    Registry.WriteBool('DayFull',True);
    Registry.WriteString('LastDay',DatetoStr(Date));
//    ExitWindowsEx(EWX_LOGOFF,EWX_FORCE);
    ShowMessage('Время вышло');
  end;
  TimeL:=TimeL+1;
  TimeR:=TimeR-1;
  lbTimeL.Caption:=inttostr(TimeL);
  lbTimeRem.Caption:=inttostr(TimeR);
end;

end.

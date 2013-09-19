object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 105
  ClientWidth = 203
  Color = clBtnFace
  Enabled = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbUser: TLabel
    Left = 8
    Top = 8
    Width = 64
    Height = 31
    Caption = 'user'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbTimeL: TLabel
    Left = 8
    Top = 40
    Width = 128
    Height = 31
    Caption = 'timelaps'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbTimeRem: TLabel
    Left = 8
    Top = 72
    Width = 112
    Height = 31
    Caption = 'timerem'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 142
    Top = 58
    Width = 31
    Height = 13
    Caption = 'Label1'
    Visible = False
  end
  object BitBtn1: TBitBtn
    Left = 126
    Top = 72
    Width = 75
    Height = 25
    DoubleBuffered = True
    Kind = bkClose
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 0
  end
  object tMT: TTimer
    Enabled = False
    OnTimer = tMTTimer
    Left = 104
    Top = 8
  end
end

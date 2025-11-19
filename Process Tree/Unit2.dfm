object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Module Address & Drivers'
  ClientHeight = 545
  ClientWidth = 710
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object Splitter1: TSplitter
    Left = 339
    Top = 0
    Width = 5
    Height = 545
    ExplicitHeight = 547
  end
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 339
    Height = 545
    TabStop = False
    Align = alLeft
    Ctl3D = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Courier New'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 0
    ExplicitHeight = 547
  end
  object Memo2: TMemo
    Left = 344
    Top = 0
    Width = 366
    Height = 545
    TabStop = False
    Align = alClient
    Ctl3D = False
    ParentCtl3D = False
    ScrollBars = ssBoth
    TabOrder = 1
    ExplicitLeft = 381
    ExplicitTop = 52
    ExplicitWidth = 300
    ExplicitHeight = 334
  end
end

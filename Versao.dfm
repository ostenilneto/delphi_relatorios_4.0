object FrmVersao: TFrmVersao
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Notas de Vers'#227'o'
  ClientHeight = 461
  ClientWidth = 784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LabelVersion: TLabel
    Left = 0
    Top = 0
    Width = 784
    Height = 33
    Align = alTop
    Alignment = taCenter
    Caption = 'LabelVersion'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
    ExplicitWidth = 150
  end
  object Label1: TLabel
    Left = 237
    Top = 59
    Width = 115
    Height = 16
    Caption = 'Selecione a Vers'#227'o:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object BtnSair: TBitBtn
    Left = 344
    Top = 419
    Width = 97
    Height = 34
    Caption = 'Fechar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Glyph.Data = {
      E6040000424DE604000000000000360000002800000014000000140000000100
      180000000000B0040000C40E0000C40E00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF8080808A8A8AFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF7F7F7F000000000000818181FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F0000000000
      00000000000000878787FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFAAAAAA000000000000000000000000000000
      0000006D6D6DDFDFDFD3D3D3D3D3D3D3D3D3D4D4D4FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000595959FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF000000000000000000000000000000000000000000909090FFFF
      FFFFFFFFFFFFFFFFFFFF848484202020FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF000000000000000000000000000000000000000000848484FFFFFFFFFFFF
      FFFFFFFFFFFF777777252525FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      00000000000000000000000000000000000000838383FFFFFFFFFFFFFFFFFFFF
      FFFF777777252525FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
      000000000000000000000000000000838383FFFFFFFFFFFFFFFFFFFFFFFF7777
      77242424FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
      0000000000000000000000838383FFFFFFFFFFFFFFFFFFFFFFFF6C6C6C151515
      FFFFFF000000FBFBFBFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      00000000000000838383FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
      0000000000B4B4B4FFFFFFFFFFFF000000000000000000000000000000000000
      000000838383FFFFFFFFFFFF2323233333333434343434343B3B3B0000000000
      00000000585858FFFFFF00000000000000000000000000000000000000000083
      8383FFFFFFFFFFFF000000000000000000000000000000000000000000000000
      0000003E3E3E000000000000000000000000000000000000000000838383FFFF
      FFFFFFFF202020313131313131323232383838000000000000000000555555FF
      FFFF000000000000000000000000000000000000000000838383FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000B1B1B1FFFFFFFFFFFF0000
      000000000000000000000000000000000000007A7A7AFFFFFFFFFFFFFFFFFFFF
      FFFF6B6B6B131313FFFFFF000000F9F9F9FFFFFFFFFFFFFFFFFF000000000000
      000000000000000000000000282828E0E0E0FFFFFFFFFFFFFFFFFFFFFFFF7777
      77242424FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
      0000323232E0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7B7B7B252525
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000090909A8A8A8F0F0
      F0D8D8D8D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0DCDCDC5F5F5F1F1F1FFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF6C6C6C000000000000000000000000000000
      000000000000000000000000000000000000000000A2A2A2FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF}
    ParentFont = False
    Spacing = 6
    TabOrder = 0
    OnClick = BtnSairClick
  end
  object MemoChanges: TMemo
    Left = 8
    Top = 92
    Width = 992
    Height = 300
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'MemoChanges')
    ParentFont = False
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 4
    Top = 39
    Width = 1000
    Height = 2
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 2
  end
  object Panel2: TPanel
    Left = 4
    Top = 404
    Width = 1000
    Height = 2
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 3
  end
  object ComboBoxVersions: TComboBox
    Left = 358
    Top = 56
    Width = 189
    Height = 24
    Style = csDropDownList
    DragMode = dmAutomatic
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnChange = ComboBoxVersionsChange
  end
end

object FrmEstatisticas: TFrmEstatisticas
  Left = 0
  Top = 0
  Caption = 'Estat'#237'sticas - Consultoria'
  ClientHeight = 561
  ClientWidth = 1184
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1184
    Height = 57
    Align = alTop
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 0
    DesignSize = (
      1184
      57)
    object Label1: TLabel
      Left = 231
      Top = 19
      Width = 58
      Height = 16
      Caption = 'Data final:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 27
      Top = 19
      Width = 68
      Height = 16
      Caption = 'Data inicial:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 432
      Top = 19
      Width = 85
      Height = 16
      Anchors = [akLeft, akTop, akBottom]
      Caption = 'Departamento:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object BtnPesquisar: TBitBtn
      Left = 813
      Top = 11
      Width = 97
      Height = 34
      Caption = 'Pesquisar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      Glyph.Data = {
        E6040000424DE604000000000000360000002800000014000000140000000100
        180000000000B0040000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFE7E7E73D3D3D000000C5C5C5FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFF6F6F61A1A1A3C3C3C454545131313FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEDED3F
        3F3F1C1C1CAFAFAF151515737373FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFB484848000000C4C4
        C4000000303030F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF4
        F4F4F9F9F9FFFFFFFFFFFFFFFFFFEEEEEE323232000000C2C2C2000000484848
        FBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF6565654E4E4E3232324242
        42A2A2A2FFFFFFFFFFFF3838380A0A0AA4A4A40C0C0C454545EDEDEDFFFFFFFF
        FFFFFFFFFFFFFFFFEDEDED7070700000002525256363636D6D6D5C5C5CA4A4A4
        FEFEFE626262080808ADADAD2D2D2D272727FAFAFAFFFFFFFFFFFFFFFFFFFFFF
        FFF9F9F94B4B4B000000DBDBDBF2F2F2FFFFFFFFFFFFFEFEFEFFFFFFFFFFFF00
        0000020202232323262626E3E3E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF575757
        000000FBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
        001E1E1EEAEAEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8E8E8040404A0A0A0FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF0B0B0B
        9D9D9DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB3B3B3101010DEDEDEFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE5555554A4A4AFB
        FBFBFFFFFFFFFFFFFFFFFFFFFFFF636363444444FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8787871C1C1CE8E8E8FFFF
        FFFFFFFFFFFFFFFFFFFF3D3D3D767676D4D4D4000000DFDFDFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFACACAC131313D9D9D9FFFFFFFFFFFF
        FFFFFFFFFFFF5A5A5A505050EEEEEE020202848484FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF8989891E1E1EE7E7E7FFFFFFFFFFFFFFFFFFFF
        FFFFA5A5A5202020FFFFFF424242171717F2F2F2FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF6666663E3E3EF8F8F8FFFFFFFFFFFFFFFFFFFFFFFFD5D5
        D5000000ACACACFFFFFF000000232323CBCBCBFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFF4F4F4000000767676FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF858585
        070707DEDEDEFFFFFF232323000000000000DBDBDBFFFFFFFFFFFFFFFFFF1717
        17353535F1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E5E53E3E3E0D
        0D0DC4C4C4FFFFFFCFCFCF898989FFFFFFFAFAFAC9C9C94B4B4B121212CCCCCC
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDF7575750000
        003B3B3B878787A5A5A58A8A8A494949000000292929D7D7D7FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC9C9C9787878
        1C1C1C0000001010105B5B5BBDBDBDF6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF}
      ParentFont = False
      Spacing = 6
      TabOrder = 0
      OnClick = BtnPesquisarClick
    end
    object BtnExportar: TBitBtn
      Left = 924
      Top = 11
      Width = 97
      Height = 34
      Caption = 'Exportar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      Glyph.Data = {
        5E050000424D5E05000000000000360000002800000014000000160000000100
        18000000000028050000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFAFAFAF6C6C6CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        B0B0B0000000000000676767FFFFFFFFFFFF4545454343434141414141414141
        41414141414141414141414141414141333333CBCBCBFFFFFFA8A8A800000000
        00000000000000005F5F5FFFFFFF000000000000000000000000000000000000
        0000000000000000000000009C9C9CFFFFFF9D9D9D0000000B0B0B0202020000
        000A0A0A0000007B7B7B0000009F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4A4A4A3C3C3CFFFFFF
        FFFFFFFFFFFF000000858585FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4141412E2E2EFFFFFFFFFFFFFF
        FFFF000000868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4141412E2E2EFFFFFFFFFFFFFFFFFF0000
        00868686FFFFFFFFFFFFD7D7D77D7D7DE0E0E0FFFFFFF5F5F59A9A9AA4A4A4FF
        FFFFFFFFFFFFFFFFFFFFFF4040402D2D2DFFFFFFFFFFFFFFFFFF000000868686
        FFFFFFFFFFFFF1F1F1090909232323FFFFFF808080000000DCDCDCFFFFFFFFFF
        FFFFFFFFFFFFFF4040402E2E2EFFFFFFFFFFFFFFFFFF000000868686FFFFFFFF
        FFFFFFFFFFCFCFCF000000D9D9D90000005A5A5AFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFD7D7D7D0D0D0FFFFFFFFFFFFFFFFFF000000868686FFFFFFFFFFFFFFFF
        FFFFFFFF616161000000202020F5F5F5FFFFFFFFFFFFFFFFFFF2F2F2A5A5A5EF
        EFEFFFFFFFFFFFFFFFFFFFFFFFFF000000868686FFFFFFFFFFFFFFFFFFFFFFFF
        7A7A7A0000002B2B2BFDFDFDFFFFFFFFFFFFFFFFFFD4D4D4000000ADADADFFFF
        FFFFFFFFFFFFFFFFFFFF000000868686FFFFFFFFFFFFFFFFFFF5F5F5000000B5
        B5B5000000757575FFFFFFFFFFFFFFFFFFDCDCDC000000B4B4B4FFFFFFFFFFFF
        FFFFFFFFFFFF000000868686FFFFFFFFFFFFFFFFFF383838000000F1F1F18B8B
        8B000000F7F7F7FFFFFFFFFFFFDCDCDC000000B4B4B4FFFFFFFFFFFFFFFFFFFF
        FFFF000000868686FFFFFFFFFFFFDFDFDF7D7D7DAEAEAEFFFFFFF6F6F68B8B8B
        A5A5A5FFFFFFFFFFFFDDDDDD000000B4B4B4FFFFFFFFFFFFFFFFFFFFFFFF0000
        00868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFF4F4F4000000B4B4B4FFFFFFFFFFFFFFFFFFFFFFFF000000868686
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2020200000000000000000
        00000000000000AEAEAEFFFFFFFFFFFFFFFFFFFFFFFF000000868686FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF323232292929D6D6D6585858000000
        1C1C1CF8F8F8FFFFFFFFFFFFFFFFFFFFFFFF000000868686FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF2F2F2F4E4E4ED4D4D40000001E1E1EFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000929292FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF3C3C3C0A0A0A0000001E1E1EFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF0000004040408B8B8B7F7F7F7F7F7F7F7F7F7F7F7F80
        80808484841C1C1C000000212121FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF0606060000000000000000000000000000000000000000000000
        000000004E4E4EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF}
      ParentFont = False
      Spacing = 10
      TabOrder = 1
      OnClick = BtnExportarClick
    end
    object BtnSair: TBitBtn
      Left = 1036
      Top = 11
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
      TabOrder = 2
      OnClick = BtnSairClick
    end
    object DateTimePicker1: TDateTimePicker
      Left = 101
      Top = 17
      Width = 105
      Height = 23
      Date = 42152.000000000000000000
      Time = 0.620817881943367000
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object DateTimePicker2: TDateTimePicker
      Left = 295
      Top = 17
      Width = 105
      Height = 23
      Constraints.MinWidth = 24
      Date = 42152.000000000000000000
      Time = 0.620817881943367000
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object BtnLimpar: TBitBtn
      Left = 700
      Top = 11
      Width = 97
      Height = 34
      Caption = 'Limpar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      Glyph.Data = {
        E6040000424DE604000000000000360000002800000014000000140000000100
        180000000000B0040000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFDADADAFEFEFECDCDCD0000000000000000000000
        000000000000000000000000000000001A1A1AECECECFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF8787870000003D3D3DFFFFFFE4E4E4767676747474777777767676
        767676767676777777707070828282F5F5F5FFFFFFFFFFFFFFFFFFFFFFFF7171
        71000000000000000000555555ECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF909090000000000000
        000000000000000000969696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF71717100000000000000000000000000
        0000AEAEAEFFFFFFDEDEDEF1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF858585000000000000000000000000030303868686FFFF
        FFDBDBDB1E1E1E363636FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFB0B0B0000000000000000000000000030303939393FFFFFFF2F2F22C2C2C
        0000000000005B5B5BF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB4B4
        B4000000000000000000000000878787FFFFFFFFFFFF00000000000000000000
        00000000005B5B5BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C9C9C
        000000000000AFAFAFFFFFFFF4F4F40000000000000000000000000000000000
        00000000414141F1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7A7A7A82
        8282FFFFFFDCDCDC2C2C2C000000000000000000000000000000000000000000
        000000404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8FFFFFFC7C7
        C72E2E2E00000000000000000000000000000000000000000000000000000000
        00005B5B5BF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA6A6A6000000
        0000000000000000000000000000000000000000000000000000000000000000
        005A5A5AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C9C9C00000000
        0000000000000000000000000000000000000000000000000000000000000000
        404040F5F5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8484840000000000
        00000000000000000000000000000000000000000000000000000000000000A6
        A6A6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C9C9C000000000000
        0000000000000000000000000000000000000000000000000D0D0DD3D3D3FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF84848400000000000000
        0000000000000000000000000000000000030303B2B2B2FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C9C9C0000000000000000
        00000000000000000000131313C9C9C9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF848484000000000000000000
        000000030303C9C9C9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C9C9C0000000000000F0F0FB2
        B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9999990F0F0FC8C8C8FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF}
      ParentFont = False
      Spacing = 6
      TabOrder = 5
      OnClick = BtnLimparClick
    end
    object DBLookupComboBox1: TDBLookupComboBox
      AlignWithMargins = True
      Left = 523
      Top = 17
      Width = 141
      Height = 23
      Anchors = [akLeft, akTop, akBottom]
      DropDownRows = 20
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      KeyField = 'DEPARTAMENTO'
      ListField = 'NOME'
      ListFieldIndex = -1
      ListSource = DataModule1.DtsDepVeic
      NullValueKey = 16449
      ParentFont = False
      TabOrder = 6
    end
  end
  object Dados: TPageControl
    Left = 0
    Top = 57
    Width = 1184
    Height = 504
    ActivePage = Atendimentos
    Align = alClient
    TabOrder = 1
    object Atendimentos: TTabSheet
      Caption = 'Atendimentos'
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 1176
        Height = 23
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Panel2'
        ShowCaption = False
        TabOrder = 0
        object Label7: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 1170
          Height = 13
          Align = alTop
          Caption = 'Quantidade de contatos por dia:'
          ExplicitWidth = 156
        end
      end
      object DBGrid3: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 26
        Width = 1170
        Height = 447
        Align = alClient
        DataSource = DataModule1.DtsEstAtendimento
        DrawingStyle = gdsGradient
        FixedColor = clSkyBlue
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Arial'
        TitleFont.Style = []
      end
    end
    object Faturamento: TTabSheet
      Caption = 'Vendas Perdidas / Faturamento'
      ImageIndex = 1
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 1176
        Height = 235
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Panel3'
        ShowCaption = False
        TabOrder = 0
        object Label11: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 1170
          Height = 13
          Align = alTop
          Caption = 'Vendas Perdidas:'
          ExplicitWidth = 83
        end
        object DBGrid6: TDBGrid
          AlignWithMargins = True
          Left = 3
          Top = 24
          Width = 1170
          Height = 208
          Align = alBottom
          DataSource = DataModule1.DtsEstVendPerdida
          DrawingStyle = gdsGradient
          FixedColor = clSkyBlue
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Arial'
          TitleFont.Style = []
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 241
        Width = 1176
        Height = 235
        Align = alBottom
        BevelOuter = bvNone
        Caption = 'Panel3'
        ShowCaption = False
        TabOrder = 1
        object Label4: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 1170
          Height = 13
          Align = alTop
          Caption = 'Faturamento:'
          ExplicitWidth = 66
        end
        object DBGrid1: TDBGrid
          AlignWithMargins = True
          Left = 3
          Top = 24
          Width = 1170
          Height = 208
          Align = alBottom
          DataSource = DataModule1.DtsEstFaturamento
          DrawingStyle = gdsGradient
          FixedColor = clSkyBlue
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Arial'
          TitleFont.Style = []
        end
      end
    end
    object Estatisticas: TTabSheet
      Caption = 'Estat'#237'sticas Loja'
      ImageIndex = 2
      object Panel5: TPanel
        Left = 0
        Top = 120
        Width = 1176
        Height = 356
        Align = alBottom
        BevelOuter = bvNone
        Caption = 'Panel3'
        ShowCaption = False
        TabOrder = 0
        object DBGrid2: TDBGrid
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 1170
          Height = 350
          Align = alClient
          DataSource = DataModule1.DtsEstEstatistica
          DrawingStyle = gdsGradient
          FixedColor = clSkyBlue
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Arial'
          TitleFont.Style = []
        end
      end
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 1176
        Height = 121
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Panel3'
        ShowCaption = False
        TabOrder = 1
        object Label8: TLabel
          Left = 64
          Top = 27
          Width = 57
          Height = 13
          Caption = 'Fluxo Total:'
        end
        object Label9: TLabel
          Left = 28
          Top = 54
          Width = 93
          Height = 13
          Caption = 'Vendas Realizadas:'
        end
        object Label10: TLabel
          Left = 38
          Top = 82
          Width = 83
          Height = 13
          Caption = 'Vendas Perdidas:'
        end
        object Label5: TLabel
          Left = 315
          Top = 27
          Width = 34
          Height = 13
          Caption = 'Ativos:'
        end
        object Label6: TLabel
          Left = 292
          Top = 54
          Width = 57
          Height = 13
          Caption = 'Receptivos:'
        end
        object DBEdit1: TDBEdit
          Left = 127
          Top = 21
          Width = 52
          Height = 21
          BiDiMode = bdRightToLeft
          DataField = 'TOTAL'
          DataSource = DataModule1.DtsEstTotal
          Enabled = False
          ParentBiDiMode = False
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 127
          Top = 50
          Width = 52
          Height = 21
          BiDiMode = bdRightToLeft
          DataField = 'Total'
          DataSource = DataModule1.DtsEstVendRealiz
          Enabled = False
          ParentBiDiMode = False
          TabOrder = 1
        end
        object DBEdit3: TDBEdit
          Left = 185
          Top = 50
          Width = 52
          Height = 21
          BiDiMode = bdLeftToRight
          Enabled = False
          ParentBiDiMode = False
          TabOrder = 2
        end
        object DBEdit5: TDBEdit
          Left = 127
          Top = 79
          Width = 52
          Height = 21
          BiDiMode = bdRightToLeft
          DataField = 'TOTAL'
          DataSource = DataModule1.DtsEstVendPerdid
          Enabled = False
          ParentBiDiMode = False
          TabOrder = 3
        end
        object DBEdit6: TDBEdit
          Left = 185
          Top = 79
          Width = 52
          Height = 21
          BiDiMode = bdLeftToRight
          Enabled = False
          ParentBiDiMode = False
          TabOrder = 4
        end
        object DBEdit4: TDBEdit
          Left = 355
          Top = 21
          Width = 52
          Height = 21
          BiDiMode = bdRightToLeft
          DataField = 'TOTAL'
          DataSource = DataModule1.DtsEstAtivos
          Enabled = False
          ParentBiDiMode = False
          TabOrder = 5
        end
        object DBEdit7: TDBEdit
          Left = 355
          Top = 50
          Width = 52
          Height = 21
          BiDiMode = bdRightToLeft
          DataField = 'TOTAL'
          DataSource = DataModule1.DtsEstReceptivos
          Enabled = False
          ParentBiDiMode = False
          TabOrder = 6
        end
      end
    end
  end
end

object FrmPisCofinsCons: TFrmPisCofinsCons
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Pis Cofins por CST consolidado'
  ClientHeight = 184
  ClientWidth = 584
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
  object Label1: TLabel
    Left = 318
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
    Left = 97
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
    Left = 168
    Top = 68
    Width = 96
    Height = 13
    Caption = 'Op'#231#227'o de Relat'#243'rio:'
  end
  object BtnPesquisar: TBitBtn
    Left = 164
    Top = 131
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
  object BtnSair: TBitBtn
    Left = 323
    Top = 131
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
    TabOrder = 1
    OnClick = BtnSairClick
  end
  object DateTimePicker2: TDateTimePicker
    Left = 382
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
    TabOrder = 2
  end
  object DateTimePicker1: TDateTimePicker
    Left = 171
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
  object ComboBox1: TComboBox
    Left = 270
    Top = 65
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 4
    Text = '1.1 - Uberaba'
    Items.Strings = (
      '1.1 - Uberaba'
      '1.2 - Arax'#225
      'Consolidado')
  end
  object Panel1: TPanel
    Left = 17
    Top = 111
    Width = 550
    Height = 2
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 5
  end
  object frxReport1: TfrxReport
    Version = '6.9.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45581.413222696800000000
    ReportOptions.LastChange = 45581.534786388900000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 520
    Top = 40
    Datasets = <>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Color = clWhite
      Frame.Typ = [ftLeft, ftRight]
      MirrorMode = []
      object TableObject1: TfrxTableObject
        AllowVectorExport = True
        ShiftMode = smDontShift
        object TableColumn1: TfrxTableColumn
          AutoSize = True
          Width = 1048.110700000000000000
          MaxWidth = 75.590600000000000000
        end
        object TableRow1: TfrxTableRow
          Height = 85.039370078740160000
          object TableCell1: TfrxTableCell
            AllowVectorExport = True
            Restrictions = [rfDontDelete]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
            Fill.BackColor = clGray
            Fill.ForeColor = clWhite
            Fill.Style = bsClear
            ParentFont = False
            object Memo1: TfrxMemoView
              Align = baHidden
              AllowVectorExport = True
              Left = 0.842610000000000000
              Top = 1.000000000000000000
              Width = 298.582870000000000000
              Height = 83.149660000000000000
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Frame.Typ = []
              Memo.UTF8W = (
                'DISTRIVE Uberaba e Arax'#225
                'CNPJ: 25.421.280-0001.32 e 25.421.280-0006.47'
                'Registros Fiscais - Opera'#231#245'es por CST - Sint'#233'tico')
              ParentFont = False
              VAlign = vaCenter
            end
            object Date: TfrxMemoView
              IndexTag = 1
              AllowVectorExport = True
              Left = 967.559680000000000000
              Top = 40.118120000000000000
              Width = 79.370130000000000000
              Height = 15.118120000000000000
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Frame.Typ = []
              Memo.UTF8W = (
                '[Date]')
              ParentFont = False
            end
            object Page: TfrxMemoView
              IndexTag = 1
              AllowVectorExport = True
              Left = 967.559680000000000000
              Top = 23.000000000000000000
              Width = 79.370130000000000000
              Height = 15.118120000000000000
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Frame.Typ = []
              Memo.UTF8W = (
                '[Page]')
              ParentFont = False
            end
            object Memo2: TfrxMemoView
              AllowVectorExport = True
              Left = 899.528140000000000000
              Top = -7.000000000000000000
              Width = 68.031540000000000000
              Height = 90.708720000000000000
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Frame.Typ = []
              HAlign = haRight
              Memo.UTF8W = (
                'P'#225'gina:'
                'Data:')
              ParentFont = False
              VAlign = vaCenter
            end
          end
        end
        object TableRow4: TfrxTableRow
          Height = 37.795275590551180000
          object TableCell2: TfrxTableCell
            AllowVectorExport = True
            Restrictions = [rfDontDelete]
            Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
            object Memo3: TfrxMemoView
              AllowVectorExport = True
              Left = 987.118740000000000000
              Top = 0.020293610000000000
              Width = 64.251968500000000000
              Height = 37.795275590000000000
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Frame.Typ = []
              HAlign = haCenter
              Memo.UTF8W = (
                'Valor'
                'COFINS')
              ParentFont = False
              VAlign = vaCenter
            end
            object Memo5: TfrxMemoView
              AllowVectorExport = True
              Left = 854.953310000000000000
              Top = 0.020293610000000000
              Width = 64.251968500000000000
              Height = 37.795275590000000000
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Frame.Typ = []
              HAlign = haCenter
              Memo.UTF8W = (
                'Base C'#225'lculo'
                'do COFINS')
              ParentFont = False
              VAlign = vaCenter
            end
            object Memo7: TfrxMemoView
              AllowVectorExport = True
              Left = 723.551640000000000000
              Top = 0.020293610000000000
              Width = 64.251968500000000000
              Height = 37.795275590000000000
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Frame.Typ = []
              HAlign = haCenter
              Memo.UTF8W = (
                'Desc.')
              ParentFont = False
              VAlign = vaCenter
            end
            object Memo4: TfrxMemoView
              AllowVectorExport = True
              Left = 921.543463310000000000
              Top = 0.240763610000000000
              Width = 64.251968500000000000
              Height = 37.795275590000000000
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Frame.Typ = []
              HAlign = haCenter
              Memo.UTF8W = (
                'Valor'
                'PIS')
              ParentFont = False
              VAlign = vaCenter
            end
            object Memo8: TfrxMemoView
              AllowVectorExport = True
              Left = 657.488560000000000000
              Top = 0.012770040000000000
              Width = 64.251968500000000000
              Height = 37.795275590000000000
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Frame.Typ = []
              HAlign = haCenter
              Memo.UTF8W = (
                'Valor Total'
                'do Item')
              ParentFont = False
              VAlign = vaCenter
            end
            object Memo6: TfrxMemoView
              AllowVectorExport = True
              Left = 789.362710000000000000
              Top = 0.240763610000000000
              Width = 64.251968500000000000
              Height = 37.795275590000000000
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Frame.Typ = []
              HAlign = haCenter
              Memo.UTF8W = (
                'Base C'#225'lculo'
                'do PIS')
              ParentFont = False
              VAlign = vaCenter
            end
          end
        end
        object TableRow5: TfrxTableRow
          Height = 22.677165354330700000
          object TableCell3: TfrxTableCell
            AllowVectorExport = True
            Restrictions = [rfDontDelete]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
            Fill.BackColor = 15790320
            ParentFont = False
            object Memo9: TfrxMemoView
              AllowVectorExport = True
              Left = 321.260050000000000000
              Top = 0.000085429999999997
              Width = 283.464566930000000000
              Height = 22.677180000000000000
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Frame.Typ = []
              HAlign = haRight
              Memo.UTF8W = (
                'Total Receita/Sa'#237'das do Bloco (A100) e CST (01):')
              ParentFont = False
              VAlign = vaCenter
            end
          end
        end
        object TableRow14: TfrxTableRow
          Height = 22.677165354330700000
          object TableCell15: TfrxTableCell
            AllowVectorExport = True
            Restrictions = [rfDontDelete]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
            Fill.BackColor = 15790320
            ParentFont = False
            object Memo10: TfrxMemoView
              AllowVectorExport = True
              Left = 321.260050000000000000
              Top = 0.000100080000000002
              Width = 283.464566930000000000
              Height = 22.677180000000000000
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Frame.Typ = []
              HAlign = haRight
              Memo.UTF8W = (
                'Total Receita/Sa'#237'das do Bloco (C100) e CST (01):')
              ParentFont = False
              VAlign = vaCenter
            end
          end
        end
        object TableRow13: TfrxTableRow
          Height = 22.677165354330700000
          object TableCell14: TfrxTableCell
            AllowVectorExport = True
            Restrictions = [rfDontDelete]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
            Fill.BackColor = 15790320
            ParentFont = False
            object Memo11: TfrxMemoView
              AllowVectorExport = True
              Left = 321.260050000000000000
              Top = 0.000114719999999999
              Width = 283.464566930000000000
              Height = 22.677180000000000000
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Frame.Typ = []
              HAlign = haRight
              Memo.UTF8W = (
                'Total Receita/Sa'#237'das do CST (01):')
              ParentFont = False
              VAlign = vaCenter
            end
          end
        end
        object TableRow12: TfrxTableRow
          Height = 22.677165354330700000
          object TableCell13: TfrxTableCell
            AllowVectorExport = True
            Restrictions = [rfDontDelete]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
            Fill.BackColor = 15790320
            ParentFont = False
            object Memo12: TfrxMemoView
              AllowVectorExport = True
              Left = 321.260050000000000000
              Top = 0.000129370000000004
              Width = 283.464566930000000000
              Height = 22.677180000000000000
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Frame.Typ = []
              HAlign = haRight
              Memo.UTF8W = (
                'Total Receita/Sa'#237'das do Bloco (C100) e CST (04):')
              ParentFont = False
              VAlign = vaCenter
            end
          end
        end
        object TableRow11: TfrxTableRow
          Height = 22.677165354330700000
          object TableCell12: TfrxTableCell
            AllowVectorExport = True
            Restrictions = [rfDontDelete]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
            Fill.BackColor = 15790320
            ParentFont = False
            object Memo13: TfrxMemoView
              AllowVectorExport = True
              Left = 321.260050000000000000
              Top = 0.000144019999999995
              Width = 283.464566930000000000
              Height = 22.677180000000000000
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Frame.Typ = []
              HAlign = haRight
              Memo.UTF8W = (
                'Total Receita/Sa'#237'das do CST (04):')
              ParentFont = False
              VAlign = vaCenter
            end
          end
        end
        object TableRow6: TfrxTableRow
          AutoSize = True
          Height = 22.677165354330700000
          object TableCell4: TfrxTableCell
            AllowVectorExport = True
            Restrictions = [rfDontDelete]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
            Fill.BackColor = 15790320
            ParentFont = False
            object Memo14: TfrxMemoView
              AllowVectorExport = True
              Left = 321.260050000000000000
              Top = 0.000158660000000005
              Width = 283.464566930000000000
              Height = 22.677180000000000000
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Frame.Typ = []
              HAlign = haRight
              Memo.UTF8W = (
                'Total Receita/Sa'#237'das do Bloco (C100) e CST (1):')
              ParentFont = False
              VAlign = vaCenter
            end
          end
        end
        object TableRow7: TfrxTableRow
          Height = 22.677165354330700000
          object TableCell7: TfrxTableCell
            AllowVectorExport = True
            Restrictions = [rfDontDelete]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
            Fill.BackColor = 15790320
            ParentFont = False
            object Memo15: TfrxMemoView
              AllowVectorExport = True
              Left = 321.260050000000000000
              Top = 0.000173310000000010
              Width = 283.464566930000000000
              Height = 22.677180000000000000
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Frame.Typ = []
              HAlign = haRight
              Memo.UTF8W = (
                'Total Receita/Sa'#237'das do CST (1):')
              ParentFont = False
              VAlign = vaCenter
            end
          end
        end
        object TableRow10: TfrxTableRow
          AutoSize = True
          Height = 22.677165354330700000
          object TableCell10: TfrxTableCell
            AllowVectorExport = True
            Restrictions = [rfDontDelete]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
            Fill.BackColor = 15790320
            ParentFont = False
            object Memo19: TfrxMemoView
              AllowVectorExport = True
              Left = 321.260050000000000000
              Top = 0.000187949999999992
              Width = 283.464566930000000000
              Height = 22.677180000000000000
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Frame.Typ = []
              HAlign = haRight
              Memo.UTF8W = (
                'Total Receita/Sa'#237'das do Bloco (C100) e CST (4):')
              ParentFont = False
              VAlign = vaCenter
            end
          end
        end
        object TableRow9: TfrxTableRow
          Height = 22.677165354330700000
          object TableCell9: TfrxTableCell
            AllowVectorExport = True
            Restrictions = [rfDontDelete]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
            Fill.BackColor = 15790320
            ParentFont = False
            object Memo16: TfrxMemoView
              AllowVectorExport = True
              Left = 321.260050000000000000
              Top = 0.000202599999999997
              Width = 283.464566930000000000
              Height = 22.677180000000000000
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Frame.Typ = []
              HAlign = haRight
              Memo.UTF8W = (
                'Total Receita/Sa'#237'das do CST (4):')
              ParentFont = False
              VAlign = vaCenter
            end
          end
        end
        object TableRow8: TfrxTableRow
          Height = 22.677165354330700000
          object TableCell8: TfrxTableCell
            AllowVectorExport = True
            Restrictions = [rfDontDelete]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
            Fill.BackColor = 15790320
            ParentFont = False
            object Memo18: TfrxMemoView
              AllowVectorExport = True
              Left = 321.260050000000000000
              Top = 0.000217250000000002
              Width = 283.464566930000000000
              Height = 22.677180000000000000
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Frame.Typ = []
              HAlign = haRight
              Memo.UTF8W = (
                'Total Receita/Sa'#237'das do Bloco (C100) e CST (49):')
              ParentFont = False
              VAlign = vaCenter
            end
          end
        end
        object TableRow15: TfrxTableRow
          Height = 22.677165354330700000
          object TableCell16: TfrxTableCell
            AllowVectorExport = True
            Restrictions = [rfDontDelete]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
            Fill.BackColor = 15790320
            ParentFont = False
            object Memo17: TfrxMemoView
              AllowVectorExport = True
              Left = 321.260050000000000000
              Top = 0.000231890000000012
              Width = 283.464566930000000000
              Height = 22.677180000000000000
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Frame.Typ = []
              HAlign = haRight
              Memo.UTF8W = (
                'Total Receita/Sa'#237'das do CST (49):')
              ParentFont = False
              VAlign = vaCenter
            end
          end
        end
        object TableRow16: TfrxTableRow
          Height = 22.677165354330710000
          object TableCell17: TfrxTableCell
            AllowVectorExport = True
            Restrictions = [rfDontDelete]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
            Fill.BackColor = 14211288
            ParentFont = False
            object Memo20: TfrxMemoView
              AllowVectorExport = True
              Left = 321.260050000000000000
              Top = 0.000246539999999990
              Width = 283.464566930000000000
              Height = 22.677180000000000000
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Frame.Typ = []
              HAlign = haRight
              Memo.UTF8W = (
                'Total Geral das Receita/Sa'#237'das:')
              ParentFont = False
              VAlign = vaCenter
            end
          end
        end
      end
    end
  end
end

object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 545
  Width = 1380
  object Bravos: TFDConnection
    Params.Strings = (
      'Database=BRAVOS'
      'User_Name=cnp'
      'Password=ninguemsabe'
      'ODBCDriver=Oracle em OraClient11g_home2'
      'DriverID=Ora')
    Connected = True
    Left = 16
    Top = 8
  end
  object QryAmaro: TFDQuery
    Connection = Bravos
    SQL.Strings = (
      
        'SELECT DISTINCT os.empresa, os.revenda,PF.CPF,FISJUR,fat_cliente' +
        '.NOME,PF.SEXO,DTA_NASCIMENTO,LOGRADOURO_ENTREGA,COMPLEMENTO_ENTR' +
        'EGA,BAIRRO_ENTREGA,MUNICIPIO_ENTREGA,UF_ENTREGA,'
      'E_MAIL_CASA,fat_cliente.ddd_TELEFONE,'
      'fat_cliente.TELEFONE,DDD_CELULAR,CELULAR,FANTASIA,'
      
        'os.nro_os, os.situacao_os, oso.descricao,os.dta_emissao, os.dta_' +
        'encerramento,'
      'ofi_atendimento.chassi,'
      
        'ofi_ficha_seguimento.placa, os.kilometragem, ofi_ficha_seguiment' +
        'o.dta_venda, ofi_ficha_seguimento.modelo, veiculo.des_modelo, of' +
        'i_ficha_seguimento.motorizacao,'
      
        'ofi_ficha_seguimento.cambio, ofi_ficha_seguimento.ano_fabricacao' +
        ', ofi_ficha_seguimento.ano_modelo,'
      'consultor.nome AS NOME_CONSULTOR, mecanico.nome AS NOME_MECANICO'
      ''
      
        'from OFI_ORDEM_SERVICO OS, ofi_servico_os oso, OFI_PARAMETRO PAR' +
        ', CAC_CONTATO CONTATO, OFI_ATENDIMENTO ATENDE,'
      
        '     FAT_CLIENTE , FAT_PESSOA_FISICA PF, ofi_atendimento, ofi_fi' +
        'cha_seguimento, '
      
        '     fat_vendedor consultor, ofi_mecanico mecanico, vei_modelo v' +
        'eiculo'
      '    '
      'where ATENDE.EMPRESA = OS.EMPRESA'
      '  and ATENDE.REVENDA = OS.REVENDA'
      '  and PAR.EMPRESA = OS.EMPRESA'
      '  and PAR.REVENDA = OS.REVENDA'
      '  and ATENDE.CONTATO = OS.CONTATO'
      '  and CONTATO.EMPRESA = OS.EMPRESA'
      '  and CONTATO.REVENDA = OS.REVENDA'
      '  and CONTATO.CONTATO = OS.CONTATO'
      '  and fat_cliente.CLIENTE = CONTATO.CLIENTE'
      '  and ofi_ficha_seguimento.modelo = veiculo.modelo'
      '  and OS.EMPRESA = 1'
      '  and OS.REVENDA IN (1,2,3)'
      '  and OS.SITUACAO_OS = 9'
      '  and FAT_CLIENTE.CLIENTE = PF.CLIENTE'
      
        '  and dta_encerramento between To_Date(:inicio,'#39'dd/mm/yyyy'#39') and' +
        ' To_Date(:fim, '#39'dd/mm/yyyy'#39')'
      '  and os.empresa = oso.empresa'
      '  and os.revenda = oso.revenda'
      '  and os.nro_os = oso.nro_os'
      '  and os.empresa = ofi_atendimento.empresa'
      '  and os.revenda = ofi_atendimento.revenda'
      '  and os.contato = ofi_atendimento.contato'
      '  and ofi_atendimento.chassi = ofi_ficha_seguimento.chassi'
      '  and ofi_atendimento.empresa = consultor.empresa(+)'
      '  and ofi_atendimento.revenda = consultor.revenda(+)'
      '  and ofi_atendimento.vendedor = consultor.vendedor(+)'
      '  and oso.empresa = mecanico.empresa(+)'
      '  and oso.revenda = mecanico.revenda(+)'
      '  and oso.mecanico = mecanico.mecanico(+)'
      '')
    Left = 124
    Top = 8
    ParamData = <
      item
        Name = 'INICIO'
        ParamType = ptInput
      end
      item
        Name = 'FIM'
        ParamType = ptInput
      end>
  end
  object DtsAmaro: TDataSource
    DataSet = QryAmaro
    Left = 64
    Top = 8
  end
  object QryNFDifal_P: TFDQuery
    Connection = Bravos
    SQL.Strings = (
      'SELECT DISTINCT '
      '       nf.REVENDA AS "REVENDA",'
      '       nf.CONTATO,'
      '       nf.NUMERO_NOTA_FISCAL AS "NOTA FISCAL", '
      '       nf.SERIE_NOTA_FISCAL AS "S'#201'RIE",'
      '       ITM.CODFISCAL_OPERACAO AS "CFO",'
      '       CFO.DES_CODFISCAL_OPERACAO AS "DESC CFO",'
      '       nf.DEPARTAMENTO AS "DEPARTAMENTO",'
      '       nf.TIPO_TRANSACAO AS "TRANSA'#199#195'O", '
      '       cli.uf_entrega as ESTADO,'
      '       nf.CLIENTE,'
      '       cli.NOME AS NOME,'
      '      nf.DTA_ENTRADA_SAIDA AS DATA'
      
        'FROM fat_cliente cli, fat_codfiscal_operacao cfo, fat_movimento_' +
        'capa nf, fat_movimento_item itm'
      
        'WHERE nf.DTA_ENTRADA_SAIDA between To_Date(:inicio,'#39'dd/mm/yyyy'#39')' +
        ' and To_Date(:fim, '#39'dd/mm/yyyy'#39')'
      
        'AND nf.TIPO_TRANSACAO in ('#39'O21'#39', '#39'P21'#39', '#39'P24'#39', '#39'P31'#39', '#39'P34'#39', '#39'P5' +
        '1'#39')'
      'AND nf.status = '#39'F'#39
      'AND (nf.TIPO_NF_OS <> '#39'S'#39' OR nf.TIPO_NF_OS is null)'
      'AND nf.CLIENTE = cli.CLIENTE'
      'AND cli.uf_entrega <> '#39'MG'#39
      'AND nf.NUMERO_NOTA_FISCAL = ITM.numero_nota_fiscal'
      'AND nf.SERIE_NOTA_FISCAL = ITM.SERIE_NOTA_FISCAL'
      'AND nf.REVENDA = ITM.REVENDA '
      'AND ITM.CODFISCAL_OPERACAO = CFO.CODFISCAL_OPERACAO '
      'AND ITM.REVENDA = CFO.REVENDA'
      
        'ORDER BY  nf.DTA_ENTRADA_SAIDA, nf.REVENDA, nf.TIPO_TRANSACAO, n' +
        'f.CONTATO')
    Left = 105
    Top = 64
    ParamData = <
      item
        Name = 'INICIO'
        ParamType = ptInput
      end
      item
        Name = 'FIM'
        ParamType = ptInput
      end>
  end
  object DtsNFDifal_P: TDataSource
    DataSet = QryNFDifal_P
    Left = 25
    Top = 64
  end
  object QryNFDifal_S: TFDQuery
    Connection = Bravos
    SQL.Strings = (
      'SELECT DISTINCT '
      '       nf.REVENDA AS "REVENDA",'
      '       nf.CONTATO,'
      '       nf.NUMERO_NOTA_FISCAL AS "NOTA FISCAL", '
      '       nf.SERIE_NOTA_FISCAL AS "S'#201'RIE",'
      '       ITS.CODFISCAL_OPERACAO AS "CFO",'
      '       CFO.DES_CODFISCAL_OPERACAO AS "DESC CFO",'
      '       nf.DEPARTAMENTO AS "DEPARTAMENTO",'
      '       nf.TIPO_TRANSACAO AS "TRANSA'#199#195'O", '
      '        cli.uf_entrega as ESTADO,'
      '       nf.CLIENTE,'
      '       cli.NOME AS NOME,'
      '      nf.DTA_ENTRADA_SAIDA AS DATA'
      
        'FROM fat_cliente cli, fat_codfiscal_operacao cfo, fat_movimento_' +
        'capa nf, fat_movimento_servico its'
      
        'WHERE nf.DTA_ENTRADA_SAIDA between To_Date(:inicio,'#39'dd/mm/yyyy'#39')' +
        ' and To_Date(:fim, '#39'dd/mm/yyyy'#39')'
      'AND nf.TIPO_TRANSACAO in ('#39'O21'#39')'
      'AND nf.status = '#39'F'#39
      'AND nf.TIPO_NF_OS = '#39'S'#39
      'AND nf.CLIENTE = cli.CLIENTE'
      'AND cli.uf_entrega <> '#39'MG'#39
      'AND nf.NUMERO_NOTA_FISCAL = ITS.numero_nota_fiscal'
      'AND nf.SERIE_NOTA_FISCAL = ITS.SERIE_NOTA_FISCAL'
      'AND nf.REVENDA = ITS.REVENDA '
      'AND ITS.CODFISCAL_OPERACAO = CFO.CODFISCAL_OPERACAO '
      'AND ITS.REVENDA = CFO.REVENDA'
      
        'ORDER BY  nf.DTA_ENTRADA_SAIDA, nf.REVENDA, nf.TIPO_TRANSACAO, n' +
        'f.CONTATO'
      '')
    Left = 105
    Top = 112
    ParamData = <
      item
        Name = 'INICIO'
        ParamType = ptInput
      end
      item
        Name = 'FIM'
        ParamType = ptInput
      end>
  end
  object DtsNFDifal_S: TDataSource
    DataSet = QryNFDifal_S
    Left = 25
    Top = 112
  end
  object QryNFDifal_V: TFDQuery
    Connection = Bravos
    SQL.Strings = (
      'SELECT DISTINCT '
      '       nf.REVENDA AS "REVENDA",'
      '       nf.CONTATO,'
      '       nf.NUMERO_NOTA_FISCAL AS "NOTA FISCAL", '
      '       nf.SERIE_NOTA_FISCAL AS "S'#201'RIE",'
      '       ITV.CODFISCAL_OPERACAO AS "CFO",'
      '       CFO.DES_CODFISCAL_OPERACAO AS "DESC CFO",'
      '       nf.DEPARTAMENTO AS "DEPARTAMENTO",'
      '       nf.TIPO_TRANSACAO AS "TRANSA'#199#195'O", '
      '        cli.uf_entrega as ESTADO,'
      '       nf.CLIENTE,'
      '       cli.NOME AS NOME,'
      '      nf.DTA_ENTRADA_SAIDA AS DATA'
      
        'FROM fat_cliente cli, fat_codfiscal_operacao cfo, fat_movimento_' +
        'capa nf, fat_movimento_veiculo itv'
      
        'WHERE nf.DTA_ENTRADA_SAIDA between To_Date(:inicio,'#39'dd/mm/yyyy'#39')' +
        ' and To_Date(:fim, '#39'dd/mm/yyyy'#39')'
      'AND nf.TIPO_TRANSACAO in ('#39'V07'#39', '#39'V20'#39', '#39'V21'#39', '#39'U07'#39', '#39'U21'#39')'
      'AND nf.status = '#39'F'#39
      'AND (nf.TIPO_NF_OS <> '#39'S'#39' OR nf.TIPO_NF_OS is null)'
      'AND nf.CLIENTE = cli.CLIENTE'
      'AND cli.uf_entrega <> '#39'MG'#39
      'AND nf.NUMERO_NOTA_FISCAL = ITV.numero_nota_fiscal'
      'AND nf.SERIE_NOTA_FISCAL = ITV.SERIE_NOTA_FISCAL'
      'AND nf.REVENDA = ITV.REVENDA '
      'AND ITV.CODFISCAL_OPERACAO = CFO.CODFISCAL_OPERACAO '
      'AND ITV.REVENDA = CFO.REVENDA'
      
        'ORDER BY  nf.DTA_ENTRADA_SAIDA, nf.REVENDA, nf.TIPO_TRANSACAO, n' +
        'f.CONTATO'
      '')
    Left = 105
    Top = 160
    ParamData = <
      item
        Name = 'INICIO'
        ParamType = ptInput
      end
      item
        Name = 'FIM'
        ParamType = ptInput
      end>
  end
  object DtsNFDifal_V: TDataSource
    DataSet = QryNFDifal_V
    Left = 25
    Top = 160
  end
  object QryCad_Vendedor: TFDQuery
    Active = True
    Connection = Bravos
    SQL.Strings = (
      'select USUARIO, '
      'INITCAP(LOWER(SUBSTR(NOME, 1, '
      '     CASE WHEN INSTR(NOME, '#39' '#39') > 0 THEN '
      '         INSTR(NOME, '#39' '#39') - 1'
      '     ELSE LENGTH(NOME) END))) AS NOME  '
      'from GER_USUARIO '
      'where '
      'ATIVO = '#39'S'#39
      'AND GRUPO IN (107,102,112,37)'
      'AND CARGO in (:cargo, 2)'
      'ORDER BY NOME')
    Left = 1287
    Top = 8
    ParamData = <
      item
        Name = 'CARGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = 6
      end>
    object QryCad_VendedorUSUARIO: TBCDField
      FieldName = 'USUARIO'
      Origin = 'USUARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 5
      Size = 0
    end
    object QryCad_VendedorNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 40
    end
  end
  object DtsVFatur: TDataSource
    DataSet = QryVFatur
    Left = 25
    Top = 208
  end
  object QryVFatur_mes: TFDQuery
    Connection = Bravos
    SQL.Strings = (
      'Select '
      #9#9'FVE.NOME VENDEDOR,'
      
        '        sum((case when CCO.CONTATO in(select FMC.CONTATO from FA' +
        'T_MOVIMENTO_CAPA FMC, FAT_TIPO_TRANSACAO FTT '
      #9#9'where FMC.EMPRESA = CCO.EMPRESA '
      #9#9'and FMC.REVENDA = CCO.REVENDA '
      #9#9'and FMC.CONTATO = CCO.CONTATO '
      #9#9'and FMC.TIPO_TRANSACAO = FTT.TIPO_TRANSACAO '
      #9#9'and FTT.SUBTIPO_TRANSACAO = '#39'N'#39
      
        #9#9'and not FTT.SUBTIPO_TRANSACAO in ('#39'T'#39', '#39'S'#39', '#39'D'#39')) then 1 else ' +
        '0 end)) as "Venda Loja", '
      
        #9'sum((case when CCO.CONTATO not in (select FMC.CONTATO from FAT_' +
        'MOVIMENTO_CAPA FMC, FAT_TIPO_TRANSACAO FTT '
      #9#9'where FMC.EMPRESA = CCO.EMPRESA '
      #9#9'and FMC.REVENDA = CCO.REVENDA '
      #9#9'and FMC.CONTATO = CCO.CONTATO '
      
        #9#9'and FMC.TIPO_TRANSACAO = FTT.TIPO_TRANSACAO) then 1 else 0 end' +
        ')) as "Venda Direta",'
      '    count(*) as "Total Vendas"'
      '    '
      'from '
      #9'FAT_VENDEDOR FVE, CAC_CONTATO CCO '
      'left join '
      #9'CAC_PROVIDENCIA CP '
      '    on (CCO.EMPRESA = CP.EMPRESA '
      #9'and CCO.REVENDA = CP.REVENDA '
      '    and CCO.CONTATO = CP.CONTATO )    '
      'where '
      #9'CCO.REVENDA = 1'
      '    and CCO.SITUACAO = '#39'F'#39' '
      '    and CCO.RESULTADO = '#39'R'#39' '
      #9'and CCO.ORIGEM = '#39'V'#39' '
      #9'and FVE.EMPRESA = CCO.EMPRESA '
      #9'and FVE.REVENDA = CCO.REVENDA '
      '    and FVE.USUARIO = CCO.USUARIO_ENCAMINHADO '
      '    and (CCO.DTA_FECHAMENTO >= To_Date(:inicio,'#39'dd/mm/yyyy'#39') '
      #9'and CCO.DTA_FECHAMENTO < To_Date(:fim, '#39'dd/mm/yyyy'#39')+1)'
      #9'and CCO.DEPARTAMENTO IN (:departamento,:departamento2) '
      
        #9'and FVE.USUARIO in (select UU.USUARIO from GER_USUARIO UU where' +
        ' not UU.USUARIO = 434 and UU.GERENTE in (257, 268, 343) )'
      '                and CP.PROVIDENCIA = (select max(providencia) '
      #9#9'from CAC_PROVIDENCIA CP1 '
      #9#9'where CP1.EMPRESA = CCO.EMPRESA '
      #9#9'AND CP1.REVENDA = CCO.REVENDA '
      #9#9'AND CP1.CONTATO = CCO.CONTATO)'
      'group by FVE.NOME'
      'order by FVE.NOME')
    Left = 105
    Top = 256
    ParamData = <
      item
        Name = 'INICIO'
        ParamType = ptInput
      end
      item
        Name = 'FIM'
        ParamType = ptInput
      end
      item
        Name = 'DEPARTAMENTO'
        ParamType = ptInput
      end
      item
        Name = 'DEPARTAMENTO2'
        ParamType = ptInput
      end>
  end
  object DtsCad_Vendedor: TDataSource
    DataSet = QryCad_Vendedor
    Left = 1191
    Top = 8
  end
  object QryVFatur: TFDQuery
    Connection = Bravos
    SQL.Strings = (
      'Select CCO.CONTATO as "Contato", '
      'To_Char(CCO.DTA_CONTATO,'#39'dd/mm/yyyy'#39') as "Data In'#237'cio",'
      'To_Char(CCO.DTA_FECHAMENTO,'#39'dd/mm/yyyy'#39') "Data Encerramento",'
      
        'to_date(CCO.DTA_FECHAMENTO,'#39'dd/mm/yyyy'#39')-to_date(CCO.DTA_CONTATO' +
        ','#39'dd/mm/yyyy'#39') as Dias,'
      'CCO.CLIENTE as "C'#243'digo Cliente", '
      'CLI.NOME as "Nome cliente", '
      'PROP.PROPOSTA as "Proposta", '
      'PROP.VEICULO as "C'#243'digo do ve'#237'culo"    '
      'from '
      
        #9'FAT_VENDEDOR FVE, CAC_CONTATO CCO, FAT_CLIENTE CLI,VEI_PROPOSTA' +
        ' PROP, VEI_NEGOCIACAO NEG     '
      'where CCO.EMPRESA = FVE.EMPRESA '
      #9'and CCO.REVENDA = FVE.REVENDA '
      #9'and CCO.USUARIO_ENCAMINHADO_ORIGINAL = FVE.USUARIO'
      #9'and CCO.EMPRESA = PROP.EMPRESA '
      #9'and CCO.REVENDA = PROP.REVENDA '
      #9'and CCO.CONTATO = PROP.CONTATO'
      #9'and CCO.CLIENTE = CLI.CLIENTE '
      #9'and PROP.EMPRESA = NEG.EMPRESA '
      #9'and PROP.REVENDA = NEG.REVENDA '
      #9'and PROP.PROPOSTA = NEG.PROPOSTA  '
      #9'and CCO.REVENDA = 1 '
      '    and CCO.SITUACAO = '#39'F'#39' '
      '    and CCO.RESULTADO = '#39'R'#39' '
      #9'and CCO.ORIGEM = '#39'V'#39' '
      #9'and FVE.EMPRESA = CCO.EMPRESA '
      #9'and FVE.REVENDA = CCO.REVENDA '
      '    and FVE.USUARIO = CCO.USUARIO_ENCAMINHADO '
      '    and (CCO.DTA_FECHAMENTO >= To_Date(:inicio,'#39'dd/mm/yyyy'#39') '
      #9'and CCO.DTA_FECHAMENTO < To_Date(:fim, '#39'dd/mm/yyyy'#39')+1)'
      #9'and CCO.DEPARTAMENTO IN (:departamento,:departamento2) '
      
        #9'and FVE.USUARIO in (select UU.USUARIO from GER_USUARIO UU where' +
        ' not UU.USUARIO = 434 and UU.GERENTE in (257, 268, 343))'
      '    and FVE.USUARIO = :vendedor'
      'order by 1')
    Left = 105
    Top = 208
    ParamData = <
      item
        Name = 'INICIO'
        ParamType = ptInput
      end
      item
        Name = 'FIM'
        ParamType = ptInput
      end
      item
        Name = 'DEPARTAMENTO'
        ParamType = ptInput
      end
      item
        Name = 'DEPARTAMENTO2'
        ParamType = ptInput
      end
      item
        Name = 'VENDEDOR'
        ParamType = ptInput
      end>
  end
  object DtsVFatur_mes: TDataSource
    DataSet = QryVFatur_mes
    Left = 25
    Top = 256
  end
  object DtsObsoleto: TDataSource
    DataSet = QryObsoleto
    Left = 25
    Top = 304
  end
  object QryObsoleto: TFDQuery
    Connection = Bravos
    SQL.Strings = (
      'Select pie.item_estoque as C'#211'DIGO_INTERNO, '
      'PIR.item_estoque_PUB as C'#211'DIGO_VW, '
      'pir.des_item_estoque as DESCRI'#199#195'O, '
      'pie.qtd_contabil as CONT'#193'BIL, '
      'pie.val_estoque as VALOR_ESTOQUE, '
      'pie.demanda_media as DEMANDA_MEDIA, '
      'pie.dta_saida as ULTIMA_SAIDA, '
      'pie.dta_ult_entrada as ULTIMA_ENTRADA '
      'from pec_item_revenda PIE '
      'JOIN pec_item_estoque PIR '
      'ON PIE.item_estoque = PIR.item_estoque '
      'where pie.revenda = 1 '
      'and pie.qtd_contabil>0 '
      'and pie.demanda_media < pie.qtd_contabil')
    Left = 105
    Top = 304
  end
  object DtsClientes1: TDataSource
    DataSet = QryClientes1
    Left = 25
    Top = 352
  end
  object QryClientes1: TFDQuery
    Connection = Bravos
    SQL.Strings = (
      
        'SELECT FCL.CLIENTE, FCL.NOME, FCL.fisjur as "TIPO", FCC.des_cate' +
        'goria_cliente AS CATEGORIA, TCD.NOME AS "SITUA'#199#195'O CADASTRO", '
      
        'TCR.NOME AS "SITUA'#199#195'O CR'#201'DITO", '#39'R$ '#39'||to_char(FCL.limite_credit' +
        'o, '#39'FM999G999G999D90'#39') AS "LIMITE CR'#201'DITO", '
      
        #39'R$ '#39'||to_char(coalesce(sum(B.VAL_TITULO - (coalesce((SELECT sum' +
        '(VAL_PAGAMENTO) '
      
        #9'FROM FIN_TITULO_PAGAMENTO WHERE EMPRESA = B.EMPRESA AND REVENDA' +
        ' = B.REVENDA '
      
        '    AND TITULO = B.TITULO AND DUPLICATA = B.DUPLICATA AND CLIENT' +
        'E = B.CLIENTE), 0)) '
      '    + coalesce((SELECT sum(VAL_DEVOLUCAO) FROM FIN_DEVOLUCAO '
      
        '    WHERE EMPRESA = B.EMPRESA AND REVENDA = B.REVENDA AND TITULO' +
        ' = B.TITULO '
      
        '    AND DUPLICATA = B.DUPLICATA AND CLIENTE = B.CLIENTE), 0)),0)' +
        ','#39'FM999G999G999D90'#39') as SALDO, '
      
        ' '#39'R$ '#39'||to_char(FCL.limite_credito - coalesce(sum(B.VAL_TITULO -' +
        ' (coalesce((SELECT sum(VAL_PAGAMENTO) '
      
        #9'FROM FIN_TITULO_PAGAMENTO WHERE EMPRESA = B.EMPRESA AND REVENDA' +
        ' = B.REVENDA AND TITULO = B.TITULO '
      
        '    AND DUPLICATA = B.DUPLICATA AND CLIENTE = B.CLIENTE), 0)) + ' +
        'coalesce((SELECT sum(VAL_DEVOLUCAO) '
      
        '    FROM FIN_DEVOLUCAO WHERE EMPRESA = B.EMPRESA AND REVENDA = B' +
        '.REVENDA AND TITULO = B.TITULO '
      
        '    AND DUPLICATA = B.DUPLICATA AND CLIENTE = B.CLIENTE), 0)),0)' +
        ','#39'FM999G999G999D90'#39') as TOTAL, to_char(FCL.DTA_ULTIMO_MOVIMENTO,' +
        #39'dd/mm/yyyy'#39') as "'#218'LTIMA COMPRA" '
      
        'FROM FAT_CLIENTE FCL, FAT_CATEGORIA_CLIENTE FCC, FIN_TITULO B, T' +
        'ST_CADASTRO TCD, '
      
        'TST_CREDITO TCR WHERE B.EMPRESA = 1 AND FCL.CLIENTE = B.CLIENTE ' +
        'AND FCL.CATEGORIA = FCC.CATEGORIA  '
      
        'AND FCL.SITUACAO_CREDITO = TCD.CODIGO AND FCL.BLOQUEIO_CREDITO =' +
        ' TCR.CODIGO AND (B.TIPO = '#39'CR'#39') '
      'AND TIPO = B.TIPO AND B.STATUS in ('#39'EM'#39','#39'PP'#39') '
      
        'group by FCL.CLIENTE, FCL.NOME, FCL.fisjur, FCC.des_categoria_cl' +
        'iente, TCD.NOME, TCR.NOME, '
      'FCL.limite_credito, FCL.DTA_ULTIMO_MOVIMENTO ORDER BY 1')
    Left = 105
    Top = 352
  end
  object DtsClientes2: TDataSource
    DataSet = QryClientes2
    Left = 25
    Top = 400
  end
  object QryClientes2: TFDQuery
    Connection = Bravos
    SQL.Strings = (
      'SELECT FCL.CLIENTE, FCL.NOME, FCL.fisjur as "TIPO", '
      
        'FCC.des_categoria_cliente AS CATEGORIA, TCD.NOME AS "SITUA'#199#195'O CA' +
        'DASTRO", '
      'TCR.NOME AS "SITUA'#199#195'O CR'#201'DITO",  '
      
        #39'R$ '#39'||to_char(FCL.limite_credito, '#39'FM999G999G999D90'#39') AS "LIMIT' +
        'E CR'#201'DITO",'
      
        'to_char(FCL.DTA_ULTIMO_MOVIMENTO,'#39'dd/mm/yyyy'#39') as "'#218'LTIMA COMPRA' +
        '"'
      
        'FROM FAT_CLIENTE FCL, FAT_CATEGORIA_CLIENTE FCC,  TST_CADASTRO T' +
        'CD, TST_CREDITO TCR'
      'WHERE FCL.CATEGORIA = FCC.CATEGORIA'
      '  AND FCL.SITUACAO_CREDITO = TCD.CODIGO'
      '  AND FCL.BLOQUEIO_CREDITO = TCR.CODIGO'
      '  and FCL.limite_credito = 0'
      'order by 1')
    Left = 105
    Top = 400
  end
  object DtsClientes3: TDataSource
    DataSet = QryClientes3
    Left = 25
    Top = 448
  end
  object QryClientes3: TFDQuery
    Connection = Bravos
    SQL.Strings = (
      
        'SELECT FCL.CLIENTE, FCL.NOME, FCL.fisjur as "TIPO", FCC.des_cate' +
        'goria_cliente AS CATEGORIA, '
      
        'TCD.NOME AS "SITUA'#199#195'O CADASTRO", TCR.NOME AS "SITUA'#199#195'O CR'#201'DITO",' +
        '  '
      
        #39'R$ '#39'||to_char(FCL.limite_credito, '#39'FM999G999G999D90'#39') AS "LIMIT' +
        'E CR'#201'DITO",'
      
        'to_char(FCL.DTA_ULTIMO_MOVIMENTO,'#39'dd/mm/yyyy'#39') as "'#218'LTIMA COMPRA' +
        '"'
      
        'FROM FAT_CLIENTE FCL, FAT_CATEGORIA_CLIENTE FCC, TST_CADASTRO TC' +
        'D, TST_CREDITO TCR'
      'WHERe FCL.CATEGORIA = FCC.CATEGORIA'
      '  AND FCL.SITUACAO_CREDITO = TCD.CODIGO'
      '  AND FCL.BLOQUEIO_CREDITO = TCR.CODIGO'
      '  and FCL.limite_credito > 0'
      'order by 1')
    Left = 105
    Top = 448
  end
  object DtsClientes4: TDataSource
    DataSet = QryClientes4
    Left = 25
    Top = 496
  end
  object QryClientes4: TFDQuery
    Connection = Bravos
    SQL.Strings = (
      
        'SELECT FCL.CLIENTE, FCL.NOME, FCL.fisjur as "TIPO", FCC.des_cate' +
        'goria_cliente AS CATEGORIA, '
      
        'TCD.NOME AS "SITUA'#199#195'O CADASTRO", TCR.NOME AS "SITUA'#199#195'O CR'#201'DITO",' +
        ' '
      
        ' '#39'R$ '#39'||to_char(FCL.limite_credito, '#39'FM999G999G999D90'#39') AS "LIMI' +
        'TE CR'#201'DITO",'
      
        'to_char(FCL.DTA_ULTIMO_MOVIMENTO,'#39'dd/mm/yyyy'#39') as "'#218'LTIMA COMPRA' +
        '"'
      
        'FROM FAT_CLIENTE FCL, FAT_CATEGORIA_CLIENTE FCC, TST_CADASTRO TC' +
        'D, TST_CREDITO TCR'
      'WHERe FCL.CATEGORIA = FCC.CATEGORIA'
      '  AND FCL.SITUACAO_CREDITO = TCD.CODIGO'
      '  AND FCL.BLOQUEIO_CREDITO = TCR.CODIGO'
      '  and FCL.limite_credito < 0'
      'order by 1')
    Left = 105
    Top = 496
  end
  object QryVVendPerd: TFDQuery
    Connection = Bravos
    SQL.Strings = (
      'select CAC.CONTATO "Contato",'
      'INITCAP(LOWER(SUBSTR(GU1.NOME, 1, '
      
        '       CASE WHEN INSTR(GU1.NOME, '#39' '#39') > 0 THEN INSTR(GU1.NOME, '#39 +
        ' '#39') - 1 '
      '            ELSE LENGTH(GU1.NOME) END))) AS "Abriu",'
      'INITCAP(LOWER(SUBSTR(GU2.NOME, 1, '
      
        '       CASE WHEN INSTR(GU2.NOME, '#39' '#39') > 0 THEN INSTR(GU2.NOME, '#39 +
        ' '#39') - 1 '
      '            ELSE LENGTH(GU2.NOME) END))) AS "Fechou",'
      
        'INITCAP(LOWER(FC.NOME)) "Nome cliente                           ' +
        '   ", '
      '(select INITCAP(LOWER(MD.DES_MODELO))'
      'from CAC_INTERESSE INTE, VEI_MODELO MD '
      'where INTE.EMPRESA = CAC.EMPRESA '
      'and INTE.REVENDA = CAC.REVENDA '
      'and INTE.CONTATO = CAC.CONTATO '
      'and INTE.EMPRESA = MD.EMPRESA '
      'and INTE.MODELO = MD.MODELO '
      'and INTE.INTERESSE = (select max(INTE2.INTERESSE) '
      'from CAC_INTERESSE INTE2 '
      'where INTE2.EMPRESA = INTE.EMPRESA '
      'and INTE2.REVENDA = INTE.REVENDA '
      'and INTE2.CONTATO = INTE.CONTATO)) "Modelo Ve'#237'culo", '
      'To_Char(CAC.DTA_CONTATO,'#39'dd/mm/yyyy'#39') "Inicio", '
      'To_Char(CAC.DTA_NOVO_CONTATO,'#39'dd/mm/yyyy'#39') "Fechamento", '
      '(select INITCAP(LOWER(CP1.DES_PROVIDENCIA)) '
      'from CAC_PROVIDENCIA CP1 '
      'where CP1.EMPRESA = CAC.EMPRESA '
      'and CP1.REVENDA = CAC.REVENDA '
      'and CP1.CONTATO = CAC.CONTATO '
      'and CP1.PROVIDENCIA = (select max(CP2.PROVIDENCIA) '
      'from CAC_PROVIDENCIA CP2 '
      'where CP2.EMPRESA = CP1.EMPRESA '
      'and CP2.REVENDA = CP1.REVENDA '
      'and CP2.CONTATO = CP1.CONTATO)) "Coment'#225'rio" '
      'from GER_USUARIO GU1, GER_USUARIO GU2, CAC_CONTATO CAC '
      'inner join CAC_FORMA_CONTATO CFC '
      
        'on (CAC.EMPRESA = CFC.EMPRESA and CAC.FORMA_CONTATO = CFC.FORMA_' +
        'CONTATO) '
      'inner join FAT_CLIENTE FC on (CAC.CLIENTE = FC.CLIENTE) '
      'inner join FAT_VENDEDOR FV on (CAC.EMPRESA = FV.EMPRESA '
      
        'and CAC.REVENDA = FV.REVENDA and CAC.USUARIO_ENCAMINHADO = FV.US' +
        'UARIO) '
      'left join CAC_INTERESSE CI '
      'on (CAC.EMPRESA = CI.EMPRESA and CAC.REVENDA = CI.REVENDA '
      'and CAC.CONTATO = CI.CONTATO) '
      'left join CAC_PROVIDENCIA CP on (CAC.EMPRESA = CP.EMPRESA '
      'and CAC.REVENDA = CP.REVENDA and CAC.CONTATO = CP.CONTATO '
      'and CP.TIPO_PROVIDENCIA = '#39'F'#39') '
      'where CFC.TIPO_FORMA_CONTATO in (1,2,3,4) '
      'and CAC.ORIGEM = '#39'V'#39' '
      'and GU1.USUARIO = CAC.USUARIO_ABRIU '
      'and GU2.USUARIO = CAC.USUARIO_ENCAMINHADO '
      'and CAC.EMPRESA = 1 and CAC.REVENDA = 1 '
      'and CP.DTA_PROVIDENCIA >= To_Date(:inicio,'#39'dd/mm/yyyy'#39') '
      'and CP.DTA_PROVIDENCIA < To_Date(:fim, '#39'dd/mm/yyyy'#39') +1'
      'and CP.PROVIDENCIA = (select max(providencia) '
      'from CAC_PROVIDENCIA CP1 '
      'where CP1.EMPRESA = CAC.EMPRESA '
      'AND CP1.REVENDA = CAC.REVENDA '
      'AND CP1.CONTATO = CAC.CONTATO) '
      'and CAC.RESULTADO = '#39'P'#39' '
      'and CAC.SITUACAO = '#39'F'#39' '
      'and FV.USUARIO = :vendedor'
      'GROUP BY CAC.CONTATO, CAC.SITUACAO, '
      'CAC.USUARIO_ABRIU, CAC.USUARIO_ENCAMINHADO, '
      'FC.NOME, CAC.DTA_CONTATO, CAC.DTA_NOVO_CONTATO, '
      'GU1.NOME, GU2.NOME, CAC.EMPRESA, CAC.REVENDA')
    Left = 329
    Top = 8
    ParamData = <
      item
        Name = 'INICIO'
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'FIM'
        ParamType = ptInput
      end
      item
        Name = 'VENDEDOR'
        DataType = ftString
        ParamType = ptInput
        Value = '0'
      end>
  end
  object DtsVVendPerd: TDataSource
    DataSet = QryVVendPerd
    Left = 233
    Top = 8
  end
  object QryVVendPerd_mes_nov: TFDQuery
    Connection = Bravos
    SQL.Strings = (
      
        'select INITCAP(LOWER(GMO.DES_MOTIVO)) "Motivo                   ' +
        '                                  ",'
      'count(*) "Total",'
      'sum((case when FV.USUARIO = 607 then 1 else 0 end)) "Danilo",'
      'sum((case when FV.USUARIO = 343 then 1 else 0 end)) "Denis",'
      'sum((case when FV.USUARIO = 118 then 1 else 0 end)) "Guilherme",'
      'sum((case when FV.USUARIO = 375 then 1 else 0 end)) "Jo'#227'o",'
      'sum((case when FV.USUARIO = 116 then 1 else 0 end)) "Lara",'
      'sum((case when FV.USUARIO = 245 then 1 else 0 end)) "Layane",'
      'sum((case when FV.USUARIO = 257 then 1 else 0 end)) "Mario",'
      'sum((case when FV.USUARIO = 534 then 1 else 0 end)) "Rodrigo"'
      'from GER_USUARIO GU1, GER_USUARIO GU2, CAC_CONTATO CAC '
      'inner join CAC_FORMA_CONTATO CFC '
      
        'on (CAC.EMPRESA = CFC.EMPRESA and CAC.FORMA_CONTATO = CFC.FORMA_' +
        'CONTATO) '
      'inner join FAT_CLIENTE FC on (CAC.CLIENTE = FC.CLIENTE) '
      'inner join FAT_VENDEDOR FV on (CAC.EMPRESA = FV.EMPRESA '
      
        'and CAC.REVENDA = FV.REVENDA and CAC.USUARIO_ENCAMINHADO = FV.US' +
        'UARIO) '
      'left join CAC_INTERESSE CI '
      'on (CAC.EMPRESA = CI.EMPRESA and CAC.REVENDA = CI.REVENDA '
      'and CAC.CONTATO = CI.CONTATO) '
      'left join CAC_PROVIDENCIA CP on (CAC.EMPRESA = CP.EMPRESA '
      'and CAC.REVENDA = CP.REVENDA and CAC.CONTATO = CP.CONTATO '
      'and CP.TIPO_PROVIDENCIA = '#39'F'#39')'
      'INNER JOIN GER_MOTIVO GMO '
      'ON (CP.EMPRESA = GMO.EMPRESA) '
      'AND (CP.REVENDA = GMO.REVENDA) '
      'AND (CP.MOTIVO = GMO.MOTIVO) '
      'where CFC.TIPO_FORMA_CONTATO in (1,2,3,4) '
      'and CAC.ORIGEM = '#39'V'#39' '
      'and GU1.USUARIO = CAC.USUARIO_ABRIU '
      'and GU2.USUARIO = CAC.USUARIO_ENCAMINHADO '
      'AND CAC.DEPARTAMENTO in (100, 110)'
      'and CP.DTA_PROVIDENCIA >= TO_DATE(:inicio,'#39'dd/mm/yyyy'#39') '
      'and CP.DTA_PROVIDENCIA < TO_DATE(:fim,'#39'dd/mm/yyyy'#39') +1'
      'and CP.PROVIDENCIA = (select max(providencia) '
      'from CAC_PROVIDENCIA CP1 '
      'where CP1.EMPRESA = CAC.EMPRESA '
      'AND CP1.REVENDA = CAC.REVENDA '
      'AND CP1.CONTATO = CAC.CONTATO) '
      'and CAC.RESULTADO = '#39'P'#39' '
      'and CAC.SITUACAO = '#39'F'#39' '
      'GROUP by GMO.DES_MOTIVO'
      'order by GMO.DES_MOTIVO'
      '')
    Left = 329
    Top = 56
    ParamData = <
      item
        Name = 'INICIO'
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'FIM'
        ParamType = ptInput
      end>
  end
  object DtsVVendPerd_mes: TDataSource
    DataSet = QryVVendPerd_mes_nov
    Left = 233
    Top = 56
  end
  object QryVVendPerd_mes_usa: TFDQuery
    Connection = Bravos
    SQL.Strings = (
      
        'select INITCAP(LOWER(GMO.DES_MOTIVO)) "Motivo                   ' +
        '                                  ",'
      'count(*) "Total",'
      'sum((case when FV.USUARIO = 521 then 1 else 0 end)) "Darlon", '
      'sum((case when FV.USUARIO = 496 then 1 else 0 end)) "Marcus", '
      'sum((case when FV.USUARIO = 439 then 1 else 0 end)) "Milena", '
      'sum((case when FV.USUARIO = 329 then 1 else 0 end)) "Ricardo", '
      'sum((case when FV.USUARIO = 257 then 1 else 0 end)) "Mario", '
      'sum((case when FV.USUARIO = 268 then 1 else 0 end)) "Plinio" '
      'from GER_USUARIO GU1, GER_USUARIO GU2, CAC_CONTATO CAC '
      'inner join CAC_FORMA_CONTATO CFC '
      
        'on (CAC.EMPRESA = CFC.EMPRESA and CAC.FORMA_CONTATO = CFC.FORMA_' +
        'CONTATO) '
      'inner join FAT_CLIENTE FC on (CAC.CLIENTE = FC.CLIENTE) '
      'inner join FAT_VENDEDOR FV on (CAC.EMPRESA = FV.EMPRESA '
      
        'and CAC.REVENDA = FV.REVENDA and CAC.USUARIO_ENCAMINHADO = FV.US' +
        'UARIO) '
      'left join CAC_INTERESSE CI '
      'on (CAC.EMPRESA = CI.EMPRESA and CAC.REVENDA = CI.REVENDA '
      'and CAC.CONTATO = CI.CONTATO) '
      'left join CAC_PROVIDENCIA CP on (CAC.EMPRESA = CP.EMPRESA '
      'and CAC.REVENDA = CP.REVENDA and CAC.CONTATO = CP.CONTATO '
      'and CP.TIPO_PROVIDENCIA = '#39'F'#39')'
      'INNER JOIN GER_MOTIVO GMO '
      'ON (CP.EMPRESA = GMO.EMPRESA) '
      'AND (CP.REVENDA = GMO.REVENDA) '
      'AND (CP.MOTIVO = GMO.MOTIVO) '
      'where CFC.TIPO_FORMA_CONTATO in (1,2,3,4) '
      'and CAC.ORIGEM = '#39'V'#39' '
      'and GU1.USUARIO = CAC.USUARIO_ABRIU '
      'and GU2.USUARIO = CAC.USUARIO_ENCAMINHADO '
      'AND CAC.DEPARTAMENTO in (200, 210)'
      'and CP.DTA_PROVIDENCIA >= TO_DATE(:inicio,'#39'dd/mm/yyyy'#39') '
      'and CP.DTA_PROVIDENCIA < TO_DATE(:fim,'#39'dd/mm/yyyy'#39') +1'
      'and CP.PROVIDENCIA = (select max(providencia) '
      'from CAC_PROVIDENCIA CP1 '
      'where CP1.EMPRESA = CAC.EMPRESA '
      'AND CP1.REVENDA = CAC.REVENDA '
      'AND CP1.CONTATO = CAC.CONTATO) '
      'and CAC.RESULTADO = '#39'P'#39' '
      'and CAC.SITUACAO = '#39'F'#39' '
      'GROUP by GMO.DES_MOTIVO'
      'order by GMO.DES_MOTIVO'
      '')
    Left = 433
    Top = 56
    ParamData = <
      item
        Name = 'INICIO'
        ParamType = ptInput
      end
      item
        Name = 'FIM'
        ParamType = ptInput
      end>
  end
  object DtsLeads: TDataSource
    DataSet = QryLeads
    Left = 233
    Top = 104
  end
  object QryLeads: TFDQuery
    Connection = Bravos
    SQL.Strings = (
      'Select COT.DES_ORIGEM_TRAFEGO "DESCRI'#199#195'O", '
      'COALESCE (sum(TMP1.NRO_REGISTROS),0) QUANTIDADE, '
      
        'sum((case when CCO.SITUACAO = '#39'F'#39' and CCO.RESULTADO = '#39'R'#39' then 1' +
        ' else 0 end)) VENDAS '
      'from CAC_ORIGEM_TRAFEGO COT, '
      'FAT_VENDEDOR FVE, '
      'CAC_CONTATO CCO '
      'left outer join '
      '(Select EMPRESA, REVENDA, CONTATO, count(CONTATO) NRO_REGISTROS '
      'from CAC_CONTATO '
      'where DTA_CONTATO >= TO_DATE(:inicio,'#39'dd/mm/yyyy'#39') '
      'and DTA_CONTATO < TO_DATE(:fim,'#39'dd/mm/yyyy'#39')+1'
      'and DEPARTAMENTO IN (100, 110, 200, 210)'
      'group by EMPRESA, REVENDA, CONTATO) TMP1 '
      'on TMP1.EMPRESA = CCO.EMPRESA '
      'and TMP1.REVENDA = CCO.REVENDA '
      'and TMP1.CONTATO = CCO.CONTATO '
      'where ((CCO.DTA_CONTATO >= TO_DATE(:inicio2,'#39'dd/mm/yyyy'#39') '
      'and CCO.DTA_CONTATO < TO_DATE(:fim2,'#39'dd/mm/yyyy'#39')+1) '
      'or (CCO.DTA_FECHAMENTO >= TO_DATE(:inicio3,'#39'dd/mm/yyyy'#39') '
      'and CCO.DTA_FECHAMENTO < TO_DATE(:fim3,'#39'dd/mm/yyyy'#39')+1)) '
      'and ( (CCO.EMPRESA = 1 and CCO.REVENDA = 1)) '
      'and CCO.ORIGEM = '#39'V'#39' '
      'and COT.EMPRESA = CCO.EMPRESA '
      'and COT.ORIGEM_TRAFEGO = CCO.ORIGEM_TRAFEGO '
      'and FVE.EMPRESA = CCO.EMPRESA '
      'and FVE.DEPARTAMENTO = CCO.DEPARTAMENTO '
      'and FVE.REVENDA = CCO.REVENDA '
      'and FVE.USUARIO = CCO.USUARIO_ENCAMINHADO '
      'and FVE.FUNCAO = '#39'V'#39' '
      'and CCO.DEPARTAMENTO IN (100, 110, 200, 210)'
      'and DES_ORIGEM_TRAFEGO like '#39'LEAD%'#39
      'and not exists '
      
        '(select FMC.CONTATO from FAT_MOVIMENTO_CAPA FMC, FAT_TIPO_TRANSA' +
        'CAO FTT '
      'where FMC.EMPRESA = CCO.EMPRESA '
      'and FMC.REVENDA = CCO.REVENDA '
      'and FMC.CONTATO = CCO.CONTATO '
      'and FMC.TIPO_TRANSACAO = FTT.TIPO_TRANSACAO '
      'and FTT.SUBTIPO_TRANSACAO in ('#39'T'#39', '#39'S'#39', '#39'D'#39')) '
      'group by COT.DES_ORIGEM_TRAFEGO '
      'order by COT.DES_ORIGEM_TRAFEGO ')
    Left = 329
    Top = 104
    ParamData = <
      item
        Name = 'INICIO'
        ParamType = ptInput
      end
      item
        Name = 'FIM'
        ParamType = ptInput
      end
      item
        Name = 'INICIO2'
        ParamType = ptInput
      end
      item
        Name = 'FIM2'
        ParamType = ptInput
      end
      item
        Name = 'INICIO3'
        ParamType = ptInput
      end
      item
        Name = 'FIM3'
        ParamType = ptInput
      end>
  end
  object QryLeads_vendedor: TFDQuery
    Connection = Bravos
    SQL.Strings = (
      'Select CCO.CONTATO, '
      'CCO.SITUACAO Status,'
      'COT.DES_ORIGEM_TRAFEGO as "Lead",'
      'To_Char(CCO.DTA_CONTATO,'#39'dd/mm/yyyy'#39') as "Data In'#237'cio",'
      'To_Char(CCO.DTA_FECHAMENTO,'#39'dd/mm/yyyy'#39') "Data Encerramento",'
      
        'to_date(CCO.DTA_FECHAMENTO,'#39'dd/mm/yyyy'#39')-to_date(CCO.DTA_CONTATO' +
        ','#39'dd/mm/yyyy'#39') as Dias,'
      'CCO.CLIENTE,'
      'CLI.NOME,'
      'FVE.NOME "Vendedor"'
      'from CAC_ORIGEM_TRAFEGO COT, '
      'FAT_VENDEDOR FVE, '
      'CAC_CONTATO CCO,'
      'FAT_CLIENTE CLI '
      'where ((CCO.DTA_CONTATO between To_Date(:inicio,'#39'dd/mm/yyyy'#39') '
      'and To_Date(:fim,'#39'dd/mm/yyyy'#39')+1))'
      'and ( (CCO.EMPRESA = 1 and CCO.REVENDA = 1)) '
      'and CCO.ORIGEM = '#39'V'#39' '
      'and FVE.FUNCAO = '#39'V'#39' '
      'and FVE.USUARIO = :vendedor'
      'and COT.EMPRESA = CCO.EMPRESA '
      'and CCO.CLIENTE = CLI.CLIENTE'
      'and COT.ORIGEM_TRAFEGO = CCO.ORIGEM_TRAFEGO '
      'and FVE.EMPRESA = CCO.EMPRESA '
      'and COT.DES_ORIGEM_TRAFEGO like '#39'%LEAD%'#39
      'and FVE.DEPARTAMENTO = CCO.DEPARTAMENTO '
      'and FVE.REVENDA = CCO.REVENDA '
      'and FVE.USUARIO = CCO.USUARIO_ENCAMINHADO '
      'order by CCO.CONTATO'
      '')
    Left = 433
    Top = 152
    ParamData = <
      item
        Name = 'INICIO'
        ParamType = ptInput
      end
      item
        Name = 'FIM'
        ParamType = ptInput
      end
      item
        Name = 'VENDEDOR'
        ParamType = ptInput
      end>
  end
  object DtsOrigem_Trafego: TDataSource
    DataSet = QryOrigem_Trafego
    Left = 1191
    Top = 56
  end
  object QryOrigem_Trafego: TFDQuery
    Connection = Bravos
    SQL.Strings = (
      'SELECT ORIGEM_TRAFEGO, DES_ORIGEM_TRAFEGO '
      'FROM CAC_ORIGEM_TRAFEGO '
      'WHERE DES_ORIGEM_TRAFEGO like '#39'LEAD%'#39
      'ORDER BY DES_ORIGEM_TRAFEGO')
    Left = 1287
    Top = 56
  end
  object DtsLeads_: TDataSource
    DataSet = QryLeads_origem
    Left = 233
    Top = 152
  end
  object QryLeads_origem: TFDQuery
    Connection = Bravos
    SQL.Strings = (
      'Select CCO.CONTATO, '
      'CCO.SITUACAO Status,'
      'To_Char(CCO.DTA_CONTATO,'#39'dd/mm/yyyy'#39') as "Data In'#237'cio",'
      'To_Char(CCO.DTA_FECHAMENTO,'#39'dd/mm/yyyy'#39') "Data Encerramento",'
      
        'to_date(CCO.DTA_FECHAMENTO,'#39'dd/mm/yyyy'#39')-to_date(CCO.DTA_CONTATO' +
        ','#39'dd/mm/yyyy'#39') as Dias,'
      'CCO.CLIENTE,'
      'CLI.NOME,'
      'FVE.NOME "Vendedor"'
      'from CAC_ORIGEM_TRAFEGO COT, '
      'FAT_VENDEDOR FVE, '
      'CAC_CONTATO CCO,'
      'FAT_CLIENTE CLI '
      
        'where ((CCO.DTA_CONTATO >= To_Date(:inicio,'#39'dd/mm/yyyy'#39') and CCO' +
        '.DTA_CONTATO < To_Date(:fim, '#39'dd/mm/yyyy'#39')+1) '
      
        'or (CCO.DTA_FECHAMENTO >= To_Date(:inicio2,'#39'dd/mm/yyyy'#39') and CCO' +
        '.DTA_FECHAMENTO < To_Date(:fim2, '#39'dd/mm/yyyy'#39')+1)) '
      'and ( (CCO.EMPRESA = 1 and CCO.REVENDA = 1)) '
      'and CCO.ORIGEM = '#39'V'#39' '
      'and FVE.FUNCAO = '#39'V'#39' '
      'and CCO.DEPARTAMENTO IN (100, 110, 200, 210)'
      'and COT.ORIGEM_TRAFEGO = :origem'
      'and COT.EMPRESA = CCO.EMPRESA '
      'and CCO.CLIENTE = CLI.CLIENTE'
      'and COT.ORIGEM_TRAFEGO = CCO.ORIGEM_TRAFEGO '
      'and FVE.EMPRESA = CCO.EMPRESA '
      'and FVE.DEPARTAMENTO = CCO.DEPARTAMENTO '
      'and FVE.REVENDA = CCO.REVENDA '
      'and FVE.USUARIO = CCO.USUARIO_ENCAMINHADO '
      'order by CCO.CONTATO'
      '')
    Left = 329
    Top = 152
    ParamData = <
      item
        Name = 'INICIO'
        ParamType = ptInput
      end
      item
        Name = 'FIM'
        ParamType = ptInput
      end
      item
        Name = 'INICIO2'
        ParamType = ptInput
      end
      item
        Name = 'FIM2'
        ParamType = ptInput
      end
      item
        Name = 'ORIGEM'
        ParamType = ptInput
      end>
  end
  object DtsVAtendimentos_mes: TDataSource
    DataSet = QryVAtendimentos_mes_nov
    Left = 233
    Top = 248
  end
  object QryVAtendimentos_mes_nov: TFDQuery
    Connection = Bravos
    SQL.Strings = (
      'select To_Char(cc.dta_contato, '#39'dd/mm/yyyy'#39') DATA,'
      'count(*) Total,'
      'sum((case when FVE.USUARIO = 607 then 1 else 0 end)) "Danilo",'
      'sum((case when FVE.USUARIO = 343 then 1 else 0 end)) "D'#234'nis",'
      
        'sum((case when FVE.USUARIO = 118 then 1 else 0 end)) "Guilherme"' +
        ', '
      'sum((case when FVE.USUARIO = 375 then 1 else 0 end)) "Joao",'
      'sum((case when FVE.USUARIO = 116 then 1 else 0 end)) "Lara",'
      'sum((case when FVE.USUARIO = 245 then 1 else 0 end)) "Layane",'
      'sum((case when FVE.USUARIO = 257 then 1 else 0 end)) "Mario",'
      'sum((case when FVE.USUARIO = 534 then 1 else 0 end)) "Rodrigo"'
      'from FAT_CLIENTE FC, '
      'CAC_CONTATO CC '
      'INNER JOIN FAT_VENDEDOR FVE'
      'ON CC.USUARIO_ABRIU = FVE.USUARIO'
      'AND CC.REVENDA = FVE.REVENDA'
      'where CC.EMPRESA = 1 and FC.CLIENTE = CC.CLIENTE '
      'and cc.dta_contato >= To_Date(:inicio,'#39'dd/mm/yyyy'#39') '
      'and cc.dta_contato < To_Date(:fim, '#39'dd/mm/yyyy'#39') + 1'
      'and CC.DEPARTAMENTO in (100, 110)'
      
        'and FVE.USUARIO in (select UU.USUARIO from GER_USUARIO UU where ' +
        'not UU.USUARIO = 434 and UU.GERENTE in (257, 343) )'
      'group by To_Char(cc.dta_contato, '#39'dd/mm/yyyy'#39')'
      'ORDER BY To_Char(cc.dta_contato, '#39'dd/mm/yyyy'#39')')
    Left = 329
    Top = 248
    ParamData = <
      item
        Name = 'INICIO'
        ParamType = ptInput
      end
      item
        Name = 'FIM'
        ParamType = ptInput
      end>
  end
  object QryVAtendimentos_mes_usa: TFDQuery
    Connection = Bravos
    SQL.Strings = (
      'select To_Char(cc.dta_contato, '#39'dd/mm/yyyy'#39') DATA,'
      'count(*) Total,'
      'sum((case when FVE.USUARIO = 521 then 1 else 0 end)) "DARLON",'
      'sum((case when FVE.USUARIO = 496 then 1 else 0 end)) "MARCUS", '
      'sum((case when FVE.USUARIO = 257 then 1 else 0 end)) "MARIO",'
      'sum((case when FVE.USUARIO = 439 then 1 else 0 end)) "MILENA", '
      'sum((case when FVE.USUARIO = 268 then 1 else 0 end)) "PLINIO", '
      'sum((case when FVE.USUARIO = 329 then 1 else 0 end)) "RICARDO"'
      'from FAT_CLIENTE FC, '
      'CAC_CONTATO CC '
      'INNER JOIN FAT_VENDEDOR FVE'
      'ON CC.USUARIO_ABRIU = FVE.USUARIO'
      'AND CC.REVENDA = FVE.REVENDA'
      'where CC.EMPRESA = 1 and FC.CLIENTE = CC.CLIENTE '
      'and cc.dta_contato >= To_Date(:inicio,'#39'dd/mm/yyyy'#39') '
      'and cc.dta_contato < To_Date(:fim, '#39'dd/mm/yyyy'#39') + 1'
      'and CC.origem = '#39'V'#39
      'and CC.DEPARTAMENTO in (200, 210)'
      'and FVE.USUARIO in ('
      'select UU.USUARIO from GER_USUARIO UU where'
      'UU.usuario =257 or UU.GERENTE = 268)'
      'group by To_Char(cc.dta_contato, '#39'dd/mm/yyyy'#39')'
      'ORDER BY To_Char(cc.dta_contato, '#39'dd/mm/yyyy'#39')')
    Left = 433
    Top = 248
    ParamData = <
      item
        Name = 'INICIO'
        ParamType = ptInput
      end
      item
        Name = 'FIM'
        ParamType = ptInput
      end>
  end
  object DtsVAtendimentos: TDataSource
    DataSet = QryVAtendimentos
    Left = 233
    Top = 200
  end
  object QryVAtendimentos: TFDQuery
    Connection = Bravos
    SQL.Strings = (
      'Select CCO.CONTATO, '
      'CCO.SITUACAO Status,'
      'To_Char(CCO.DTA_CONTATO,'#39'dd/mm/yyyy'#39') as "Data In'#237'cio",'
      'To_Char(CCO.DTA_FECHAMENTO,'#39'dd/mm/yyyy'#39') "Data Encerramento",'
      
        'to_date(CCO.DTA_FECHAMENTO,'#39'dd/mm/yyyy'#39')-to_date(CCO.DTA_CONTATO' +
        ','#39'dd/mm/yyyy'#39') as Dias,'
      'CCO.CLIENTE,'
      'CLI.NOME,'
      'FVE.NOME "Vendedor"'
      'from CAC_ORIGEM_TRAFEGO COT, '
      'FAT_VENDEDOR FVE, '
      'CAC_CONTATO CCO,'
      'FAT_CLIENTE CLI '
      
        'where (CCO.DTA_CONTATO >= To_Date(:inicio,'#39'dd/mm/yyyy'#39') and CCO.' +
        'DTA_CONTATO < To_Date(:fim, '#39'dd/mm/yyyy'#39')+1) '
      'and ( (CCO.EMPRESA = 1 and CCO.REVENDA = 1)) '
      'and CCO.ORIGEM = '#39'V'#39' and FVE.USUARIO = :vendedor'
      'and CCO.DEPARTAMENTO IN (:departamento1, :departamento2)'
      'and COT.EMPRESA = CCO.EMPRESA '
      'and CCO.CLIENTE = CLI.CLIENTE'
      'and COT.ORIGEM_TRAFEGO = CCO.ORIGEM_TRAFEGO '
      'and FVE.EMPRESA = CCO.EMPRESA '
      'and FVE.REVENDA = CCO.REVENDA '
      'and FVE.USUARIO = CCO.USUARIO_ABRIU'
      'order by CCO.CONTATO')
    Left = 329
    Top = 200
    ParamData = <
      item
        Name = 'INICIO'
        ParamType = ptInput
      end
      item
        Name = 'FIM'
        ParamType = ptInput
      end
      item
        Name = 'VENDEDOR'
        ParamType = ptInput
      end
      item
        Name = 'departamento1'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'departamento2'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object DtsIcmsST: TDataSource
    DataSet = QryIcmsST
    Left = 233
    Top = 296
  end
  object QryIcmsST: TFDQuery
    Connection = Bravos
    SQL.Strings = (
      'select '
      'numero_nota_fiscal "Nota Fiscal", serie_nota_fiscal "S'#233'rie", '
      'cnpj_emissor "Emissor",  '
      'dta_emissao "Data", cnpj_destinatario "Destinat'#225'rio", '
      
        #39'R$ '#39'||to_char(val_nota) "Valor", importado "Importado", chave_n' +
        'fe "Chave"  '
      'from FAT_XMLNFE_RECEBIDO '
      'where DTA_EMISSAO BETWEEN TO_DATE(:inicio,'#39'dd/mm/yyyy'#39') '
      'and To_Date(:fim, '#39'dd/mm/yyyy'#39')'
      ' and (XML_NOTA like ('#39'%<CFOP>5101</CFOP>%'#39') '
      ' or XML_NOTA like ('#39'%<CFOP>5102</CFOP>%'#39')'
      ' or XML_NOTA like ('#39'%<CFOP>6101</CFOP>%'#39') '
      ' or XML_NOTA like ('#39'%<CFOP>6102</CFOP>%'#39'))')
    Left = 329
    Top = 296
    ParamData = <
      item
        Name = 'INICIO'
        ParamType = ptInput
      end
      item
        Name = 'FIM'
        ParamType = ptInput
      end>
  end
  object DtsVeicFamilia: TDataSource
    DataSet = QryVeicFamilia
    Left = 1191
    Top = 104
  end
  object QryVeicFamilia: TFDQuery
    Active = True
    Connection = Bravos
    SQL.Strings = (
      'select familia, des_familia from vei_familia where marca = '#39'VW'#39)
    Left = 1287
    Top = 104
  end
  object DtsCRM: TDataSource
    DataSet = QryAnivers
    Left = 209
    Top = 344
  end
  object QryAnivers: TFDQuery
    Connection = Bravos
    SQL.Strings = (
      'SELECT FP.CLIENTE, CL.NOME, '
      #9'PF.DTA_NASCIMENTO NASCIMENTO,'
      '        to_char(PF.DTA_NASCIMENTO, '#39'DD'#39') DIA,'
      '        to_char(PF.DTA_NASCIMENTO, '#39'MM'#39') MES,'
      '    CL.DDD_TELEFONE, CL.TELEFONE,'
      '    CL.DDD_CELULAR, CL.CELULAR,'
      
        '    (CL.TIPOVIA_ENTREGA || '#39' '#39' || CL.LOGRADOURO_ENTREGA || '#39'-'#39' |' +
        '| CL.COMPLEMENTO_ENTREGA) AS Endereco, '
      
        #9'CL.BAIRRO_ENTREGA, CL.MUNICIPIO_ENTREGA, CL.UF_ENTREGA, CL.CEP_' +
        'ENTREGA,'
      '    CL.E_MAIL_CASA, CL.E_MAIL_TRABALHO, '
      
        '    VE.VEICULO, VE.NOVO_USADO, VE.MODELO, FS.ANO_FABRICACAO, FS.' +
        'ANO_MODELO, VE.DTA_VENDA, FP.CHASSI, '
      '    VE.REVENDA_NFSAIDA, '
      #9' FVE.NOME VENDEDOR '
      'FROM OFI_FICHA_SEGUIMENTO FS '
      'INNER JOIN OFI_FICHA_PROPRIETARIO FP '
      #9'ON (FS.CHASSI = FP.CHASSI) '
      'INNER JOIN FAT_CLIENTE CL '
      #9'ON (FP.CLIENTE = CL.CLIENTE) '
      'LEFT JOIN FAT_PESSOA_FISICA PF '
      #9'ON (PF.CLIENTE = CL.CLIENTE)'
      'LEFT JOIN FAT_PESSOA_JURIDICA PJ '
      #9'ON (PJ.CLIENTE = CL.CLIENTE)'
      'INNER JOIN VEI_MODELO MO '
      #9'ON (FS.EMPRESA = MO.EMPRESA) '
      '    AND (FS.MODELO = MO.MODELO) '
      'INNER JOIN VEI_FAMILIA FA '
      #9'ON (MO.EMPRESA = FA.EMPRESA) '
      '    AND (MO.FAMILIA = FA.FAMILIA) '
      'INNER JOIN GER_MARCA GE '
      #9'ON (FA.MARCA = GE.MARCA) '
      'LEFT JOIN VEI_VEICULO VE '
      #9'ON (FS.CHASSI = VE.CHASSI) '
      'LEFT JOIN  FAT_VENDEDOR FVE'
      #9'ON (VE.VENDEDOR_VEICULO = FVE.VENDEDOR'
      '    AND VE.REVENDA_NFSAIDA = FVE.REVENDA)'
      
        'LEFT JOIN (select EMPRESA, VEICULO, max(DTA_ENTREGA_REAL) DTA_EN' +
        'TREGA_REAL '
      #9#9'from VEI_AGENDA_ENTREGA group by EMPRESA, VEICULO) AE '
      '    ON (VE.EMPRESA = AE.EMPRESA '
      '    and VE.VEICULO = AE.VEICULO) '
      'LEFT JOIN FAT_MOVIMENTO_CAPA FMC '
      #9'ON (VE.EMPRESA_NFSAIDA = FMC.EMPRESA) '
      '    AND (VE.REVENDA_NFSAIDA = FMC.REVENDA) '
      '    AND (VE.NUMERO_NOTA_NFSAIDA = FMC.NUMERO_NOTA_FISCAL) '
      '    AND (VE.SERIE_NOTA_FISCAL_NFSAIDA = FMC.SERIE_NOTA_FISCAL ) '
      '    AND (VE.TIPO_TRANSACAO_NFSAIDA = FMC.TIPO_TRANSACAO ) '
      '    AND (VE.CONTADOR_NFSAIDA = FMC.CONTADOR) '
      'WHERE FP.PROPRIETARIO_ATUAL = '#39'S'#39' '
      #9'AND FS.EMPRESA = 1 '
      '    and FS.REVENDA = 1 '
      '    and VE.NOVO_USADO = '#39'N'#39
      '    and CL.FISJUR = '#39'F'#39
      
        '    AND (CL.ACEITA_CONTATADO = '#39'S'#39' OR CL.ACEITA_CONTATADO IS NUL' +
        'L) '
      '    AND NOT EXISTS ( select CLIENTE from FAT_CLIENTE_LGPD '
      '    '#9'where EMPRESA = 1 '
      '        '#9'and REVENDA = 1             '
      '            and CLIENTE = CL.CLIENTE '
      '            and coalesce(DIREITO_ESQUECIMENTO,'#39'N'#39') = '#39'S'#39' ) '
      'AND (to_char(PF.DTA_NASCIMENTO, '#39'mm'#39') between :MsIni and :MsFim)'
      
        '    AND (to_char(PF.DTA_NASCIMENTO, '#39'dd'#39') between :DtIni AND :Dt' +
        'Fim) '
      #9'ORDER BY 5,4,1'
      '')
    Left = 273
    Top = 344
    ParamData = <
      item
        Name = 'MSINI'
        ParamType = ptInput
      end
      item
        Name = 'MSFIM'
        ParamType = ptInput
      end
      item
        Name = 'DTINI'
        ParamType = ptInput
      end
      item
        Name = 'DTFIM'
        ParamType = ptInput
      end>
  end
  object QryCRMVeic: TFDQuery
    Connection = Bravos
    SQL.Strings = (
      'SELECT DISTINCT FP.CLIENTE, CL.NOME, CL.FISJUR "FIS/JUR",'
      #9'case when CL.FISJUR = '#39'F'#39' then PF.DTA_NASCIMENTO '
      '    '#9'else Null end NASCIMENTO,'
      '    CL.DDD_TELEFONE, CL.TELEFONE,'
      '    CL.DDD_CELULAR, CL.CELULAR,'
      
        '    (CL.TIPOVIA_ENTREGA || '#39' '#39' || CL.LOGRADOURO_ENTREGA || '#39'-'#39' |' +
        '| CL.COMPLEMENTO_ENTREGA) AS Endereco, '
      
        #9'CL.BAIRRO_ENTREGA, CL.MUNICIPIO_ENTREGA, CL.UF_ENTREGA, CL.CEP_' +
        'ENTREGA,'
      '    CL.E_MAIL_CASA, CL.E_MAIL_TRABALHO, '
      
        '    VE.VEICULO, VE.NOVO_USADO, VE.MODELO, FS.ANO_FABRICACAO, FS.' +
        'ANO_MODELO, VE.DTA_VENDA, FP.CHASSI, '
      '    VE.REVENDA_NFSAIDA, '
      #9' FVE.NOME VENDEDOR '
      'FROM OFI_FICHA_SEGUIMENTO FS '
      'INNER JOIN OFI_FICHA_PROPRIETARIO FP '
      #9'ON (FS.CHASSI = FP.CHASSI) '
      'INNER JOIN FAT_CLIENTE CL '
      #9'ON (FP.CLIENTE = CL.CLIENTE) '
      'LEFT JOIN FAT_PESSOA_FISICA PF '
      #9'ON (PF.CLIENTE = CL.CLIENTE)'
      'LEFT JOIN FAT_PESSOA_JURIDICA PJ '
      #9'ON (PJ.CLIENTE = CL.CLIENTE)'
      'INNER JOIN VEI_MODELO MO '
      #9'ON (FS.EMPRESA = MO.EMPRESA) '
      '    AND (FS.MODELO = MO.MODELO) '
      'INNER JOIN VEI_FAMILIA FA '
      #9'ON (MO.EMPRESA = FA.EMPRESA) '
      '    AND (MO.FAMILIA = FA.FAMILIA) '
      'INNER JOIN GER_MARCA GE '
      #9'ON (FA.MARCA = GE.MARCA) '
      'LEFT JOIN VEI_VEICULO VE '
      #9'ON (FS.CHASSI = VE.CHASSI) '
      'LEFT JOIN  FAT_VENDEDOR FVE'
      #9'ON (VE.VENDEDOR_VEICULO = FVE.VENDEDOR'
      '    AND VE.REVENDA_NFSAIDA = FVE.REVENDA)'
      
        'LEFT JOIN (select EMPRESA, VEICULO, max(DTA_ENTREGA_REAL) DTA_EN' +
        'TREGA_REAL '
      #9#9'from VEI_AGENDA_ENTREGA group by EMPRESA, VEICULO) AE '
      '    ON (VE.EMPRESA = AE.EMPRESA '
      '    and VE.VEICULO = AE.VEICULO) '
      'LEFT JOIN FAT_MOVIMENTO_CAPA FMC '
      #9'ON (VE.EMPRESA_NFSAIDA = FMC.EMPRESA) '
      '    AND (VE.REVENDA_NFSAIDA = FMC.REVENDA) '
      '    AND (VE.NUMERO_NOTA_NFSAIDA = FMC.NUMERO_NOTA_FISCAL) '
      '    AND (VE.SERIE_NOTA_FISCAL_NFSAIDA = FMC.SERIE_NOTA_FISCAL ) '
      '    AND (VE.TIPO_TRANSACAO_NFSAIDA = FMC.TIPO_TRANSACAO ) '
      '    AND (VE.CONTADOR_NFSAIDA = FMC.CONTADOR) '
      'WHERE FP.PROPRIETARIO_ATUAL = '#39'S'#39' '
      #9'AND FS.EMPRESA = 1 '
      '    and FS.REVENDA = 1 '
      '    and VE.NOVO_USADO = :dep'
      
        '    AND (CL.ACEITA_CONTATADO = '#39'S'#39' OR CL.ACEITA_CONTATADO IS NUL' +
        'L) '
      '    AND NOT EXISTS ( select CLIENTE from FAT_CLIENTE_LGPD '
      '    '#9'where EMPRESA = 1 '
      '        '#9'and REVENDA = 1 '
      '            and CLIENTE = CL.CLIENTE '
      '            and coalesce(DIREITO_ESQUECIMENTO,'#39'N'#39') = '#39'S'#39' ) '
      '    AND VE.DTA_VENDA between TO_DATE(:inicio,'#39'dd/mm/yyyy'#39') '
      '    and TO_DATE(:fim,'#39'dd/mm/yyyy'#39') '
      '    ORDER BY 1'
      '')
    Left = 345
    Top = 344
    ParamData = <
      item
        Name = 'DEP'
        ParamType = ptInput
      end
      item
        Name = 'INICIO'
        ParamType = ptInput
      end
      item
        Name = 'FIM'
        ParamType = ptInput
      end>
  end
  object QryCRMVeicModelo: TFDQuery
    Connection = Bravos
    SQL.Strings = (
      'SELECT DISTINCT FP.CLIENTE, CL.NOME, CL.FISJUR "FIS/JUR",'
      #9'case when CL.FISJUR = '#39'F'#39' then PF.DTA_NASCIMENTO '
      '    '#9'else Null end NASCIMENTO,'
      '    CL.DDD_TELEFONE, CL.TELEFONE,'
      '    CL.DDD_CELULAR, CL.CELULAR,'
      
        '    (CL.TIPOVIA_ENTREGA || '#39' '#39' || CL.LOGRADOURO_ENTREGA || '#39'-'#39' |' +
        '| CL.COMPLEMENTO_ENTREGA) AS Endereco, '
      
        #9'CL.BAIRRO_ENTREGA, CL.MUNICIPIO_ENTREGA, CL.UF_ENTREGA, CL.CEP_' +
        'ENTREGA,'
      '    CL.E_MAIL_CASA, CL.E_MAIL_TRABALHO, '
      
        '    VE.VEICULO, VE.NOVO_USADO, VE.MODELO, FS.ANO_FABRICACAO, FS.' +
        'ANO_MODELO, VE.DTA_VENDA, FP.CHASSI, '
      '    VE.REVENDA_NFSAIDA, '
      #9' FVE.NOME VENDEDOR '
      'FROM OFI_FICHA_SEGUIMENTO FS '
      'INNER JOIN OFI_FICHA_PROPRIETARIO FP '
      #9'ON (FS.CHASSI = FP.CHASSI) '
      'INNER JOIN FAT_CLIENTE CL '
      #9'ON (FP.CLIENTE = CL.CLIENTE) '
      'LEFT JOIN FAT_PESSOA_FISICA PF '
      #9'ON (PF.CLIENTE = CL.CLIENTE)'
      'LEFT JOIN FAT_PESSOA_JURIDICA PJ '
      #9'ON (PJ.CLIENTE = CL.CLIENTE)'
      'INNER JOIN VEI_MODELO MO '
      #9'ON (FS.EMPRESA = MO.EMPRESA) '
      '    AND (FS.MODELO = MO.MODELO) '
      'INNER JOIN VEI_FAMILIA FA '
      #9'ON (MO.EMPRESA = FA.EMPRESA) '
      '    AND (MO.FAMILIA = FA.FAMILIA) '
      'INNER JOIN GER_MARCA GE '
      #9'ON (FA.MARCA = GE.MARCA) '
      'LEFT JOIN VEI_VEICULO VE '
      #9'ON (FS.CHASSI = VE.CHASSI) '
      'LEFT JOIN  FAT_VENDEDOR FVE'
      #9'ON (VE.VENDEDOR_VEICULO = FVE.VENDEDOR'
      '    AND VE.REVENDA_NFSAIDA = FVE.REVENDA)'
      
        'LEFT JOIN (select EMPRESA, VEICULO, max(DTA_ENTREGA_REAL) DTA_EN' +
        'TREGA_REAL '
      #9#9'from VEI_AGENDA_ENTREGA group by EMPRESA, VEICULO) AE '
      '    ON (VE.EMPRESA = AE.EMPRESA '
      '    and VE.VEICULO = AE.VEICULO) '
      'LEFT JOIN FAT_MOVIMENTO_CAPA FMC '
      #9'ON (VE.EMPRESA_NFSAIDA = FMC.EMPRESA) '
      '    AND (VE.REVENDA_NFSAIDA = FMC.REVENDA) '
      '    AND (VE.NUMERO_NOTA_NFSAIDA = FMC.NUMERO_NOTA_FISCAL) '
      '    AND (VE.SERIE_NOTA_FISCAL_NFSAIDA = FMC.SERIE_NOTA_FISCAL ) '
      '    AND (VE.TIPO_TRANSACAO_NFSAIDA = FMC.TIPO_TRANSACAO ) '
      '    AND (VE.CONTADOR_NFSAIDA = FMC.CONTADOR) '
      'WHERE FP.PROPRIETARIO_ATUAL = '#39'S'#39' '
      #9'AND FS.EMPRESA = 1 '
      '    and FS.REVENDA = 1 '
      
        '    AND (CL.ACEITA_CONTATADO = '#39'S'#39' OR CL.ACEITA_CONTATADO IS NUL' +
        'L) '
      '    AND NOT EXISTS ( select CLIENTE from FAT_CLIENTE_LGPD '
      '    '#9'where EMPRESA = 1 '
      '        '#9'and REVENDA = 1 '
      '            and CLIENTE = CL.CLIENTE '
      '            and coalesce(DIREITO_ESQUECIMENTO,'#39'N'#39') = '#39'S'#39' ) '
      '    AND VE.DTA_VENDA between TO_DATE(:inicio,'#39'dd/mm/yyyy'#39') '
      '    and TO_DATE(:fim,'#39'dd/mm/yyyy'#39') '
      '    AND FA.FAMILIA in (:familia) ORDER BY 1'
      '')
    Left = 425
    Top = 344
    ParamData = <
      item
        Name = 'INICIO'
        ParamType = ptInput
      end
      item
        Name = 'FIM'
        ParamType = ptInput
      end
      item
        Name = 'FAMILIA'
        ParamType = ptInput
      end>
  end
  object DtsDepVeic: TDataSource
    DataSet = QryDepVeic
    Left = 1191
    Top = 152
  end
  object QryDepVeic: TFDQuery
    Active = True
    Connection = Bravos
    SQL.Strings = (
      'SELECT DEPARTAMENTO, NOME'
      'FROM GER_DEPARTAMENTO'
      'WHERE DEPARTAMENTO IN (100,200)'
      'AND REVENDA = 1')
    Left = 1287
    Top = 152
  end
  object DtsEstAtendimento: TDataSource
    DataSet = QryEstAtendimento_VN
    Left = 577
    Top = 8
  end
  object QryEstAtendimento_VN: TFDQuery
    Connection = Bravos
    SQL.Strings = (
      'select TO_CHAR(cc.dta_contato, '#39'DD/MM/YYYY'#39') as "Data",'
      'count(*) "Total",'
      'sum((case when FVE.USUARIO = 607 then 1 else 0 end)) "Danilo",'
      'sum((case when FVE.USUARIO = 343 then 1 else 0 end)) "D'#234'nis",'
      
        'sum((case when FVE.USUARIO = 118 then 1 else 0 end)) "Guilherme"' +
        ','
      'sum((case when FVE.USUARIO = 375 then 1 else 0 end)) "Jo'#227'o",'
      'sum((case when FVE.USUARIO = 116 then 1 else 0 end)) "Lara",'
      'sum((case when FVE.USUARIO = 245 then 1 else 0 end)) "Layane",'
      'sum((case when FVE.USUARIO = 257 then 1 else 0 end)) "Mario",'
      'sum((case when FVE.USUARIO = 534 then 1 else 0 end)) "Rodrigo"'
      'from FAT_CLIENTE FC, '
      'CAC_CONTATO CC '
      'INNER JOIN FAT_VENDEDOR FVE'
      'ON CC.USUARIO_ABRIU = FVE.USUARIO'
      'AND CC.REVENDA = FVE.REVENDA'
      'where CC.EMPRESA = 1 and FC.CLIENTE = CC.CLIENTE '
      'and cc.dta_contato >= To_Date(:inicio,'#39'dd/mm/yyyy'#39') '
      'and cc.dta_contato < To_Date(:fim, '#39'dd/mm/yyyy'#39')+1'
      'and CC.DEPARTAMENTO in (100,110)'
      
        'and FVE.USUARIO in (select UU.USUARIO from GER_USUARIO UU where ' +
        'not UU.USUARIO = 434 and UU.GERENTE in (257, 343, 268) )'
      'group by TO_CHAR(cc.dta_contato, '#39'DD/MM/YYYY'#39')'
      'ORDER BY TO_CHAR(cc.dta_contato, '#39'DD/MM/YYYY'#39')')
    Left = 683
    Top = 8
    ParamData = <
      item
        Name = 'INICIO'
        ParamType = ptInput
      end
      item
        Name = 'FIM'
        ParamType = ptInput
      end>
  end
  object QryEstAtendimento_VU: TFDQuery
    Connection = Bravos
    SQL.Strings = (
      'select To_Char(cc.dta_contato, '#39'dd/mm/yyyy'#39') "Data",'
      'count(*) "Total",'
      'sum((case when FVE.USUARIO = 521 then 1 else 0 end)) "Darlon",'
      'sum((case when FVE.USUARIO = 496 then 1 else 0 end)) "Marcus", '
      'sum((case when FVE.USUARIO = 257 then 1 else 0 end)) "Mario",'
      'sum((case when FVE.USUARIO = 439 then 1 else 0 end)) "Milena", '
      'sum((case when FVE.USUARIO = 268 then 1 else 0 end)) "Plinio", '
      'sum((case when FVE.USUARIO = 329 then 1 else 0 end)) "Ricardo"'
      'from FAT_CLIENTE FC, '
      'CAC_CONTATO CC '
      'INNER JOIN FAT_VENDEDOR FVE'
      'ON CC.USUARIO_ABRIU = FVE.USUARIO'
      'AND CC.REVENDA = FVE.REVENDA'
      'where CC.EMPRESA = 1 and FC.CLIENTE = CC.CLIENTE '
      'and cc.dta_contato >= To_Date(:inicio,'#39'dd/mm/yyyy'#39') '
      'and cc.dta_contato < To_Date(:fim, '#39'dd/mm/yyyy'#39') + 1'
      'and CC.origem = '#39'V'#39
      'and CC.DEPARTAMENTO in (200, 210)'
      'and FVE.USUARIO in ('
      'select UU.USUARIO from GER_USUARIO UU where'
      'UU.usuario =257 or UU.GERENTE = 268 )'
      'group by To_Char(cc.dta_contato, '#39'dd/mm/yyyy'#39')'
      'ORDER BY To_Char(cc.dta_contato, '#39'dd/mm/yyyy'#39')')
    Left = 800
    Top = 8
    ParamData = <
      item
        Name = 'INICIO'
        ParamType = ptInput
      end
      item
        Name = 'FIM'
        ParamType = ptInput
      end>
  end
  object DtsEstVendPerdida: TDataSource
    DataSet = QryEstVendPerdida_VN
    Left = 577
    Top = 56
  end
  object QryEstVendPerdida_VN: TFDQuery
    Connection = Bravos
    SQL.Strings = (
      'select GMO.DES_MOTIVO "Motivo",'
      'count(*) "Total",'
      'sum((case when FV.USUARIO = 607 then 1 else 0 end)) "Danilo",'
      'sum((case when FV.USUARIO = 343 then 1 else 0 end)) "D'#234'nis",'
      'sum((case when FV.USUARIO = 118 then 1 else 0 end)) "Guilherme",'
      'sum((case when FV.USUARIO = 375 then 1 else 0 end)) "Jo'#227'o",'
      'sum((case when FV.USUARIO = 116 then 1 else 0 end)) "Lara",'
      'sum((case when FV.USUARIO = 245 then 1 else 0 end)) "Layane",'
      'sum((case when FV.USUARIO = 257 then 1 else 0 end)) "Mario",'
      'sum((case when FV.USUARIO = 534 then 1 else 0 end)) "Rodrigo"'
      'from GER_USUARIO GU1, GER_USUARIO GU2, CAC_CONTATO CAC '
      'inner join CAC_FORMA_CONTATO CFC '
      
        'on (CAC.EMPRESA = CFC.EMPRESA and CAC.FORMA_CONTATO = CFC.FORMA_' +
        'CONTATO) '
      'inner join FAT_CLIENTE FC on (CAC.CLIENTE = FC.CLIENTE) '
      'inner join FAT_VENDEDOR FV on (CAC.EMPRESA = FV.EMPRESA '
      
        'and CAC.REVENDA = FV.REVENDA and CAC.USUARIO_ENCAMINHADO = FV.US' +
        'UARIO) '
      'left join CAC_INTERESSE CI '
      'on (CAC.EMPRESA = CI.EMPRESA and CAC.REVENDA = CI.REVENDA '
      'and CAC.CONTATO = CI.CONTATO) '
      'left join CAC_PROVIDENCIA CP on (CAC.EMPRESA = CP.EMPRESA '
      'and CAC.REVENDA = CP.REVENDA and CAC.CONTATO = CP.CONTATO '
      'and CP.TIPO_PROVIDENCIA = '#39'F'#39')'
      'INNER JOIN GER_MOTIVO GMO '
      'ON (CP.EMPRESA = GMO.EMPRESA) '
      'AND (CP.REVENDA = GMO.REVENDA) '
      'AND (CP.MOTIVO = GMO.MOTIVO) '
      'where CFC.TIPO_FORMA_CONTATO in (1,2,3,4) '
      'and CAC.ORIGEM = '#39'V'#39' '
      'and GU1.USUARIO = CAC.USUARIO_ABRIU '
      'and GU2.USUARIO = CAC.USUARIO_ENCAMINHADO '
      'AND CAC.DEPARTAMENTO in (100,110)'
      'and CP.DTA_PROVIDENCIA>= TO_DATE(:inicio,'#39'dd/mm/yyyy'#39') '
      'and CP.DTA_PROVIDENCIA < TO_DATE(:fim,'#39'dd/mm/yyyy'#39') +1'
      'and CP.PROVIDENCIA = (select max(providencia) '
      'from CAC_PROVIDENCIA CP1 '
      'where CP1.EMPRESA = CAC.EMPRESA '
      'AND CP1.REVENDA = CAC.REVENDA '
      'AND CP1.CONTATO = CAC.CONTATO) '
      'and CAC.RESULTADO = '#39'P'#39' '
      'and CAC.SITUACAO = '#39'F'#39' '
      'GROUP by GMO.DES_MOTIVO'
      'order by GMO.DES_MOTIVO')
    Left = 683
    Top = 56
    ParamData = <
      item
        Name = 'INICIO'
        ParamType = ptInput
      end
      item
        Name = 'FIM'
        ParamType = ptInput
      end>
  end
  object QryEstVendPerdida_VU: TFDQuery
    Connection = Bravos
    SQL.Strings = (
      'select GMO.DES_MOTIVO "Motivo",'
      'count(*) "Total",'
      'sum((case when FV.USUARIO = 521 then 1 else 0 end)) "Darlon", '
      'sum((case when FV.USUARIO = 496 then 1 else 0 end)) "Marcus", '
      'sum((case when FV.USUARIO = 439 then 1 else 0 end)) "Milena", '
      'sum((case when FV.USUARIO = 329 then 1 else 0 end)) "Ricardo", '
      'sum((case when FV.USUARIO = 257 then 1 else 0 end)) "Mario", '
      'sum((case when FV.USUARIO = 268 then 1 else 0 end)) "Plinio" '
      'from GER_USUARIO GU1, GER_USUARIO GU2, CAC_CONTATO CAC '
      'inner join CAC_FORMA_CONTATO CFC '
      
        'on (CAC.EMPRESA = CFC.EMPRESA and CAC.FORMA_CONTATO = CFC.FORMA_' +
        'CONTATO) '
      'inner join FAT_CLIENTE FC on (CAC.CLIENTE = FC.CLIENTE) '
      'inner join FAT_VENDEDOR FV on (CAC.EMPRESA = FV.EMPRESA '
      
        'and CAC.REVENDA = FV.REVENDA and CAC.USUARIO_ENCAMINHADO = FV.US' +
        'UARIO) '
      'left join CAC_INTERESSE CI '
      'on (CAC.EMPRESA = CI.EMPRESA and CAC.REVENDA = CI.REVENDA '
      'and CAC.CONTATO = CI.CONTATO) '
      'left join CAC_PROVIDENCIA CP on (CAC.EMPRESA = CP.EMPRESA '
      'and CAC.REVENDA = CP.REVENDA and CAC.CONTATO = CP.CONTATO '
      'and CP.TIPO_PROVIDENCIA = '#39'F'#39')'
      'INNER JOIN GER_MOTIVO GMO '
      'ON (CP.EMPRESA = GMO.EMPRESA) '
      'AND (CP.REVENDA = GMO.REVENDA) '
      'AND (CP.MOTIVO = GMO.MOTIVO) '
      'where CFC.TIPO_FORMA_CONTATO in (1,2,3,4) '
      'and CAC.ORIGEM = '#39'V'#39' '
      'and GU1.USUARIO = CAC.USUARIO_ABRIU '
      'and GU2.USUARIO = CAC.USUARIO_ENCAMINHADO '
      'AND CAC.DEPARTAMENTO in (200, 210)'
      'and CP.DTA_PROVIDENCIA >= TO_DATE(:inicio,'#39'dd/mm/yyyy'#39') '
      'and CP.DTA_PROVIDENCIA < TO_DATE(:fim,'#39'dd/mm/yyyy'#39') +1'
      'and CP.PROVIDENCIA = (select max(providencia) '
      'from CAC_PROVIDENCIA CP1 '
      'where CP1.EMPRESA = CAC.EMPRESA '
      'AND CP1.REVENDA = CAC.REVENDA '
      'AND CP1.CONTATO = CAC.CONTATO) '
      'and CAC.RESULTADO = '#39'P'#39' '
      'and CAC.SITUACAO = '#39'F'#39' '
      'GROUP by GMO.DES_MOTIVO'
      'order by GMO.DES_MOTIVO')
    Left = 800
    Top = 56
    ParamData = <
      item
        Name = 'INICIO'
        ParamType = ptInput
      end
      item
        Name = 'FIM'
        ParamType = ptInput
      end>
  end
  object DtsEstFaturamento: TDataSource
    DataSet = QryEstFaturamento_VN
    Left = 577
    Top = 104
  end
  object QryEstFaturamento_VN: TFDQuery
    Connection = Bravos
    SQL.Strings = (
      'Select '
      #9#9'FVE.NOME "Vendedor",'
      '    count(*) as "Total",'
      
        '        sum((case when CCO.CONTATO in(select FMC.CONTATO from FA' +
        'T_MOVIMENTO_CAPA FMC, FAT_TIPO_TRANSACAO FTT '
      #9#9'where FMC.EMPRESA = CCO.EMPRESA '
      #9#9'and FMC.REVENDA = CCO.REVENDA '
      #9#9'and FMC.CONTATO = CCO.CONTATO '
      #9#9'and FMC.TIPO_TRANSACAO = FTT.TIPO_TRANSACAO '
      #9#9'and FTT.SUBTIPO_TRANSACAO = '#39'N'#39
      
        #9#9'and not FTT.SUBTIPO_TRANSACAO in ('#39'T'#39', '#39'S'#39', '#39'D'#39')) then 1 else ' +
        '0 end)) as "Venda Loja", '
      
        #9'sum((case when CCO.CONTATO not in (select FMC.CONTATO from FAT_' +
        'MOVIMENTO_CAPA FMC, FAT_TIPO_TRANSACAO FTT '
      #9#9'where FMC.EMPRESA = CCO.EMPRESA '
      #9#9'and FMC.REVENDA = CCO.REVENDA '
      #9#9'and FMC.CONTATO = CCO.CONTATO '
      
        #9#9'and FMC.TIPO_TRANSACAO = FTT.TIPO_TRANSACAO) then 1 else 0 end' +
        ')) as "Venda Direta"'
      '    '
      'from '
      #9'FAT_VENDEDOR FVE, CAC_CONTATO CCO '
      'left join '
      #9'CAC_PROVIDENCIA CP '
      '    on (CCO.EMPRESA = CP.EMPRESA '
      #9'and CCO.REVENDA = CP.REVENDA '
      '    and CCO.CONTATO = CP.CONTATO )    '
      'where '
      #9'CCO.REVENDA = 1 '
      '    and CCO.SITUACAO = '#39'F'#39' '
      '    and CCO.RESULTADO = '#39'R'#39' '
      #9'and CCO.ORIGEM = '#39'V'#39' '
      #9'and FVE.EMPRESA = CCO.EMPRESA '
      #9'and FVE.REVENDA = CCO.REVENDA '
      #9'and FVE.FUNCAO = '#39'V'#39
      '    and FVE.USUARIO = CCO.USUARIO_ENCAMINHADO '
      '    and (CCO.DTA_FECHAMENTO >= To_Date(:inicio,'#39'dd/mm/yyyy'#39') '
      #9'and CCO.DTA_FECHAMENTO < To_Date(:fim, '#39'dd/mm/yyyy'#39')+1)'
      #9'and CCO.DEPARTAMENTO IN (100,110) '
      
        #9'and FVE.USUARIO in (select UU.USUARIO from GER_USUARIO UU where' +
        ' not UU.USUARIO = 434 and UU.GERENTE in (257, 343) )'
      '                and CP.PROVIDENCIA = (select max(providencia) '
      #9#9'from CAC_PROVIDENCIA CP1 '
      #9#9'where CP1.EMPRESA = CCO.EMPRESA '
      #9#9'AND CP1.REVENDA = CCO.REVENDA '
      #9#9'AND CP1.CONTATO = CCO.CONTATO)'
      'group by FVE.NOME'
      'order by FVE.NOME')
    Left = 683
    Top = 104
    ParamData = <
      item
        Name = 'INICIO'
        ParamType = ptInput
      end
      item
        Name = 'FIM'
        ParamType = ptInput
      end>
  end
  object QryEstFaturamento_VU: TFDQuery
    Connection = Bravos
    SQL.Strings = (
      'Select '
      #9#9'FVE.NOME "Vendedor",'
      '    count(*) as "Total",'
      
        '        sum((case when CCO.CONTATO in(select FMC.CONTATO from FA' +
        'T_MOVIMENTO_CAPA FMC, FAT_TIPO_TRANSACAO FTT '
      #9#9'where FMC.EMPRESA = CCO.EMPRESA '
      #9#9'and FMC.REVENDA = CCO.REVENDA '
      #9#9'and FMC.CONTATO = CCO.CONTATO '
      #9#9'and FMC.TIPO_TRANSACAO = FTT.TIPO_TRANSACAO '
      #9#9'and FTT.SUBTIPO_TRANSACAO = '#39'N'#39
      
        #9#9'and not FTT.SUBTIPO_TRANSACAO in ('#39'T'#39', '#39'S'#39', '#39'D'#39')) then 1 else ' +
        '0 end)) as "Venda Loja", '
      
        #9'sum((case when CCO.CONTATO not in (select FMC.CONTATO from FAT_' +
        'MOVIMENTO_CAPA FMC, FAT_TIPO_TRANSACAO FTT '
      #9#9'where FMC.EMPRESA = CCO.EMPRESA '
      #9#9'and FMC.REVENDA = CCO.REVENDA '
      #9#9'and FMC.CONTATO = CCO.CONTATO '
      
        #9#9'and FMC.TIPO_TRANSACAO = FTT.TIPO_TRANSACAO) then 1 else 0 end' +
        ')) as "Venda Direta"'
      '    '
      'from '
      #9'FAT_VENDEDOR FVE, CAC_CONTATO CCO '
      'left join '
      #9'CAC_PROVIDENCIA CP '
      '    on (CCO.EMPRESA = CP.EMPRESA '
      #9'and CCO.REVENDA = CP.REVENDA '
      '    and CCO.CONTATO = CP.CONTATO )    '
      'where '
      #9'CCO.REVENDA = 1'
      '    and CCO.SITUACAO = '#39'F'#39' '
      '    and CCO.RESULTADO = '#39'R'#39' '
      #9'and CCO.ORIGEM = '#39'V'#39' '
      #9'and FVE.EMPRESA = CCO.EMPRESA '
      
        #9'and FVE.REVENDA = CCO.REVENDA     and FVE.USUARIO = CCO.USUARIO' +
        '_ENCAMINHADO '
      '    and (CCO.DTA_FECHAMENTO >= To_Date(:inicio,'#39'dd/mm/yyyy'#39') '
      #9'and CCO.DTA_FECHAMENTO < To_Date(:fim, '#39'dd/mm/yyyy'#39')+1)'
      #9'and CCO.DEPARTAMENTO IN (200,210) '
      #9'and FVE.USUARIO in ('
      'select UU.USUARIO from GER_USUARIO UU where'
      'UU.usuario =257 or UU.GERENTE = 268)'
      '                and CP.PROVIDENCIA = (select max(providencia) '
      #9#9'from CAC_PROVIDENCIA CP1 '
      #9#9'where CP1.EMPRESA = CCO.EMPRESA '
      #9#9'AND CP1.REVENDA = CCO.REVENDA '
      #9#9'AND CP1.CONTATO = CCO.CONTATO)'
      'group by FVE.NOME'
      'order by FVE.NOME')
    Left = 800
    Top = 104
    ParamData = <
      item
        Name = 'INICIO'
        ParamType = ptInput
      end
      item
        Name = 'FIM'
        ParamType = ptInput
      end>
  end
  object DtsEstEstatistica: TDataSource
    DataSet = QryEstEstatistica_VN
    Left = 577
    Top = 152
  end
  object QryEstEstatistica_VN: TFDQuery
    Connection = Bravos
    SQL.Strings = (
      'Select '
      #9'FVE.NOME "Vendedor", '
      
        #9'sum((case when (CCO.DTA_CONTATO >= To_Date(:inicio,'#39'dd/mm/yyyy'#39 +
        ') '
      #9#9'and CCO.DTA_CONTATO < To_Date(:fim, '#39'dd/mm/yyyy'#39')+1) '
      
        #9#9'and FVE.USUARIO = CCO.USUARIO_ABRIU then 1 else 0 end)) as "To' +
        'tal Atendimentos",'
      
        '        sum((case when CCO.ATIVO_PASSIVO = '#39'A'#39' and (CCO.DTA_CONT' +
        'ATO >= To_Date(:inicio1,'#39'dd/mm/yyyy'#39') '
      #9#9'and CCO.DTA_CONTATO < To_Date(:fim1, '#39'dd/mm/yyyy'#39')+1) '
      
        #9#9'and FVE.USUARIO = CCO.USUARIO_ABRIU then 1 else 0 end)) as "At' +
        'ivos", '
      
        '        sum((case when CCO.ATIVO_PASSIVO = '#39'P'#39' and (CCO.DTA_CONT' +
        'ATO >= To_Date(:inicio2,'#39'dd/mm/yyyy'#39') '
      #9#9'and CCO.DTA_CONTATO < To_Date(:fim2, '#39'dd/mm/yyyy'#39')+1) '
      
        #9#9'and FVE.USUARIO = CCO.USUARIO_ABRIU then 1 else 0 end)) as "Re' +
        'ceptivos",'
      
        '    '#9'sum((case when CCO.FORMA_CONTATO = 1 and (CCO.DTA_CONTATO >' +
        '= To_Date(:inicio3,'#39'dd/mm/yyyy'#39') '
      #9#9'and CCO.DTA_CONTATO < To_Date(:fim3, '#39'dd/mm/yyyy'#39')+1) '
      
        #9#9'and FVE.USUARIO = CCO.USUARIO_ABRIU then 1 else 0 end)) as "Sh' +
        'owroom",'
      
        '    '#9'sum((case when CCO.FORMA_CONTATO = 2 and (CCO.DTA_CONTATO >' +
        '=To_Date(:inicio4,'#39'dd/mm/yyyy'#39')  '
      #9#9'and CCO.DTA_CONTATO < To_Date(:fim4, '#39'dd/mm/yyyy'#39')+1) '
      
        #9#9'and FVE.USUARIO = CCO.USUARIO_ABRIU then 1 else 0 end)) as "Te' +
        'lefone",'
      
        '    '#9'sum((case when COT.DES_ORIGEM_TRAFEGO like '#39'%LEAD%'#39' and (CC' +
        'O.DTA_CONTATO >=To_Date(:inicio5,'#39'dd/mm/yyyy'#39') '
      ' '#9#9'and CCO.DTA_CONTATO < To_Date(:fim5, '#39'dd/mm/yyyy'#39')+1) '
      
        #9#9'and FVE.USUARIO = CCO.USUARIO_ABRIU then 1 else 0 end)) as "Le' +
        'ad",  '
      #9'sum((case when CCO.SITUACAO = '#39'F'#39' and CCO.RESULTADO = '#39'R'#39' '
      #9#9'and (CCO.DTA_FECHAMENTO >= To_Date(:inicio6,'#39'dd/mm/yyyy'#39') '
      #9#9'and CCO.DTA_FECHAMENTO < To_Date(:fim6, '#39'dd/mm/yyyy'#39')+1)'
      
        #9#9'and FVE.USUARIO = CCO.USUARIO_ENCAMINHADO  then 1 else 0 end))' +
        ' as "Total Vendas", '
      
        '        sum((case when CCO.CONTATO in(select FMC.CONTATO from FA' +
        'T_MOVIMENTO_CAPA FMC, FAT_TIPO_TRANSACAO FTT '
      #9#9'where FMC.EMPRESA = CCO.EMPRESA '
      #9#9'and FMC.REVENDA = CCO.REVENDA '
      
        '        '#9'and (CCO.DTA_FECHAMENTO >= To_Date(:inicio7,'#39'dd/mm/yyyy' +
        #39') '
      #9#9'and CCO.DTA_FECHAMENTO < To_Date(:fim7, '#39'dd/mm/yyyy'#39')+1)'
      '        '#9'and CCO.SITUACAO = '#39'F'#39' '
      '        '#9'and CCO.RESULTADO = '#39'R'#39
      #9#9'and FMC.CONTATO = CCO.CONTATO '
      #9#9'and FMC.TIPO_TRANSACAO = FTT.TIPO_TRANSACAO '
      #9#9'and FTT.SUBTIPO_TRANSACAO = '#39'N'#39
      '        '#9'and FVE.USUARIO = CCO.USUARIO_ENCAMINHADO'
      
        #9#9'and not FTT.SUBTIPO_TRANSACAO in ('#39'T'#39', '#39'S'#39', '#39'D'#39')) then 1 else ' +
        '0 end)) as "Venda Loja", '
      '    '#9'sum((case when CCO.SITUACAO = '#39'F'#39' and CCO.RESULTADO = '#39'R'#39' '
      #9#9'and (CCO.DTA_FECHAMENTO >= To_Date(:inicio8,'#39'dd/mm/yyyy'#39') '
      #9#9'and CCO.DTA_FECHAMENTO < To_Date(:fim8, '#39'dd/mm/yyyy'#39')+1)'
      
        #9#9'and FVE.USUARIO = CCO.USUARIO_ENCAMINHADO  then 1 else 0 end))' +
        ' '
      
        '    '#9'- sum((case when CCO.CONTATO in(select FMC.CONTATO from FAT' +
        '_MOVIMENTO_CAPA FMC, FAT_TIPO_TRANSACAO FTT '
      #9#9'where FMC.EMPRESA = CCO.EMPRESA '
      #9#9'and FMC.REVENDA = CCO.REVENDA '
      
        '        '#9'and (CCO.DTA_FECHAMENTO >= To_Date(:inicio9,'#39'dd/mm/yyyy' +
        #39') '
      #9#9'and CCO.DTA_FECHAMENTO < To_Date(:fim9, '#39'dd/mm/yyyy'#39')+1)'
      '        '#9'and CCO.SITUACAO = '#39'F'#39' '
      '        '#9'and CCO.RESULTADO = '#39'R'#39
      #9#9'and FMC.CONTATO = CCO.CONTATO '
      #9#9'and FMC.TIPO_TRANSACAO = FTT.TIPO_TRANSACAO '
      #9#9'and FTT.SUBTIPO_TRANSACAO = '#39'N'#39
      '        '#9'and FVE.USUARIO = CCO.USUARIO_ENCAMINHADO'
      
        #9#9'and not FTT.SUBTIPO_TRANSACAO in ('#39'T'#39', '#39'S'#39', '#39'D'#39')) then 1 else ' +
        '0 end))  as "Venda Direta",'
      
        #9'Round((sum((case when CCO.SITUACAO = '#39'F'#39' and CCO.RESULTADO = '#39'R' +
        #39' '
      #9#9'and (CCO.DTA_FECHAMENTO >= To_Date(:inicio10,'#39'dd/mm/yyyy'#39') '
      #9#9'and CCO.DTA_FECHAMENTO < To_Date(:fim10, '#39'dd/mm/yyyy'#39')+1)'
      
        #9#9'and FVE.USUARIO = CCO.USUARIO_ENCAMINHADO  then 1 else 0 end))' +
        '*100)'
      
        '        / nullif(sum((case when (CCO.DTA_CONTATO >= To_Date(:ini' +
        'cio11,'#39'dd/mm/yyyy'#39') '
      #9#9'and CCO.DTA_CONTATO < To_Date(:fim11, '#39'dd/mm/yyyy'#39')+1) '
      
        #9#9'and FVE.USUARIO = CCO.USUARIO_ABRIU then 1 else 0 end)),0),1) ' +
        '|| '#39'%'#39' as "Aproveitamento",'
      ''
      
        #9'sum((case when CP.DTA_PROVIDENCIA>= TO_DATE(:inicio12,'#39'dd/mm/yy' +
        'yy'#39') '
      #9#9'and CP.DTA_PROVIDENCIA < TO_DATE(:fim12,'#39'dd/mm/yyyy'#39') +1'
      '                and CCO.RESULTADO = '#39'P'#39' '
      #9#9'and CCO.SITUACAO = '#39'F'#39
      
        '                and FVE.USUARIO = CCO.USUARIO_ENCAMINHADO then 1' +
        ' else 0 end)) as "Vendas Perdidas", '
      ''
      
        '        Round((sum((case when CP.DTA_PROVIDENCIA>= TO_DATE(:inic' +
        'io13,'#39'dd/mm/yyyy'#39') '
      #9#9'and CP.DTA_PROVIDENCIA < TO_DATE(:fim13,'#39'dd/mm/yyyy'#39') +1'
      '                and CCO.RESULTADO = '#39'P'#39' '
      #9#9'and CCO.SITUACAO = '#39'F'#39
      
        '                and FVE.USUARIO = CCO.USUARIO_ENCAMINHADO then 1' +
        ' else 0 end))*100)'
      
        '        / nullif(sum((case when (CCO.DTA_CONTATO >= To_Date(:ini' +
        'cio14,'#39'dd/mm/yyyy'#39') '
      #9#9'and CCO.DTA_CONTATO < To_Date(:fim14, '#39'dd/mm/yyyy'#39')+1) '
      
        #9#9'and FVE.USUARIO = CCO.USUARIO_ABRIU then 1 else 0 end)),0),1) ' +
        '|| '#39'%'#39' as "Descarte" '
      '    '
      'from '
      #9'CAC_ORIGEM_TRAFEGO COT,  FAT_VENDEDOR FVE, CAC_CONTATO CCO '
      'left join '
      #9'CAC_PROVIDENCIA CP '
      '    '#9'on (CCO.EMPRESA = CP.EMPRESA '
      #9'and CCO.REVENDA = CP.REVENDA '
      '    '#9'and CCO.CONTATO = CP.CONTATO )    '
      'where '
      #9'CCO.REVENDA = 1 '
      #9'and CCO.ORIGEM = '#39'V'#39' '
      #9'and FVE.EMPRESA = CCO.EMPRESA '
      #9'and FVE.REVENDA = CCO.REVENDA '
      '        and COT.ORIGEM_TRAFEGO = CCO.ORIGEM_TRAFEGO '
      #9'and CCO.DEPARTAMENTO IN (100,110) '
      #9'and FVE.USUARIO in ('
      #9#9'select UU.USUARIO from GER_USUARIO UU where'
      #9#9#9'not UU.USUARIO IN (434,505, 273) and UU.GERENTE in (257, 343)'
      
        '                                                and UU.ATIVO = '#39 +
        'S'#39' )'
      '    '#9#9#9'and CP.PROVIDENCIA = (select max(providencia) '
      #9#9'from CAC_PROVIDENCIA CP1 '
      #9#9'where CP1.EMPRESA = CCO.EMPRESA '
      #9#9#9'AND CP1.REVENDA = CCO.REVENDA '
      #9#9#9'AND CP1.CONTATO = CCO.CONTATO)'
      'group by FVE.NOME '
      'order by FVE.NOME'
      '')
    Left = 683
    Top = 152
    ParamData = <
      item
        Name = 'INICIO'
        ParamType = ptInput
      end
      item
        Name = 'FIM'
        ParamType = ptInput
      end
      item
        Name = 'INICIO1'
        ParamType = ptInput
      end
      item
        Name = 'FIM1'
        ParamType = ptInput
      end
      item
        Name = 'INICIO2'
        ParamType = ptInput
      end
      item
        Name = 'FIM2'
        ParamType = ptInput
      end
      item
        Name = 'INICIO3'
        ParamType = ptInput
      end
      item
        Name = 'FIM3'
        ParamType = ptInput
      end
      item
        Name = 'INICIO4'
        ParamType = ptInput
      end
      item
        Name = 'FIM4'
        ParamType = ptInput
      end
      item
        Name = 'INICIO5'
        ParamType = ptInput
      end
      item
        Name = 'FIM5'
        ParamType = ptInput
      end
      item
        Name = 'INICIO6'
        ParamType = ptInput
      end
      item
        Name = 'FIM6'
        ParamType = ptInput
      end
      item
        Name = 'INICIO7'
        ParamType = ptInput
      end
      item
        Name = 'FIM7'
        ParamType = ptInput
      end
      item
        Name = 'INICIO8'
        ParamType = ptInput
      end
      item
        Name = 'FIM8'
        ParamType = ptInput
      end
      item
        Name = 'INICIO9'
        ParamType = ptInput
      end
      item
        Name = 'FIM9'
        ParamType = ptInput
      end
      item
        Name = 'INICIO10'
        ParamType = ptInput
      end
      item
        Name = 'FIM10'
        ParamType = ptInput
      end
      item
        Name = 'INICIO11'
        ParamType = ptInput
      end
      item
        Name = 'FIM11'
        ParamType = ptInput
      end
      item
        Name = 'INICIO12'
        ParamType = ptInput
      end
      item
        Name = 'FIM12'
        ParamType = ptInput
      end
      item
        Name = 'INICIO13'
        ParamType = ptInput
      end
      item
        Name = 'FIM13'
        ParamType = ptInput
      end
      item
        Name = 'INICIO14'
        ParamType = ptInput
      end
      item
        Name = 'FIM14'
        ParamType = ptInput
      end>
  end
  object QryEstEstatistica_VU: TFDQuery
    Connection = Bravos
    SQL.Strings = (
      'Select '
      #9'FVE.NOME "Vendedor", '
      
        #9'sum((case when (CCO.DTA_CONTATO >= To_Date(:inicio,'#39'dd/mm/yyyy'#39 +
        ') '
      #9#9'and CCO.DTA_CONTATO < To_Date(:fim, '#39'dd/mm/yyyy'#39')+1) '
      
        #9#9'and FVE.USUARIO = CCO.USUARIO_ABRIU then 1 else 0 end)) as "To' +
        'tal Atendimentos",'
      
        '        sum((case when CCO.ATIVO_PASSIVO = '#39'A'#39' and (CCO.DTA_CONT' +
        'ATO >= To_Date(:inicio1,'#39'dd/mm/yyyy'#39') '
      #9#9'and CCO.DTA_CONTATO < To_Date(:fim1, '#39'dd/mm/yyyy'#39')+1) '
      
        #9#9'and FVE.USUARIO = CCO.USUARIO_ABRIU then 1 else 0 end)) as "At' +
        'ivos", '
      
        '        sum((case when CCO.ATIVO_PASSIVO = '#39'P'#39' and (CCO.DTA_CONT' +
        'ATO >= To_Date(:inicio2,'#39'dd/mm/yyyy'#39') '
      #9#9'and CCO.DTA_CONTATO < To_Date(:fim2, '#39'dd/mm/yyyy'#39')+1) '
      
        #9#9'and FVE.USUARIO = CCO.USUARIO_ABRIU then 1 else 0 end)) as "Re' +
        'ceptivos",'
      
        '    '#9'sum((case when CCO.FORMA_CONTATO = 1 and (CCO.DTA_CONTATO >' +
        '= To_Date(:inicio3,'#39'dd/mm/yyyy'#39') '
      #9#9'and CCO.DTA_CONTATO < To_Date(:fim3, '#39'dd/mm/yyyy'#39')+1) '
      
        #9#9'and FVE.USUARIO = CCO.USUARIO_ABRIU then 1 else 0 end)) as "Sh' +
        'owroom",'
      
        '    '#9'sum((case when CCO.FORMA_CONTATO = 2 and (CCO.DTA_CONTATO >' +
        '=To_Date(:inicio4,'#39'dd/mm/yyyy'#39')  '
      #9#9'and CCO.DTA_CONTATO < To_Date(:fim4, '#39'dd/mm/yyyy'#39')+1) '
      
        #9#9'and FVE.USUARIO = CCO.USUARIO_ABRIU then 1 else 0 end)) as "Te' +
        'lefone",'
      
        '    '#9'sum((case when COT.DES_ORIGEM_TRAFEGO like '#39'%LEAD%'#39' and (CC' +
        'O.DTA_CONTATO >=To_Date(:inicio5,'#39'dd/mm/yyyy'#39')  '
      #9#9'and CCO.DTA_CONTATO < To_Date(:fim5, '#39'dd/mm/yyyy'#39')+1) '
      
        #9#9'and FVE.USUARIO = CCO.USUARIO_ABRIU then 1 else 0 end)) as "Le' +
        'ad",  '
      #9'sum((case when CCO.SITUACAO = '#39'F'#39' and CCO.RESULTADO = '#39'R'#39' '
      #9#9'and (CCO.DTA_FECHAMENTO >= To_Date(:inicio6,'#39'dd/mm/yyyy'#39') '
      #9#9'and CCO.DTA_FECHAMENTO < To_Date(:fim6, '#39'dd/mm/yyyy'#39')+1)'
      
        #9#9'and FVE.USUARIO = CCO.USUARIO_ENCAMINHADO  then 1 else 0 end))' +
        ' as "Total Vendas", '
      
        ' '#9'sum((case when CCO.CONTATO in(select FMC.CONTATO from FAT_MOVI' +
        'MENTO_CAPA FMC, FAT_TIPO_TRANSACAO FTT '
      #9#9'where FMC.EMPRESA = CCO.EMPRESA '
      #9#9'and FMC.REVENDA = CCO.REVENDA '
      
        '        '#9'and (CCO.DTA_FECHAMENTO >= To_Date(:inicio7,'#39'dd/mm/yyyy' +
        #39') '
      #9#9'and CCO.DTA_FECHAMENTO < To_Date(:fim7, '#39'dd/mm/yyyy'#39')+1)'
      '        '#9'and CCO.SITUACAO = '#39'F'#39' '
      '        '#9'and CCO.RESULTADO = '#39'R'#39
      #9#9'and FMC.CONTATO = CCO.CONTATO '
      #9#9'and FMC.TIPO_TRANSACAO = FTT.TIPO_TRANSACAO '
      #9#9'and FTT.SUBTIPO_TRANSACAO = '#39'N'#39
      '        '#9'and FVE.USUARIO = CCO.USUARIO_ENCAMINHADO'
      
        #9#9'and not FTT.SUBTIPO_TRANSACAO in ('#39'T'#39', '#39'S'#39', '#39'D'#39')) then 1 else ' +
        '0 end)) as "Venda Loja", '
      '    '#9'sum((case when CCO.SITUACAO = '#39'F'#39' and CCO.RESULTADO = '#39'R'#39' '
      #9#9'and (CCO.DTA_FECHAMENTO >= To_Date(:inicio8,'#39'dd/mm/yyyy'#39') '
      #9#9'and CCO.DTA_FECHAMENTO < To_Date(:fim8, '#39'dd/mm/yyyy'#39')+1)'
      
        #9#9'and FVE.USUARIO = CCO.USUARIO_ENCAMINHADO  then 1 else 0 end))' +
        ' '
      
        '    '#9'- sum((case when CCO.CONTATO in(select FMC.CONTATO from FAT' +
        '_MOVIMENTO_CAPA FMC, FAT_TIPO_TRANSACAO FTT '
      #9#9'where FMC.EMPRESA = CCO.EMPRESA '
      #9#9'and FMC.REVENDA = CCO.REVENDA '
      
        '        '#9'and (CCO.DTA_FECHAMENTO >= To_Date(:inicio9,'#39'dd/mm/yyyy' +
        #39') '
      #9#9'and CCO.DTA_FECHAMENTO < To_Date(:fim9, '#39'dd/mm/yyyy'#39')+1)'
      '        '#9'and CCO.SITUACAO = '#39'F'#39' '
      '        '#9'and CCO.RESULTADO = '#39'R'#39
      #9#9'and FMC.CONTATO = CCO.CONTATO '
      #9#9'and FMC.TIPO_TRANSACAO = FTT.TIPO_TRANSACAO '
      #9#9'and FTT.SUBTIPO_TRANSACAO = '#39'N'#39
      '        '#9'and FVE.USUARIO = CCO.USUARIO_ENCAMINHADO'
      
        #9#9'and not FTT.SUBTIPO_TRANSACAO in ('#39'T'#39', '#39'S'#39', '#39'D'#39')) then 1 else ' +
        '0 end))  as "Venda Direta",'
      '              '
      
        #9'Round((sum((case when CCO.SITUACAO = '#39'F'#39' and CCO.RESULTADO = '#39'R' +
        #39' '
      #9#9'and (CCO.DTA_FECHAMENTO >= To_Date(:inicio10,'#39'dd/mm/yyyy'#39') '
      #9#9'and CCO.DTA_FECHAMENTO < To_Date(:fim10, '#39'dd/mm/yyyy'#39')+1)'
      
        #9#9'and FVE.USUARIO = CCO.USUARIO_ENCAMINHADO  then 1 else 0 end))' +
        '*100)'
      
        '        / nullif(sum((case when (CCO.DTA_CONTATO >= To_Date(:ini' +
        'cio11,'#39'dd/mm/yyyy'#39') '
      #9#9'and CCO.DTA_CONTATO < To_Date(:fim11, '#39'dd/mm/yyyy'#39')+1) '
      
        #9#9'and FVE.USUARIO = CCO.USUARIO_ABRIU then 1 else 0 end)),0),1) ' +
        '|| '#39'%'#39' as "Aproveitamento",'
      ''
      
        #9'sum((case when CP.DTA_PROVIDENCIA>= TO_DATE(:inicio12,'#39'dd/mm/yy' +
        'yy'#39') '
      #9#9'and CP.DTA_PROVIDENCIA < TO_DATE(:fim12,'#39'dd/mm/yyyy'#39') +1'
      '                and CCO.RESULTADO = '#39'P'#39' '
      #9#9'and CCO.SITUACAO = '#39'F'#39
      
        '                and FVE.USUARIO = CCO.USUARIO_ENCAMINHADO then 1' +
        ' else 0 end)) as "Vendas Perdidas", '
      ''
      
        '        Round((sum((case when CP.DTA_PROVIDENCIA>= TO_DATE(:inic' +
        'io13,'#39'dd/mm/yyyy'#39') '
      #9#9'and CP.DTA_PROVIDENCIA < TO_DATE(:fim13,'#39'dd/mm/yyyy'#39') +1'
      '                and CCO.RESULTADO = '#39'P'#39' '
      #9#9'and CCO.SITUACAO = '#39'F'#39
      
        '                and FVE.USUARIO = CCO.USUARIO_ENCAMINHADO then 1' +
        ' else 0 end))*100)'
      
        '         / nullif(sum((case when (CCO.DTA_CONTATO >= To_Date(:in' +
        'icio14,'#39'dd/mm/yyyy'#39') '
      #9#9'and CCO.DTA_CONTATO < To_Date(:fim14, '#39'dd/mm/yyyy'#39')+1) '
      
        #9#9'and FVE.USUARIO = CCO.USUARIO_ABRIU then 1 else 0 end)),0),1) ' +
        '|| '#39'%'#39' as "Descarte" '
      'from '
      #9'CAC_ORIGEM_TRAFEGO COT,  FAT_VENDEDOR FVE, CAC_CONTATO CCO '
      'left join '
      #9'CAC_PROVIDENCIA CP '
      '    '#9'on (CCO.EMPRESA = CP.EMPRESA '
      #9'and CCO.REVENDA = CP.REVENDA '
      '    '#9'and CCO.CONTATO = CP.CONTATO )    '
      'where '
      #9'CCO.REVENDA = 1 '
      #9'and CCO.ORIGEM = '#39'V'#39' '
      #9'and FVE.EMPRESA = CCO.EMPRESA '
      #9'and FVE.REVENDA = CCO.REVENDA '
      '        and COT.ORIGEM_TRAFEGO = CCO.ORIGEM_TRAFEGO '
      #9'and CCO.DEPARTAMENTO IN (200,210) '
      #9'and FVE.USUARIO in ('
      #9#9'select UU.USUARIO from GER_USUARIO UU where'
      #9#9#9'UU.usuario =257 or UU.GERENTE = 268 )'
      '    '#9#9#9'and CP.PROVIDENCIA = (select max(providencia) '
      #9#9'from CAC_PROVIDENCIA CP1 '
      #9#9'where CP1.EMPRESA = CCO.EMPRESA '
      #9#9#9'AND CP1.REVENDA = CCO.REVENDA '
      #9#9#9'AND CP1.CONTATO = CCO.CONTATO)'
      'group by FVE.NOME '
      'order by FVE.NOME')
    Left = 800
    Top = 152
    ParamData = <
      item
        Name = 'INICIO'
        ParamType = ptInput
      end
      item
        Name = 'FIM'
        ParamType = ptInput
      end
      item
        Name = 'INICIO1'
        ParamType = ptInput
      end
      item
        Name = 'FIM1'
        ParamType = ptInput
      end
      item
        Name = 'INICIO2'
        ParamType = ptInput
      end
      item
        Name = 'FIM2'
        ParamType = ptInput
      end
      item
        Name = 'INICIO3'
        ParamType = ptInput
      end
      item
        Name = 'FIM3'
        ParamType = ptInput
      end
      item
        Name = 'INICIO4'
        ParamType = ptInput
      end
      item
        Name = 'FIM4'
        ParamType = ptInput
      end
      item
        Name = 'INICIO5'
        ParamType = ptInput
      end
      item
        Name = 'FIM5'
        ParamType = ptInput
      end
      item
        Name = 'INICIO6'
        ParamType = ptInput
      end
      item
        Name = 'FIM6'
        ParamType = ptInput
      end
      item
        Name = 'INICIO7'
        ParamType = ptInput
      end
      item
        Name = 'FIM7'
        ParamType = ptInput
      end
      item
        Name = 'INICIO8'
        ParamType = ptInput
      end
      item
        Name = 'FIM8'
        ParamType = ptInput
      end
      item
        Name = 'INICIO9'
        ParamType = ptInput
      end
      item
        Name = 'FIM9'
        ParamType = ptInput
      end
      item
        Name = 'INICIO10'
        ParamType = ptInput
      end
      item
        Name = 'FIM10'
        ParamType = ptInput
      end
      item
        Name = 'INICIO11'
        ParamType = ptInput
      end
      item
        Name = 'FIM11'
        ParamType = ptInput
      end
      item
        Name = 'INICIO12'
        ParamType = ptInput
      end
      item
        Name = 'FIM12'
        ParamType = ptInput
      end
      item
        Name = 'INICIO13'
        ParamType = ptInput
      end
      item
        Name = 'FIM13'
        ParamType = ptInput
      end
      item
        Name = 'INICIO14'
        ParamType = ptInput
      end
      item
        Name = 'FIM14'
        ParamType = ptInput
      end>
  end
  object DtsEstTotal: TDataSource
    DataSet = QryEstTotal
    Left = 185
    Top = 392
  end
  object QryEstTotal: TFDQuery
    Connection = Bravos
    SQL.Strings = (
      'select DISTINCT(count(*)) Total'
      'from FAT_CLIENTE FC, '
      'CAC_CONTATO CC '
      'INNER JOIN FAT_VENDEDOR FVE'
      'ON CC.USUARIO_ABRIU = FVE.USUARIO'
      'AND CC.REVENDA = FVE.REVENDA'
      'where CC.EMPRESA = 1 and FC.CLIENTE = CC.CLIENTE '
      'and cc.dta_contato >= To_Date(:inicio,'#39'dd/mm/yyyy'#39') '
      'and cc.dta_contato < To_Date(:fim, '#39'dd/mm/yyyy'#39')+1'
      'and CC.origem = '#39'V'#39
      'and CC.DEPARTAMENTO in (:departamento, :departamento2)'
      
        'and FVE.USUARIO in (select UU.USUARIO from GER_USUARIO UU where ' +
        'not UU.USUARIO = 434 and UU.GERENTE in (257, 343, 268) )')
    Left = 281
    Top = 392
    ParamData = <
      item
        Name = 'INICIO'
        DataType = ftString
        ParamType = ptInput
        Value = '25/09/2024'
      end
      item
        Name = 'FIM'
        DataType = ftString
        ParamType = ptInput
        Value = '25/09/2024'
      end
      item
        Name = 'DEPARTAMENTO'
        DataType = ftString
        ParamType = ptInput
        Value = '100'
      end
      item
        Name = 'DEPARTAMENTO2'
        DataType = ftString
        ParamType = ptInput
        Value = '110'
      end>
    object QryEstTotalTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      Precision = 38
      Size = 38
    end
  end
  object DtsEstVendRealiz: TDataSource
    DataSet = QryEstVendRealiz
    Left = 185
    Top = 440
  end
  object QryEstVendRealiz: TFDQuery
    Connection = Bravos
    SQL.Strings = (
      'Select '
      ''
      '    count(*) as "Total"'
      '    '
      'from '
      #9'FAT_VENDEDOR FVE, CAC_CONTATO CCO '
      'left join '
      #9'CAC_PROVIDENCIA CP '
      '    on (CCO.EMPRESA = CP.EMPRESA '
      #9'and CCO.REVENDA = CP.REVENDA '
      '    and CCO.CONTATO = CP.CONTATO )    '
      'where '
      #9'CCO.REVENDA = 1 '
      '    and CCO.SITUACAO = '#39'F'#39' '
      '    and CCO.RESULTADO = '#39'R'#39' '
      #9'and CCO.ORIGEM = '#39'V'#39' '
      #9'and FVE.EMPRESA = CCO.EMPRESA '
      
        #9'and FVE.REVENDA = CCO.REVENDA     and FVE.USUARIO = CCO.USUARIO' +
        '_ENCAMINHADO '
      '    and (CCO.DTA_FECHAMENTO >= To_Date(:inicio,'#39'dd/mm/yyyy'#39') '
      #9'and CCO.DTA_FECHAMENTO < To_Date(:fim, '#39'dd/mm/yyyy'#39')+1)'
      #9'and CCO.DEPARTAMENTO IN (:departamento,:departamento2) '
      #9'and FVE.USUARIO in '
      
        '    (select UU.USUARIO from GER_USUARIO UU where not UU.USUARIO ' +
        '= 434 and UU.GERENTE in (257, 343, 268) )'
      '                and CP.PROVIDENCIA = (select max(providencia) '
      #9#9'from CAC_PROVIDENCIA CP1 '
      #9#9'where CP1.EMPRESA = CCO.EMPRESA '
      #9#9'AND CP1.REVENDA = CCO.REVENDA '
      #9#9'AND CP1.CONTATO = CCO.CONTATO)')
    Left = 281
    Top = 440
    ParamData = <
      item
        Name = 'INICIO'
        DataType = ftString
        ParamType = ptInput
        Value = '25/09/2024'
      end
      item
        Name = 'FIM'
        DataType = ftString
        ParamType = ptInput
        Value = '25/09/2024'
      end
      item
        Name = 'DEPARTAMENTO'
        DataType = ftString
        ParamType = ptInput
        Value = '100'
      end
      item
        Name = 'DEPARTAMENTO2'
        DataType = ftString
        ParamType = ptInput
        Value = '200'
      end>
    object QryEstVendRealizTotal: TFMTBCDField
      FieldName = 'Total'
      Origin = '"Total"'
      Precision = 38
      Size = 38
    end
  end
  object DtsEstVendPerdid: TDataSource
    DataSet = QryEstVendPerdid
    Left = 377
    Top = 392
  end
  object QryEstVendPerdid: TFDQuery
    Connection = Bravos
    SQL.Strings = (
      'select DISTINCT(count(*)) Total'
      'from GER_USUARIO GU1, GER_USUARIO GU2, CAC_CONTATO CAC '
      'inner join CAC_FORMA_CONTATO CFC '
      
        'on (CAC.EMPRESA = CFC.EMPRESA and CAC.FORMA_CONTATO = CFC.FORMA_' +
        'CONTATO) '
      'inner join FAT_CLIENTE FC on (CAC.CLIENTE = FC.CLIENTE) '
      'inner join FAT_VENDEDOR FV on (CAC.EMPRESA = FV.EMPRESA '
      
        'and CAC.REVENDA = FV.REVENDA and CAC.USUARIO_ENCAMINHADO = FV.US' +
        'UARIO) '
      'left join CAC_INTERESSE CI '
      'on (CAC.EMPRESA = CI.EMPRESA and CAC.REVENDA = CI.REVENDA '
      'and CAC.CONTATO = CI.CONTATO) '
      'left join CAC_PROVIDENCIA CP on (CAC.EMPRESA = CP.EMPRESA '
      'and CAC.REVENDA = CP.REVENDA and CAC.CONTATO = CP.CONTATO '
      'and CP.TIPO_PROVIDENCIA = '#39'F'#39')'
      'INNER JOIN GER_MOTIVO GMO '
      'ON (CP.EMPRESA = GMO.EMPRESA) '
      'AND (CP.REVENDA = GMO.REVENDA) '
      'AND (CP.MOTIVO = GMO.MOTIVO) '
      'where CFC.TIPO_FORMA_CONTATO in (1,2,3,4) '
      'and CAC.ORIGEM = '#39'V'#39' '
      'and GU1.USUARIO = CAC.USUARIO_ABRIU '
      'and GU2.USUARIO = CAC.USUARIO_ENCAMINHADO '
      'AND CAC.DEPARTAMENTO in (:departamento, :departamento2)'
      'and CP.DTA_PROVIDENCIA >= TO_DATE(:inicio,'#39'dd/mm/yyyy'#39') '
      'and CP.DTA_PROVIDENCIA < TO_DATE(:fim,'#39'dd/mm/yyyy'#39')+1'
      'and CP.PROVIDENCIA = (select max(providencia) '
      'from CAC_PROVIDENCIA CP1 '
      'where CP1.EMPRESA = CAC.EMPRESA '
      'AND CP1.REVENDA = CAC.REVENDA '
      'and CAC.origem = '#39'V'#39
      'AND CP1.CONTATO = CAC.CONTATO) '
      'and CAC.RESULTADO = '#39'P'#39' '
      'and CAC.SITUACAO = '#39'F'#39)
    Left = 473
    Top = 392
    ParamData = <
      item
        Name = 'DEPARTAMENTO'
        DataType = ftString
        ParamType = ptInput
        Value = '100'
      end
      item
        Name = 'DEPARTAMENTO2'
        DataType = ftString
        ParamType = ptInput
        Value = '110'
      end
      item
        Name = 'INICIO'
        DataType = ftString
        ParamType = ptInput
        Value = '25/09/2024'
      end
      item
        Name = 'FIM'
        DataType = ftString
        ParamType = ptInput
        Value = '25/09/2024'
      end>
    object QryEstVendPerdidTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      Precision = 38
      Size = 38
    end
  end
  object DtsEstAtivos: TDataSource
    DataSet = QryEstAtivos
    Left = 377
    Top = 440
  end
  object QryEstAtivos: TFDQuery
    Connection = Bravos
    SQL.Strings = (
      'select DISTINCT(count(*)) Total'
      'from FAT_CLIENTE FC, '
      'CAC_CONTATO CC '
      'INNER JOIN FAT_VENDEDOR FVE'
      'ON CC.USUARIO_ABRIU = FVE.USUARIO'
      'AND CC.REVENDA = FVE.REVENDA'
      'where CC.EMPRESA = 1 and FC.CLIENTE = CC.CLIENTE '
      'and cc.dta_contato >= To_Date(:inicio,'#39'dd/mm/yyyy'#39') '
      'and CC.origem = '#39'V'#39
      'and cc.dta_contato < To_Date(:fim, '#39'dd/mm/yyyy'#39')+1'
      'and CC.DEPARTAMENTO in (:departamento, :departamento2)'
      
        'and FVE.USUARIO in (select UU.USUARIO from GER_USUARIO UU where ' +
        'not UU.USUARIO = 434 and UU.GERENTE in (257, 343, 268) )'
      'and CC.ATIVO_PASSIVO = '#39'A'#39)
    Left = 473
    Top = 440
    ParamData = <
      item
        Name = 'INICIO'
        DataType = ftString
        ParamType = ptInput
        Value = '25/09/2024'
      end
      item
        Name = 'FIM'
        DataType = ftString
        ParamType = ptInput
        Value = '25/09/2024'
      end
      item
        Name = 'DEPARTAMENTO'
        DataType = ftString
        ParamType = ptInput
        Value = '100'
      end
      item
        Name = 'DEPARTAMENTO2'
        DataType = ftString
        ParamType = ptInput
        Value = '110'
      end>
    object QryEstAtivosTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      Precision = 38
      Size = 38
    end
  end
  object DtsEstReceptivos: TDataSource
    DataSet = QryEstReceptivos
    Left = 281
    Top = 488
  end
  object QryEstReceptivos: TFDQuery
    Connection = Bravos
    SQL.Strings = (
      'select DISTINCT(count(*)) Total'
      'from FAT_CLIENTE FC, '
      'CAC_CONTATO CC '
      'INNER JOIN FAT_VENDEDOR FVE'
      'ON CC.USUARIO_ABRIU = FVE.USUARIO'
      'AND CC.REVENDA = FVE.REVENDA'
      'where CC.EMPRESA = 1 and FC.CLIENTE = CC.CLIENTE '
      'and cc.dta_contato >= To_Date(:inicio,'#39'dd/mm/yyyy'#39') '
      'and CC.origem = '#39'V'#39
      'and cc.dta_contato < To_Date(:fim, '#39'dd/mm/yyyy'#39')+1'
      'and CC.DEPARTAMENTO in (:departamento, :departamento2)'
      
        'and FVE.USUARIO in (select UU.USUARIO from GER_USUARIO UU where ' +
        'not UU.USUARIO = 434 and UU.GERENTE in (257, 343, 268) )'
      'and CC.ATIVO_PASSIVO = '#39'P'#39)
    Left = 377
    Top = 488
    ParamData = <
      item
        Name = 'INICIO'
        DataType = ftString
        ParamType = ptInput
        Value = '25/09/2024'
      end
      item
        Name = 'FIM'
        DataType = ftString
        ParamType = ptInput
        Value = '25/09/2024'
      end
      item
        Name = 'DEPARTAMENTO'
        DataType = ftString
        ParamType = ptInput
        Value = '100'
      end
      item
        Name = 'DEPARTAMENTO2'
        DataType = ftString
        ParamType = ptInput
        Value = '110'
      end>
    object QryEstReceptivosTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      Precision = 38
      Size = 38
    end
  end
  object DtsPainelVendasVU: TDataSource
    DataSet = QryPainelVendasVU
    Left = 593
    Top = 232
  end
  object QryPainelVendasVU: TFDQuery
    Connection = Bravos
    SQL.Strings = (
      ''
      'Select '
      #9'REGEXP_SUBSTR(FVE.NOME,'#39'(\w+)'#39',1,1) as "Vendedor", '
      
        #9'sum((case when (CCO.DTA_CONTATO >= To_Date(:inicio0,'#39'dd/mm/yyyy' +
        #39') '
      #9#9'and CCO.DTA_CONTATO < To_Date(:fim0, '#39'dd/mm/yyyy'#39')+1) '
      
        #9#9'and FVE.USUARIO = CCO.USUARIO_ABRIU then 1 else 0 end)) as "To' +
        'tal Atendimentos",'
      
        '    sum((case when (CCO.DTA_CONTATO >= To_Date(:inicio1,'#39'dd/mm/y' +
        'yyy'#39') '
      #9#9'and CCO.DTA_CONTATO < To_Date(:fim1, '#39'dd/mm/yyyy'#39')+1)'
      '        and CCO.ATIVO_PASSIVO = '#39'A'#39' '
      
        #9#9'and FVE.USUARIO = CCO.USUARIO_ABRIU then 1 else 0 end)) as "At' +
        'ivos", '
      
        '    sum((case when CCO.ATIVO_PASSIVO = '#39'P'#39' and (CCO.DTA_CONTATO ' +
        '>= To_Date(:inicio2,'#39'dd/mm/yyyy'#39') '
      #9#9'and CCO.DTA_CONTATO < To_Date(:fim2, '#39'dd/mm/yyyy'#39')+1) '
      
        #9#9'and FVE.USUARIO = CCO.USUARIO_ABRIU then 1 else 0 end)) as "Re' +
        'ceptivos",'
      
        '    sum((case when CCO.FORMA_CONTATO = 1 and (CCO.DTA_CONTATO >=' +
        ' To_Date(:inicio3,'#39'dd/mm/yyyy'#39') '
      #9#9'and CCO.DTA_CONTATO < To_Date(:fim3, '#39'dd/mm/yyyy'#39')+1) '
      
        #9#9'and FVE.USUARIO = CCO.USUARIO_ABRIU then 1 else 0 end)) as "Sh' +
        'owroom",'
      
        '    '#9'sum((case when CCO.FORMA_CONTATO = 2 and (CCO.DTA_CONTATO >' +
        '=To_Date(:inicio4,'#39'dd/mm/yyyy'#39')  '
      #9#9'and CCO.DTA_CONTATO < To_Date(:fim4, '#39'dd/mm/yyyy'#39')+1) '
      
        #9#9'and FVE.USUARIO = CCO.USUARIO_ABRIU then 1 else 0 end)) as "Te' +
        'lefone",'
      
        '    '#9'sum((case when COT.DES_ORIGEM_TRAFEGO like '#39'%LEAD%'#39' and (CC' +
        'O.DTA_CONTATO >=To_Date(:inicio5,'#39'dd/mm/yyyy'#39') '
      ' '#9#9'and CCO.DTA_CONTATO < To_Date(:fim5, '#39'dd/mm/yyyy'#39')+1) '
      
        #9#9'and FVE.USUARIO = CCO.USUARIO_ABRIU then 1 else 0 end)) as "Le' +
        'ad",  '
      #9'sum((case when CCO.SITUACAO = '#39'F'#39' and CCO.RESULTADO = '#39'R'#39' '
      #9#9'and (CCO.DTA_FECHAMENTO >= To_Date(:inicio6,'#39'dd/mm/yyyy'#39') '
      #9#9'and CCO.DTA_FECHAMENTO < To_Date(:fim6, '#39'dd/mm/yyyy'#39')+1)'
      
        #9#9'and FVE.USUARIO = CCO.USUARIO_ENCAMINHADO  then 1 else 0 end))' +
        ' as "Total Vendas", '
      
        '        sum((case when CCO.CONTATO in(select FMC.CONTATO from FA' +
        'T_MOVIMENTO_CAPA FMC, FAT_TIPO_TRANSACAO FTT '
      #9#9'where FMC.EMPRESA = CCO.EMPRESA '
      #9#9'and FMC.REVENDA = CCO.REVENDA '
      
        '        '#9'and (CCO.DTA_FECHAMENTO >= To_Date(:inicio7,'#39'dd/mm/yyyy' +
        #39') '
      #9#9'and CCO.DTA_FECHAMENTO < To_Date(:fim7, '#39'dd/mm/yyyy'#39')+1)'
      '        '#9'and CCO.SITUACAO = '#39'F'#39' '
      '        '#9'and CCO.RESULTADO = '#39'R'#39
      #9#9'and FMC.CONTATO = CCO.CONTATO '
      #9#9'and FMC.TIPO_TRANSACAO = FTT.TIPO_TRANSACAO '
      #9#9'and FTT.SUBTIPO_TRANSACAO = '#39'N'#39
      '        '#9'and FVE.USUARIO = CCO.USUARIO_ENCAMINHADO'
      
        #9#9'and not FTT.SUBTIPO_TRANSACAO in ('#39'T'#39', '#39'S'#39', '#39'D'#39')) then 1 else ' +
        '0 end)) as "Venda Loja", '
      '    '#9'sum((case when CCO.SITUACAO = '#39'F'#39' and CCO.RESULTADO = '#39'R'#39' '
      #9#9'and (CCO.DTA_FECHAMENTO >= To_Date(:inicio8,'#39'dd/mm/yyyy'#39') '
      #9#9'and CCO.DTA_FECHAMENTO < To_Date(:fim8, '#39'dd/mm/yyyy'#39')+1)'
      
        #9#9'and FVE.USUARIO = CCO.USUARIO_ENCAMINHADO  then 1 else 0 end))' +
        ' '
      
        '    '#9'- sum((case when CCO.CONTATO in(select FMC.CONTATO from FAT' +
        '_MOVIMENTO_CAPA FMC, FAT_TIPO_TRANSACAO FTT '
      #9#9'where FMC.EMPRESA = CCO.EMPRESA '
      #9#9'and FMC.REVENDA = CCO.REVENDA '
      
        '        '#9'and (CCO.DTA_FECHAMENTO >= To_Date(:inicio9,'#39'dd/mm/yyyy' +
        #39') '
      #9#9'and CCO.DTA_FECHAMENTO < To_Date(:fim9, '#39'dd/mm/yyyy'#39')+1)'
      '        '#9'and CCO.SITUACAO = '#39'F'#39' '
      '        '#9'and CCO.RESULTADO = '#39'R'#39
      #9#9'and FMC.CONTATO = CCO.CONTATO '
      #9#9'and FMC.TIPO_TRANSACAO = FTT.TIPO_TRANSACAO '
      #9#9'and FTT.SUBTIPO_TRANSACAO = '#39'N'#39
      '        '#9'and FVE.USUARIO = CCO.USUARIO_ENCAMINHADO'
      
        #9#9'and not FTT.SUBTIPO_TRANSACAO in ('#39'T'#39', '#39'S'#39', '#39'D'#39')) then 1 else ' +
        '0 end))  as "Venda Direta",'
      ''
      
        #9'sum((case when CP.DTA_PROVIDENCIA>= TO_DATE(:inicio10,'#39'dd/mm/yy' +
        'yy'#39') '
      #9#9'and CP.DTA_PROVIDENCIA < TO_DATE(:fim10,'#39'dd/mm/yyyy'#39') +1'
      '                and CCO.RESULTADO = '#39'P'#39' '
      #9#9'and CCO.SITUACAO = '#39'F'#39
      
        '                and FVE.USUARIO = CCO.USUARIO_ENCAMINHADO then 1' +
        ' else 0 end)) as "Vendas Perdidas"'
      '    '
      'from '
      #9'CAC_ORIGEM_TRAFEGO COT,  FAT_VENDEDOR FVE, CAC_CONTATO CCO '
      'left join '
      #9'CAC_PROVIDENCIA CP '
      '    '#9'on (CCO.EMPRESA = CP.EMPRESA '
      #9'and CCO.REVENDA = CP.REVENDA '
      '    '#9'and CCO.CONTATO = CP.CONTATO )    '
      'where '
      #9'CCO.REVENDA in (1) '
      #9'and CCO.ORIGEM = '#39'V'#39' '
      #9'and FVE.EMPRESA = CCO.EMPRESA '
      #9'and FVE.REVENDA = CCO.REVENDA '
      '        and COT.ORIGEM_TRAFEGO = CCO.ORIGEM_TRAFEGO '
      #9'and CCO.DEPARTAMENTO IN (200,210) '
      '    '#9'and FVE.USUARIO in ('
      #9#9'select UU.USUARIO from GER_USUARIO UU where'
      #9#9#9'not UU.USUARIO in (434,614) and UU.GERENTE in (268) )'
      '    '#9#9#9'and CP.PROVIDENCIA = (select max(providencia) '
      #9#9'from CAC_PROVIDENCIA CP1 '
      #9#9'where CP1.EMPRESA = CCO.EMPRESA '
      #9#9#9'AND CP1.REVENDA = CCO.REVENDA '
      #9#9#9'AND CP1.CONTATO = CCO.CONTATO)'
      ''
      'group by FVE.NOME '
      'order by FVE.NOME')
    Left = 698
    Top = 232
    ParamData = <
      item
        Name = 'INICIO0'
        ParamType = ptInput
      end
      item
        Name = 'FIM0'
        ParamType = ptInput
      end
      item
        Name = 'INICIO1'
        ParamType = ptInput
      end
      item
        Name = 'FIM1'
        ParamType = ptInput
      end
      item
        Name = 'INICIO2'
        ParamType = ptInput
      end
      item
        Name = 'FIM2'
        ParamType = ptInput
      end
      item
        Name = 'INICIO3'
        ParamType = ptInput
      end
      item
        Name = 'FIM3'
        ParamType = ptInput
      end
      item
        Name = 'INICIO4'
        ParamType = ptInput
      end
      item
        Name = 'FIM4'
        ParamType = ptInput
      end
      item
        Name = 'INICIO5'
        ParamType = ptInput
      end
      item
        Name = 'FIM5'
        ParamType = ptInput
      end
      item
        Name = 'INICIO6'
        ParamType = ptInput
      end
      item
        Name = 'FIM6'
        ParamType = ptInput
      end
      item
        Name = 'INICIO7'
        ParamType = ptInput
      end
      item
        Name = 'FIM7'
        ParamType = ptInput
      end
      item
        Name = 'INICIO8'
        ParamType = ptInput
      end
      item
        Name = 'FIM8'
        ParamType = ptInput
      end
      item
        Name = 'INICIO9'
        ParamType = ptInput
      end
      item
        Name = 'FIM9'
        ParamType = ptInput
      end
      item
        Name = 'INICIO10'
        ParamType = ptInput
      end
      item
        Name = 'FIM10'
        ParamType = ptInput
      end>
  end
  object DtsPainelVendasVN: TDataSource
    DataSet = QryPainelVendasVN
    Left = 593
    Top = 280
  end
  object QryPainelVendasVN: TFDQuery
    Connection = Bravos
    SQL.Strings = (
      ''
      'Select '
      #9'REGEXP_SUBSTR(FVE.NOME,'#39'(\w+)'#39',1,1) as "Vendedor", '
      
        #9'sum((case when (CCO.DTA_CONTATO >= To_Date(:inicio0,'#39'dd/mm/yyyy' +
        #39') '
      #9#9'and CCO.DTA_CONTATO < To_Date(:fim0, '#39'dd/mm/yyyy'#39')+1) '
      
        #9#9'and FVE.USUARIO = CCO.USUARIO_ABRIU then 1 else 0 end)) as "To' +
        'tal Atendimentos",'
      
        '    sum((case when (CCO.DTA_CONTATO >= To_Date(:inicio1,'#39'dd/mm/y' +
        'yyy'#39') '
      #9#9'and CCO.DTA_CONTATO < To_Date(:fim1, '#39'dd/mm/yyyy'#39')+1)'
      '        and CCO.ATIVO_PASSIVO = '#39'A'#39' '
      
        #9#9'and FVE.USUARIO = CCO.USUARIO_ABRIU then 1 else 0 end)) as "At' +
        'ivos", '
      
        '    sum((case when CCO.ATIVO_PASSIVO = '#39'P'#39' and (CCO.DTA_CONTATO ' +
        '>= To_Date(:inicio2,'#39'dd/mm/yyyy'#39') '
      #9#9'and CCO.DTA_CONTATO < To_Date(:fim2, '#39'dd/mm/yyyy'#39')+1) '
      
        #9#9'and FVE.USUARIO = CCO.USUARIO_ABRIU then 1 else 0 end)) as "Re' +
        'ceptivos",'
      
        '    sum((case when CCO.FORMA_CONTATO = 1 and (CCO.DTA_CONTATO >=' +
        ' To_Date(:inicio3,'#39'dd/mm/yyyy'#39') '
      #9#9'and CCO.DTA_CONTATO < To_Date(:fim3, '#39'dd/mm/yyyy'#39')+1) '
      
        #9#9'and FVE.USUARIO = CCO.USUARIO_ABRIU then 1 else 0 end)) as "Sh' +
        'owroom",'
      
        '    '#9'sum((case when CCO.FORMA_CONTATO = 2 and (CCO.DTA_CONTATO >' +
        '=To_Date(:inicio4,'#39'dd/mm/yyyy'#39')  '
      #9#9'and CCO.DTA_CONTATO < To_Date(:fim4, '#39'dd/mm/yyyy'#39')+1) '
      
        #9#9'and FVE.USUARIO = CCO.USUARIO_ABRIU then 1 else 0 end)) as "Te' +
        'lefone",'
      
        '    '#9'sum((case when COT.DES_ORIGEM_TRAFEGO like '#39'%LEAD%'#39' and (CC' +
        'O.DTA_CONTATO >=To_Date(:inicio5,'#39'dd/mm/yyyy'#39') '
      ' '#9#9'and CCO.DTA_CONTATO < To_Date(:fim5, '#39'dd/mm/yyyy'#39')+1) '
      
        #9#9'and FVE.USUARIO = CCO.USUARIO_ABRIU then 1 else 0 end)) as "Le' +
        'ad",  '
      #9'sum((case when CCO.SITUACAO = '#39'F'#39' and CCO.RESULTADO = '#39'R'#39' '
      #9#9'and (CCO.DTA_FECHAMENTO >= To_Date(:inicio6,'#39'dd/mm/yyyy'#39') '
      #9#9'and CCO.DTA_FECHAMENTO < To_Date(:fim6, '#39'dd/mm/yyyy'#39')+1)'
      
        #9#9'and FVE.USUARIO = CCO.USUARIO_ENCAMINHADO  then 1 else 0 end))' +
        ' as "Total Vendas", '
      
        '        sum((case when CCO.CONTATO in(select FMC.CONTATO from FA' +
        'T_MOVIMENTO_CAPA FMC, FAT_TIPO_TRANSACAO FTT '
      #9#9'where FMC.EMPRESA = CCO.EMPRESA '
      #9#9'and FMC.REVENDA = CCO.REVENDA '
      
        '        '#9'and (CCO.DTA_FECHAMENTO >= To_Date(:inicio7,'#39'dd/mm/yyyy' +
        #39') '
      #9#9'and CCO.DTA_FECHAMENTO < To_Date(:fim7, '#39'dd/mm/yyyy'#39')+1)'
      '        '#9'and CCO.SITUACAO = '#39'F'#39' '
      '        '#9'and CCO.RESULTADO = '#39'R'#39
      #9#9'and FMC.CONTATO = CCO.CONTATO '
      #9#9'and FMC.TIPO_TRANSACAO = FTT.TIPO_TRANSACAO '
      #9#9'and FTT.SUBTIPO_TRANSACAO = '#39'N'#39
      '        '#9'and FVE.USUARIO = CCO.USUARIO_ENCAMINHADO'
      
        #9#9'and not FTT.SUBTIPO_TRANSACAO in ('#39'T'#39', '#39'S'#39', '#39'D'#39')) then 1 else ' +
        '0 end)) as "Venda Loja", '
      '    '#9'sum((case when CCO.SITUACAO = '#39'F'#39' and CCO.RESULTADO = '#39'R'#39' '
      #9#9'and (CCO.DTA_FECHAMENTO >= To_Date(:inicio8,'#39'dd/mm/yyyy'#39') '
      #9#9'and CCO.DTA_FECHAMENTO < To_Date(:fim8, '#39'dd/mm/yyyy'#39')+1)'
      
        #9#9'and FVE.USUARIO = CCO.USUARIO_ENCAMINHADO  then 1 else 0 end))' +
        ' '
      
        '    '#9'- sum((case when CCO.CONTATO in(select FMC.CONTATO from FAT' +
        '_MOVIMENTO_CAPA FMC, FAT_TIPO_TRANSACAO FTT '
      #9#9'where FMC.EMPRESA = CCO.EMPRESA '
      #9#9'and FMC.REVENDA = CCO.REVENDA '
      
        '        '#9'and (CCO.DTA_FECHAMENTO >= To_Date(:inicio9,'#39'dd/mm/yyyy' +
        #39') '
      #9#9'and CCO.DTA_FECHAMENTO < To_Date(:fim9, '#39'dd/mm/yyyy'#39')+1)'
      '        '#9'and CCO.SITUACAO = '#39'F'#39' '
      '        '#9'and CCO.RESULTADO = '#39'R'#39
      #9#9'and FMC.CONTATO = CCO.CONTATO '
      #9#9'and FMC.TIPO_TRANSACAO = FTT.TIPO_TRANSACAO '
      #9#9'and FTT.SUBTIPO_TRANSACAO = '#39'N'#39
      '        '#9'and FVE.USUARIO = CCO.USUARIO_ENCAMINHADO'
      
        #9#9'and not FTT.SUBTIPO_TRANSACAO in ('#39'T'#39', '#39'S'#39', '#39'D'#39')) then 1 else ' +
        '0 end))  as "Venda Direta",'
      ''
      
        #9'sum((case when CP.DTA_PROVIDENCIA>= TO_DATE(:inicio10,'#39'dd/mm/yy' +
        'yy'#39') '
      #9#9'and CP.DTA_PROVIDENCIA < TO_DATE(:fim10,'#39'dd/mm/yyyy'#39') +1'
      '                and CCO.RESULTADO = '#39'P'#39' '
      #9#9'and CCO.SITUACAO = '#39'F'#39
      
        '                and FVE.USUARIO = CCO.USUARIO_ENCAMINHADO then 1' +
        ' else 0 end)) as "Vendas Perdidas"'
      '    '
      'from '
      #9'CAC_ORIGEM_TRAFEGO COT,  FAT_VENDEDOR FVE, CAC_CONTATO CCO '
      'left join '
      #9'CAC_PROVIDENCIA CP '
      '    '#9'on (CCO.EMPRESA = CP.EMPRESA '
      #9'and CCO.REVENDA = CP.REVENDA '
      '    '#9'and CCO.CONTATO = CP.CONTATO )    '
      'where '
      #9'CCO.REVENDA = 1 '
      #9'and CCO.ORIGEM = '#39'V'#39' '
      #9'and FVE.EMPRESA = CCO.EMPRESA '
      #9'and FVE.REVENDA = CCO.REVENDA '
      '        and COT.ORIGEM_TRAFEGO = CCO.ORIGEM_TRAFEGO '
      #9'and CCO.DEPARTAMENTO IN (100,110) '
      '    '#9'and FVE.USUARIO in ('
      #9#9'select UU.USUARIO from GER_USUARIO UU where'
      #9#9#9'not UU.USUARIO in (434, 320, 505, 587, 599)  '
      '                        and UU.GERENTE in (257, 343) '
      '                        and UU.ATIVO = '#39'S'#39')'
      '    '#9#9#9'and CP.PROVIDENCIA = (select max(providencia) '
      #9#9'from CAC_PROVIDENCIA CP1 '
      #9#9'where CP1.EMPRESA = CCO.EMPRESA '
      #9#9#9'AND CP1.REVENDA = CCO.REVENDA '
      #9#9#9'AND CP1.CONTATO = CCO.CONTATO)'
      ''
      'group by FVE.NOME '
      'order by FVE.NOME')
    Left = 698
    Top = 280
    ParamData = <
      item
        Name = 'INICIO0'
        ParamType = ptInput
      end
      item
        Name = 'FIM0'
        ParamType = ptInput
      end
      item
        Name = 'INICIO1'
        DataType = ftString
        ParamType = ptInput
        Value = '01/09/2024'
      end
      item
        Name = 'FIM1'
        DataType = ftString
        ParamType = ptInput
        Value = '30/09/2024'
      end
      item
        Name = 'INICIO2'
        DataType = ftString
        ParamType = ptInput
        Value = '01/09/2024'
      end
      item
        Name = 'FIM2'
        DataType = ftString
        ParamType = ptInput
        Value = '30/09/2024'
      end
      item
        Name = 'INICIO3'
        DataType = ftString
        ParamType = ptInput
        Value = '01/09/2024'
      end
      item
        Name = 'FIM3'
        DataType = ftString
        ParamType = ptInput
        Value = '30/09/2024'
      end
      item
        Name = 'INICIO4'
        DataType = ftString
        ParamType = ptInput
        Value = '01/09/2024'
      end
      item
        Name = 'FIM4'
        DataType = ftString
        ParamType = ptInput
        Value = '30/09/2024'
      end
      item
        Name = 'INICIO5'
        DataType = ftString
        ParamType = ptInput
        Value = '01/09/2024'
      end
      item
        Name = 'FIM5'
        DataType = ftString
        ParamType = ptInput
        Value = '30/09/2024'
      end
      item
        Name = 'INICIO6'
        DataType = ftString
        ParamType = ptInput
        Value = '01/09/2024'
      end
      item
        Name = 'FIM6'
        DataType = ftString
        ParamType = ptInput
        Value = '30/09/2024'
      end
      item
        Name = 'INICIO7'
        DataType = ftString
        ParamType = ptInput
        Value = '01/09/2024'
      end
      item
        Name = 'FIM7'
        DataType = ftString
        ParamType = ptInput
        Value = '30/09/2024'
      end
      item
        Name = 'INICIO8'
        DataType = ftString
        ParamType = ptInput
        Value = '01/09/2024'
      end
      item
        Name = 'FIM8'
        DataType = ftString
        ParamType = ptInput
        Value = '30/09/2024'
      end
      item
        Name = 'INICIO9'
        DataType = ftString
        ParamType = ptInput
        Value = '01/09/2024'
      end
      item
        Name = 'FIM9'
        DataType = ftString
        ParamType = ptInput
        Value = '30/09/2024'
      end
      item
        Name = 'INICIO10'
        DataType = ftString
        ParamType = ptInput
        Value = '01/09/2024'
      end
      item
        Name = 'FIM10'
        DataType = ftString
        ParamType = ptInput
        Value = '30/09/2024'
      end>
    object QryPainelVendasVNVendedor: TStringField
      FieldName = 'Vendedor'
      Origin = '"Vendedor"'
      Size = 50
    end
    object QryPainelVendasVNTotalAtendimentos: TFMTBCDField
      FieldName = 'Total Atendimentos'
      Origin = '"Total Atendimentos"'
      Precision = 38
      Size = 38
    end
    object QryPainelVendasVNAtivos: TFMTBCDField
      FieldName = 'Ativos'
      Origin = '"Ativos"'
      Precision = 38
      Size = 38
    end
    object QryPainelVendasVNReceptivos: TFMTBCDField
      FieldName = 'Receptivos'
      Origin = '"Receptivos"'
      Precision = 38
      Size = 38
    end
    object QryPainelVendasVNShowroom: TFMTBCDField
      FieldName = 'Showroom'
      Origin = '"Showroom"'
      Precision = 38
      Size = 38
    end
    object QryPainelVendasVNTelefone: TFMTBCDField
      FieldName = 'Telefone'
      Origin = '"Telefone"'
      Precision = 38
      Size = 38
    end
    object QryPainelVendasVNLead: TFMTBCDField
      FieldName = 'Lead'
      Origin = '"Lead"'
      Precision = 38
      Size = 38
    end
    object QryPainelVendasVNTotalVendas: TFMTBCDField
      FieldName = 'Total Vendas'
      Origin = '"Total Vendas"'
      Precision = 38
      Size = 38
    end
    object QryPainelVendasVNVendaLoja: TFMTBCDField
      FieldName = 'Venda Loja'
      Origin = '"Venda Loja"'
      Precision = 38
      Size = 38
    end
    object QryPainelVendasVNVendaDireta: TFMTBCDField
      FieldName = 'Venda Direta'
      Origin = '"Venda Direta"'
      Precision = 38
      Size = 38
    end
    object QryPainelVendasVNVendasPerdidas: TFMTBCDField
      FieldName = 'Vendas Perdidas'
      Origin = '"Vendas Perdidas"'
      Precision = 38
      Size = 38
    end
  end
end

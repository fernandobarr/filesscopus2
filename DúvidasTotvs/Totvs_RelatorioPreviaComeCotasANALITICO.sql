USE BRD_ACT_YMF_COT
GO


SELECT COT_POSICAO_NOTA.ID_NOTA,
       COT_POSICAO_NOTA.DT_APLICACAO,
       COT_POSICAO_NOTA.DT_POSICAO,
       COT_COTISTA.CD_COTISTA,
       COT_CLIENTE_COTISTA.NM_CLIENTE NM_COTISTA,
       COT_FUNDO.CD_FUNDO,
       COT_CLIENTE_FUNDO.NM_CLIENTE NM_FUNDO,
       COT_FUNDO.CD_EMPRESA,
       COT_CLIENTE_EMPRESA.NM_CLIENTE NM_EMPRESA,
       COT_POSICAO_NOTA.VL_IR + ISNULL( RESGATE.VL_IR, 0 ) + ISNULL( RESGATE_PROV.VL_IR, 0 ) VL_IR,
       ISNULL( SUBSTRING( COT_FUNDO_DESENQUADRAMENTO.CD_DESENQ, 1, 1 ), COT_FUNDO_IR.IC_LC_CARTEIRA_FUNDO ) IC_LC_CARTEIRA_FUNDO,
       COT_POSICAO_RENDIMENTO.VL_RENDIMENTO + ISNULL( RESGATE.VL_RENDIMENTO, 0 ) + ISNULL( RESGATE_PROV.VL_RENDIMENTO, 0 ) VL_RENDIMENTO,
       COT_POSICAO_NOTA.DT_ULTIMO_RESGATE_IR, 
       COT_POSICAO_RENDIMENTO.PC_ALIQUOTA,
       COT_POSICAO_RENDIMENTO.CD_RENDIMENTO,
       COT_FUNDO_DESENQUADRAMENTO.CD_ALIQUOTA_IR,
       CASE WHEN ( COT_TIPO_COTISTA.IC_SN_ISENTO_IR = 'N' OR ( COT_TIPO_COTISTA.IC_SN_ISENTO_IR = 'S' AND IC_SN_IR_CONTA_ORDEM = 'S' ) ) THEN
          'T' ELSE 'I' END IC_IT_ISENTO_TRIBUTAVEL
  FROM COT_POSICAO_NOTA
       INNER JOIN COT_COTISTA
         INNER JOIN COT_CLIENTE COT_CLIENTE_COTISTA
                 ON COT_CLIENTE_COTISTA.CD_CLIENTE = COT_COTISTA.CD_CLIENTE
         INNER JOIN COT_TIPO_COTISTA
                 ON COT_COTISTA.ID_TIPO_COTISTA = COT_TIPO_COTISTA.ID_TIPO_COTISTA
               ON COT_POSICAO_NOTA.CD_COTISTA = COT_COTISTA.CD_COTISTA
       INNER JOIN COT_FUNDO
         INNER JOIN COT_CLIENTE COT_CLIENTE_FUNDO
                 ON COT_CLIENTE_FUNDO.CD_CLIENTE = COT_FUNDO.CD_CLIENTE
               ON COT_POSICAO_NOTA.CD_FUNDO = COT_FUNDO.CD_FUNDO
       INNER JOIN COT_EMPRESA
          INNER JOIN COT_CLIENTE COT_CLIENTE_EMPRESA
                  ON COT_CLIENTE_EMPRESA.CD_CLIENTE = COT_EMPRESA.CD_CLIENTE
                ON COT_EMPRESA.CD_EMPRESA = COT_FUNDO.CD_EMPRESA
       INNER JOIN COT_FUNDO_PARAMETRO 
               ON COT_FUNDO.CD_FUNDO = COT_FUNDO_PARAMETRO.CD_FUNDO
              AND COT_POSICAO_NOTA.DT_POSICAO BETWEEN COT_FUNDO_PARAMETRO.DT_INICIO_VALIDADE AND COT_FUNDO_PARAMETRO.DT_FIM_VALIDADE
       INNER JOIN COT_POSICAO_FUNDO
               ON COT_POSICAO_FUNDO.CD_FUNDO = COT_FUNDO.CD_FUNDO 
              AND COT_POSICAO_FUNDO.DT_POSICAO = COT_POSICAO_NOTA.DT_POSICAO 
       INNER JOIN COT_FUNDO_IR
               ON COT_FUNDO_IR.CD_FUNDO = COT_FUNDO.CD_FUNDO
              AND COT_POSICAO_NOTA.DT_POSICAO BETWEEN COT_FUNDO_IR.DT_INICIO_IR AND COT_FUNDO_IR.DT_FIM_IR
       LEFT JOIN COT_POSICAO_RENDIMENTO
         INNER JOIN COT_MOVIMENTO
            ON COT_POSICAO_RENDIMENTO.ID_NOTA = COT_MOVIMENTO.ID_NOTA
         LEFT OUTER JOIN COT_FUNDO_DESENQUADRAMENTO
           ON COT_FUNDO_DESENQUADRAMENTO.CD_FUNDO = COT_MOVIMENTO.CD_FUNDO
          AND COT_FUNDO_DESENQUADRAMENTO.ID_DESENQ = COT_POSICAO_RENDIMENTO.ID_DESENQ
          AND COT_FUNDO_DESENQUADRAMENTO.CD_COBRANCA_IR IN ( 'R', 'N' )
         LEFT OUTER JOIN ( SELECT COT_RESGATE.ID_NOTA_APLICACAO ID_NOTA_APLICACAO, 
                                  COT_MOVIMENTO.DT_LIQUIDACAO_FISICA DT_LIQUIDACAO_FISICA, 
                                  COT_RESGATE_RENDIMENTO.CD_RENDIMENTO CD_RENDIMENTO,    
                                  COT_RESGATE_RENDIMENTO.ID_DESENQ ID_DESENQ,
                                  SUM( COT_RESGATE.VL_IR ) VL_IR, 
                                  SUM( COT_RESGATE_RENDIMENTO.VL_RENDIMENTO ) VL_RENDIMENTO
                             FROM COT_RESGATE
                            INNER JOIN COT_MOVIMENTO
                               ON COT_RESGATE.ID_NOTA = COT_MOVIMENTO.ID_NOTA
                            INNER JOIN COT_RESGATE_RENDIMENTO
                               ON COT_RESGATE.ID_NOTA = COT_RESGATE_RENDIMENTO.ID_NOTA
                              AND COT_RESGATE.ID_NOTA_APLICACAO = COT_RESGATE_RENDIMENTO.ID_NOTA_APLICACAO
                            GROUP BY COT_RESGATE.ID_NOTA_APLICACAO , 
                                  COT_MOVIMENTO.DT_LIQUIDACAO_FISICA , 
                                  COT_RESGATE_RENDIMENTO.CD_RENDIMENTO , 
                                  COT_RESGATE_RENDIMENTO.ID_DESENQ ) RESGATE
           ON RESGATE.ID_NOTA_APLICACAO = COT_POSICAO_RENDIMENTO.ID_NOTA
           AND RESGATE.DT_LIQUIDACAO_FISICA = COT_POSICAO_RENDIMENTO.DT_POSICAO
           AND RESGATE.CD_RENDIMENTO = COT_POSICAO_RENDIMENTO.CD_RENDIMENTO
           AND RESGATE.ID_DESENQ = COT_POSICAO_RENDIMENTO.ID_DESENQ
         LEFT OUTER JOIN ( SELECT COT_RESGATE_RENDIMENTO_PROV.ID_NOTA_APLICACAO ID_NOTA_APLICACAO,
                                  COT_RESGATE_RENDIMENTO_PROV.DT_POSICAO DT_POSICAO,
                                  COT_RESGATE_RENDIMENTO_PROV.CD_RENDIMENTO CD_RENDIMENTO,
                                  COT_RESGATE_RENDIMENTO_PROV.ID_DESENQ ID_DESENQ,
                                  SUM( COT_RESGATE_PROVISORIO.VL_IR ) VL_IR,
                                  SUM( COT_RESGATE_RENDIMENTO_PROV.VL_RENDIMENTO ) VL_RENDIMENTO
                             FROM COT_RESGATE_PROVISORIO
                            INNER JOIN COT_RESGATE_RENDIMENTO_PROV
                               ON COT_RESGATE_PROVISORIO.ID_NOTA = COT_RESGATE_RENDIMENTO_PROV.ID_NOTA
                              AND COT_RESGATE_PROVISORIO.ID_NOTA_APLICACAO = COT_RESGATE_RENDIMENTO_PROV.ID_NOTA_APLICACAO
                              AND COT_RESGATE_PROVISORIO.DT_POSICAO = COT_RESGATE_RENDIMENTO_PROV.DT_POSICAO
                            GROUP BY COT_RESGATE_RENDIMENTO_PROV.ID_NOTA_APLICACAO ,
                                  COT_RESGATE_RENDIMENTO_PROV.DT_POSICAO ,


                                  COT_RESGATE_RENDIMENTO_PROV.CD_RENDIMENTO ,
                                  COT_RESGATE_RENDIMENTO_PROV.ID_DESENQ ) RESGATE_PROV
           ON RESGATE_PROV.ID_NOTA_APLICACAO = COT_POSICAO_RENDIMENTO.ID_NOTA
           AND RESGATE_PROV.DT_POSICAO = COT_POSICAO_RENDIMENTO.DT_POSICAO   
           AND RESGATE_PROV.CD_RENDIMENTO = COT_POSICAO_RENDIMENTO.CD_RENDIMENTO
           AND RESGATE_PROV.ID_DESENQ = COT_POSICAO_RENDIMENTO.ID_DESENQ
         ON COT_POSICAO_NOTA.ID_NOTA = COT_POSICAO_RENDIMENTO.ID_NOTA 
        AND COT_POSICAO_NOTA.DT_POSICAO = COT_POSICAO_RENDIMENTO.DT_POSICAO 
        AND COT_POSICAO_RENDIMENTO.CD_RENDIMENTO IN ('RA','DR')
 WHERE COT_POSICAO_FUNDO.IC_AF_POSICAO = 'A'
   AND COT_FUNDO_IR.IC_FC_ALIQUOTA = 'C'
   AND COT_FUNDO_PARAMETRO.IC_SN_IR_AUTOMATICO = 'S'
   AND COT_POSICAO_NOTA.DT_POSICAO = :adt_posicao
   AND COT_FUNDO.CD_EMPRESA IN ( :as_empresa )
   AND COT_FUNDO.CD_FUNDO = :as_fundo
   AND COT_COTISTA.CD_COTISTA = :as_cotista
 AND COT_TIPO_COTISTA.IC_SN_IR_AUTOMATICO = 'S'
UNION
SELECT COT_POSICAO_NOTA_HISTORICO.ID_NOTA,
       COT_POSICAO_NOTA_HISTORICO.DT_APLICACAO,
       COT_POSICAO_NOTA_HISTORICO.DT_POSICAO,
       COT_COTISTA.CD_COTISTA,
       COT_CLIENTE_COTISTA.NM_CLIENTE NM_COTISTA,
       COT_FUNDO.CD_FUNDO,
       COT_CLIENTE_FUNDO.NM_CLIENTE NM_FUNDO,
       COT_FUNDO.CD_EMPRESA,
       COT_CLIENTE_EMPRESA.NM_CLIENTE NM_EMPRESA,
       COT_POSICAO_NOTA_HISTORICO.VL_IR + ISNULL( RESGATE.VL_IR, 0 ) + ISNULL( RESGATE_PROV.VL_IR, 0 ) VL_IR,
       ISNULL( SUBSTRING( COT_FUNDO_DESENQUADRAMENTO.CD_DESENQ, 1, 1 ), COT_FUNDO_IR.IC_LC_CARTEIRA_FUNDO ) IC_LC_CARTEIRA_FUNDO,
       COT_POSICAO_RENDIMENTO_HIST.VL_RENDIMENTO + ISNULL( RESGATE.VL_RENDIMENTO, 0 ) + ISNULL( RESGATE_PROV.VL_RENDIMENTO, 0 ) VL_RENDIMENTO,
       COT_POSICAO_NOTA_HISTORICO.DT_ULTIMO_RESGATE_IR, 
       COT_POSICAO_RENDIMENTO_HIST.PC_ALIQUOTA,
       COT_POSICAO_RENDIMENTO_HIST.CD_RENDIMENTO,
       COT_FUNDO_DESENQUADRAMENTO.CD_ALIQUOTA_IR,
       CASE WHEN ( COT_TIPO_COTISTA.IC_SN_ISENTO_IR = 'N' OR ( COT_TIPO_COTISTA.IC_SN_ISENTO_IR = 'S' AND IC_SN_IR_CONTA_ORDEM = 'S' ) ) THEN
          'T' ELSE 'I' END IC_IT_ISENTO_TRIBUTAVEL
  FROM COT_POSICAO_NOTA_HISTORICO
       INNER JOIN COT_COTISTA
         INNER JOIN COT_CLIENTE COT_CLIENTE_COTISTA
                 ON COT_CLIENTE_COTISTA.CD_CLIENTE = COT_COTISTA.CD_CLIENTE
         INNER JOIN COT_TIPO_COTISTA
                 ON COT_COTISTA.ID_TIPO_COTISTA = COT_TIPO_COTISTA.ID_TIPO_COTISTA
               ON COT_POSICAO_NOTA_HISTORICO.CD_COTISTA = COT_COTISTA.CD_COTISTA
       INNER JOIN COT_FUNDO
         INNER JOIN COT_CLIENTE COT_CLIENTE_FUNDO
                 ON COT_CLIENTE_FUNDO.CD_CLIENTE = COT_FUNDO.CD_CLIENTE
               ON COT_POSICAO_NOTA_HISTORICO.CD_FUNDO = COT_FUNDO.CD_FUNDO
       INNER JOIN COT_EMPRESA
          INNER JOIN COT_CLIENTE COT_CLIENTE_EMPRESA
                  ON COT_CLIENTE_EMPRESA.CD_CLIENTE = COT_EMPRESA.CD_CLIENTE
                ON COT_EMPRESA.CD_EMPRESA = COT_FUNDO.CD_EMPRESA
       INNER JOIN COT_FUNDO_PARAMETRO 
               ON COT_FUNDO.CD_FUNDO = COT_FUNDO_PARAMETRO.CD_FUNDO
              AND COT_POSICAO_NOTA_HISTORICO.DT_POSICAO BETWEEN COT_FUNDO_PARAMETRO.DT_INICIO_VALIDADE AND COT_FUNDO_PARAMETRO.DT_FIM_VALIDADE
       INNER JOIN COT_POSICAO_FUNDO
               ON COT_POSICAO_FUNDO.CD_FUNDO = COT_FUNDO.CD_FUNDO 
              AND COT_POSICAO_FUNDO.DT_POSICAO = COT_POSICAO_NOTA_HISTORICO.DT_POSICAO 
       INNER JOIN COT_FUNDO_IR
               ON COT_FUNDO_IR.CD_FUNDO = COT_FUNDO.CD_FUNDO
              AND COT_POSICAO_NOTA_HISTORICO.DT_POSICAO BETWEEN COT_FUNDO_IR.DT_INICIO_IR AND COT_FUNDO_IR.DT_FIM_IR
       LEFT JOIN COT_POSICAO_RENDIMENTO_HIST
         INNER JOIN COT_MOVIMENTO
            ON COT_POSICAO_RENDIMENTO_HIST.ID_NOTA = COT_MOVIMENTO.ID_NOTA
         LEFT OUTER JOIN COT_FUNDO_DESENQUADRAMENTO
           ON COT_FUNDO_DESENQUADRAMENTO.CD_FUNDO = COT_MOVIMENTO.CD_FUNDO
          AND COT_FUNDO_DESENQUADRAMENTO.ID_DESENQ = COT_POSICAO_RENDIMENTO_HIST.ID_DESENQ
          AND COT_FUNDO_DESENQUADRAMENTO.CD_COBRANCA_IR IN ( 'R', 'N' )
         LEFT OUTER JOIN ( SELECT COT_RESGATE.ID_NOTA_APLICACAO ID_NOTA_APLICACAO, 
                                  COT_MOVIMENTO.DT_LIQUIDACAO_FISICA DT_LIQUIDACAO_FISICA, 
                                  COT_RESGATE_RENDIMENTO.CD_RENDIMENTO CD_RENDIMENTO, 
                                  COT_RESGATE_RENDIMENTO.ID_DESENQ ID_DESENQ,
                                  SUM( COT_RESGATE.VL_IR ) VL_IR, 
                                  SUM( COT_RESGATE_RENDIMENTO.VL_RENDIMENTO ) VL_RENDIMENTO
                             FROM COT_RESGATE
                            INNER JOIN COT_MOVIMENTO
                               ON COT_RESGATE.ID_NOTA = COT_MOVIMENTO.ID_NOTA
                            INNER JOIN COT_RESGATE_RENDIMENTO
                               ON COT_RESGATE.ID_NOTA = COT_RESGATE_RENDIMENTO.ID_NOTA
                              AND COT_RESGATE.ID_NOTA_APLICACAO = COT_RESGATE_RENDIMENTO.ID_NOTA_APLICACAO
                            GROUP BY COT_RESGATE.ID_NOTA_APLICACAO , 
                                  COT_MOVIMENTO.DT_LIQUIDACAO_FISICA , 
                                  COT_RESGATE_RENDIMENTO.CD_RENDIMENTO , 
                                  COT_RESGATE_RENDIMENTO.ID_DESENQ ) RESGATE
           ON RESGATE.ID_NOTA_APLICACAO = COT_POSICAO_RENDIMENTO_HIST.ID_NOTA
          AND RESGATE.DT_LIQUIDACAO_FISICA = COT_POSICAO_RENDIMENTO_HIST.DT_POSICAO
          AND RESGATE.CD_RENDIMENTO = COT_POSICAO_RENDIMENTO_HIST.CD_RENDIMENTO
          AND RESGATE.ID_DESENQ = COT_POSICAO_RENDIMENTO_HIST.ID_DESENQ
         LEFT OUTER JOIN ( SELECT COT_RESGATE_RENDIMENTO_PROV.ID_NOTA_APLICACAO ID_NOTA_APLICACAO,
                                  COT_RESGATE_RENDIMENTO_PROV.DT_POSICAO DT_POSICAO,
                                  COT_RESGATE_RENDIMENTO_PROV.CD_RENDIMENTO CD_RENDIMENTO,
                                  COT_RESGATE_RENDIMENTO_PROV.ID_DESENQ ID_DESENQ,
                                  SUM( COT_RESGATE_PROVISORIO.VL_IR ) VL_IR,
                                  SUM( COT_RESGATE_RENDIMENTO_PROV.VL_RENDIMENTO ) VL_RENDIMENTO
                             FROM COT_RESGATE_PROVISORIO
                            INNER JOIN COT_RESGATE_RENDIMENTO_PROV
                            ON COT_RESGATE_PROVISORIO.ID_NOTA = COT_RESGATE_RENDIMENTO_PROV.ID_NOTA
                           AND COT_RESGATE_PROVISORIO.ID_NOTA_APLICACAO = COT_RESGATE_RENDIMENTO_PROV.ID_NOTA_APLICACAO
                           AND COT_RESGATE_PROVISORIO.DT_POSICAO = COT_RESGATE_RENDIMENTO_PROV.DT_POSICAO
                         GROUP BY COT_RESGATE_RENDIMENTO_PROV.ID_NOTA_APLICACAO ,
                                  COT_RESGATE_RENDIMENTO_PROV.DT_POSICAO ,
                                  COT_RESGATE_RENDIMENTO_PROV.CD_RENDIMENTO ,
                                  COT_RESGATE_RENDIMENTO_PROV.ID_DESENQ ) RESGATE_PROV
           ON RESGATE_PROV.ID_NOTA_APLICACAO = COT_POSICAO_RENDIMENTO_HIST.ID_NOTA
          AND RESGATE_PROV.DT_POSICAO = COT_POSICAO_RENDIMENTO_HIST.DT_POSICAO   
          AND RESGATE_PROV.CD_RENDIMENTO = COT_POSICAO_RENDIMENTO_HIST.CD_RENDIMENTO
          AND RESGATE_PROV.ID_DESENQ = COT_POSICAO_RENDIMENTO_HIST.ID_DESENQ
         ON COT_POSICAO_NOTA_HISTORICO.ID_NOTA = COT_POSICAO_RENDIMENTO_HIST.ID_NOTA 
        AND COT_POSICAO_NOTA_HISTORICO.DT_POSICAO = COT_POSICAO_RENDIMENTO_HIST.DT_POSICAO 
        AND COT_POSICAO_RENDIMENTO_HIST.CD_RENDIMENTO IN ('RA','DR')
 WHERE COT_POSICAO_FUNDO.IC_AF_POSICAO = 'F'
   AND COT_FUNDO_IR.IC_FC_ALIQUOTA = 'C'
   AND COT_FUNDO_PARAMETRO.IC_SN_IR_AUTOMATICO = 'S'
   AND COT_POSICAO_NOTA_HISTORICO.DT_POSICAO = :adt_posicao
   AND COT_FUNDO.CD_EMPRESA IN ( :as_empresa )
   AND COT_FUNDO.CD_FUNDO = :as_fundo
   AND COT_COTISTA.CD_COTISTA = :as_cotista
 AND COT_TIPO_COTISTA.IC_SN_IR_AUTOMATICO = 'S'

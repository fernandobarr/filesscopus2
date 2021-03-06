USE BRD_ACT_YMF_COT
GO

DECLARE 
@Data01 date =  '2016-10-03 00:00:00.000' 
,@Data02 date =   '2016-10-25 00:00:00.000'
,@Fundo char(15) =   '007530' 

SELECT CONVERT( CHAR, COT_POSICAO_FUNDO.DT_POSICAO, 103 ) DT_POSICAO,   
         COT_POSICAO_FUNDO.VL_PATRIMONIO_ABERTURA,   
         COT_POSICAO_FUNDO.VL_COTA_ABERTURA,   
         COT_POSICAO_FUNDO.VL_PATRIMONIO_FECHAMENTO_TOTAL,   
         COT_POSICAO_FUNDO.CD_FUNDO,   
         COT_CLIENTE.NM_CLIENTE,   
         COT_CLIENTE.NM_ABREVIADO,   
         COT_POSICAO_FUNDO.VL_COTA_FECHAMENTO,   
         COT_POSICAO_FUNDO.QT_COTAS_TOTAL,   
         COT_POSICAO_FUNDO.QT_COTAS_FECHAMENTO_TOTAL,   
         COT_POSICAO_FUNDO.VL_COTA_PRE_PFEE,   
         COT_POSICAO_FUNDO.VL_PFEE_ACUMULADO,   
         COT_POSICAO_FUNDO.VL_PFEE_RESGATADO,   
         COT_POSICAO_FUNDO.VL_RECEITA_PFEE,   
         COT_FUNDO.CD_ADMINISTRADOR,   
         COT_FUNDO.CD_EMPRESA,
         LEMP.NM_LOGOTIPO NM_LOGOTIPO_EMP,
         LADM.NM_LOGOTIPO NM_LOGOTIPO_ADM  
    FROM COT_POSICAO_FUNDO,   
         COT_CLIENTE,   
         COT_FUNDO
         LEFT JOIN NET_ADM_EMPRESA_LOGO LEMP ON LEMP.CD_EMPRESA = COT_FUNDO.CD_EMPRESA
			LEFT JOIN NET_ADM_ADMINISTRADOR_LOGO LADM ON LADM.CD_ADMINISTRADOR = COT_FUNDO.CD_ADMINISTRADOR  
   WHERE ( COT_FUNDO.CD_CLIENTE = COT_CLIENTE.CD_CLIENTE ) and  
         ( COT_FUNDO.CD_FUNDO = COT_POSICAO_FUNDO.CD_FUNDO ) and  
         ( COT_POSICAO_FUNDO.CD_FUNDO IN ( @Fundo ) ) AND  
         ( COT_POSICAO_FUNDO.DT_POSICAO >= @Data01 ) AND  
         ( COT_POSICAO_FUNDO.DT_POSICAO <= @Data02 )
ORDER BY COT_FUNDO.CD_EMPRESA,
         COT_FUNDO.CD_ADMINISTRADOR,
         COT_POSICAO_FUNDO.CD_FUNDO,
         CONVERT( DATETIME, COT_POSICAO_FUNDO.DT_POSICAO )
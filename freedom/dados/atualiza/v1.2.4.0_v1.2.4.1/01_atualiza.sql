/* Server Version: LI-V6.3.3.4870 Firebird 1.5.  ODS Version: 10.1. */
SET NAMES NONE;

SET SQL DIALECT 3;

SET AUTODDL ON;

ALTER TABLE FNITMODBOLETO ADD SEQNOSSONUMERO INTEGER;

Update Rdb$Relation_Fields set Rdb$Description =
'Sequencia do nosso numero, para gera��o de nosso numero no padr�o ''S'' SGPREFER1.TPNOSSONUMERO.'
where Rdb$Relation_Name='FNITMODBOLETO' and Rdb$Field_Name='SEQNOSSONUMERO';

ALTER TABLE FNITRECEBER ADD SEQNOSSONUMERO INTEGER;

Update Rdb$Relation_Fields set Rdb$Description =
'Sequencial do nosso n�mero.'
where Rdb$Relation_Name='FNITRECEBER' and Rdb$Field_Name='SEQNOSSONUMERO';

ALTER TABLE SGPREFERE1 ADD TPNOSSONUMERO CHAR(1);

Update Rdb$Relation_Fields set Rdb$Description =
'Indica o padr�o para gera��o do nosso n�mero (boletos e arquivos de remessa)
D - N�mero do documento (doc)
R - N�mero do contas a receber (codrec)
S - Sequencial �nico (recomendado)'
where Rdb$Relation_Name='SGPREFERE1' and Rdb$Field_Name='TPNOSSONUMERO';

ALTER TABLE SGPREFERE1 ADD IMPDOCBOL CHAR(1) DEFAULT 'N' NOT NULL;

Update Rdb$Relation_Fields set Rdb$Description =
'Define se o n�mero  NF ser� impresso no campo documento do boleto (S/N).
'
where Rdb$Relation_Name='SGPREFERE1' and Rdb$Field_Name='IMPDOCBOL';

/* Create Table... */
CREATE TABLE FNITRENEGREC(CODEMP INTEGER NOT NULL,
CODFILIAL SMALLINT NOT NULL,
CODRENEGREC INTEGER NOT NULL,
CODITRENEGREC SMALLINT NOT NULL,
CODEMPIR INTEGER NOT NULL,
CODFILIALIR SMALLINT NOT NULL,
CODREC INTEGER NOT NULL,
NPARCITREC INTEGER NOT NULL,
DTINI DATE DEFAULT 'now',
DTINS DATE DEFAULT 'today' NOT NULL,
HINS TIME DEFAULT 'now' NOT NULL,
IDUSUINS CHAR(8) DEFAULT USER NOT NULL,
DTALT DATE DEFAULT 'now',
HALT TIME DEFAULT 'now',
IDUSUALT CHAR(8) DEFAULT USER);


CREATE TABLE FNRENEGREC(CODEMP INTEGER NOT NULL,
CODFILIAL SMALLINT NOT NULL,
CODRENEGREC INTEGER NOT NULL,
DTRENEGREC DATE NOT NULL,
VLRORIGINAL NUMERICDN NOT NULL,
VLRDESCONTO NUMERICDN,
VLRADICIONAL NUMERICDN,
VLRJUROS NUMERICDN,
VLRLIQRENEGREC NUMERICDN NOT NULL,
CODEMPPG INTEGER NOT NULL,
CODFILIALPG INTEGER NOT NULL,
CODPLANOPAG INTEGER NOT NULL,
OBSRENEGREC VARCHAR(250),
DTINI DATE DEFAULT 'now',
DTINS DATE DEFAULT 'today' NOT NULL,
HINS TIME DEFAULT 'now' NOT NULL,
IDUSUINS CHAR(8) DEFAULT USER NOT NULL,
DTALT DATE DEFAULT 'now',
HALT TIME DEFAULT 'now',
IDUSUALT CHAR(8) DEFAULT USER);


Update Rdb$Relations set Rdb$Description =
'Tabela para gerenciamento de t�tulos renegociados.'
where Rdb$Relation_Name='FNRENEGREC';


/* Create Procedure... */
SET TERM ^ ;

CREATE PROCEDURE FNGERASEQNOSSONUMERO(CODEMPBO INTEGER,
CODFILIALBO SMALLINT,
CODBANCO CHAR(3),
CODEMPCB INTEGER,
CODFILIALCB SMALLINT,
CODCARTCOB CHAR(2),
CODEMPCT INTEGER,
CODFILIALCT SMALLINT,
NUMCONTA CHAR(10))
 RETURNS(SEQNOSSONUMERO INTEGER)
 AS
 BEGIN EXIT; END
^


/* Create Primary Key... */
SET TERM ; ^

ALTER TABLE FNITRENEGREC ADD CONSTRAINT FNITRENEGRECPK PRIMARY KEY (CODITRENEGREC,CODRENEGREC,CODFILIAL,CODEMP);

ALTER TABLE FNRENEGREC ADD CONSTRAINT FNRENEGRECPK PRIMARY KEY (CODRENEGREC,CODFILIAL,CODEMP);

/* Create Foreign Key... */
--CONNECT 'localhost:/opt/firebird/dados/desenv/1.2.4.0/freedom.fdb' USER 'SYSDBA' PASSWORD 'masterkey';

ALTER TABLE FNITRENEGREC ADD CONSTRAINT FNITRENEGRECFKFNITRECEBER FOREIGN KEY (NPARCITREC,CODREC,CODFILIALIR,CODEMPIR) REFERENCES FNITRECEBER(NPARCITREC,CODREC,CODFILIAL,CODEMP);

ALTER TABLE FNRENEGREC ADD CONSTRAINT FNRENEGRECFKFNPLANOPAG FOREIGN KEY (CODPLANOPAG,CODFILIALPG,CODEMPPG) REFERENCES FNPLANOPAG(CODPLANOPAG,CODFILIAL,CODEMP) ON DELETE CASCADE;

/* Alter Procedure... */
/* Alter (FNGERASEQNOSSONUMERO) */
SET TERM ^ ;

ALTER PROCEDURE FNGERASEQNOSSONUMERO(CODEMPBO INTEGER,
CODFILIALBO SMALLINT,
CODBANCO CHAR(3),
CODEMPCB INTEGER,
CODFILIALCB SMALLINT,
CODCARTCOB CHAR(2),
CODEMPCT INTEGER,
CODFILIALCT SMALLINT,
NUMCONTA CHAR(10))
 RETURNS(SEQNOSSONUMERO INTEGER)
 AS
begin
    
    seqnossonumero = 0;

    --Buscando sequencia atual;

    select first 1 coalesce(im.seqnossonumero,0)
    from fnitmodboleto im
    where im.codempcb=:codempcb and im.codfilialcb=:codfilialcb and im.codcartcob=:codcartcob
    and im.codempbo=:codempbo and im.codfilialbo=:codfilialbo and im.codbanco=:codbanco
    and im.codempct=:codempct and im.codfilialct=:codfilialct and im.numconta=:numconta
    into seqnossonumero;

    --Incrementando sequencia;

    seqnossonumero = seqnossonumero + 1;

    --Atualizando sequencia na tabela de itens de modelo

    update fnitmodboleto im set im.seqnossonumero=:seqnossonumero
    where im.codempcb=:codempcb and im.codfilialcb=:codfilialcb and im.codcartcob=:codcartcob
    and im.codempbo=:codempbo and im.codfilialbo=:codfilialbo and im.codbanco=:codbanco
    and im.codempct=:codempct and im.codfilialct=:codfilialct and im.numconta=:numconta;

    suspend;

end
^

/* Alter (SGRETVERSAO) */
ALTER PROCEDURE SGRETVERSAO RETURNS(VERSAO VARCHAR(30))
 AS
begin
    versao = '1.2.4.1 (06/11/2010)';
    suspend;
end
^

/* Alter (VDCOPIAORCSP) */
ALTER PROCEDURE VDCOPIAORCSP(CODEMP INTEGER,
CODFILIAL INTEGER,
CODORC INTEGER,
CODFILIALCL INTEGER,
CODCLI INTEGER)
 RETURNS(IRET INTEGER)
 AS
declare variable icodorc integer;
declare variable icodfilialpf integer;
declare variable cusaorcseq char(1);
declare variable vlrprodorc decimal(15,5);
declare variable percdescorc decimal(9,2);
declare variable vlrdescorc decimal(15,5);
declare variable vlradicorc decimal(15,5);
declare variable vlrdescitorc decimal(15,5);
declare variable vlrliqorc decimal(15,5);
BEGIN
  SELECT ICODFILIAL FROM SGRETFILIAL(:CODEMP, 'SGPREFERE1')
    INTO :ICODFILIALPF;
  SELECT USAORCSEQ FROM SGPREFERE1 P
     WHERE P.CODEMP=:CODEMP AND P.CODFILIAL=:ICODFILIALPF
     INTO :CUSAORCSEQ;
  IF (CUSAORCSEQ='S') THEN
  BEGIN
     SELECT ISEQ FROM SPGERANUM(:CODEMP,:CODFILIAL,'OC') INTO ICODORC;
  END
  ELSE
  BEGIN
     SELECT COALESCE(MAX(O.CODORC),0)+1 FROM VDORCAMENTO O
       WHERE O.CODEMP=:CODEMP AND O.CODFILIAL=:CODFILIAL AND
       O.TIPOORC='O' INTO ICODORC;
  END

  INSERT INTO VDORCAMENTO (CODEMP, CODFILIAL, TIPOORC, CODORC,
    CODEMPAE, CODFILIALAE, CODATEND, CODEMPCV, CODFILIALCV, CODCONV,
    DTORC, DTVENCORC, OBSORC, CODPLANOPAG, CODFILIALPG,
    CODEMPPG, TXT01, CODEMPVD, CODFILIALVD, CODVEND, CODEMPCL, CODFILIALCL,
    CODCLI, CODTPCONV, CODFILIALTC, CODEMPTC, PRAZOENTORC, statusorc)
    SELECT CODEMP, CODFILIAL, 'O', :ICODORC, CODEMPAE, CODFILIALAE,
      CODATEND, CODEMPCV, CODFILIALCV, CODCONV, DTORC, DTVENCORC,
      OBSORC, CODPLANOPAG, CODFILIALPG, CODEMPPG, TXT01, CODEMPVD,
      CODFILIALVD, CODVEND, :CODEMP, :CODFILIALCL, :CODCLI, CODTPCONV,
      CODFILIALTC, CODEMPTC, PRAZOENTORC, '*' FROM VDORCAMENTO WHERE
      CODORC=:CODORC AND CODEMP=:CODEMP AND CODFILIAL=:CODFILIAL;

  INSERT INTO VDITORCAMENTO (CODEMP, CODFILIAL, TIPOORC, CODORC, CODITORC,
    CODEMPPD, CODFILIALPD, CODPROD, QTDITORC, PRECOITORC, PERCDESCITORC,
    VLRDESCITORC, VLRLIQITORC, VLRPRODITORC, REFPROD, NUMAUTORIZORC, ACEITEITORC,
    APROVITORC, EMITITORC, VENCAUTORIZORC, STRDESCITORC, OBSITORC,
    CODEMPAX, CODFILIALAX, CODALMOX)
    SELECT CODEMP, CODFILIAL, TIPOORC, :ICODORC, CODITORC,
      CODEMPPD, CODFILIALPD, CODPROD, QTDITORC, PRECOITORC, PERCDESCITORC,
      VLRDESCITORC, VLRLIQITORC, VLRPRODITORC, REFPROD, null, 'N',
      'N', 'N', VENCAUTORIZORC, STRDESCITORC, OBSITORC,
      CODEMPAX, CODFILIALAX, CODALMOX
      FROM VDITORCAMENTO
      WHERE CODORC=:CODORC AND CODEMP=:CODEMP AND CODFILIAL=:CODFILIAL;

  SELECT VLRPRODORC, PERCDESCORC,VLRDESCORC,VLRADICORC,VLRDESCITORC,VLRLIQORC
      FROM VDORCAMENTO WHERE CODORC=:CODORC AND CODEMP=:CODEMP AND
      CODFILIAL=:CODFILIAL
      INTO :VLRPRODORC, :PERCDESCORC, :VLRDESCORC, :VLRADICORC, :VLRDESCITORC, :VLRLIQORC;

  UPDATE VDORCAMENTO SET VLRPRODORC=:VLRPRODORC, PERCDESCORC=:PERCDESCORC,
     VLRDESCORC=:VLRDESCORC, VLRADICORC=:VLRADICORC,
     VLRDESCITORC=:VLRDESCITORC, VLRLIQORC=:VLRLIQORC
     WHERE CODORC=:ICODORC AND CODEMP=:CODEMP AND CODFILIAL=:CODFILIAL;

  IRET = ICODORC;
  SUSPEND;
END
^

/* Create Trigger... */
CREATE TRIGGER FNITRENEGRECTGBU FOR FNITRENEGREC
ACTIVE BEFORE UPDATE POSITION 0 
as
begin
  new.DTALT=cast('now' AS DATE);
  new.IDUSUALT=USER;
  new.HALT = cast('now' AS TIME);
end
^

CREATE TRIGGER FNRENEGRECTGBU FOR FNRENEGREC
ACTIVE BEFORE UPDATE POSITION 0 
as
begin
  new.DTALT=cast('now' AS DATE);
  new.IDUSUALT=USER;
  new.HALT = cast('now' AS TIME);
end
^


/* Alter exist trigger... */
ALTER TRIGGER EQITRECMERCTGAU ACTIVE
^

/* Alter exist trigger... */
ALTER TRIGGER FNITRECEBERTGBI
as

    declare variable seqnossonumero int;

begin

    --Setando valor padr�o de campos para 0;
    if (new.vlrparcitrec is null) then
        new.vlrparcitrec = 0;

    if (new.vlrdescitrec is null) then
        new.vlrdescitrec = 0;

    if (new.vlrjurositrec is null) then
        new.vlrjurositrec = 0;

    if (new.vlrmultaitrec is null) then
        new.vlrmultaitrec = 0;

    -- Calculando o valor liquido da parcela...
    new.vlritrec = new.vlrparcitrec - new.vlrdescitrec - new.vlrdevitrec + new.vlrjurositrec + new.vlrmultaitrec;
    new.vlrapagitrec = new.vlritrec - new.vlrpagoitrec;

    -- Zerando valores caso fique negativo...
    if (new.vlrapagitrec<0) then
        new.vlrapagitrec = 0;

    if(new.dtprevitrec is null) then
        new.dtprevitrec = new.dtvencitrec;

    --Buscando sequencial caso informa��es de banco e carteira j� tenham sido informadas...

    if(new.codbanco is not null and new.codcartcob is not null and new.numconta is not null) then
    begin

       select seqnossonumero
       from fngeraseqnossonumero( new.codempbo, new.codfilialbo, new.codbanco, new.codempcb, new.codfilialcb, new.codcartcob, new.codempca, new.codfilialca, new.numconta)
       into :seqnossonumero;

       if (:seqnossonumero is not null and :seqnossonumero >0 ) then
       begin
          new.seqnossonumero = :seqnossonumero;
       end

    end



end
^

/* Alter exist trigger... */
ALTER TRIGGER FNITRECEBERTGBU
AS

  DECLARE VARIABLE SCODFILIALPF SMALLINT;
  DECLARE VARIABLE CCOMISPDUPL CHAR(1);
  DECLARE VARIABLE NVLRPARCREC NUMERIC(15, 5);
  DECLARE VARIABLE NVLRCOMIREC NUMERIC(15, 5);
  DECLARE VARIABLE ESTITRECALTDTVENC CHAR(1);
  DECLARE VARIABLE AUTOBAIXAPARC CHAR(1);
  declare variable seqnossonumero int;

BEGIN
  new.DTALT=cast('now' AS DATE);
  new.IDUSUALT=USER;
  new.HALT = cast('now' AS TIME);
  IF ( new.ALTUSUITREC IS NULL ) THEN /* Para n�o permitir flag de usu�rio nulo */
     new.ALTUSUITREC = 'S';

  SELECT ESTITRECALTDTVENC FROM SGPREFERE1 WHERE CODEMP=new.CODEMP AND CODFILIAL=new.CODFILIAL INTO :ESTITRECALTDTVENC;
  SELECT ITPP.AUTOBAIXAPARC FROM FNPARCPAG ITPP, FNRECEBER R
    WHERE ITPP.CODEMP=R.CODFILIALPG AND ITPP.CODFILIAL=R.CODFILIALPG AND ITPP.CODPLANOPAG=R.CODPLANOPAG AND
      ITPP.NROPARCPAG=new.NPARCITREC AND
       R.CODEMP=new.CODEMP AND R.CODFILIAL=new.CODFILIAL AND R.CODREC=new.CODREC
    INTO :AUTOBAIXAPARC;
  IF  ( ( (old.STATUSITREC IN ('RP','RL') )  AND (new.STATUSITREC='R1') ) OR
        ( (ESTITRECALTDTVENC='S') AND (AUTOBAIXAPARC='S') AND
          (old.DTVENCITREC<>new.DTVENCITREC) ) ) THEN
  BEGIN
    new.STATUSITREC = 'R1';
    new.VLRPAGOITREC = 0;
  END
  ELSE IF ( (old.STATUSITREC='R1') AND ( new.STATUSITREC='CR' ) ) THEN
  BEGIN
     IF ( (new.OBSITREC IS NULL) OR (rtrim(new.OBSITREC)='') ) THEN
     BEGIN
        EXCEPTION FNITRECEBEREX02;
     END
     new.VLRCANCITREC = new.VLRAPAGITREC;
     new.VLRPARCITREC = 0;
     new.VLRDESCITREC = 0;
     new.VLRJUROSITREC = 0;
     new.VLRDEVITREC = 0;
     new.VLRITREC = 0;
  END

  new.VLRITREC = new.VLRPARCITREC - new.VLRDESCITREC - new.VLRDEVITREC + new.VLRJUROSITREC + new.VLRMULTAITREC;
  new.VLRAPAGITREC = new.VLRITREC - new.VLRPAGOITREC;
  if (new.VLRAPAGITREC < 0) then /* se o valor a pagar for maior que zero */
    new.VLRAPAGITREC = 0;  /* ent�o valor a pagar ser� zero */
  if ( (new.VLRAPAGITREC=0) AND (new.STATUSITREC<>'CR') ) then /* se o valor a pagar for igual a zero */
    new.STATUSITREC = 'RP';  /* ent�o o status ser� RP(pagamento completo) */
  else if (new.VLRPAGOITREC>0) then /* caso contr�rio e o valor pago maior que zero */
    new.STATUSITREC = 'RL'; /*  ent�o o status ser� RL(pagamento parcial) */
  /*
    Esta se��o � destinada e ajustar as comiss�es conforme os valores de parcelas
    caso o prefer�ncias esteja ajustado para isso.
  */
  IF ( (new.VLRPARCITREC!=old.VLRPARCITREC) AND (new.VLRPARCITREC!=0) ) THEN
  BEGIN
     SELECT ICODFILIAL FROM SGRETFILIAL(new.CODEMP,'SGPREFERE1') INTO :SCODFILIALPF;
     SELECT P1.COMISPDUPL  FROM SGPREFERE1 P1
         WHERE P1.CODEMP=new.CODEMP AND P1.CODFILIAL=:SCODFILIALPF INTO :CCOMISPDUPL;
     IF (CCOMISPDUPL='S') THEN
     BEGIN
        SELECT V.VLRLIQVENDA, R.VLRCOMIREC FROM FNRECEBER R, VDVENDA V
          WHERE R.CODEMP=new.CODEMP AND R.CODFILIAL=new.CODFILIAL AND
              R.CODREC=new.CODREC AND V.CODEMP=R.CODEMPVA AND V.CODFILIAL=R.CODFILIALVA AND
              V.TIPOVENDA=R.TIPOVENDA AND V.CODVENDA=R.CODVENDA INTO :NVLRPARCREC, :NVLRCOMIREC;
        IF (NVLRPARCREC!=0) THEN
          new.VLRCOMIITREC = cast( new.VLRPARCITREC * :NVLRCOMIREC / :NVLRPARCREC as NUMERIC(15, 5) );
     END
  END
  IF ((old.IMPRECIBOITREC='N') AND (new.IMPRECIBOITREC='S') AND (new.RECIBOITREC IS NULL)) THEN
  BEGIN
     SELECT ISEQ FROM SPGERANUM(new.CODEMP,new.CODFILIAL,'RB') INTO new.RECIBOITREC;
  END
  /*Altera��o das datas de entrada e saida do estado de 'em cobran�a'*/
  IF (new.RECEMCOB='S') THEN
  BEGIN
    new.DTINIEMCOB=CURRENT_DATE;
    new.DTFIMEMCOB=NULL;
  END
  ELSE IF (new.RECEMCOB='N') THEN
  BEGIN
    new.DTFIMEMCOB=CURRENT_DATE;
  END
  if(new.dtprevitrec is null) then
    new.dtprevitrec = new.dtvencitrec;



    --Buscando sequencial caso informa��es de banco e carteira tenham sido alteradas...

    if ( (old.codbanco is null or old.codcartcob is null or old.numconta is null )
          or
         (new.codbanco != old.codbanco or new.codcartcob != old.codcartcob or new.numconta != old.numconta)
          and
         (new.codbanco is not null and new.codcartcob is not null and new.numconta is not null ) ) then

    begin

        seqnossonumero = 0;

       select seqnossonumero
       from fngeraseqnossonumero( new.codempbo, new.codfilialbo, new.codbanco, new.codempcb, new.codfilialcb, new.codcartcob, new.codempca, new.codfilialca, new.numconta)
       into :seqnossonumero;

       if (:seqnossonumero is not null and :seqnossonumero >0 ) then
       begin
          new.seqnossonumero = :seqnossonumero;
       end

    end

end
^

/* Alter Procedure... */
/* Alter (FNGERASEQNOSSONUMERO) */
ALTER PROCEDURE FNGERASEQNOSSONUMERO(CODEMPBO INTEGER,
CODFILIALBO SMALLINT,
CODBANCO CHAR(3),
CODEMPCB INTEGER,
CODFILIALCB SMALLINT,
CODCARTCOB CHAR(2),
CODEMPCT INTEGER,
CODFILIALCT SMALLINT,
NUMCONTA CHAR(10))
 RETURNS(SEQNOSSONUMERO INTEGER)
 AS
begin
    
    seqnossonumero = 0;

    --Buscando sequencia atual;

    select first 1 coalesce(im.seqnossonumero,0)
    from fnitmodboleto im
    where im.codempcb=:codempcb and im.codfilialcb=:codfilialcb and im.codcartcob=:codcartcob
    and im.codempbo=:codempbo and im.codfilialbo=:codfilialbo and im.codbanco=:codbanco
    and im.codempct=:codempct and im.codfilialct=:codfilialct and im.numconta=:numconta
    into seqnossonumero;

    --Incrementando sequencia;

    seqnossonumero = seqnossonumero + 1;

    --Atualizando sequencia na tabela de itens de modelo

    update fnitmodboleto im set im.seqnossonumero=:seqnossonumero
    where im.codempcb=:codempcb and im.codfilialcb=:codfilialcb and im.codcartcob=:codcartcob
    and im.codempbo=:codempbo and im.codfilialbo=:codfilialbo and im.codbanco=:codbanco
    and im.codempct=:codempct and im.codfilialct=:codfilialct and im.numconta=:numconta;

    suspend;

end
^

/* Alter (SGRETVERSAO) */
ALTER PROCEDURE SGRETVERSAO RETURNS(VERSAO VARCHAR(30))
 AS
begin
    versao = '1.2.4.1 (06/11/2010)';
    suspend;
end
^

/* Alter (VDCOPIAORCSP) */
ALTER PROCEDURE VDCOPIAORCSP(CODEMP INTEGER,
CODFILIAL INTEGER,
CODORC INTEGER,
CODFILIALCL INTEGER,
CODCLI INTEGER)
 RETURNS(IRET INTEGER)
 AS
declare variable icodorc integer;
declare variable icodfilialpf integer;
declare variable cusaorcseq char(1);
declare variable vlrprodorc decimal(15,5);
declare variable percdescorc decimal(9,2);
declare variable vlrdescorc decimal(15,5);
declare variable vlradicorc decimal(15,5);
declare variable vlrdescitorc decimal(15,5);
declare variable vlrliqorc decimal(15,5);
BEGIN
  SELECT ICODFILIAL FROM SGRETFILIAL(:CODEMP, 'SGPREFERE1')
    INTO :ICODFILIALPF;
  SELECT USAORCSEQ FROM SGPREFERE1 P
     WHERE P.CODEMP=:CODEMP AND P.CODFILIAL=:ICODFILIALPF
     INTO :CUSAORCSEQ;
  IF (CUSAORCSEQ='S') THEN
  BEGIN
     SELECT ISEQ FROM SPGERANUM(:CODEMP,:CODFILIAL,'OC') INTO ICODORC;
  END
  ELSE
  BEGIN
     SELECT COALESCE(MAX(O.CODORC),0)+1 FROM VDORCAMENTO O
       WHERE O.CODEMP=:CODEMP AND O.CODFILIAL=:CODFILIAL AND
       O.TIPOORC='O' INTO ICODORC;
  END

  INSERT INTO VDORCAMENTO (CODEMP, CODFILIAL, TIPOORC, CODORC,
    CODEMPAE, CODFILIALAE, CODATEND, CODEMPCV, CODFILIALCV, CODCONV,
    DTORC, DTVENCORC, OBSORC, CODPLANOPAG, CODFILIALPG,
    CODEMPPG, TXT01, CODEMPVD, CODFILIALVD, CODVEND, CODEMPCL, CODFILIALCL,
    CODCLI, CODTPCONV, CODFILIALTC, CODEMPTC, PRAZOENTORC, statusorc)
    SELECT CODEMP, CODFILIAL, 'O', :ICODORC, CODEMPAE, CODFILIALAE,
      CODATEND, CODEMPCV, CODFILIALCV, CODCONV, DTORC, DTVENCORC,
      OBSORC, CODPLANOPAG, CODFILIALPG, CODEMPPG, TXT01, CODEMPVD,
      CODFILIALVD, CODVEND, :CODEMP, :CODFILIALCL, :CODCLI, CODTPCONV,
      CODFILIALTC, CODEMPTC, PRAZOENTORC, '*' FROM VDORCAMENTO WHERE
      CODORC=:CODORC AND CODEMP=:CODEMP AND CODFILIAL=:CODFILIAL;

  INSERT INTO VDITORCAMENTO (CODEMP, CODFILIAL, TIPOORC, CODORC, CODITORC,
    CODEMPPD, CODFILIALPD, CODPROD, QTDITORC, PRECOITORC, PERCDESCITORC,
    VLRDESCITORC, VLRLIQITORC, VLRPRODITORC, REFPROD, NUMAUTORIZORC, ACEITEITORC,
    APROVITORC, EMITITORC, VENCAUTORIZORC, STRDESCITORC, OBSITORC,
    CODEMPAX, CODFILIALAX, CODALMOX)
    SELECT CODEMP, CODFILIAL, TIPOORC, :ICODORC, CODITORC,
      CODEMPPD, CODFILIALPD, CODPROD, QTDITORC, PRECOITORC, PERCDESCITORC,
      VLRDESCITORC, VLRLIQITORC, VLRPRODITORC, REFPROD, null, 'N',
      'N', 'N', VENCAUTORIZORC, STRDESCITORC, OBSITORC,
      CODEMPAX, CODFILIALAX, CODALMOX
      FROM VDITORCAMENTO
      WHERE CODORC=:CODORC AND CODEMP=:CODEMP AND CODFILIAL=:CODFILIAL;

  SELECT VLRPRODORC, PERCDESCORC,VLRDESCORC,VLRADICORC,VLRDESCITORC,VLRLIQORC
      FROM VDORCAMENTO WHERE CODORC=:CODORC AND CODEMP=:CODEMP AND
      CODFILIAL=:CODFILIAL
      INTO :VLRPRODORC, :PERCDESCORC, :VLRDESCORC, :VLRADICORC, :VLRDESCITORC, :VLRLIQORC;

  UPDATE VDORCAMENTO SET VLRPRODORC=:VLRPRODORC, PERCDESCORC=:PERCDESCORC,
     VLRDESCORC=:VLRDESCORC, VLRADICORC=:VLRADICORC,
     VLRDESCITORC=:VLRDESCITORC, VLRLIQORC=:VLRLIQORC
     WHERE CODORC=:ICODORC AND CODEMP=:CODEMP AND CODFILIAL=:CODFILIAL;

  IRET = ICODORC;
  SUSPEND;
END
^

SET TERM ; ^

ALTER TABLE FNITMODBOLETO ALTER COLUMN CODEMP POSITION 1;

ALTER TABLE FNITMODBOLETO ALTER COLUMN CODFILIAL POSITION 2;

ALTER TABLE FNITMODBOLETO ALTER COLUMN CODMODBOL POSITION 3;

ALTER TABLE FNITMODBOLETO ALTER COLUMN CODEMPBO POSITION 4;

ALTER TABLE FNITMODBOLETO ALTER COLUMN CODFILIALBO POSITION 5;

ALTER TABLE FNITMODBOLETO ALTER COLUMN CODBANCO POSITION 6;

ALTER TABLE FNITMODBOLETO ALTER COLUMN CODEMPCB POSITION 7;

ALTER TABLE FNITMODBOLETO ALTER COLUMN CODFILIALCB POSITION 8;

ALTER TABLE FNITMODBOLETO ALTER COLUMN CODCARTCOB POSITION 9;

ALTER TABLE FNITMODBOLETO ALTER COLUMN CONVCOB POSITION 10;

ALTER TABLE FNITMODBOLETO ALTER COLUMN DVCONVCOB POSITION 11;

ALTER TABLE FNITMODBOLETO ALTER COLUMN CODEMPCT POSITION 12;

ALTER TABLE FNITMODBOLETO ALTER COLUMN CODFILIALCT POSITION 13;

ALTER TABLE FNITMODBOLETO ALTER COLUMN NUMCONTA POSITION 14;

ALTER TABLE FNITMODBOLETO ALTER COLUMN SEQNOSSONUMERO POSITION 15;

ALTER TABLE FNITMODBOLETO ALTER COLUMN DTINS POSITION 16;

ALTER TABLE FNITMODBOLETO ALTER COLUMN HINS POSITION 17;

ALTER TABLE FNITMODBOLETO ALTER COLUMN IDUSUINS POSITION 18;

ALTER TABLE FNITMODBOLETO ALTER COLUMN DTALT POSITION 19;

ALTER TABLE FNITMODBOLETO ALTER COLUMN HALT POSITION 20;

ALTER TABLE FNITMODBOLETO ALTER COLUMN IDUSUALT POSITION 21;

ALTER TABLE FNITRECEBER ALTER COLUMN CODEMP POSITION 1;

ALTER TABLE FNITRECEBER ALTER COLUMN CODFILIAL POSITION 2;

ALTER TABLE FNITRECEBER ALTER COLUMN CODREC POSITION 3;

ALTER TABLE FNITRECEBER ALTER COLUMN NPARCITREC POSITION 4;

ALTER TABLE FNITRECEBER ALTER COLUMN VLRITREC POSITION 5;

ALTER TABLE FNITRECEBER ALTER COLUMN VLRDESCITREC POSITION 6;

ALTER TABLE FNITRECEBER ALTER COLUMN VLRMULTAITREC POSITION 7;

ALTER TABLE FNITRECEBER ALTER COLUMN VLRJUROSITREC POSITION 8;

ALTER TABLE FNITRECEBER ALTER COLUMN VLRDEVITREC POSITION 9;

ALTER TABLE FNITRECEBER ALTER COLUMN VLRPARCITREC POSITION 10;

ALTER TABLE FNITRECEBER ALTER COLUMN VLRPAGOITREC POSITION 11;

ALTER TABLE FNITRECEBER ALTER COLUMN VLRAPAGITREC POSITION 12;

ALTER TABLE FNITRECEBER ALTER COLUMN VLRCOMIITREC POSITION 13;

ALTER TABLE FNITRECEBER ALTER COLUMN VLRCANCITREC POSITION 14;

ALTER TABLE FNITRECEBER ALTER COLUMN VLRBASECOMIS POSITION 15;

ALTER TABLE FNITRECEBER ALTER COLUMN DESCPONT POSITION 16;

ALTER TABLE FNITRECEBER ALTER COLUMN DTITREC POSITION 17;

ALTER TABLE FNITRECEBER ALTER COLUMN DTVENCITREC POSITION 18;

ALTER TABLE FNITRECEBER ALTER COLUMN DTPREVITREC POSITION 19;

ALTER TABLE FNITRECEBER ALTER COLUMN DTPAGOITREC POSITION 20;

ALTER TABLE FNITRECEBER ALTER COLUMN STATUSITREC POSITION 21;

ALTER TABLE FNITRECEBER ALTER COLUMN CODEMPPN POSITION 22;

ALTER TABLE FNITRECEBER ALTER COLUMN CODFILIALPN POSITION 23;

ALTER TABLE FNITRECEBER ALTER COLUMN CODPLAN POSITION 24;

ALTER TABLE FNITRECEBER ALTER COLUMN OBSITREC POSITION 25;

ALTER TABLE FNITRECEBER ALTER COLUMN CODEMPCA POSITION 26;

ALTER TABLE FNITRECEBER ALTER COLUMN CODFILIALCA POSITION 27;

ALTER TABLE FNITRECEBER ALTER COLUMN NUMCONTA POSITION 28;

ALTER TABLE FNITRECEBER ALTER COLUMN CODEMPBO POSITION 29;

ALTER TABLE FNITRECEBER ALTER COLUMN CODFILIALBO POSITION 30;

ALTER TABLE FNITRECEBER ALTER COLUMN CODBANCO POSITION 31;

ALTER TABLE FNITRECEBER ALTER COLUMN CODEMPTC POSITION 32;

ALTER TABLE FNITRECEBER ALTER COLUMN CODFILIALTC POSITION 33;

ALTER TABLE FNITRECEBER ALTER COLUMN CODTIPOCOB POSITION 34;

ALTER TABLE FNITRECEBER ALTER COLUMN CODEMPCB POSITION 35;

ALTER TABLE FNITRECEBER ALTER COLUMN CODFILIALCB POSITION 36;

ALTER TABLE FNITRECEBER ALTER COLUMN CODCARTCOB POSITION 37;

ALTER TABLE FNITRECEBER ALTER COLUMN DOCLANCAITREC POSITION 38;

ALTER TABLE FNITRECEBER ALTER COLUMN FLAG POSITION 39;

ALTER TABLE FNITRECEBER ALTER COLUMN CODEMPCC POSITION 40;

ALTER TABLE FNITRECEBER ALTER COLUMN CODFILIALCC POSITION 41;

ALTER TABLE FNITRECEBER ALTER COLUMN ANOCC POSITION 42;

ALTER TABLE FNITRECEBER ALTER COLUMN CODCC POSITION 43;

ALTER TABLE FNITRECEBER ALTER COLUMN IMPRECIBOITREC POSITION 44;

ALTER TABLE FNITRECEBER ALTER COLUMN RECIBOITREC POSITION 45;

ALTER TABLE FNITRECEBER ALTER COLUMN ALTUSUITREC POSITION 46;

ALTER TABLE FNITRECEBER ALTER COLUMN PDVITREC POSITION 47;

ALTER TABLE FNITRECEBER ALTER COLUMN RECEMCOB POSITION 48;

ALTER TABLE FNITRECEBER ALTER COLUMN DTINIEMCOB POSITION 49;

ALTER TABLE FNITRECEBER ALTER COLUMN DTFIMEMCOB POSITION 50;

ALTER TABLE FNITRECEBER ALTER COLUMN SEQNOSSONUMERO POSITION 51;

ALTER TABLE FNITRECEBER ALTER COLUMN DTINS POSITION 52;

ALTER TABLE FNITRECEBER ALTER COLUMN HINS POSITION 53;

ALTER TABLE FNITRECEBER ALTER COLUMN IDUSUINS POSITION 54;

ALTER TABLE FNITRECEBER ALTER COLUMN DTALT POSITION 55;

ALTER TABLE FNITRECEBER ALTER COLUMN HALT POSITION 56;

ALTER TABLE FNITRECEBER ALTER COLUMN IDUSUALT POSITION 57;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODEMP POSITION 1;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODFILIAL POSITION 2;

ALTER TABLE SGPREFERE1 ALTER COLUMN USAREFPROD POSITION 3;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODTIPOMOV POSITION 4;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODEMPTM POSITION 5;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODFILIALTM POSITION 6;

ALTER TABLE SGPREFERE1 ALTER COLUMN USAPEDSEQ POSITION 7;

ALTER TABLE SGPREFERE1 ALTER COLUMN USAORCSEQ POSITION 8;

ALTER TABLE SGPREFERE1 ALTER COLUMN FILTRO POSITION 9;

ALTER TABLE SGPREFERE1 ALTER COLUMN USALIQREL POSITION 10;

ALTER TABLE SGPREFERE1 ALTER COLUMN TIPOPRECOCUSTO POSITION 11;

ALTER TABLE SGPREFERE1 ALTER COLUMN ANOCENTROCUSTO POSITION 12;

ALTER TABLE SGPREFERE1 ALTER COLUMN OBSORCPAD POSITION 13;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODTIPOMOV2 POSITION 14;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODFILIALT2 POSITION 15;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODEMPT2 POSITION 16;

ALTER TABLE SGPREFERE1 ALTER COLUMN CLASSORC POSITION 17;

ALTER TABLE SGPREFERE1 ALTER COLUMN TITORCTXT01 POSITION 18;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODTIPOMOV3 POSITION 19;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODFILIALT3 POSITION 20;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODEMPT3 POSITION 21;

ALTER TABLE SGPREFERE1 ALTER COLUMN ORDNOTA POSITION 22;

ALTER TABLE SGPREFERE1 ALTER COLUMN SETORVENDA POSITION 23;

ALTER TABLE SGPREFERE1 ALTER COLUMN PREFCRED POSITION 24;

ALTER TABLE SGPREFERE1 ALTER COLUMN TIPOPREFCRED POSITION 25;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODEMPMO POSITION 26;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODFILIALMO POSITION 27;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODMOEDA POSITION 28;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODTIPOMOV4 POSITION 29;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODFILIALT4 POSITION 30;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODEMPT4 POSITION 31;

ALTER TABLE SGPREFERE1 ALTER COLUMN USACLASCOMIS POSITION 32;

ALTER TABLE SGPREFERE1 ALTER COLUMN PERCPRECOCUSTO POSITION 33;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODGRUP POSITION 34;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODFILIALGP POSITION 35;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODEMPGP POSITION 36;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODMARCA POSITION 37;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODFILIALMC POSITION 38;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODEMPMC POSITION 39;

ALTER TABLE SGPREFERE1 ALTER COLUMN RGCLIOBRIG POSITION 40;

ALTER TABLE SGPREFERE1 ALTER COLUMN TABFRETEVD POSITION 41;

ALTER TABLE SGPREFERE1 ALTER COLUMN TABADICVD POSITION 42;

ALTER TABLE SGPREFERE1 ALTER COLUMN TRAVATMNFVD POSITION 43;

ALTER TABLE SGPREFERE1 ALTER COLUMN TIPOVALIDORC POSITION 44;

ALTER TABLE SGPREFERE1 ALTER COLUMN CLIMESMOCNPJ POSITION 45;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODTBJ POSITION 46;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODEMPTJ POSITION 47;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODFILIALTJ POSITION 48;

ALTER TABLE SGPREFERE1 ALTER COLUMN CNPJOBRIGCLI POSITION 49;

ALTER TABLE SGPREFERE1 ALTER COLUMN JUROSPOSCALC POSITION 50;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODEMPFR POSITION 51;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODFILIALFR POSITION 52;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODFOR POSITION 53;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODEMPTN POSITION 54;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODFILIALTN POSITION 55;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODTRAN POSITION 56;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODEMPTF POSITION 57;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODFILIALTF POSITION 58;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODTIPOFOR POSITION 59;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODEMPT5 POSITION 60;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODFILIALT5 POSITION 61;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODTIPOMOV5 POSITION 62;

ALTER TABLE SGPREFERE1 ALTER COLUMN ESTLOTNEG POSITION 63;

ALTER TABLE SGPREFERE1 ALTER COLUMN ESTNEG POSITION 64;

ALTER TABLE SGPREFERE1 ALTER COLUMN NATVENDA POSITION 65;

ALTER TABLE SGPREFERE1 ALTER COLUMN IPIVENDA POSITION 66;

ALTER TABLE SGPREFERE1 ALTER COLUMN CUSTOSICMS POSITION 67;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODEMPPG POSITION 68;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODFILIALPG POSITION 69;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODPLANOPAG POSITION 70;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODEMPTB POSITION 71;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODFILIALTB POSITION 72;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODTAB POSITION 73;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODEMPCE POSITION 74;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODFILIALCE POSITION 75;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODCLASCLI POSITION 76;

ALTER TABLE SGPREFERE1 ALTER COLUMN CASASDEC POSITION 77;

ALTER TABLE SGPREFERE1 ALTER COLUMN CASASDECFIN POSITION 78;

ALTER TABLE SGPREFERE1 ALTER COLUMN COMISPDUPL POSITION 79;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODEMPT6 POSITION 80;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODFILIALT6 POSITION 81;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODTIPOMOV6 POSITION 82;

ALTER TABLE SGPREFERE1 ALTER COLUMN BLOQVENDA POSITION 83;

ALTER TABLE SGPREFERE1 ALTER COLUMN BLOQCOMPRA POSITION 84;

ALTER TABLE SGPREFERE1 ALTER COLUMN VENDAMATPRIM POSITION 85;

ALTER TABLE SGPREFERE1 ALTER COLUMN VENDAPATRIM POSITION 86;

ALTER TABLE SGPREFERE1 ALTER COLUMN PEPSPROD POSITION 87;

ALTER TABLE SGPREFERE1 ALTER COLUMN CNPJFOROBRIG POSITION 88;

ALTER TABLE SGPREFERE1 ALTER COLUMN INSCESTFOROBRIG POSITION 89;

ALTER TABLE SGPREFERE1 ALTER COLUMN BUSCAPRODSIMILAR POSITION 90;

ALTER TABLE SGPREFERE1 ALTER COLUMN MULTIALMOX POSITION 91;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODEMPT8 POSITION 92;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODFILIALT8 POSITION 93;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODTIPOMOV8 POSITION 94;

ALTER TABLE SGPREFERE1 ALTER COLUMN ESTNEGGRUP POSITION 95;

ALTER TABLE SGPREFERE1 ALTER COLUMN USATABPE POSITION 96;

ALTER TABLE SGPREFERE1 ALTER COLUMN TAMDESCPROD POSITION 97;

ALTER TABLE SGPREFERE1 ALTER COLUMN DESCCOMPPED POSITION 98;

ALTER TABLE SGPREFERE1 ALTER COLUMN OBSCLIVEND POSITION 99;

ALTER TABLE SGPREFERE1 ALTER COLUMN CONTESTOQ POSITION 100;

ALTER TABLE SGPREFERE1 ALTER COLUMN DIASPEDT POSITION 101;

ALTER TABLE SGPREFERE1 ALTER COLUMN RECALCPCVENDA POSITION 102;

ALTER TABLE SGPREFERE1 ALTER COLUMN RECALCPCORC POSITION 103;

ALTER TABLE SGPREFERE1 ALTER COLUMN USALAYOUTPED POSITION 104;

ALTER TABLE SGPREFERE1 ALTER COLUMN VERIFALTPARCVENDA POSITION 105;

ALTER TABLE SGPREFERE1 ALTER COLUMN BUSCACODPRODGEN POSITION 106;

ALTER TABLE SGPREFERE1 ALTER COLUMN FILBUSCGENPROD POSITION 107;

ALTER TABLE SGPREFERE1 ALTER COLUMN FILBUSCGENREF POSITION 108;

ALTER TABLE SGPREFERE1 ALTER COLUMN FILBUSCGENCODBAR POSITION 109;

ALTER TABLE SGPREFERE1 ALTER COLUMN FILBUSCGENCODFAB POSITION 110;

ALTER TABLE SGPREFERE1 ALTER COLUMN FILBUSCGENCODFOR POSITION 111;

ALTER TABLE SGPREFERE1 ALTER COLUMN BUSCAVLRULTCOMPRA POSITION 112;

ALTER TABLE SGPREFERE1 ALTER COLUMN ICMSVENDA POSITION 113;

ALTER TABLE SGPREFERE1 ALTER COLUMN USAPRECOZERO POSITION 114;

ALTER TABLE SGPREFERE1 ALTER COLUMN USAIMGASSORC POSITION 115;

ALTER TABLE SGPREFERE1 ALTER COLUMN IMGASSORC POSITION 116;

ALTER TABLE SGPREFERE1 ALTER COLUMN CONSISTCPFCLI POSITION 117;

ALTER TABLE SGPREFERE1 ALTER COLUMN CONSISTEIECLI POSITION 118;

ALTER TABLE SGPREFERE1 ALTER COLUMN CONSISTEIEFOR POSITION 119;

ALTER TABLE SGPREFERE1 ALTER COLUMN CONSISTECPFFOR POSITION 120;

ALTER TABLE SGPREFERE1 ALTER COLUMN USANOMEVENDORC POSITION 121;

ALTER TABLE SGPREFERE1 ALTER COLUMN SISCONTABIL POSITION 122;

ALTER TABLE SGPREFERE1 ALTER COLUMN ATBANCOIMPBOL POSITION 123;

ALTER TABLE SGPREFERE1 ALTER COLUMN TIPOCODBAR POSITION 124;

ALTER TABLE SGPREFERE1 ALTER COLUMN ADICORCOBSPED POSITION 125;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODEMPMENSORC POSITION 126;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODFILIALMENSORC POSITION 127;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODMENSORC POSITION 128;

ALTER TABLE SGPREFERE1 ALTER COLUMN CUSTOCOMPRA POSITION 129;

ALTER TABLE SGPREFERE1 ALTER COLUMN TABTRANSPCP POSITION 130;

ALTER TABLE SGPREFERE1 ALTER COLUMN TABTRANSPORC POSITION 131;

ALTER TABLE SGPREFERE1 ALTER COLUMN TABSOLCP POSITION 132;

ALTER TABLE SGPREFERE1 ALTER COLUMN ADICFRETEBASEICM POSITION 133;

ALTER TABLE SGPREFERE1 ALTER COLUMN PRECOCPREL POSITION 134;

ALTER TABLE SGPREFERE1 ALTER COLUMN DESCORC POSITION 135;

ALTER TABLE SGPREFERE1 ALTER COLUMN MULTICOMIS POSITION 136;

ALTER TABLE SGPREFERE1 ALTER COLUMN USUATIVCLI POSITION 137;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODEMPHISTREC POSITION 138;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODFILIALHISTREC POSITION 139;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODHISTREC POSITION 140;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODEMPHISTPAG POSITION 141;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODFILIALHISTPAG POSITION 142;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODHISTPAG POSITION 143;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODEMPTC POSITION 144;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODFILIALTC POSITION 145;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODTIPOCLI POSITION 146;

ALTER TABLE SGPREFERE1 ALTER COLUMN ESTITRECALTDTVENC POSITION 147;

ALTER TABLE SGPREFERE1 ALTER COLUMN LCREDGLOBAL POSITION 148;

ALTER TABLE SGPREFERE1 ALTER COLUMN VDMANUTCOMOBRIG POSITION 149;

ALTER TABLE SGPREFERE1 ALTER COLUMN CLASSPED POSITION 150;

ALTER TABLE SGPREFERE1 ALTER COLUMN TIPOCLASSPED POSITION 151;

ALTER TABLE SGPREFERE1 ALTER COLUMN USAIBGECLI POSITION 152;

ALTER TABLE SGPREFERE1 ALTER COLUMN USAIBGEFOR POSITION 153;

ALTER TABLE SGPREFERE1 ALTER COLUMN USAIBGETRANSP POSITION 154;

ALTER TABLE SGPREFERE1 ALTER COLUMN SOMAVOLUMES POSITION 155;

ALTER TABLE SGPREFERE1 ALTER COLUMN BUSCACEP POSITION 156;

ALTER TABLE SGPREFERE1 ALTER COLUMN URLWSCEP POSITION 157;

ALTER TABLE SGPREFERE1 ALTER COLUMN CLASSCP POSITION 158;

ALTER TABLE SGPREFERE1 ALTER COLUMN LABELOBS01CP POSITION 159;

ALTER TABLE SGPREFERE1 ALTER COLUMN LABELOBS02CP POSITION 160;

ALTER TABLE SGPREFERE1 ALTER COLUMN LABELOBS03CP POSITION 161;

ALTER TABLE SGPREFERE1 ALTER COLUMN LABELOBS04CP POSITION 162;

ALTER TABLE SGPREFERE1 ALTER COLUMN CONSISTEIEPF POSITION 163;

ALTER TABLE SGPREFERE1 ALTER COLUMN CREDICMSSIMPLES POSITION 164;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODEMPMS POSITION 165;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODFILIALMS POSITION 166;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODMENSICMSSIMPLES POSITION 167;

ALTER TABLE SGPREFERE1 ALTER COLUMN GERACOMISVENDAORC POSITION 168;

ALTER TABLE SGPREFERE1 ALTER COLUMN GERACODUNIF POSITION 169;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODTIPOMOV9 POSITION 170;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODFILIALT9 POSITION 171;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODEMPT9 POSITION 172;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODEMPJP POSITION 173;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODFILIALJP POSITION 174;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODPLANJP POSITION 175;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODEMPJR POSITION 176;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODFILIALJR POSITION 177;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODPLANJR POSITION 178;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODEMPDR POSITION 179;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODFILIALDR POSITION 180;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODPLANDR POSITION 181;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODEMPDC POSITION 182;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODFILIALDC POSITION 183;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODPLANDC POSITION 184;

ALTER TABLE SGPREFERE1 ALTER COLUMN GERAPAGEMIS POSITION 185;

ALTER TABLE SGPREFERE1 ALTER COLUMN LANCAFINCONTR POSITION 186;

ALTER TABLE SGPREFERE1 ALTER COLUMN LANCARMACONTR POSITION 187;

ALTER TABLE SGPREFERE1 ALTER COLUMN CASASDECPRE POSITION 188;

ALTER TABLE SGPREFERE1 ALTER COLUMN VISUALIZALUCR POSITION 189;

ALTER TABLE SGPREFERE1 ALTER COLUMN CLASSNFE POSITION 190;

ALTER TABLE SGPREFERE1 ALTER COLUMN DIRNFE POSITION 191;

ALTER TABLE SGPREFERE1 ALTER COLUMN DIRNFELIN POSITION 192;

ALTER TABLE SGPREFERE1 ALTER COLUMN FORMATODANFE POSITION 193;

ALTER TABLE SGPREFERE1 ALTER COLUMN AMBIENTENFE POSITION 194;

ALTER TABLE SGPREFERE1 ALTER COLUMN PROCEMINFE POSITION 195;

ALTER TABLE SGPREFERE1 ALTER COLUMN VERPROCNFE POSITION 196;

ALTER TABLE SGPREFERE1 ALTER COLUMN KEYLICNFE POSITION 197;

ALTER TABLE SGPREFERE1 ALTER COLUMN DTVENCTONFE POSITION 198;

ALTER TABLE SGPREFERE1 ALTER COLUMN INFADPRODNFE POSITION 199;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODEMPNF POSITION 200;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODFILIALNF POSITION 201;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODEMAILNF POSITION 202;

ALTER TABLE SGPREFERE1 ALTER COLUMN EXIBEPARCOBSDANFE POSITION 203;

ALTER TABLE SGPREFERE1 ALTER COLUMN INFCPDEVOLUCAO POSITION 204;

ALTER TABLE SGPREFERE1 ALTER COLUMN INFVDREMESSA POSITION 205;

ALTER TABLE SGPREFERE1 ALTER COLUMN GERARECEMIS POSITION 206;

ALTER TABLE SGPREFERE1 ALTER COLUMN RETENSAOIMP POSITION 207;

ALTER TABLE SGPREFERE1 ALTER COLUMN TIPOCUSTOLUC POSITION 208;

ALTER TABLE SGPREFERE1 ALTER COLUMN TABIMPORTCP POSITION 209;

ALTER TABLE SGPREFERE1 ALTER COLUMN HABVLRTOTITORC POSITION 210;

ALTER TABLE SGPREFERE1 ALTER COLUMN USABUSCAGENPRODCP POSITION 211;

ALTER TABLE SGPREFERE1 ALTER COLUMN ADICOBSORCPED POSITION 212;

ALTER TABLE SGPREFERE1 ALTER COLUMN USAPRECOCOT POSITION 213;

ALTER TABLE SGPREFERE1 ALTER COLUMN BLOQPRECOAPROV POSITION 214;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODEMPFT POSITION 215;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODFILIALFT POSITION 216;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODTIPOFORFT POSITION 217;

ALTER TABLE SGPREFERE1 ALTER COLUMN USAPRECOCOMIS POSITION 218;

ALTER TABLE SGPREFERE1 ALTER COLUMN ESPECIALCOMIS POSITION 219;

ALTER TABLE SGPREFERE1 ALTER COLUMN DTINS POSITION 220;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODFILIALTS POSITION 221;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODTIPOMOVS POSITION 222;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODEMPTS POSITION 223;

ALTER TABLE SGPREFERE1 ALTER COLUMN HINS POSITION 224;

ALTER TABLE SGPREFERE1 ALTER COLUMN IDUSUINS POSITION 225;

ALTER TABLE SGPREFERE1 ALTER COLUMN DTALT POSITION 226;

ALTER TABLE SGPREFERE1 ALTER COLUMN HALT POSITION 227;

ALTER TABLE SGPREFERE1 ALTER COLUMN IDUSUALT POSITION 228;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODEMPSV POSITION 229;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODFILIALSV POSITION 230;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODPLANOPAGSV POSITION 231;

ALTER TABLE SGPREFERE1 ALTER COLUMN ARREDPRECO POSITION 232;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODEMPPC POSITION 233;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODFILIALPC POSITION 234;

ALTER TABLE SGPREFERE1 ALTER COLUMN CODPLANPC POSITION 235;

ALTER TABLE SGPREFERE1 ALTER COLUMN TPNOSSONUMERO POSITION 236;

ALTER TABLE SGPREFERE1 ALTER COLUMN IMPDOCBOL POSITION 237;

/* Create(Add) Crant */
GRANT DELETE, INSERT, SELECT, UPDATE ON FNITRENEGREC TO ADM;

GRANT DELETE, INSERT, SELECT, UPDATE ON FNRENEGREC TO ADM;

GRANT EXECUTE ON PROCEDURE FNGERASEQNOSSONUMERO TO ADM;

COMMIT;




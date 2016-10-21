

/*
DROP
  TABLE T_AM_ART_ADVOGADO CASCADE CONSTRAINTS ;

DROP
  TABLE T_AM_ART_BAIRRO CASCADE CONSTRAINTS ;

DROP
  TABLE T_AM_ART_CIDADE CASCADE CONSTRAINTS ;

DROP
  TABLE T_AM_ART_CLIENTE CASCADE CONSTRAINTS ;

DROP
  TABLE T_AM_ART_ESPECIALIDADE CASCADE CONSTRAINTS ;

DROP
  TABLE T_AM_ART_ESTADO CASCADE CONSTRAINTS ;

DROP
  TABLE T_AM_ART_FONE_PESSOA CASCADE CONSTRAINTS ;

DROP
  TABLE T_AM_ART_FORUM CASCADE CONSTRAINTS ;

DROP
  TABLE T_AM_ART_HIST_PROC_TX CASCADE CONSTRAINTS ;

DROP
  TABLE T_AM_ART_HIST_TAXA CASCADE CONSTRAINTS ;

DROP
  TABLE T_AM_ART_HORA_ADVOGADO CASCADE CONSTRAINTS ;

DROP
  TABLE T_AM_ART_LANCA_DESPESA CASCADE CONSTRAINTS ;

DROP
  TABLE T_AM_ART_LANCA_HONORARIO CASCADE CONSTRAINTS ;

DROP
  TABLE T_AM_ART_LOGRADOURO CASCADE CONSTRAINTS ;

DROP
  TABLE T_AM_ART_PESSOA CASCADE CONSTRAINTS ;

DROP
  TABLE T_AM_ART_PESSOA_ENDE CASCADE CONSTRAINTS ;

DROP
  TABLE T_AM_ART_PROCESSO CASCADE CONSTRAINTS ;

DROP
  TABLE T_AM_ART_TELEFONE CASCADE CONSTRAINTS ;

DROP
  TABLE T_AM_ART_TIPO_CAUSA CASCADE CONSTRAINTS ;

DROP
  TABLE T_AM_ART_TIPO_DESPESA CASCADE CONSTRAINTS ;

DROP
  TABLE T_AM_ART_TIPO_FONE CASCADE CONSTRAINTS ;

DROP
  TABLE T_AM_ART_TIPO_LOG CASCADE CONSTRAINTS ;

DROP
  TABLE T_AM_ART_TIPO_TAREFA CASCADE CONSTRAINTS ;
*/

CREATE
  TABLE T_AM_ART_ADVOGADO
  (
    cd_advogado NUMBER (8) NOT NULL ,
    nr_oab      NUMBER (8) NOT NULL ,
    nr_cpf      NUMBER (11) NOT NULL ,
    nr_rg       CHAR (10) NOT NULL ,
    ds_email    VARCHAR2 (128) NOT NULL ,
    ds_password VARCHAR2 (40)
  ) ;
ALTER TABLE T_AM_ART_ADVOGADO ADD CONSTRAINT PK_AM_ART_ADVOGADO PRIMARY KEY (
cd_advogado ) ;
ALTER TABLE T_AM_ART_ADVOGADO ADD CONSTRAINT UN_AM_ART_ADVOGADO_CPF UNIQUE ( nr_cpf
) ;
ALTER TABLE T_AM_ART_ADVOGADO ADD CONSTRAINT UN_AM_ART_ADVOGADO_RG UNIQUE ( nr_rg )
;
ALTER TABLE T_AM_ART_ADVOGADO ADD CONSTRAINT UN_AM_ART_ADVOGADO_OAB UNIQUE ( nr_oab
) ;


CREATE
  TABLE T_AM_ART_BAIRRO
  (
    cd_bairro NUMBER (6) NOT NULL ,
    cd_cidade NUMBER (4) NOT NULL ,
    nm_bairro VARCHAR2 (20) NOT NULL
  ) ;
ALTER TABLE T_AM_ART_BAIRRO ADD CONSTRAINT PK_AM_ART_BAIRRO PRIMARY KEY (
cd_bairro ) ;


CREATE
  TABLE T_AM_ART_CIDADE
  (
    cd_cidade NUMBER (4) NOT NULL ,
    cd_estado NUMBER (2) NOT NULL ,
    nm_cidade VARCHAR2 (20) NOT NULL
  ) ;
ALTER TABLE T_AM_ART_CIDADE ADD CONSTRAINT PK_AM_ART_CIDADE PRIMARY KEY (
cd_cidade ) ;


CREATE
  TABLE T_AM_ART_CLIENTE
  (
    cd_cliente       NUMBER (8) NOT NULL ,
    ds_razao_social  VARCHAR2 (128) NOT NULL ,
    nr_cnpj          NUMBER (15) NOT NULL ,
    nr_insc_estadual NUMBER (15) ,
    ds_email         VARCHAR2 (128) NOT NULL ,
    ds_password      VARCHAR2 (40)
  ) ;
ALTER TABLE T_AM_ART_CLIENTE ADD CONSTRAINT PK_AM_ART_CLIENTE PRIMARY KEY (
cd_cliente ) ;
ALTER TABLE T_AM_ART_CLIENTE ADD CONSTRAINT UN_AM_ART_CLIENTE_CNPJ UNIQUE (
nr_cnpj ) ;
ALTER TABLE T_AM_ART_CLIENTE ADD CONSTRAINT UN_AM_ART_CLIENTE_RAZAO UNIQUE (
ds_razao_social ) ;


CREATE
  TABLE T_AM_ART_ESPECIALIDADE
  (
    cd_advogado NUMBER (8) NOT NULL ,
    cd_causa    NUMBER (5) NOT NULL
  ) ;
ALTER TABLE T_AM_ART_ESPECIALIDADE ADD CONSTRAINT PK_AM_ART_ESPECIALIDADE
PRIMARY KEY ( cd_causa, cd_advogado ) ;


CREATE
  TABLE T_AM_ART_ESTADO
  (
    cd_estado NUMBER (2) NOT NULL ,
    nm_estado VARCHAR2 (20) NOT NULL ,
    sg_estado CHAR (2) NOT NULL
  ) ;
ALTER TABLE T_AM_ART_ESTADO ADD CONSTRAINT PK_AM_ART_ESTADO PRIMARY KEY (
cd_estado ) ;
ALTER TABLE T_AM_ART_ESTADO ADD CONSTRAINT UN_AM_ART_ESTADO UNIQUE ( nm_estado
) ;
ALTER TABLE T_AM_ART_ESTADO ADD CONSTRAINT UN_AM_ART_SIGLA_ESTADO UNIQUE (
sg_estado ) ;


CREATE
  TABLE T_AM_ART_FONE_PESSOA
  (
    cd_pessoa NUMBER (8) NOT NULL ,
    cd_fone   NUMBER (8) NOT NULL ,
    nr_ramal  NUMBER (4)
  ) ;
ALTER TABLE T_AM_ART_FONE_PESSOA ADD CONSTRAINT PK_AM_ART_FONE_PESSOA PRIMARY
KEY ( cd_pessoa, cd_fone ) ;


CREATE
  TABLE T_AM_ART_FORUM
  (
    cd_forum NUMBER (8) NOT NULL ,
    ds_forum VARCHAR2 (256) NOT NULL
  ) ;
ALTER TABLE T_AM_ART_FORUM ADD CONSTRAINT PK_AM_ART_FORUM PRIMARY KEY (
cd_forum ) ;


CREATE
  TABLE T_AM_ART_HIST_PROC_TX
  (
    nr_processo NUMBER (10) NOT NULL ,
    cd_taxa     NUMBER (4) NOT NULL ,
    dt_validade DATE NOT NULL
  ) ;
ALTER TABLE T_AM_ART_HIST_PROC_TX ADD CONSTRAINT PK_AM_ART_HIST_PROC_TX PRIMARY
KEY ( nr_processo, cd_taxa ) ;


CREATE
  TABLE T_AM_ART_HIST_TAXA
  (
    cd_taxa        NUMBER (4) NOT NULL ,
    dt_vigencia    DATE NOT NULL ,
    vl_taxa_adm    NUMBER (8,2) NOT NULL ,
    vl_taxa_juros  NUMBER (5,2) NOT NULL ,
    vl_mora_diaria NUMBER (4,2) NOT NULL
  ) ;
ALTER TABLE T_AM_ART_HIST_TAXA ADD CONSTRAINT CK_AM_ART_HIST_TAXA_ADM CHECK (
VL_TAXA_ADM>0) ;
ALTER TABLE T_AM_ART_HIST_TAXA ADD CONSTRAINT CK_AM_ART_HIST_TAXA_JUROS CHECK (
VL_TAXA_JUROS >0) ;
ALTER TABLE T_AM_ART_HIST_TAXA ADD CONSTRAINT CK_AM_ART_HIST_TAXA_MORA CHECK (
VL_MORA_DIARIA >0) ;
ALTER TABLE T_AM_ART_HIST_TAXA ADD CONSTRAINT PK_AM_ART_HIST_TAXA PRIMARY KEY (
cd_taxa ) ;


CREATE
  TABLE T_AM_ART_HORA_ADVOGADO
  (
    cd_advogado  NUMBER (8) NOT NULL ,
    cd_hist_hora NUMBER (4) NOT NULL ,
    dt_vigencia  DATE NOT NULL ,
    vl_hora      NUMBER (8,2) NOT NULL
  ) ;
ALTER TABLE T_AM_ART_HORA_ADVOGADO ADD CONSTRAINT CK_AM_ART_HORA_ADVOGADO CHECK
(VL_HORA>0) ;
ALTER TABLE T_AM_ART_HORA_ADVOGADO ADD CONSTRAINT PK_AM_ART_HORA_ADVOGADO
PRIMARY KEY ( cd_hist_hora, cd_advogado ) ;


CREATE
  TABLE T_AM_ART_LANCA_DESPESA
  (
    cd_lancamento   NUMBER (10) NOT NULL ,
    cd_tipo_despesa NUMBER (5) NOT NULL ,
    nr_processo     NUMBER (10) NOT NULL ,
    dt_despesa      DATE NOT NULL ,
    vl_despesa      NUMBER (8,2) NOT NULL ,
    ds_observacao   VARCHAR2 (256)
  ) ;
ALTER TABLE T_AM_ART_LANCA_DESPESA ADD CONSTRAINT CK_AM_ART_LANCA_DESPESA CHECK
(VL_DESPESA>0) ;
ALTER TABLE T_AM_ART_LANCA_DESPESA ADD CONSTRAINT PK_AM_ART_LANCA_DESPESA
PRIMARY KEY ( cd_lancamento ) ;


CREATE
  TABLE T_AM_ART_LANCA_HONORARIO
  (
    cd_lancamento  NUMBER (10) NOT NULL ,
    cd_tipo_tarefa NUMBER (3) NOT NULL ,
    nr_processo    NUMBER (10) NOT NULL ,
    dt_honorario   DATE NOT NULL ,
    qt_hora        NUMBER (8,2) NOT NULL ,
    ds_observacao  VARCHAR2 (256)
  ) ;
ALTER TABLE T_AM_ART_LANCA_HONORARIO ADD CONSTRAINT CK_AM_ART_LANCA_HONORARIO
CHECK (QT_HORA>0) ;
ALTER TABLE T_AM_ART_LANCA_HONORARIO ADD CONSTRAINT PK_AM_ART_LANCA_HONORARIO
PRIMARY KEY ( cd_lancamento ) ;


CREATE
  TABLE T_AM_ART_LOGRADOURO
  (
    nr_cep        NUMBER (8) NOT NULL ,
    cd_bairro     NUMBER (6) NOT NULL ,
    cd_tipo_log   NUMBER (2) NOT NULL ,
    ds_logradouro VARCHAR2 (60) NOT NULL
  ) ;
ALTER TABLE T_AM_ART_LOGRADOURO ADD CONSTRAINT PK_AM_ART_LOGRADOURO PRIMARY KEY
( nr_cep ) ;


CREATE
  TABLE T_AM_ART_PESSOA
  (
    cd_pessoa NUMBER (8) NOT NULL ,
    nm_pessoa VARCHAR2 (60) NOT NULL
  ) ;
ALTER TABLE T_AM_ART_PESSOA ADD CONSTRAINT PK_AM_ART_PESSOA PRIMARY KEY (
cd_pessoa ) ;


CREATE
  TABLE T_AM_ART_PESSOA_ENDE
  (
    cd_pessoa_ende NUMBER (10) NOT NULL ,
    nr_cep         NUMBER (8) NOT NULL ,
    cd_pessoa      NUMBER (8) NOT NULL ,
    nr_endereco    NUMBER (5) NOT NULL ,
    ds_complemento VARCHAR2 (20)
  ) ;
ALTER TABLE T_AM_ART_PESSOA_ENDE ADD CONSTRAINT PK_AM_ART_FUNC_ENDE PRIMARY KEY
( cd_pessoa_ende, nr_cep ) ;


CREATE
  TABLE T_AM_ART_PROCESSO
  (
    nr_processo       NUMBER (10) NOT NULL ,
    cd_advogado       NUMBER (8) NOT NULL ,
    cd_cliente        NUMBER (8) NOT NULL ,
    cd_causa          NUMBER (5) NOT NULL ,
    cd_forum          NUMBER (8) NOT NULL ,
    ds_processo       VARCHAR2 (60) NOT NULL ,
    dt_abertura       DATE NOT NULL ,
    dt_fechamento     DATE ,
    dt_dia_vencimento NUMBER (2) NOT NULL ,
    nr_resultado      NUMBER (1) ,
    nr_situacao       NUMBER (1) NOT NULL ,
    ds_observacao     VARCHAR2 (256)
  ) ;
ALTER TABLE T_AM_ART_PROCESSO ADD CONSTRAINT CK_AM_ART_PROCESSO_DATA CHECK (
DT_FECHAMENTO>DT_ABERTURA) ;
ALTER TABLE T_AM_ART_PROCESSO ADD CONSTRAINT CK_AM_ART_PROCESSO_DIA CHECK (
DT_DIA_VENCIMENTO>=1 AND DT_DIA_VENCIMENTO <= 30) ;
ALTER TABLE T_AM_ART_PROCESSO ADD CONSTRAINT CK_AM_ART_PROCESSO_RESULT CHECK (
NR_RESULTADO=1 OR NR_RESULTADO=2) ;
ALTER TABLE T_AM_ART_PROCESSO ADD CONSTRAINT CK_AM_ART_PROCESSO_SITUACAO CHECK
(NR_SITUACAO=1 OR NR_SITUACAO=2) ;
ALTER TABLE T_AM_ART_PROCESSO ADD CONSTRAINT PK_AM_ART_PROCESSO PRIMARY KEY (
nr_processo ) ;


CREATE
  TABLE T_AM_ART_TELEFONE
  (
    cd_fone      NUMBER (8) NOT NULL ,
    cd_tipo_fone NUMBER (2) NOT NULL ,
    nr_ddd       NUMBER (3) NOT NULL ,
    nr_fone      NUMBER (9) NOT NULL
  ) ;
ALTER TABLE T_AM_ART_TELEFONE ADD CONSTRAINT PK_AM_ART_TELEFONE PRIMARY KEY (
cd_fone ) ;


CREATE
  TABLE T_AM_ART_TIPO_CAUSA
  (
    cd_causa NUMBER (5) NOT NULL ,
    ds_causa VARCHAR2 (40) NOT NULL
  ) ;
ALTER TABLE T_AM_ART_TIPO_CAUSA ADD CONSTRAINT PK_AM_ART_TIPO_CAUSA PRIMARY KEY
( cd_causa ) ;
ALTER TABLE T_AM_ART_TIPO_CAUSA ADD CONSTRAINT UN_AM_ART_TIPO_CAUSA UNIQUE (
ds_causa ) ;


CREATE
  TABLE T_AM_ART_TIPO_DESPESA
  (
    cd_tipo_despesa NUMBER (5) NOT NULL ,
    ds_tipo_despesa VARCHAR2 (256) NOT NULL
  ) ;
ALTER TABLE T_AM_ART_TIPO_DESPESA ADD CONSTRAINT PK_AM_ART_TIPO_DESPESA PRIMARY
KEY ( cd_tipo_despesa ) ;
ALTER TABLE T_AM_ART_TIPO_DESPESA ADD CONSTRAINT UN_AM_ART_TIPO_DESPESA UNIQUE
( ds_tipo_despesa ) ;


CREATE
  TABLE T_AM_ART_TIPO_FONE
  (
    cd_tipo_fone NUMBER (2) NOT NULL ,
    ds_tipo_fone VARCHAR2 (20) NOT NULL
  ) ;
ALTER TABLE T_AM_ART_TIPO_FONE ADD CONSTRAINT PK_AM_ART_TIPO_FONE PRIMARY KEY (
cd_tipo_fone ) ;
ALTER TABLE T_AM_ART_TIPO_FONE ADD CONSTRAINT UN_AM_ART_TIPO_FONE UNIQUE (
ds_tipo_fone ) ;


CREATE
  TABLE T_AM_ART_TIPO_LOG
  (
    cd_tipo_log NUMBER (2) NOT NULL ,
    ds_tipo_log VARCHAR2 (20) NOT NULL
  ) ;
ALTER TABLE T_AM_ART_TIPO_LOG ADD CONSTRAINT PK_AM_ART_TIPO_LOG PRIMARY KEY (
cd_tipo_log ) ;
ALTER TABLE T_AM_ART_TIPO_LOG ADD CONSTRAINT UN_AM_ART_TIPO_LOG UNIQUE (
ds_tipo_log ) ;


CREATE
  TABLE T_AM_ART_TIPO_TAREFA
  (
    cd_tipo_tarefa NUMBER (3) NOT NULL ,
    ds_tipo_tarefa VARCHAR2 (256) NOT NULL
  ) ;
ALTER TABLE T_AM_ART_TIPO_TAREFA ADD CONSTRAINT PK_AM_ART_TIPO_TAREFA PRIMARY
KEY ( cd_tipo_tarefa ) ;
ALTER TABLE T_AM_ART_TIPO_TAREFA ADD CONSTRAINT UN_AM_ART_TIPO_TAREFA UNIQUE (
ds_tipo_tarefa ) ;


--FOREIGN KEYS
ALTER TABLE T_AM_ART_HORA_ADVOGADO ADD CONSTRAINT FK_AM_ART_ADV_HORA FOREIGN
KEY ( cd_advogado ) REFERENCES T_AM_ART_ADVOGADO ( cd_advogado ) ;

ALTER TABLE T_AM_ART_LOGRADOURO ADD CONSTRAINT FK_AM_ART_BAIRRO FOREIGN KEY (
cd_bairro ) REFERENCES T_AM_ART_BAIRRO ( cd_bairro ) ;

ALTER TABLE T_AM_ART_BAIRRO ADD CONSTRAINT FK_AM_ART_CIDADE FOREIGN KEY (
cd_cidade ) REFERENCES T_AM_ART_CIDADE ( cd_cidade ) ;

ALTER TABLE T_AM_ART_ESPECIALIDADE ADD CONSTRAINT FK_AM_ART_ESPEC_ADVOGADO
FOREIGN KEY ( cd_advogado ) REFERENCES T_AM_ART_ADVOGADO ( cd_advogado ) ;

ALTER TABLE T_AM_ART_ESPECIALIDADE ADD CONSTRAINT FK_AM_ART_ESPEC_CAUSA FOREIGN
KEY ( cd_causa ) REFERENCES T_AM_ART_TIPO_CAUSA ( cd_causa ) ;

ALTER TABLE T_AM_ART_CIDADE ADD CONSTRAINT FK_AM_ART_ESTADO FOREIGN KEY (
cd_estado ) REFERENCES T_AM_ART_ESTADO ( cd_estado ) ;

ALTER TABLE T_AM_ART_FONE_PESSOA ADD CONSTRAINT FK_AM_ART_FONE FOREIGN KEY (
cd_fone ) REFERENCES T_AM_ART_TELEFONE ( cd_fone ) ;

ALTER TABLE T_AM_ART_HIST_PROC_TX ADD CONSTRAINT FK_AM_ART_HIST_TAXA FOREIGN
KEY ( cd_taxa ) REFERENCES T_AM_ART_HIST_TAXA ( cd_taxa ) ;

ALTER TABLE T_AM_ART_PESSOA_ENDE ADD CONSTRAINT FK_AM_ART_LOGRADOURO FOREIGN
KEY ( nr_cep ) REFERENCES T_AM_ART_LOGRADOURO ( nr_cep ) ;

ALTER TABLE T_AM_ART_ADVOGADO ADD CONSTRAINT FK_AM_ART_PESSOA_ADV FOREIGN KEY (
cd_advogado ) REFERENCES T_AM_ART_PESSOA ( cd_pessoa ) ;

ALTER TABLE T_AM_ART_CLIENTE ADD CONSTRAINT FK_AM_ART_PESSOA_CLIENTE FOREIGN
KEY ( cd_cliente ) REFERENCES T_AM_ART_PESSOA ( cd_pessoa ) ;

ALTER TABLE T_AM_ART_PESSOA_ENDE ADD CONSTRAINT FK_AM_ART_PESSOA_ENDE FOREIGN
KEY ( cd_pessoa ) REFERENCES T_AM_ART_PESSOA ( cd_pessoa ) ;

ALTER TABLE T_AM_ART_FONE_PESSOA ADD CONSTRAINT FK_AM_ART_PESSOA_FONE FOREIGN
KEY ( cd_pessoa ) REFERENCES T_AM_ART_PESSOA ( cd_pessoa ) ;

ALTER TABLE T_AM_ART_FORUM ADD CONSTRAINT FK_AM_ART_PESSOA_FORUM FOREIGN KEY (
cd_forum ) REFERENCES T_AM_ART_PESSOA ( cd_pessoa ) ;

ALTER TABLE T_AM_ART_PROCESSO ADD CONSTRAINT FK_AM_ART_PROC_CLIENTE FOREIGN KEY
( cd_cliente ) REFERENCES T_AM_ART_CLIENTE ( cd_cliente ) ;

ALTER TABLE T_AM_ART_LANCA_DESPESA ADD CONSTRAINT FK_AM_ART_PROC_DESP FOREIGN
KEY ( nr_processo ) REFERENCES T_AM_ART_PROCESSO ( nr_processo ) ;

ALTER TABLE T_AM_ART_PROCESSO ADD CONSTRAINT FK_AM_ART_PROC_ESPEC FOREIGN KEY (
cd_causa, cd_advogado ) REFERENCES T_AM_ART_ESPECIALIDADE ( cd_causa,
cd_advogado ) ;

ALTER TABLE T_AM_ART_PROCESSO ADD CONSTRAINT FK_AM_ART_PROC_FORUM FOREIGN KEY (
cd_forum ) REFERENCES T_AM_ART_FORUM ( cd_forum ) ;

ALTER TABLE T_AM_ART_LANCA_HONORARIO ADD CONSTRAINT FK_AM_ART_PROC_HONO FOREIGN
KEY ( nr_processo ) REFERENCES T_AM_ART_PROCESSO ( nr_processo ) ;

ALTER TABLE T_AM_ART_HIST_PROC_TX ADD CONSTRAINT FK_AM_ART_PROC_TX FOREIGN KEY
( nr_processo ) REFERENCES T_AM_ART_PROCESSO ( nr_processo ) ;

ALTER TABLE T_AM_ART_LANCA_DESPESA ADD CONSTRAINT FK_AM_ART_TIPO_DESP FOREIGN
KEY ( cd_tipo_despesa ) REFERENCES T_AM_ART_TIPO_DESPESA ( cd_tipo_despesa ) ;

ALTER TABLE T_AM_ART_TELEFONE ADD CONSTRAINT FK_AM_ART_TIPO_FONE FOREIGN KEY (
cd_tipo_fone ) REFERENCES T_AM_ART_TIPO_FONE ( cd_tipo_fone ) ;

ALTER TABLE T_AM_ART_LOGRADOURO ADD CONSTRAINT FK_AM_ART_TIPO_LOG FOREIGN KEY (
cd_tipo_log ) REFERENCES T_AM_ART_TIPO_LOG ( cd_tipo_log ) ;

ALTER TABLE T_AM_ART_LANCA_HONORARIO ADD CONSTRAINT FK_AM_ART_TIPO_TAREFA
FOREIGN KEY ( cd_tipo_tarefa ) REFERENCES T_AM_ART_TIPO_TAREFA ( cd_tipo_tarefa
) ;
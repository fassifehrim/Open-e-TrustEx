USE etrustex;

CREATE TABLE `cpa_tb_business_domain` (
  `CBD_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CRE_DT` datetime DEFAULT NULL,
  `CRE_ID` varchar(255) DEFAULT NULL,
  `MOD_DT` datetime DEFAULT NULL,
  `MOD_ID` varchar(255) DEFAULT NULL,
  `CBD_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CBD_ID`),
  UNIQUE KEY `CBD_NAME` (`CBD_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `cpa_tb_user` (
  `CUS_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CRE_DT` datetime DEFAULT NULL,
  `CRE_ID` varchar(255) DEFAULT NULL,
  `MOD_DT` datetime DEFAULT NULL,
  `MOD_ID` varchar(255) DEFAULT NULL,
  `CUS_NAME` varchar(255) NOT NULL,
  `CUS_PASSW` varchar(255) NOT NULL,
  PRIMARY KEY (`CUS_ID`),
  UNIQUE KEY `CUS_NAME` (`CUS_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `cpa_tb_user_role` (
  `RDL_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CRE_DT` datetime DEFAULT NULL,
  `CRE_ID` varchar(255) DEFAULT NULL,
  `MOD_DT` datetime DEFAULT NULL,
  `MOD_ID` varchar(255) DEFAULT NULL,
  `RDL_CODE` varchar(255) NOT NULL,
  `RDL_DESC` varchar(255) NOT NULL,
  PRIMARY KEY (`RDL_ID`),
  UNIQUE KEY `RDL_CODE` (`RDL_CODE`),
  UNIQUE KEY `RDL_DESC` (`RDL_DESC`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `etr_tb_credentials` (
  `CRED_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CRE_DT` datetime DEFAULT NULL,
  `CRE_ID` varchar(255) DEFAULT NULL,
  `MOD_DT` datetime DEFAULT NULL,
  `MOD_ID` varchar(255) DEFAULT NULL,
  `CRED_CERT` varchar(255) DEFAULT NULL,
  `CRED_PASSW` varchar(255) NOT NULL,
  `CRED_PASSW_ENCRYPTED` tinyint(1) NOT NULL,
  `CRED_SIG_REQUIRED` tinyint(1) NOT NULL,
  `CRED_USER` varchar(255) NOT NULL,
  PRIMARY KEY (`CRED_ID`),
  UNIQUE KEY `CRED_USER` (`CRED_USER`),
  UNIQUE KEY `CRED_CERT` (`CRED_CERT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `etr_tb_certificate` (
  `CERT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CRE_DT` datetime DEFAULT NULL,
  `CRE_ID` varchar(255) DEFAULT NULL,
  `MOD_DT` datetime DEFAULT NULL,
  `MOD_ID` varchar(255) DEFAULT NULL,
  `CERT_ATTRIBUTES` varchar(255) DEFAULT NULL,
  `CERT_ENCODED_DATA` varchar(4000) NOT NULL,
  `CERT_HOLDER` varchar(255) NOT NULL,
  `CERT_ISSUER` varchar(255) NOT NULL,
  `CERT_SERIAL_NR` varchar(255) NOT NULL,
  `CERT_SIGN_ALG` varchar(255) DEFAULT NULL,
  `CERT_SIGN_VAL` varchar(255) DEFAULT NULL,
  `CERT_TYPE` varchar(255) NOT NULL,
  `CERT_USAGE` varchar(255) NOT NULL,
  `CERT_VALID_TO` datetime DEFAULT NULL,
  `CERT_VALID_FROM` datetime DEFAULT NULL,
  `CERT_VERSION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CERT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `etr_tb_cia_level` (
  `CIA_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CRE_DT` datetime DEFAULT NULL,
  `CRE_ID` varchar(255) DEFAULT NULL,
  `MOD_DT` datetime DEFAULT NULL,
  `MOD_ID` varchar(255) DEFAULT NULL,
  `CIA_AVAILABILITY_LVL` int(11) NOT NULL,
  `CIA_CONFIDENTIALITY_LVL` int(11) NOT NULL,
  `CIA_INTEGRITY_LVL` int(11) NOT NULL,
  PRIMARY KEY (`CIA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `etr_tb_party` (
  `PTY_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CRE_DT` datetime DEFAULT NULL,
  `CRE_ID` varchar(255) DEFAULT NULL,
  `MOD_DT` datetime DEFAULT NULL,
  `MOD_ID` varchar(255) DEFAULT NULL,
  `PTY_PARTY_NAME` varchar(255) NOT NULL,
  `PTY_THIRD_PTY_FL` tinyint(1) DEFAULT NULL,
  `PTY_BUSINESS_DOMAIN` bigint(20) DEFAULT NULL,
  `PTY_CERT_ID` bigint(20) DEFAULT NULL,
  `PTY_CRED_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PTY_ID`),
  UNIQUE KEY `PTY_PARTY_NAME` (`PTY_PARTY_NAME`),
  UNIQUE KEY `PTY_CRED_ID` (`PTY_CRED_ID`),
  UNIQUE KEY `PTY_PARTY_NAME_2` (`PTY_PARTY_NAME`,`PTY_BUSINESS_DOMAIN`),
  KEY `FK92B82CF1E5C12197` (`PTY_BUSINESS_DOMAIN`),
  KEY `FK92B82CF1B9A0FD68` (`PTY_CERT_ID`),
  KEY `FK92B82CF16BEB6763` (`PTY_CRED_ID`),
  CONSTRAINT `FK92B82CF16BEB6763` FOREIGN KEY (`PTY_CRED_ID`) REFERENCES `etr_tb_credentials` (`CRED_ID`),
  CONSTRAINT `FK92B82CF1B9A0FD68` FOREIGN KEY (`PTY_CERT_ID`) REFERENCES `etr_tb_certificate` (`CERT_ID`),
  CONSTRAINT `FK92B82CF1E5C12197` FOREIGN KEY (`PTY_BUSINESS_DOMAIN`) REFERENCES `cpa_tb_business_domain` (`CBD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `cpa_tb_user_rights` (
  `CUR_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CRE_DT` datetime DEFAULT NULL,
  `CRE_ID` varchar(255) DEFAULT NULL,
  `MOD_DT` datetime DEFAULT NULL,
  `MOD_ID` varchar(255) DEFAULT NULL,
  `CUR_BUD_ID` bigint(20) DEFAULT NULL,
  `CUR_PTY_ID` bigint(20) DEFAULT NULL,
  `CUR_URR_ID` bigint(20) DEFAULT NULL,
  `CUR_USR_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CUR_ID`),
  KEY `FKCD084AA5F152CD46` (`CUR_BUD_ID`),
  KEY `FKCD084AA51589B62F` (`CUR_PTY_ID`),
  KEY `FKCD084AA5ABEBE57F` (`CUR_URR_ID`),
  KEY `FKCD084AA58161C2EA` (`CUR_USR_ID`),
  CONSTRAINT `FKCD084AA58161C2EA` FOREIGN KEY (`CUR_USR_ID`) REFERENCES `cpa_tb_user` (`CUS_ID`),
  CONSTRAINT `FKCD084AA51589B62F` FOREIGN KEY (`CUR_PTY_ID`) REFERENCES `etr_tb_party` (`PTY_ID`),
  CONSTRAINT `FKCD084AA5ABEBE57F` FOREIGN KEY (`CUR_URR_ID`) REFERENCES `cpa_tb_user_role` (`RDL_ID`),
  CONSTRAINT `FKCD084AA5F152CD46` FOREIGN KEY (`CUR_BUD_ID`) REFERENCES `cpa_tb_business_domain` (`CBD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `etr_tb_state_machine` (
  `SM_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `SM_DEFINITION` longtext,
  PRIMARY KEY (`SM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `etr_tb_document` (
  `DOC_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CRE_DT` datetime DEFAULT NULL,
  `CRE_ID` varchar(255) DEFAULT NULL,
  `MOD_DT` datetime DEFAULT NULL,
  `MOD_ID` varchar(255) DEFAULT NULL,
  `DOC_TYPE_CD` varchar(255) DEFAULT NULL,
  `DOC_LOCAL_NAME` varchar(255) NOT NULL,
  `DOC_NAME` varchar(255) NOT NULL,
  `DOC_NAMESPACE` varchar(255) DEFAULT NULL,
  `DOC_VERSION` varchar(255) DEFAULT NULL,
  `DOC_SM_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DOC_ID`),
  KEY `FKD3300310152F5AC0` (`DOC_SM_ID`),
  CONSTRAINT `FKD3300310152F5AC0` FOREIGN KEY (`DOC_SM_ID`) REFERENCES `etr_tb_state_machine` (`SM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `etr_tb_profile` (
  `PRO_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CRE_DT` datetime DEFAULT NULL,
  `CRE_ID` varchar(255) DEFAULT NULL,
  `MOD_DT` datetime DEFAULT NULL,
  `MOD_ID` varchar(255) DEFAULT NULL,
  `PRO_NAME` varchar(255) NOT NULL,
  `PRO_NAMESPACE` varchar(255) DEFAULT NULL,
  `PRO_BUD_ID` bigint(20) DEFAULT NULL,
  `PRO_CIA_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PRO_ID`),
  KEY `FKE23240F4649CB839` (`PRO_BUD_ID`),
  KEY `FKE23240F4C58BE095` (`PRO_CIA_ID`),
  CONSTRAINT `FKE23240F4C58BE095` FOREIGN KEY (`PRO_CIA_ID`) REFERENCES `etr_tb_cia_level` (`CIA_ID`),
  CONSTRAINT `FKE23240F4649CB839` FOREIGN KEY (`PRO_BUD_ID`) REFERENCES `cpa_tb_business_domain` (`CBD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `etr_tb_interchange_agr` (
  `ICA_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CRE_DT` datetime DEFAULT NULL,
  `CRE_ID` varchar(255) DEFAULT NULL,
  `MOD_DT` datetime DEFAULT NULL,
  `MOD_ID` varchar(255) DEFAULT NULL,
  `ICA_VAL_START_DT` datetime DEFAULT NULL,
  `INT_CIA_ID` bigint(20) DEFAULT NULL,
  `ICA_PRO_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ICA_ID`),
  KEY `FKFF481E04CDDDED13` (`INT_CIA_ID`),
  KEY `FKFF481E042FA8EAD3` (`ICA_PRO_ID`),
  CONSTRAINT `FKFF481E042FA8EAD3` FOREIGN KEY (`ICA_PRO_ID`) REFERENCES `etr_tb_profile` (`PRO_ID`),
  CONSTRAINT `FKFF481E04CDDDED13` FOREIGN KEY (`INT_CIA_ID`) REFERENCES `etr_tb_cia_level` (`CIA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `etr_tb_role` (
  `ROL_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CRE_DT` datetime DEFAULT NULL,
  `CRE_ID` varchar(255) DEFAULT NULL,
  `MOD_DT` datetime DEFAULT NULL,
  `MOD_ID` varchar(255) DEFAULT NULL,
  `ROL_IS_BIDIRECTIONAL` tinyint(1) DEFAULT NULL,
  `ROL_CODE` varchar(255) NOT NULL,
  `ROL_NAME` varchar(255) NOT NULL,
  `ROL_IS_TECHNICAL` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ROL_ID`),
  UNIQUE KEY `ROL_CODE` (`ROL_CODE`),
  UNIQUE KEY `ROL_NAME` (`ROL_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `etr_tb_transaction` (
  `TRA_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CRE_DT` datetime DEFAULT NULL,
  `CRE_ID` varchar(255) DEFAULT NULL,
  `MOD_DT` datetime DEFAULT NULL,
  `MOD_ID` varchar(255) DEFAULT NULL,
  `TRA_NAME` varchar(255) NOT NULL,
  `TRA_NAMESPACE` varchar(255) DEFAULT NULL,
  `TRA_REQ_LOCAL_NAME` varchar(255) DEFAULT NULL,
  `TRA_RES_LOCAL_NAME` varchar(255) DEFAULT NULL,
  `TRA_VERSION` varchar(255) DEFAULT NULL,
  `TRA_CIA_ID` bigint(20) DEFAULT NULL,
  `TRA_DOC_ID` bigint(20) DEFAULT NULL,
  `TRA_REC_ROL_ID` bigint(20) DEFAULT NULL,
  `TRA_SEN_ROL_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`TRA_ID`),
  KEY `FK81A2E4A9E86130DF` (`TRA_CIA_ID`),
  KEY `FK81A2E4A968C364D4` (`TRA_DOC_ID`),
  KEY `FK81A2E4A94F545E47` (`TRA_REC_ROL_ID`),
  KEY `FK81A2E4A9BA4ABCFB` (`TRA_SEN_ROL_ID`),
  CONSTRAINT `FK81A2E4A9BA4ABCFB` FOREIGN KEY (`TRA_SEN_ROL_ID`) REFERENCES `etr_tb_role` (`ROL_ID`),
  CONSTRAINT `FK81A2E4A94F545E47` FOREIGN KEY (`TRA_REC_ROL_ID`) REFERENCES `etr_tb_role` (`ROL_ID`),
  CONSTRAINT `FK81A2E4A968C364D4` FOREIGN KEY (`TRA_DOC_ID`) REFERENCES `etr_tb_document` (`DOC_ID`),
  CONSTRAINT `FK81A2E4A9E86130DF` FOREIGN KEY (`TRA_CIA_ID`) REFERENCES `etr_tb_cia_level` (`CIA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `etr_tb_endpoint` (
  `EDP_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `EDP_MSG_TYPE` varchar(255) NOT NULL,
  `EDP_ACTIVE_FLAG` tinyint(1) NOT NULL,
  `EDP_AUTH_FLAG` tinyint(1) NOT NULL,
  `EDP_PROXY_HOST` varchar(255) DEFAULT NULL,
  `EDP_PROXY_PORT` int(11) DEFAULT NULL,
  `EDP_USE_PROXY` tinyint(1) DEFAULT NULL,
  `EDP_CRED_ID` bigint(20) DEFAULT NULL,
  `EDP_ICA_ID` bigint(20) DEFAULT NULL,
  `EDP_PTY_ID` bigint(20) DEFAULT NULL,
  `EDP_PRO_ID` bigint(20) DEFAULT NULL,
  `EDP_PROXY_CRED_ID` bigint(20) DEFAULT NULL,
  `EDP_TRA_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`EDP_ID`),
  KEY `FK79A4F8A8B18C01F` (`EDP_CRED_ID`),
  KEY `FK79A4F8A1498B59A` (`EDP_ICA_ID`),
  KEY `FK79A4F8A55CEDF9E` (`EDP_PTY_ID`),
  KEY `FK79A4F8A8F93669` (`EDP_PRO_ID`),
  KEY `FK79A4F8A7FE685CE` (`EDP_PROXY_CRED_ID`),
  KEY `FK79A4F8A52D4BA68` (`EDP_TRA_ID`),
  CONSTRAINT `FK79A4F8A52D4BA68` FOREIGN KEY (`EDP_TRA_ID`) REFERENCES `etr_tb_transaction` (`TRA_ID`),
  CONSTRAINT `FK79A4F8A1498B59A` FOREIGN KEY (`EDP_ICA_ID`) REFERENCES `etr_tb_interchange_agr` (`ICA_ID`),
  CONSTRAINT `FK79A4F8A55CEDF9E` FOREIGN KEY (`EDP_PTY_ID`) REFERENCES `etr_tb_party` (`PTY_ID`),
  CONSTRAINT `FK79A4F8A7FE685CE` FOREIGN KEY (`EDP_PROXY_CRED_ID`) REFERENCES `etr_tb_credentials` (`CRED_ID`),
  CONSTRAINT `FK79A4F8A8B18C01F` FOREIGN KEY (`EDP_CRED_ID`) REFERENCES `etr_tb_credentials` (`CRED_ID`),
  CONSTRAINT `FK79A4F8A8F93669` FOREIGN KEY (`EDP_PRO_ID`) REFERENCES `etr_tb_profile` (`PRO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `etr_tb_endpoint_jms` (
  `EDP_JMS_CFACT_NM` varchar(255) DEFAULT NULL,
  `EDP_JMS_DEST_JNDI_NM` varchar(255) NOT NULL,
  `EDP_JMS_INIT_CONT_FACT` varchar(255) DEFAULT NULL,
  `EDP_JMS_MESS_CON_CLASS` varchar(255) DEFAULT NULL,
  `EDP_JMS_PROV_URL` varchar(255) DEFAULT NULL,
  `ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKB9FC93B79F3B3F3` (`ID`),
  CONSTRAINT `FKB9FC93B79F3B3F3` FOREIGN KEY (`ID`) REFERENCES `etr_tb_endpoint` (`EDP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `etr_tb_endpoint_ws` (
  `EDP_WS_REQUIRE_SIGNED_RESP_FL` tinyint(1) NOT NULL,
  `EDP_WS_SING_FL` tinyint(1) NOT NULL,
  `EDP_WS_URL` varchar(255) NOT NULL,
  `ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKBE4F7BB179F3B3F3` (`ID`),
  CONSTRAINT `FKBE4F7BB179F3B3F3` FOREIGN KEY (`ID`) REFERENCES `etr_tb_endpoint` (`EDP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `etr_tb_extraction_config` (
  `DE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DE_KEY` varchar(255) NOT NULL,
  `DE_XPATH` varchar(255) NOT NULL,
  `TRA_DOC_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DE_ID`),
  KEY `FKB526E84568C364D4` (`TRA_DOC_ID`),
  CONSTRAINT `FKB526E84568C364D4` FOREIGN KEY (`TRA_DOC_ID`) REFERENCES `etr_tb_document` (`DOC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `etr_tb_party_role` (
  `PAR_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CRE_DT` datetime DEFAULT NULL,
  `CRE_ID` varchar(255) DEFAULT NULL,
  `MOD_DT` datetime DEFAULT NULL,
  `MOD_ID` varchar(255) DEFAULT NULL,
  `PAR_PTY_ID` bigint(20) DEFAULT NULL,
  `PAR_ROL_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PAR_ID`),
  UNIQUE KEY `PAR_PTY_ID` (`PAR_PTY_ID`,`PAR_ROL_ID`),
  KEY `FK16247304E7EBC8AE` (`PAR_PTY_ID`),
  KEY `FK1624730471DB20FA` (`PAR_ROL_ID`),
  CONSTRAINT `FK1624730471DB20FA` FOREIGN KEY (`PAR_ROL_ID`) REFERENCES `etr_tb_role` (`ROL_ID`),
  CONSTRAINT `FK16247304E7EBC8AE` FOREIGN KEY (`PAR_PTY_ID`) REFERENCES `etr_tb_party` (`PTY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `etr_tb_ica_partyrole` (
  `ICA_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PAR_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ICA_ID`,`PAR_ID`),
  KEY `FK87E5F78F69D5FD3A` (`PAR_ID`),
  KEY `FK87E5F78FB4F0194C` (`ICA_ID`),
  CONSTRAINT `FK87E5F78FB4F0194C` FOREIGN KEY (`ICA_ID`) REFERENCES `etr_tb_interchange_agr` (`ICA_ID`),
  CONSTRAINT `FK87E5F78F69D5FD3A` FOREIGN KEY (`PAR_ID`) REFERENCES `etr_tb_party_role` (`PAR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `etr_tb_message` (
  `MSG_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CRE_DT` datetime DEFAULT NULL,
  `CRE_ID` varchar(255) DEFAULT NULL,
  `MOD_DT` datetime DEFAULT NULL,
  `MOD_ID` varchar(255) DEFAULT NULL,
  `MSG_CORRELATION_ID` varchar(255) DEFAULT NULL,
  `MSG_DOCUMENT_ID` varchar(255) NOT NULL,
  `MSG_ISSUE_DT` datetime DEFAULT NULL,
  `MSG_DOC_TYPE_CD` varchar(255) NOT NULL,
  `MSG_RECEIPT_DT` datetime DEFAULT NULL,
  `MSG_RSP_CD` varchar(255) DEFAULT NULL,
  `MSG_RETRIEVED_FL` tinyint(1) DEFAULT NULL,
  `MSG_STS_CD` varchar(255) DEFAULT NULL,
  `MSG_AGR_ID` bigint(20) DEFAULT NULL,
  `MSG_ISSUER_ID` bigint(20) NOT NULL,
  `MSG_RECEIVER_ID` bigint(20) DEFAULT NULL,
  `MSG_SENDER_ID` bigint(20) NOT NULL,
  `MSG_TRANS_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`MSG_ID`),
  KEY `FK2D8EB752B2957F25` (`MSG_AGR_ID`),
  KEY `FK2D8EB752CD5931CE` (`MSG_ISSUER_ID`),
  KEY `FK2D8EB7523DCBBE58` (`MSG_RECEIVER_ID`),
  KEY `FK2D8EB752C43388D2` (`MSG_SENDER_ID`),
  KEY `FK2D8EB752EB6FFDF3` (`MSG_TRANS_ID`),
  CONSTRAINT `FK2D8EB752EB6FFDF3` FOREIGN KEY (`MSG_TRANS_ID`) REFERENCES `etr_tb_transaction` (`TRA_ID`),
  CONSTRAINT `FK2D8EB7523DCBBE58` FOREIGN KEY (`MSG_RECEIVER_ID`) REFERENCES `etr_tb_party` (`PTY_ID`),
  CONSTRAINT `FK2D8EB752B2957F25` FOREIGN KEY (`MSG_AGR_ID`) REFERENCES `etr_tb_interchange_agr` (`ICA_ID`),
  CONSTRAINT `FK2D8EB752C43388D2` FOREIGN KEY (`MSG_SENDER_ID`) REFERENCES `etr_tb_party` (`PTY_ID`),
  CONSTRAINT `FK2D8EB752CD5931CE` FOREIGN KEY (`MSG_ISSUER_ID`) REFERENCES `etr_tb_party` (`PTY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `etr_tb_message_binary` (
  `MSG_BIN_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CRE_DT` datetime DEFAULT NULL,
  `CRE_ID` varchar(255) DEFAULT NULL,
  `MOD_DT` datetime DEFAULT NULL,
  `MOD_ID` varchar(255) DEFAULT NULL,
  `MSG_BIN_FILE` longblob,
  `MSG_BIN_TYPE` varchar(255) DEFAULT NULL,
  `MSG_BIN_FILE_ID` varchar(255) DEFAULT NULL,
  `MSG_BIN_MIME` varchar(255) DEFAULT NULL,
  `MSG_BIN_SIZE` bigint(20) DEFAULT NULL,
  `MSG_BIN_MSG_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`MSG_BIN_ID`),
  UNIQUE KEY `MSG_BIN_FILE_ID` (`MSG_BIN_FILE_ID`),
  KEY `FK6A1EC58E319BB8DB` (`MSG_BIN_MSG_ID`),
  CONSTRAINT `FK6A1EC58E319BB8DB` FOREIGN KEY (`MSG_BIN_MSG_ID`) REFERENCES `etr_tb_message` (`MSG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `etr_tb_metadata` (
  `MD_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MD_TYPE` varchar(255) DEFAULT NULL,
  `MD_VALUE` longtext,
  `PID_DOC_ID` bigint(20) DEFAULT NULL,
  `PID_ICA_ID` bigint(20) DEFAULT NULL,
  `PID_PRO_ID` bigint(20) DEFAULT NULL,
  `PID_TRA_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`MD_ID`),
  KEY `FK8500AD2498D93FEC` (`PID_DOC_ID`),
  KEY `FK8500AD249A88A280` (`PID_ICA_ID`),
  KEY `FK8500AD248EE9234F` (`PID_PRO_ID`),
  KEY `FK8500AD24D8C4A74E` (`PID_TRA_ID`),
  CONSTRAINT `FK8500AD24D8C4A74E` FOREIGN KEY (`PID_TRA_ID`) REFERENCES `etr_tb_transaction` (`TRA_ID`),
  CONSTRAINT `FK8500AD248EE9234F` FOREIGN KEY (`PID_PRO_ID`) REFERENCES `etr_tb_profile` (`PRO_ID`),
  CONSTRAINT `FK8500AD2498D93FEC` FOREIGN KEY (`PID_DOC_ID`) REFERENCES `etr_tb_document` (`DOC_ID`),
  CONSTRAINT `FK8500AD249A88A280` FOREIGN KEY (`PID_ICA_ID`) REFERENCES `etr_tb_interchange_agr` (`ICA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `etr_tb_msg_msg` (
  `MSG_CHILD_ID` bigint(20) NOT NULL,
  `MSG_PAR_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`MSG_CHILD_ID`,`MSG_PAR_ID`),
  KEY `FK44CF18EEFECAF083` (`MSG_PAR_ID`),
  KEY `FK44CF18EEA4F6EA8` (`MSG_CHILD_ID`),
  CONSTRAINT `FK44CF18EEA4F6EA8` FOREIGN KEY (`MSG_CHILD_ID`) REFERENCES `etr_tb_message` (`MSG_ID`),
  CONSTRAINT `FK44CF18EEFECAF083` FOREIGN KEY (`MSG_PAR_ID`) REFERENCES `etr_tb_message` (`MSG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `etr_tb_msg_response_code` (
  `RSC_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CRE_DT` datetime DEFAULT NULL,
  `CRE_ID` varchar(255) DEFAULT NULL,
  `MOD_DT` datetime DEFAULT NULL,
  `MOD_ID` varchar(255) DEFAULT NULL,
  `RSC_CD` varchar(255) NOT NULL,
  `RSC_VAL` varchar(255) NOT NULL,
  `RSC_STS_CD` varchar(255) DEFAULT NULL,
  `RSC_DOC_ID` bigint(20) DEFAULT NULL,
  `RSC_ICA_ID` bigint(20) DEFAULT NULL,
  `RSC_PRO_ID` bigint(20) DEFAULT NULL,
  `RSC_TRA_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`RSC_ID`),
  KEY `FK436AFC78E4374B55` (`RSC_DOC_ID`),
  KEY `FK436AFC78E5E6ADE9` (`RSC_ICA_ID`),
  KEY `FK436AFC78DA472EB8` (`RSC_PRO_ID`),
  KEY `FK436AFC782422B2B7` (`RSC_TRA_ID`),
  CONSTRAINT `FK436AFC782422B2B7` FOREIGN KEY (`RSC_TRA_ID`) REFERENCES `etr_tb_transaction` (`TRA_ID`),
  CONSTRAINT `FK436AFC78DA472EB8` FOREIGN KEY (`RSC_PRO_ID`) REFERENCES `etr_tb_profile` (`PRO_ID`),
  CONSTRAINT `FK436AFC78E4374B55` FOREIGN KEY (`RSC_DOC_ID`) REFERENCES `etr_tb_document` (`DOC_ID`),
  CONSTRAINT `FK436AFC78E5E6ADE9` FOREIGN KEY (`RSC_ICA_ID`) REFERENCES `etr_tb_interchange_agr` (`ICA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `etr_tb_party_id` (
  `PID_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CRE_DT` datetime DEFAULT NULL,
  `CRE_ID` varchar(255) DEFAULT NULL,
  `MOD_DT` datetime DEFAULT NULL,
  `MOD_ID` varchar(255) DEFAULT NULL,
  `PID_IDENTIFIER_SCHEME` varchar(255) DEFAULT NULL,
  `PID_IDENTIFIER_VALUE` varchar(255) DEFAULT NULL,
  `PID_PTY_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PID_ID`),
  KEY `FKE6B74F29DBBECC84` (`PID_PTY_ID`),
  CONSTRAINT `FKE6B74F29DBBECC84` FOREIGN KEY (`PID_PTY_ID`) REFERENCES `etr_tb_party` (`PTY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `etr_tb_partyagreement` (
  `PAG_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CRE_DT` datetime DEFAULT NULL,
  `CRE_ID` varchar(255) DEFAULT NULL,
  `MOD_DT` datetime DEFAULT NULL,
  `MOD_ID` varchar(255) DEFAULT NULL,
  `PAG_AUTH_PTY_ID` bigint(20) NOT NULL,
  `PAG_DEL_PTY_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`PAG_ID`),
  KEY `FK751E3419C0F7139E` (`PAG_AUTH_PTY_ID`),
  KEY `FK751E3419E04AB54D` (`PAG_DEL_PTY_ID`),
  CONSTRAINT `FK751E3419E04AB54D` FOREIGN KEY (`PAG_DEL_PTY_ID`) REFERENCES `etr_tb_party` (`PTY_ID`),
  CONSTRAINT `FK751E3419C0F7139E` FOREIGN KEY (`PAG_AUTH_PTY_ID`) REFERENCES `etr_tb_party` (`PTY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `etr_tb_partyagreement_tran` (
  `PAT_PAG_ID` bigint(20) NOT NULL,
  `PAT_TRA_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`PAT_PAG_ID`,`PAT_TRA_ID`),
  KEY `FKF9AD9791B4B3FD36` (`PAT_TRA_ID`),
  KEY `FKF9AD97919E1BEE1F` (`PAT_PAG_ID`),
  CONSTRAINT `FKF9AD97919E1BEE1F` FOREIGN KEY (`PAT_PAG_ID`) REFERENCES `etr_tb_partyagreement` (`PAG_ID`),
  CONSTRAINT `FKF9AD9791B4B3FD36` FOREIGN KEY (`PAT_TRA_ID`) REFERENCES `etr_tb_transaction` (`TRA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `etr_tb_profile_transaction` (
  `PTR_PRO_ID` bigint(20) NOT NULL,
  `PTR_TRA_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`PTR_PRO_ID`,`PTR_TRA_ID`),
  KEY `FK189537F3E605E08B` (`PTR_TRA_ID`),
  KEY `FK189537F39C2A5C8C` (`PTR_PRO_ID`),
  CONSTRAINT `FK189537F39C2A5C8C` FOREIGN KEY (`PTR_PRO_ID`) REFERENCES `etr_tb_profile` (`PRO_ID`),
  CONSTRAINT `FK189537F3E605E08B` FOREIGN KEY (`PTR_TRA_ID`) REFERENCES `etr_tb_transaction` (`TRA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `etr_tb_query_result` (
  `QR_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `QR_KEY` varchar(255) NOT NULL,
  `QR_VALUE` varchar(255) NOT NULL,
  `QR_MSG_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`QR_ID`),
  KEY `FK37964B094583F303` (`QR_MSG_ID`),
  CONSTRAINT `FK37964B094583F303` FOREIGN KEY (`QR_MSG_ID`) REFERENCES `etr_tb_message` (`MSG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `etr_tb_sla_policy` (
  `SLA_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CRE_DT` datetime DEFAULT NULL,
  `CRE_ID` varchar(255) DEFAULT NULL,
  `MOD_DT` datetime DEFAULT NULL,
  `MOD_ID` varchar(255) DEFAULT NULL,
  `SLA_ACTIVE_FL` tinyint(1) DEFAULT NULL,
  `SLA_FLEXIBILITY` int(11) DEFAULT NULL,
  `SLA_FREQUENCY` varchar(255) DEFAULT NULL,
  `SLA_TYPE` varchar(255) DEFAULT NULL,
  `SLA_VALUE` int(11) DEFAULT NULL,
  `SLA_BD_ID` bigint(20) DEFAULT NULL,
  `SLA_TRA_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`SLA_ID`),
  KEY `FKA1A234FE44BE511F` (`SLA_BD_ID`),
  KEY `FKA1A234FE3ACAC111` (`SLA_TRA_ID`),
  CONSTRAINT `FKA1A234FE3ACAC111` FOREIGN KEY (`SLA_TRA_ID`) REFERENCES `etr_tb_transaction` (`TRA_ID`),
  CONSTRAINT `FKA1A234FE44BE511F` FOREIGN KEY (`SLA_BD_ID`) REFERENCES `cpa_tb_business_domain` (`CBD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `etr_tb_xml_store` (
  `XS_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `XS_KEY` varchar(255) NOT NULL,
  `XS_VALUE` longtext,
  PRIMARY KEY (`XS_ID`),
  UNIQUE KEY `XS_KEY` (`XS_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `etr_tb_log` (
  `LOG_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CRE_DT` datetime DEFAULT NULL,
  `CRE_ID` varchar(255) DEFAULT NULL,
  `MOD_DT` datetime DEFAULT NULL,
  `MOD_ID` varchar(255) DEFAULT NULL,
  `LOG_BUS_CORRELATION_ID` varchar(255) DEFAULT NULL,
  `LOG_CORRELATION_ID` varchar(255) DEFAULT NULL,
  `LOG_DESCRIPTION` varchar(255) DEFAULT NULL,
  `LOG_DOCUMENT_ID` varchar(255) DEFAULT NULL,
  `LOG_DOCUMENT_TYPE_CD` varchar(255) DEFAULT NULL,
  `LOG_LARGE_VALUE` longtext,
  `LOG_TYPE` varchar(255) NOT NULL,
  `LOG_MSG_BIN_ID` bigint(20) DEFAULT NULL,
  `LOG_MSG_ID` bigint(20) DEFAULT NULL,
  `LOG_MSG_SIZE` bigint(20) DEFAULT NULL,
  `LOG_OPERATION` varchar(255) DEFAULT NULL,
  `LOG_URL_CONTEXT` varchar(255) DEFAULT NULL,
  `LOG_VALUE` varchar(255) DEFAULT NULL,
  `LOG_BUSINESS_DOMAIN` bigint(20) DEFAULT NULL,
  `LOG_ISSUER_PTY_ID` bigint(20) DEFAULT NULL,
  `LOG_RECEIVER_PTY_ID` bigint(20) DEFAULT NULL,
  `LOG_SENDER_PTY_ID` bigint(20) DEFAULT NULL,
  `LOG_TRA_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`LOG_ID`),
  KEY `FKF8F5C00F2C4C93E6` (`LOG_BUSINESS_DOMAIN`),
  KEY `FKF8F5C00FF83269DB` (`LOG_ISSUER_PTY_ID`),
  KEY `FKF8F5C00F93170CA5` (`LOG_RECEIVER_PTY_ID`),
  KEY `FKF8F5C00FBC419EDF` (`LOG_SENDER_PTY_ID`),
  KEY `FKF8F5C00FB8DD0375` (`LOG_TRA_ID`),
  CONSTRAINT `FKF8F5C00FB8DD0375` FOREIGN KEY (`LOG_TRA_ID`) REFERENCES `etr_tb_transaction` (`TRA_ID`),
  CONSTRAINT `FKF8F5C00F2C4C93E6` FOREIGN KEY (`LOG_BUSINESS_DOMAIN`) REFERENCES `cpa_tb_business_domain` (`CBD_ID`),
  CONSTRAINT `FKF8F5C00F93170CA5` FOREIGN KEY (`LOG_RECEIVER_PTY_ID`) REFERENCES `etr_tb_party` (`PTY_ID`),
  CONSTRAINT `FKF8F5C00FBC419EDF` FOREIGN KEY (`LOG_SENDER_PTY_ID`) REFERENCES `etr_tb_party` (`PTY_ID`),
  CONSTRAINT `FKF8F5C00FF83269DB` FOREIGN KEY (`LOG_ISSUER_PTY_ID`) REFERENCES `etr_tb_party` (`PTY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `etr_tb_service_endpoint` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NAME` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `etr_tb_service_ep_transaction` (
  `ENDPOINT_ID` bigint(20) NOT NULL,
  `TRANSACTION_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ENDPOINT_ID`,`TRANSACTION_ID`),
  KEY `FKF273554963023EFF` (`TRANSACTION_ID`),
  KEY `FKF2735549D9794AF4` (`ENDPOINT_ID`),
  CONSTRAINT `FKF2735549D9794AF4` FOREIGN KEY (`ENDPOINT_ID`) REFERENCES `etr_tb_service_endpoint` (`ID`),
  CONSTRAINT `FKF273554963023EFF` FOREIGN KEY (`TRANSACTION_ID`) REFERENCES `etr_tb_transaction` (`TRA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
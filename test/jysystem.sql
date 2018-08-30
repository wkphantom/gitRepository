/*
Navicat MySQL Data Transfer

Source Server         : yuanchengku
Source Server Version : 50513
Source Host           : 183.196.213.85:33606
Source Database       : jysystem

Target Server Type    : MYSQL
Target Server Version : 50513
File Encoding         : 65001

Date: 2018-04-11 08:11:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for act_evt_log
-- ----------------------------
DROP TABLE IF EXISTS `act_evt_log`;
CREATE TABLE `act_evt_log` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_evt_log
-- ----------------------------

-- ----------------------------
-- Table structure for act_ge_bytearray
-- ----------------------------
DROP TABLE IF EXISTS `act_ge_bytearray`;
CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ge_bytearray
-- ----------------------------
INSERT INTO `act_ge_bytearray` VALUES ('2', '1', 'source', null, 0x7B226964223A2263616E766173222C227265736F757263654964223A2263616E766173222C227374656E63696C736574223A7B226E616D657370616365223A22687474703A2F2F62336D6E2E6F72672F7374656E63696C7365742F62706D6E322E3023227D7D, null);

-- ----------------------------
-- Table structure for act_ge_property
-- ----------------------------
DROP TABLE IF EXISTS `act_ge_property`;
CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ge_property
-- ----------------------------
INSERT INTO `act_ge_property` VALUES ('next.dbid', '2501', '2');
INSERT INTO `act_ge_property` VALUES ('schema.history', 'create(5.18.0.1)', '1');
INSERT INTO `act_ge_property` VALUES ('schema.version', '5.18.0.1', '1');

-- ----------------------------
-- Table structure for act_hi_actinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_actinst`;
CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_actinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_attachment
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_attachment`;
CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_comment
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_comment`;
CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_comment
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_detail
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_detail`;
CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_detail
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_identitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_identitylink`;
CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_identitylink
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_procinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_procinst`;
CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_procinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_taskinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_taskinst`;
CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `CLAIM_TIME_` datetime DEFAULT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_taskinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_varinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_varinst`;
CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_varinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_group
-- ----------------------------
DROP TABLE IF EXISTS `act_id_group`;
CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_id_group
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_info
-- ----------------------------
DROP TABLE IF EXISTS `act_id_info`;
CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_id_info
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_membership
-- ----------------------------
DROP TABLE IF EXISTS `act_id_membership`;
CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_id_membership
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_user
-- ----------------------------
DROP TABLE IF EXISTS `act_id_user`;
CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_id_user
-- ----------------------------

-- ----------------------------
-- Table structure for act_procdef_info
-- ----------------------------
DROP TABLE IF EXISTS `act_procdef_info`;
CREATE TABLE `act_procdef_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_procdef_info
-- ----------------------------

-- ----------------------------
-- Table structure for act_re_deployment
-- ----------------------------
DROP TABLE IF EXISTS `act_re_deployment`;
CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_re_deployment
-- ----------------------------

-- ----------------------------
-- Table structure for act_re_model
-- ----------------------------
DROP TABLE IF EXISTS `act_re_model`;
CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_re_model
-- ----------------------------
INSERT INTO `act_re_model` VALUES ('1', '2', 'test', '12', null, '2018-01-26 10:56:20', '2018-01-26 10:56:20', '1', '{\"name\":\"test\",\"revision\":1,\"description\":\"\"}', null, '2', null, '');

-- ----------------------------
-- Table structure for act_re_procdef
-- ----------------------------
DROP TABLE IF EXISTS `act_re_procdef`;
CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_re_procdef
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_event_subscr
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_event_subscr`;
CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_event_subscr
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_execution
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_execution`;
CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_execution
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_identitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_identitylink`;
CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_identitylink
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_job`;
CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_task
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_task`;
CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `DUE_DATE_` datetime DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_task
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_variable
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_variable`;
CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_variable
-- ----------------------------

-- ----------------------------
-- Table structure for hd_bank_info
-- ----------------------------
DROP TABLE IF EXISTS `hd_bank_info`;
CREATE TABLE `hd_bank_info` (
  `id` varchar(32) NOT NULL,
  `bank_type` varchar(20) DEFAULT NULL COMMENT '开户行',
  `bank_card_id` varchar(20) DEFAULT NULL COMMENT '银行卡号',
  `mobile_telephone_number` varchar(20) DEFAULT NULL COMMENT '注册时的手机号码',
  `create_time` varchar(20) DEFAULT NULL,
  `account_id` varchar(32) DEFAULT NULL,
  `update_time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bank_card_id` (`bank_card_id`),
  UNIQUE KEY `bank_card_id_2` (`bank_card_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='银行卡相关的信息';

-- ----------------------------
-- Records of hd_bank_info
-- ----------------------------

-- ----------------------------
-- Table structure for hd_baoxianlipei
-- ----------------------------
DROP TABLE IF EXISTS `hd_baoxianlipei`;
CREATE TABLE `hd_baoxianlipei` (
  `hetongbianhao` varchar(100) DEFAULT NULL COMMENT '合同编号',
  `fahuoren` varchar(100) DEFAULT NULL COMMENT '发货人',
  `lianxifangshi` varchar(100) DEFAULT NULL COMMENT '联系方式',
  `chengyunren` varchar(100) DEFAULT NULL COMMENT '承运人',
  `chengyunrenfs` varchar(100) DEFAULT NULL COMMENT '承运人联系方式',
  `sunshijine` varchar(100) DEFAULT NULL COMMENT '损失金额',
  `huowusunhuai` varchar(100) DEFAULT NULL COMMENT '货物损坏描述',
  `shangchuan` varchar(100) DEFAULT NULL COMMENT '上传图片',
  `lipeiriqi` varchar(256) DEFAULT NULL COMMENT '理赔日期',
  `lipeijindu` varchar(256) DEFAULT NULL COMMENT '理赔进度',
  `lipeiren` varchar(100) DEFAULT NULL COMMENT '理赔操作人',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hd_baoxianlipei
-- ----------------------------

-- ----------------------------
-- Table structure for hd_bid
-- ----------------------------
DROP TABLE IF EXISTS `hd_bid`;
CREATE TABLE `hd_bid` (
  `id` varchar(32) NOT NULL DEFAULT '' COMMENT '主键',
  `bid_time` varchar(20) DEFAULT NULL COMMENT '竞价时间',
  `account_id` varchar(32) DEFAULT NULL COMMENT '竞价人id',
  `goods_publish_id` varchar(32) DEFAULT NULL COMMENT '货源编号',
  `cargo_type_classification` varchar(20) DEFAULT NULL COMMENT '货物类型',
  `place_of_loading` varchar(50) DEFAULT NULL COMMENT '出发地',
  `goods_receipt_place` varchar(50) DEFAULT NULL COMMENT '目的地',
  `vehicle_publish_id` varchar(32) DEFAULT NULL COMMENT '车源编号',
  `bid_price` varchar(10) DEFAULT NULL COMMENT '运输价格',
  `planto_time` varchar(20) DEFAULT NULL COMMENT '预计提货时间',
  `info_state` varchar(20) DEFAULT NULL COMMENT '竞价状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='实际承运人竞价记录表';

-- ----------------------------
-- Records of hd_bid
-- ----------------------------
INSERT INTO `hd_bid` VALUES ('1f2efb323bc7444a93986baea8f6ce64', '2018/01/19 08:41:15', '2', '2085472c616143eb8351417f044082bd', 'dfgnhfd', '海南省/三亚市/海棠区', '江苏省/泰州市/高港区', '', '741', '2018-1-20', '竞价成功');
INSERT INTO `hd_bid` VALUES ('2773c995ebb7410592a2d5205ae35e61', '2018/01/18 11:24:10', '2', '0b4a8eb4e2bb4120b38c6cbdd9a3e30c', '东方国际法国红酒', '安徽省/芜湖市/弋江区', '北京市/北京市/西城区', '', '74122', '2018-1-20', '合同已签');
INSERT INTO `hd_bid` VALUES ('325e4455829244228e00d500695c9a52', '2018/01/21 11:00:41', '2', '1a6ae138802b445891f51401f4b3e76a', 'ghgeefgrtyyrh', '河北省/唐山市/路北区', '辽宁省/大连市/西岗区', '', '74', '2018-1-27', '竞价中');
INSERT INTO `hd_bid` VALUES ('4028ac816250a5bf016250ade2a50001', '2018-03-23 10:26:35', '6791e802ad8747e485024c15fe4fe70c', '297e902362507a0c016250a95261000f', '/饮料', '北京市', '海南省龙华区', null, '3亿零钱', '2018-03-12 23:25:56', '竞价失败');
INSERT INTO `hd_bid` VALUES ('4028ac816250a5bf016250b21a920002', '2018-03-23 10:31:12', '6791e802ad8747e485024c15fe4fe70c', '297e902362507a0c016250a95261000f', '/饮料', '北京市', '海南省龙华区', null, '33333', '2018-03-08 10:45:05', '竞价失败');
INSERT INTO `hd_bid` VALUES ('4028b88162504c110162505274f80002', '2018-03-23 08:46:43', '5d40345cf5aa458abb888ebac8ad53c1', '28b6673e101f4d21a905f9ae28a9b20a', '而法国23', '安徽省/芜湖市/弋江区', '安徽省/芜湖市/弋江区', null, '12345w', '2018-03-23 08:46:36', '竞价中');
INSERT INTO `hd_bid` VALUES ('4028b8816250acee016250acee8a0000', '2018-03-23 10:25:33', '5d40345cf5aa458abb888ebac8ad53c1', '297e902362507a0c016250a95261000f', '/饮料', '北京市', '海南省龙华区', null, '350w', '2018-03-29 14:30:20', '竞价失败');
INSERT INTO `hd_bid` VALUES ('4028b8816250acee016250b0b65b0001', '2018-03-23 10:29:41', '5d40345cf5aa458abb888ebac8ad53c1', '297e902362507a0c016250a95261000f', '/饮料', '北京市', '海南省龙华区', null, '234w', '2018-03-20 13:45:14', '竞价失败');
INSERT INTO `hd_bid` VALUES ('4028b8816250acee016250b1210b0002', '2018-03-23 10:30:08', '5d40345cf5aa458abb888ebac8ad53c1', '297e902362507a0c016250a95261000f', '/饮料', '北京市', '海南省龙华区', '', '12', '2018-03-28 14:50:55', '合同已签');
INSERT INTO `hd_bid` VALUES ('4028b8816250acee016250b41c5b0003', '2018-03-23 10:33:23', '5d40345cf5aa458abb888ebac8ad53c1', '297e902362507a0c016250a54e33000d', '/手机', '河北省保定市', '河北省冀州', null, '23', '2018-03-19 16:45:17', '竞价中');
INSERT INTO `hd_bid` VALUES ('4946edbff399453eb52602ec267eaaf4', '2018/01/31 16:43:57', '2', 'b0aa30a43c874ba8b0a2c1f404d2dec8', 'fgbbd', '安徽省/合肥市/瑶海区', '安徽省/宣城市/宁国市', '', '77', '2018-1-31', '竞价失败');
INSERT INTO `hd_bid` VALUES ('4e615e94a4b043f09cd94ff9ca408d0a', '2018/01/31 16:44:24', '2', 'b0aa30a43c874ba8b0a2c1f404d2dec8', 'fgbbd', '安徽省/合肥市/瑶海区', '安徽省/宣城市/宁国市', '', '70', '2018-1-31', '合同已签');
INSERT INTO `hd_bid` VALUES ('6b09fce313a04dd192b104960142821b', '2018/01/31 16:44:14', '2', 'b0aa30a43c874ba8b0a2c1f404d2dec8', 'fgbbd', '安徽省/合肥市/瑶海区', '安徽省/宣城市/宁国市', '', '76', '2018-1-31', '竞价失败');
INSERT INTO `hd_bid` VALUES ('7f6e94df90e4421999746d1670343b36', '2018/01/19 08:49:38', '2', '1a6ae138802b445891f51401f4b3e76a', 'ghgeefgrtyyrh', '河北省/唐山市/路北区', '辽宁省/大连市/西岗区', '', '41', '2018-1-20', '合同已签');
INSERT INTO `hd_bid` VALUES ('841a923dc7cd402a890e816c4fb1408b', '2018-02-11 11:32:40', '5d40345cf5aa458abb888ebac8ad53c1', '0a7622dede444b3fb90f33bcc3e80b55', '重货', '河北省/衡水市/桃城区', '河北省/衡水市/武邑县', '', '12', '2018-02-11 11:32:38', '合同已签');
INSERT INTO `hd_bid` VALUES ('8a9915ada78541859f69523c575d9a03', '2018-03-21 09:21:29', '2', '28b6673e101f4d21a905f9ae28a9b20a', '而法国23', '安徽省/芜湖市/弋江区', '安徽省/芜湖市/弋江区', null, '234', '2018-03-21 09:25:17', '竞价中');
INSERT INTO `hd_bid` VALUES ('9ab2cba6c0604475aff81e062779525c', '2018/01/18 09:19:41', '2', '149139fbcb7a418cbae88c6f377bf4f2', '钢化膜', '广东省/韶关市/浈江区', '北京市/北京市/西城区', '', '12345', '2018-1-20', '竞价中');
INSERT INTO `hd_bid` VALUES ('afb4dce3361647eebae9c51b76c5c894', '2018-02-11 11:32:34', '5d40345cf5aa458abb888ebac8ad53c1', '0a7622dede444b3fb90f33bcc3e80b55', '重货', '河北省/衡水市/桃城区', '河北省/衡水市/武邑县', null, '12', '2018-02-11 11:32:31', '竞价成功');
INSERT INTO `hd_bid` VALUES ('ba90b253817b4fb7971f7dd3675a33c8', '2018-02-11 10:16:02', '5d40345cf5aa458abb888ebac8ad53c1', '2085472c616143eb8351417f044082bd', 'dfgnhfd', '海南省/三亚市/海棠区', '江苏省/泰州市/高港区', null, '12', '2018-02-11 10:15:50', '竞价中');
INSERT INTO `hd_bid` VALUES ('ce678f66a34341c881a579adb3447f48', '2018/01/21 10:08:39', '2', '1a6ae138802b445891f51401f4b3e76a', 'ghgeefgrtyyrh', '河北省/唐山市/路北区', '辽宁省/大连市/西岗区', '', '741', '2018-1-7', '合同已签');
INSERT INTO `hd_bid` VALUES ('fb8062e0e7534df19a7e00efe8b1bc94', '2018-03-21 10:47:53', '1893cdc43d0c4580a4bc75243038cf42', '28b6673e101f4d21a905f9ae28a9b20a', '而法国23', '安徽省/芜湖市/弋江区', '安徽省/芜湖市/弋江区', null, '3500', '2018-03-22 14:50:42', '竞价中');

-- ----------------------------
-- Table structure for hd_business_licence_information
-- ----------------------------
DROP TABLE IF EXISTS `hd_business_licence_information`;
CREATE TABLE `hd_business_licence_information` (
  `business_licence_id` varchar(32) NOT NULL DEFAULT ' ' COMMENT '主键',
  `enterprise_registration_number` varchar(15) DEFAULT ' ' COMMENT '企业注册号',
  `enterprise_registration_address` varchar(512) DEFAULT ' ' COMMENT '企业注册地址:住所',
  `legal_representative` varchar(30) DEFAULT ' ' COMMENT '法定代表人:法定代表人姓名',
  `company_type` varchar(50) DEFAULT ' ' COMMENT '公司类型:依据股东对公司承担责任形式的不同对公司类型的分类',
  `business_scope` varchar(500) DEFAULT ' ' COMMENT '经营范围:企业经营范围',
  `registered_capital` varchar(50) DEFAULT ' ' COMMENT '注册资本:企业登记注册时的资本',
  `establishment_date` varchar(30) DEFAULT ' ' COMMENT '成立日期',
  `period_start_date` varchar(30) DEFAULT ' ' COMMENT '期限开始日期:营业执照有效期开始日期',
  `period_end_date` varchar(30) DEFAULT ' ' COMMENT '期限结束日期:营业执照有效期截止日期',
  `certification_unit` varchar(100) DEFAULT ' ' COMMENT '发证单位:营业执照的颁发单位',
  `photo` varchar(256) DEFAULT ' ' COMMENT '照片:营业执照的扫描照片名称（含路径）',
  `operator_id` varchar(32) DEFAULT ' ' COMMENT 'operator_id',
  `create_time` varchar(30) DEFAULT ' ' COMMENT 'create_time',
  `update_time` varchar(30) DEFAULT ' ' COMMENT 'update_time',
  PRIMARY KEY (`business_licence_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='营业执照';

-- ----------------------------
-- Records of hd_business_licence_information
-- ----------------------------
INSERT INTO `hd_business_licence_information` VALUES ('2', '21', '4th356', 'wteggrb', '234', '345bhtyb h', ' ', '2018-03-29', ' ', '2018-03-20', ' ', '/autocarrier/mystatic/img/pic/20180319e4ff187aea504369834cb12979a79f29.jpg', '2', '2018-03-15 08:26:44', '2018-03-23 08:51:31');

-- ----------------------------
-- Table structure for hd_buynewcar
-- ----------------------------
DROP TABLE IF EXISTS `hd_buynewcar`;
CREATE TABLE `hd_buynewcar` (
  `id` varchar(255) NOT NULL,
  `cartype` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `buyarea` varchar(255) DEFAULT NULL,
  `codearea` varchar(255) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `taketime` varchar(255) DEFAULT NULL,
  `credit` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hd_buynewcar
-- ----------------------------
INSERT INTO `hd_buynewcar` VALUES ('2018-01-25 16:30:07', '德龙新M3000', 'zpt', '116519816519', '安徽省/合肥市/瑶海区', '安徽省/合肥市/瑶海区', '1', '一周内', '30%', '是', '2018-01-25 16:48:38');
INSERT INTO `hd_buynewcar` VALUES ('2018-01-25 16:30:12', '德龙新M3000', 'zpt', '116519816519', '安徽省/合肥市/瑶海区', '安徽省/合肥市/瑶海区', '1', '一周内', '30%', '是', '2018-01-26 14:01:54');
INSERT INTO `hd_buynewcar` VALUES ('2018-01-25 16:30:16', '东风凯普特', 'zpt', '116519816519', '安徽省/合肥市/瑶海区', '安徽省/合肥市/瑶海区', '1', '一周内', '30%', '否', null);
INSERT INTO `hd_buynewcar` VALUES ('2018-01-25 16:55:59', '德龙新M3000', 'zpt', '116519816519', '安徽省/合肥市/瑶海区', '安徽省/合肥市/瑶海区', '1', '一周内', '30%', '否', null);
INSERT INTO `hd_buynewcar` VALUES ('2018-01-26 09:37:04', '德龙新M3000', '魏晓飞', '18632881252', '安徽省/合肥市/瑶海区', '安徽省/合肥市/瑶海区', '1', '一周内', '30%', '否', null);

-- ----------------------------
-- Table structure for hd_buyoldcar
-- ----------------------------
DROP TABLE IF EXISTS `hd_buyoldcar`;
CREATE TABLE `hd_buyoldcar` (
  `id` varchar(255) NOT NULL,
  `cartype` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `buyarea` varchar(255) DEFAULT NULL,
  `codearea` varchar(255) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `taketime` varchar(255) DEFAULT NULL,
  `credit` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hd_buyoldcar
-- ----------------------------
INSERT INTO `hd_buyoldcar` VALUES ('2018-01-26 09:39:19', '德龙新M3000', '魏晓飞', '18632881252', '安徽省/合肥市/瑶海区', '安徽省/合肥市/瑶海区', '1', '一周内', '30%', '是', '2018-01-26 10:21:38');
INSERT INTO `hd_buyoldcar` VALUES ('2018-01-26 09:41:56', '德龙新M3000', '魏晓飞', '18632881252', '安徽省/合肥市/瑶海区', '安徽省/合肥市/瑶海区', '1', '一周内', '30%', '否', null);
INSERT INTO `hd_buyoldcar` VALUES ('2018-01-26 09:53:54', '德龙新M3000', '魏晓飞', '18632881252', '安徽省/合肥市/瑶海区', '安徽省/合肥市/瑶海区', '1', '一周内', '30%', '否', null);

-- ----------------------------
-- Table structure for hd_captital_flow_pay
-- ----------------------------
DROP TABLE IF EXISTS `hd_captital_flow_pay`;
CREATE TABLE `hd_captital_flow_pay` (
  `capital_flow_id` varchar(32) NOT NULL COMMENT '主键',
  `carrier_id` varchar(32) DEFAULT NULL COMMENT '承运人编号',
  `carrier` varchar(32) DEFAULT NULL COMMENT '实际承运人名称',
  `vehicle_number` varchar(10) DEFAULT NULL COMMENT '车牌号',
  `license_plate_type_code` varchar(10) DEFAULT NULL COMMENT '牌照类型代码',
  `shipping_note_number` varchar(32) DEFAULT NULL COMMENT '托运单号',
  `payment_means_code` varchar(10) DEFAULT NULL COMMENT '付款方式代码',
  `bank_code` varchar(10) DEFAULT NULL COMMENT '银行代码',
  `sequence_code` varchar(50) DEFAULT NULL COMMENT '流水号/序列号',
  `monetary_amount` varchar(10) DEFAULT NULL COMMENT '货币金额',
  `receive_means_code` varchar(10) DEFAULT NULL COMMENT '收款方式代码',
  `receive_account` varchar(30) DEFAULT NULL COMMENT '收款账号',
  `data_time` varchar(30) DEFAULT NULL COMMENT '付款日期',
  `operator_id` varchar(32) DEFAULT NULL COMMENT '操作者编号',
  `operator_name` varchar(32) DEFAULT NULL COMMENT '操作者名称',
  `check_id` varchar(32) DEFAULT NULL COMMENT '复核人编号',
  `check_name` varchar(32) DEFAULT NULL COMMENT '符合人名称',
  `check_time` varchar(32) DEFAULT NULL COMMENT '复核时间',
  `receive_id` varchar(32) DEFAULT NULL COMMENT '收款人编号',
  `receive_name` varchar(32) DEFAULT NULL COMMENT '收款人名称',
  `receive_time` varchar(32) DEFAULT NULL COMMENT '收款时间',
  `status` varchar(32) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`capital_flow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='无车承运人付给实际承运人的运费';

-- ----------------------------
-- Records of hd_captital_flow_pay
-- ----------------------------
INSERT INTO `hd_captital_flow_pay` VALUES ('1a6ae138802b445891f51401f4b3e76a', '1', '1', '1', '1', '12356', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '待发放');
INSERT INTO `hd_captital_flow_pay` VALUES ('2a6ae138802b445891f51401f4b3e76a', '2', '2', '2', '2', '23456', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '待发放');

-- ----------------------------
-- Table structure for hd_captital_flow_receive
-- ----------------------------
DROP TABLE IF EXISTS `hd_captital_flow_receive`;
CREATE TABLE `hd_captital_flow_receive` (
  `capital_flow_id` varchar(32) NOT NULL COMMENT '主键',
  `shipping_note_number` varchar(32) DEFAULT NULL COMMENT '托运单号',
  `payment_means_code` varchar(10) DEFAULT NULL COMMENT '付款方式代码',
  `bank_code` varchar(10) DEFAULT NULL COMMENT '银行代码',
  `sequence_code` varchar(50) DEFAULT NULL COMMENT '流水号/序列号',
  `monetary_amount` varchar(10) DEFAULT NULL COMMENT '货币金额',
  `receive_means_code` varchar(10) DEFAULT NULL COMMENT '收款方式代码',
  `receive_account` varchar(32) DEFAULT NULL COMMENT '收款账号',
  `data_time` varchar(30) DEFAULT NULL COMMENT '付款日期',
  `pay_id` varchar(32) DEFAULT NULL COMMENT '付款人编号',
  `pay_name` varchar(32) DEFAULT NULL COMMENT '付款人姓名',
  `receive_id` varchar(32) DEFAULT NULL COMMENT '确认人编号',
  `receive_name` varchar(32) DEFAULT NULL COMMENT '确认人名称',
  `status` varchar(10) DEFAULT '' COMMENT '付款状态',
  PRIMARY KEY (`capital_flow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发货人付给无车承运人的运费\r\n';

-- ----------------------------
-- Records of hd_captital_flow_receive
-- ----------------------------
INSERT INTO `hd_captital_flow_receive` VALUES ('1a6ae138802b445891f51401f4b3e76a', '213456', '2134567', '324567', '2345678', '2134567', '234567', '2345678', '2018-03-08', '2', '234567', '2', 'wxf', '已确认');

-- ----------------------------
-- Table structure for hd_captital_flow_upload
-- ----------------------------
DROP TABLE IF EXISTS `hd_captital_flow_upload`;
CREATE TABLE `hd_captital_flow_upload` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `message_reference_number` varchar(32) DEFAULT NULL COMMENT '报文参考号,由省平台的工具了生成的GUID',
  `message_sending_date_time` varchar(100) DEFAULT NULL COMMENT '报文的实际发送日期时间',
  `shipping_note_number` varchar(100) NOT NULL COMMENT '托运单号',
  `status` varchar(100) DEFAULT '新增' COMMENT '车辆核验通过,车辆核验失败,上传成功,上传失败,新增',
  `operator_name` varchar(20) DEFAULT NULL COMMENT '操作人',
  `operator_id` varchar(32) DEFAULT NULL COMMENT '用户编号',
  `remark` varchar(2000) DEFAULT NULL COMMENT '发送报文内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hd_captital_flow_upload
-- ----------------------------

-- ----------------------------
-- Table structure for hd_cargoload_message
-- ----------------------------
DROP TABLE IF EXISTS `hd_cargoload_message`;
CREATE TABLE `hd_cargoload_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original_document_number` varchar(100) NOT NULL COMMENT '原始单号',
  `shipping_note_number` varchar(100) DEFAULT NULL COMMENT '托运单号',
  `carrier` varchar(100) DEFAULT '武邑衡东物流有限公司' COMMENT '无车承运人',
  `unified_social_credit_identifier` varchar(100) DEFAULT NULL COMMENT '统一社会信用代码',
  `permit_number_carrier` varchar(100) DEFAULT NULL COMMENT '许可证编号,无车承运人的道路经营许可证编号',
  `consignment_date_time` varchar(100) DEFAULT NULL COMMENT '托运日期时间',
  `business_type_code` varchar(100) DEFAULT NULL COMMENT '业务类型代码',
  `despatch_actual_date_time` varchar(100) DEFAULT NULL COMMENT '发运实际日期时间',
  `goods_receipt_date_time` varchar(100) DEFAULT NULL COMMENT '收货日期时间',
  `consignor_info` varchar(100) DEFAULT 'ConsignorInfo' COMMENT '发货方信息',
  `consignor` varchar(100) DEFAULT NULL COMMENT '发货人',
  `personal_identity_document` varchar(100) DEFAULT NULL COMMENT '个人证件号',
  `place_of_loading` varchar(100) DEFAULT NULL COMMENT '装货地点',
  `country_subdivision_code_loading` varchar(100) DEFAULT NULL COMMENT '发货地点国家行政区划代码',
  `consignee_info` varchar(100) DEFAULT 'ConsigneeInfo' COMMENT '收货方信息',
  `consignee` varchar(100) DEFAULT NULL COMMENT '收货人',
  `goods_receipt_place` varchar(100) DEFAULT NULL COMMENT '收货地点',
  `country_subdivision_code_receipt` varchar(100) DEFAULT NULL COMMENT '收货地点国家行政区划代码',
  `price_info` varchar(100) DEFAULT 'PriceInfo' COMMENT '费用信息',
  `total_monetary_amount` varchar(100) DEFAULT NULL COMMENT '货币总金额',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `vehicle_info` varchar(100) DEFAULT 'VehicleInfo' COMMENT '车辆信息',
  `license_plate_type_code` varchar(100) DEFAULT NULL COMMENT '牌照类型代码',
  `vehicle_number` varchar(100) DEFAULT NULL COMMENT '车辆牌照号',
  `vehicle_classification_code` varchar(100) DEFAULT NULL COMMENT '车辆分类代码',
  `vehicle_tonnage` varchar(100) DEFAULT NULL COMMENT '车辆载质量',
  `road_transport_certificate_number` varchar(100) DEFAULT NULL COMMENT '道路运输证号',
  `trailer_vehicle_plate_number` varchar(100) DEFAULT NULL COMMENT '挂车牌照号',
  `owner` varchar(100) DEFAULT NULL COMMENT '所有人',
  `permit_number_owener` varchar(100) DEFAULT NULL COMMENT '许可证编号:车辆所属业户(企业)的道路运输经营许可证号',
  `driver` varchar(100) DEFAULT NULL COMMENT '驾驶员',
  `name_of_person` varchar(100) DEFAULT NULL COMMENT '姓名',
  `qualification_certificate_number` varchar(100) DEFAULT NULL COMMENT '从业资格证号',
  `telephone_number` varchar(100) DEFAULT NULL COMMENT '电话号码',
  `goods_info` varchar(100) DEFAULT 'GoodsInfo' COMMENT '货物信息',
  `description_of_goods` varchar(100) DEFAULT NULL COMMENT '货物名称',
  `cargo_type_classification_code` varchar(100) DEFAULT NULL COMMENT '货物类型分类代码',
  `goods_item_gross_weight` varchar(100) DEFAULT NULL COMMENT '货物项毛重',
  `cube` varchar(100) DEFAULT NULL COMMENT '体积',
  `total_number_of_packages` varchar(100) DEFAULT NULL COMMENT '总件数',
  `free_Text` varchar(100) DEFAULT NULL COMMENT '自由文本',
  `status` varchar(100) DEFAULT '新增' COMMENT '车辆核验通过,车辆核验失败,上传成功,上传失败,新增',
  `user_name` varchar(20) DEFAULT NULL COMMENT '操作人',
  `hash_code` varchar(200) DEFAULT NULL COMMENT '哈希码',
  `user_id` int(5) DEFAULT NULL COMMENT '用户编号',
  `create_time` varchar(20) DEFAULT NULL,
  `account_id` varchar(32) DEFAULT NULL,
  `update_time` varchar(20) DEFAULT NULL,
  `sign_time` varchar(20) DEFAULT NULL COMMENT '签收时间',
  `sign_person` varchar(20) DEFAULT NULL COMMENT '签收人',
  `sign_photo` varchar(100) DEFAULT NULL COMMENT '签收图片路径',
  `sign_carrier` varchar(100) DEFAULT NULL COMMENT '签收操作人',
  `receipt_send_time` varchar(20) DEFAULT NULL COMMENT '回单寄送时间',
  `receipt_send_person` varchar(20) DEFAULT NULL COMMENT '回单寄送人名称',
  `receipt_sign_time` varchar(20) DEFAULT NULL COMMENT '回单签收时间',
  `receipt_sign_person` varchar(20) DEFAULT NULL COMMENT '回单签收人',
  `pay` int(2) unsigned zerofill NOT NULL COMMENT '支付状态',
  `check_pay` int(2) unsigned zerofill NOT NULL COMMENT '支付审核',
  `shipments` int(2) unsigned zerofill NOT NULL COMMENT '发货状态',
  `score` int(2) unsigned zerofill NOT NULL COMMENT '托-承评价状态',
  `estimate` int(2) unsigned zerofill NOT NULL COMMENT '平-托评价状态',
  `sign_for_goods` int(2) unsigned zerofill NOT NULL COMMENT '签收状态',
  `receipt` int(2) unsigned zerofill NOT NULL COMMENT '回单状态',
  `settle_accounts` int(2) unsigned zerofill NOT NULL COMMENT '结算状态',
  `finish` int(2) unsigned zerofill NOT NULL COMMENT '结账状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `HashCode` (`hash_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='无车承运人数据上传记录';

-- ----------------------------
-- Records of hd_cargoload_message
-- ----------------------------

-- ----------------------------
-- Table structure for hd_cargoload_message_upload
-- ----------------------------
DROP TABLE IF EXISTS `hd_cargoload_message_upload`;
CREATE TABLE `hd_cargoload_message_upload` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `message_reference_number` varchar(32) DEFAULT NULL COMMENT '报文参考号,由省平台的工具了生成的GUID',
  `message_sending_date_time` varchar(100) DEFAULT NULL COMMENT '报文的实际发送日期时间',
  `shipping_note_number` varchar(100) NOT NULL COMMENT '托运单号',
  `original_document_number` varchar(32) DEFAULT NULL COMMENT '原始单号',
  `hash_code` varchar(100) DEFAULT NULL COMMENT '根据托运单的信息计算hashcode,防止运单重复',
  `status` varchar(100) DEFAULT '新增' COMMENT '车辆核验通过,车辆核验失败,上传成功,上传失败,新增',
  `user_name` varchar(20) DEFAULT NULL COMMENT '操作人',
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户编号',
  `remark` varchar(2000) DEFAULT NULL COMMENT '发送报文内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hd_cargoload_message_upload
-- ----------------------------

-- ----------------------------
-- Table structure for hd_carrier_contract
-- ----------------------------
DROP TABLE IF EXISTS `hd_carrier_contract`;
CREATE TABLE `hd_carrier_contract` (
  `contract_id` varchar(32) NOT NULL COMMENT '合同编号,使用bid_id',
  `carrier_name` varchar(32) NOT NULL DEFAULT '' COMMENT '承运人名称',
  `carrier_id` varchar(32) NOT NULL DEFAULT '' COMMENT '承运人id',
  `goods_publish_id` varchar(32) NOT NULL DEFAULT '' COMMENT '货物id',
  `status` varchar(10) NOT NULL DEFAULT '' COMMENT '运输状态',
  `create_time` varchar(20) NOT NULL DEFAULT '' COMMENT '创建时间',
  `update_time` varchar(20) NOT NULL DEFAULT '' COMMENT '更新时间',
  PRIMARY KEY (`contract_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='承运人运输合同';

-- ----------------------------
-- Records of hd_carrier_contract
-- ----------------------------
INSERT INTO `hd_carrier_contract` VALUES ('4028b8816250acee016250b1210b0002', '', '5d40345cf5aa458abb888ebac8ad53c1', '297e902362507a0c016250a95261000f', '待收款', '2018-03-23 10:46:06', '');
INSERT INTO `hd_carrier_contract` VALUES ('ce678f66a34341c881a579adb3447f48', '', '2', '1a6ae138802b445891f51401f4b3e76a', '已评价', '2018-02-26 17:05:25', '');

-- ----------------------------
-- Table structure for hd_carrie_deposit
-- ----------------------------
DROP TABLE IF EXISTS `hd_carrie_deposit`;
CREATE TABLE `hd_carrie_deposit` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `mobile_phone_number` varchar(18) DEFAULT NULL COMMENT '用户手机号码',
  `person_type` varchar(2) DEFAULT NULL COMMENT '用户类型:个人用户1;企业用户2',
  `bank_name` varchar(20) DEFAULT NULL COMMENT '收款银行',
  `bank_card_number` varchar(20) DEFAULT NULL COMMENT '收款银行卡号',
  `message_number` varchar(100) DEFAULT NULL COMMENT '汇款单号',
  `name_of_person` varchar(1000) DEFAULT NULL COMMENT '汇款人姓名:个人为姓名,企业是企业名称',
  `monetary_amount` varchar(10) DEFAULT NULL COMMENT '汇款金额',
  `monetary_amount_status` varchar(4) DEFAULT NULL COMMENT '汇款状态:已汇款1;确认收款2',
  `submit_person` varchar(10) DEFAULT NULL COMMENT '确认人',
  `check_person` varchar(10) DEFAULT NULL COMMENT '审核人',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `create_time` varchar(20) DEFAULT NULL,
  `account_id` varchar(32) DEFAULT NULL,
  `update_time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='保证金信息记录表';

-- ----------------------------
-- Records of hd_carrie_deposit
-- ----------------------------
INSERT INTO `hd_carrie_deposit` VALUES ('2', null, null, '0', '123412345613456', 'fd', 'dsdd', 'ssd', null, null, null, 'sdfghj', null, null, null);
INSERT INTO `hd_carrie_deposit` VALUES ('57735384f6af4992b29d720256b69c7d', null, null, '4', '7418529637485296', 'asdf12356789', 'asd', 'sdfg', null, null, null, null, null, null, null);
INSERT INTO `hd_carrie_deposit` VALUES ('5d40345cf5aa458abb888ebac8ad53c1', null, null, '0', '123412345613456', '123424132', '魏晓飞', '12234W', null, null, null, '有钱,看看多少数一数', null, null, null);
INSERT INTO `hd_carrie_deposit` VALUES ('60b7d5362fc24aef83ea7d0625abd0e3', null, null, '1', 'qwdfg', 'werghn', 'sdfghn', 'sdfghn', null, null, null, null, null, null, null);
INSERT INTO `hd_carrie_deposit` VALUES ('6791e802ad8747e485024c15fe4fe70c', null, null, '2', '6227888831211386309', '1231231213132', '水暖大神', '100000000', null, null, null, 'sss', null, null, null);
INSERT INTO `hd_carrie_deposit` VALUES ('c6916a0ba5a24bd29e4c6528cde6a531', null, null, '0', '213451111111111', '1234567', '魏晓飞', '34545', null, null, null, '位的我vv', null, null, null);
INSERT INTO `hd_carrie_deposit` VALUES ('cd7e05d8afca4af09aa43d495f9a6f4c', null, null, '0', '', '', '', '', null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for hd_complain
-- ----------------------------
DROP TABLE IF EXISTS `hd_complain`;
CREATE TABLE `hd_complain` (
  `id` varchar(32) NOT NULL,
  `complain_time` varchar(20) DEFAULT NULL COMMENT '投诉时间',
  `complain_person_id` varchar(32) DEFAULT NULL COMMENT '投诉人编号',
  `complain_person` varchar(20) DEFAULT NULL COMMENT '投诉人',
  `complain_person_role_id` varchar(32) DEFAULT NULL COMMENT '投诉人角色编号',
  `complain_person_role` varchar(20) DEFAULT NULL COMMENT '投诉人角色',
  `complain_type` varchar(20) DEFAULT NULL COMMENT '投诉类型',
  `complain_accused` varchar(20) DEFAULT NULL COMMENT '投诉对象',
  `is_compaction` varchar(20) DEFAULT NULL COMMENT '是否签订合同:1是/2否',
  `compaction_id` varchar(32) DEFAULT NULL COMMENT '合同编号:可以是运输合同也可以是承运合同',
  `complain_content` varchar(512) DEFAULT NULL COMMENT '投诉内容',
  `complain_photo` varchar(100) DEFAULT NULL COMMENT '投诉照片:照片路径',
  `is_accept` varchar(20) DEFAULT '2' COMMENT '是否受理:1是/2否',
  `accept_content` varchar(512) DEFAULT NULL COMMENT '处理措施',
  `compensate_bill` varchar(20) DEFAULT NULL COMMENT '赔偿金额',
  `accept_person_id` varchar(20) DEFAULT NULL COMMENT '处理人编号',
  `accept_person` varchar(20) DEFAULT NULL COMMENT '处理人',
  `accept_time` varchar(20) DEFAULT NULL COMMENT '处理时间',
  `check_person_id` varchar(20) DEFAULT NULL COMMENT '审核人编号',
  `check_person` varchar(20) DEFAULT NULL COMMENT '审核人',
  `check_time` varchar(20) DEFAULT NULL COMMENT '审核时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='投诉及处理';

-- ----------------------------
-- Records of hd_complain
-- ----------------------------
INSERT INTO `hd_complain` VALUES ('2', '', 'cd7e05d8afca4af09aa43d495f9a6f4c', '', null, null, '0', '', '1', '', '', '/autocarrier/upload/img/2018022237771af0218a4454b1034ae2ca6b7eeb.jpg', '2', null, null, null, null, null, null, null, null);
INSERT INTO `hd_complain` VALUES ('297e9023628e395601628e3ac6440001', '2018-04-04 09:17:19', '2', '柳龙', null, null, '0', 'huow', null, 'ce678f66a34341c881a579adb3447f48', 'zxzxzxz', null, '已受理', null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for hd_consignor_contract
-- ----------------------------
DROP TABLE IF EXISTS `hd_consignor_contract`;
CREATE TABLE `hd_consignor_contract` (
  `contract_id` varchar(32) DEFAULT NULL COMMENT '合同编号',
  `emergency_degree` varchar(1) DEFAULT NULL COMMENT '紧急程度',
  `is_stamp` varchar(1) DEFAULT NULL COMMENT '是否开税票',
  `stamp_money` varchar(255) DEFAULT NULL COMMENT '开票金额',
  `invoice_header` varchar(255) DEFAULT NULL COMMENT '发票抬头',
  `tax_number` varchar(255) DEFAULT NULL COMMENT '税号',
  `goods_id` varchar(32) DEFAULT NULL COMMENT '货物id',
  `basic_carrie_bill` varchar(255) DEFAULT NULL COMMENT '基本运费',
  `delivery_fee` varchar(255) DEFAULT NULL COMMENT '送货费',
  `shift_way` varchar(255) DEFAULT NULL COMMENT '交接方式',
  `refund` varchar(255) DEFAULT NULL COMMENT '返款金额',
  `pay_way` varchar(255) DEFAULT NULL COMMENT '付款方式',
  `receipt_require` varchar(255) DEFAULT NULL COMMENT '回单要求',
  `collection_delivery` varchar(255) DEFAULT NULL COMMENT '代收货款',
  `freight_all` varchar(255) DEFAULT NULL COMMENT '运费合计',
  `buy_insurance` varchar(255) DEFAULT NULL COMMENT '购买保险',
  `insurance_bill` varchar(255) DEFAULT NULL COMMENT '保险费用',
  `Insurance_all` varchar(255) DEFAULT NULL COMMENT '保险总额',
  `bill_all` varchar(255) DEFAULT NULL COMMENT '费用总计'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hd_consignor_contract
-- ----------------------------

-- ----------------------------
-- Table structure for hd_credit_rating
-- ----------------------------
DROP TABLE IF EXISTS `hd_credit_rating`;
CREATE TABLE `hd_credit_rating` (
  `id` varchar(30) NOT NULL COMMENT '主键',
  `goods_contract_id` varchar(100) DEFAULT NULL COMMENT '托运合同编号',
  `vehicle_contract_id` varchar(100) DEFAULT NULL COMMENT '承运合同编号',
  `create_time` varchar(20) DEFAULT NULL COMMENT '评价日期',
  `person_id` varchar(100) DEFAULT NULL COMMENT '评价人编号',
  `person` varchar(30) DEFAULT NULL COMMENT '评价人',
  `by_person_id` varchar(100) DEFAULT NULL COMMENT '被评价人编号',
  `by_person` varchar(30) DEFAULT NULL COMMENT '被评价人',
  `service_status` varchar(5) DEFAULT NULL COMMENT '服务态度',
  `transport_efficiency` varchar(5) DEFAULT NULL COMMENT '运输效率',
  `punctual_efficiency` varchar(5) DEFAULT NULL COMMENT '准点率',
  `credit_content` varchar(521) DEFAULT NULL COMMENT '综合评价',
  `update_time` varchar(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='信用评价表';

-- ----------------------------
-- Records of hd_credit_rating
-- ----------------------------
INSERT INTO `hd_credit_rating` VALUES ('1523343482211', '1a6ae138802b445891f51401f4b3e76a', 'ce678f66a34341c881a579adb3447f48', null, '2', null, '2', '', null, null, null, null, null);
INSERT INTO `hd_credit_rating` VALUES ('1523345233247', '1a6ae138802b445891f51401f4b3e76a', 'ce678f66a34341c881a579adb3447f48', null, '2', null, '2', '', '5', '5', '5', null, null);

-- ----------------------------
-- Table structure for hd_dingdan_jiesuan
-- ----------------------------
DROP TABLE IF EXISTS `hd_dingdan_jiesuan`;
CREATE TABLE `hd_dingdan_jiesuan` (
  `dingdanhao` varchar(100) DEFAULT NULL COMMENT '订单编号',
  `yunfei` varchar(100) DEFAULT NULL COMMENT '运费金额',
  `shoukuanxm` varchar(100) DEFAULT NULL COMMENT '收款人姓名',
  `shoukuanzh` varchar(100) DEFAULT NULL COMMENT '收款人银行帐号',
  `shoukuanshijian` varchar(100) DEFAULT NULL COMMENT '收款的时间',
  `fukuangs` varchar(100) DEFAULT NULL COMMENT '付款公司',
  `fukuanzh` varchar(100) DEFAULT NULL COMMENT '付款帐号',
  `shenheren` varchar(100) DEFAULT NULL COMMENT '审核人',
  `shenheshijian` varchar(100) DEFAULT NULL COMMENT '审核时间',
  `sijizhifuzt` varchar(100) DEFAULT NULL COMMENT '收款人支付状态',
  `gongsifukuanzt` varchar(100) DEFAULT NULL COMMENT '公司付款状态',
  `shoukuanrenyh` varchar(100) DEFAULT NULL COMMENT '收款人开户行',
  `shoukuancaozuoren` varchar(100) DEFAULT NULL COMMENT '收款操作人',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hd_dingdan_jiesuan
-- ----------------------------

-- ----------------------------
-- Table structure for hd_dingdan_zhifu
-- ----------------------------
DROP TABLE IF EXISTS `hd_dingdan_zhifu`;
CREATE TABLE `hd_dingdan_zhifu` (
  `dingdanhao` varchar(100) DEFAULT NULL COMMENT '订单编号',
  `yunfei` varchar(100) DEFAULT NULL COMMENT '运费金额',
  `zhifuxm` varchar(100) DEFAULT NULL COMMENT '支付人姓名',
  `zhifuzh` varchar(100) DEFAULT NULL COMMENT '支付人银行帐号',
  `zhifushijian` varchar(100) DEFAULT NULL COMMENT '支付的时间',
  `shoukuangs` varchar(100) DEFAULT NULL COMMENT '收款公司',
  `shoukuanzh` varchar(100) DEFAULT NULL COMMENT '收款帐号',
  `shenheren` varchar(100) DEFAULT NULL COMMENT '审核人',
  `shenheshijian` varchar(100) DEFAULT NULL COMMENT '审核时间',
  `zhifurenzt` varchar(100) DEFAULT NULL COMMENT '支付人支付状态',
  `gongsishoukuanzt` varchar(100) DEFAULT NULL COMMENT '公司收款状态',
  `zhifurenyh` varchar(100) DEFAULT NULL COMMENT '支付人开户行',
  `zhifucaozuoren` varchar(100) DEFAULT NULL COMMENT '支付操作人',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hd_dingdan_zhifu
-- ----------------------------

-- ----------------------------
-- Table structure for hd_driver_information
-- ----------------------------
DROP TABLE IF EXISTS `hd_driver_information`;
CREATE TABLE `hd_driver_information` (
  `driver_id` varchar(32) NOT NULL DEFAULT ' ' COMMENT '主键',
  `name_of_person` varchar(30) DEFAULT ' ' COMMENT '姓名',
  `gender` varchar(12) DEFAULT ' ' COMMENT '性别',
  `identity_document_number` varchar(18) DEFAULT ' ' COMMENT '身份证号',
  `mobile_telephone_number` varchar(18) DEFAULT ' ' COMMENT '移动电话号码',
  `telephone_number` varchar(18) DEFAULT ' ' COMMENT '电话号码:（备用电话号码，可以是移动电话号码）',
  `photo_information` varchar(30) DEFAULT ' ' COMMENT '照片信息:可为身份证头像照片或身份证扫描照片信息,无需填写',
  `photo` varchar(256) DEFAULT ' ' COMMENT '照片:照片路径',
  `photo_description` varchar(256) DEFAULT ' ' COMMENT '照片描述:对照片的自然语言描述',
  `email` varchar(50) DEFAULT ' ' COMMENT '电子邮件地址',
  `remark` varchar(256) DEFAULT ' ' COMMENT '备注',
  `operator_id` varchar(32) DEFAULT ' ' COMMENT 'operator_id',
  `create_time` varchar(30) DEFAULT ' ' COMMENT 'create_time',
  `update_time` varchar(30) DEFAULT ' ' COMMENT 'update_time',
  PRIMARY KEY (`driver_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='驾驶员基本信息';

-- ----------------------------
-- Records of hd_driver_information
-- ----------------------------
INSERT INTO `hd_driver_information` VALUES ('4028b88162504c110162504c115d0000', '魏晓飞', '男', '131122199405072817', '13269491680', '18632871252', null, '/autocarrier/mystatic/img/pic/20180323fe2fe84093504f4093a0634809c4e517.bmp', '/autocarrier/mystatic/img/pic/20180323ebf4f6665ec44c4299f3d4c924d51fbe.bmp', '1692334890@qq.com', null, '5d40345cf5aa458abb888ebac8ad53c1', '2018-03-23 08:55:18', null);
INSERT INTO `hd_driver_information` VALUES ('bdf135634ac347b8a9284c750daea113', 'asdfghjkl', 'as', '130184184502124152', '13717485296', 'asdf', null, '/autocarrier/mystatic/img/pic/201803096d93cc73d9d7440dbb8b7105232e5f2f.jpg', '/autocarrier/mystatic/img/pic/20180309c3fc10abda3745bf8c4d5813174ad91c.jpg', 'aswq@qq.com', null, '2', '2018-03-09 15:50:42', null);

-- ----------------------------
-- Table structure for hd_driver_license_information
-- ----------------------------
DROP TABLE IF EXISTS `hd_driver_license_information`;
CREATE TABLE `hd_driver_license_information` (
  `driver_license_id` varchar(32) NOT NULL DEFAULT ' ' COMMENT '主键',
  `persona_lidentity_document` varchar(35) DEFAULT ' ' COMMENT '个人证件号:驾驶证证件号码',
  `country_name` varchar(35) DEFAULT ' ' COMMENT '国家（地区）名称',
  `communication_number` varchar(512) DEFAULT ' ' COMMENT '通讯地址:住址',
  `birth_date` varchar(30) DEFAULT ' ' COMMENT '出生日期',
  `license_initial_collectiondate` varchar(30) DEFAULT ' ' COMMENT '证件初次领取日期',
  `vehicle_type_permitted_to_drive` varchar(20) DEFAULT ' ' COMMENT '准驾车型',
  `start_time` varchar(30) DEFAULT ' ' COMMENT '起始时间',
  `date_or_time_or_period` varchar(30) DEFAULT ' ' COMMENT '日期/时间/期限:有效期限',
  `certification_unit` varchar(100) DEFAULT ' ' COMMENT '发证单位',
  `photo` varchar(256) DEFAULT ' ' COMMENT '照片:驾驶证扫描照片名称（含路径）',
  `operator_id` varchar(32) DEFAULT ' ' COMMENT 'operator_id',
  `create_time` varchar(30) DEFAULT ' ' COMMENT 'create_time',
  `update_time` varchar(30) DEFAULT ' ' COMMENT 'update_time',
  PRIMARY KEY (`driver_license_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='驾驶证信息';

-- ----------------------------
-- Records of hd_driver_license_information
-- ----------------------------
INSERT INTO `hd_driver_license_information` VALUES ('4028b88162504c110162504c115d0000', '111111111111111', '中国', '河北省衡水市武邑县清凉店镇', '2018-03-23', '2018-03-23', '不知道', null, '2018-03-23', '公安局', '/autocarrier/mystatic/img/pic/201803234acb9722b4964bd39abc5fa34d39093a.bmp', '5d40345cf5aa458abb888ebac8ad53c1', '2018-03-23 08:55:18', null);
INSERT INTO `hd_driver_license_information` VALUES ('bdf135634ac347b8a9284c750daea113', 'asdfghj', 'asdfgb', 'sdfghj', '2018-03-06', '2018-03-06', 'dfgb', null, '2018-03-06', 'sdfg', '/autocarrier/mystatic/img/pic/20180309c3fc10abda3745bf8c4d5813174ad91c.jpg', '2', '2018-03-09 15:50:42', null);

-- ----------------------------
-- Table structure for hd_driving_licence_information
-- ----------------------------
DROP TABLE IF EXISTS `hd_driving_licence_information`;
CREATE TABLE `hd_driving_licence_information` (
  `driving_licence_id` varchar(32) NOT NULL DEFAULT ' ',
  `vehicle_number` varchar(35) NOT NULL DEFAULT ' ' COMMENT '车辆牌照号',
  `vehicle_classification` varchar(12) NOT NULL DEFAULT ' ' COMMENT '车辆分类',
  `communication_number` varchar(512) NOT NULL DEFAULT ' ' COMMENT '通讯地址:车辆所有人的通讯地址',
  `use_character` varchar(256) NOT NULL DEFAULT ' ' COMMENT '使用性质:车辆的使用性质描述，如营运或非营运',
  `vehicle_brand_model` varchar(50) NOT NULL DEFAULT ' ' COMMENT '车辆厂牌型号:品牌型号',
  `vehicle_frame_number` varchar(17) NOT NULL DEFAULT ' ' COMMENT '车辆车架号:车辆识别VIN码',
  `vehicle_engine_number` varchar(50) NOT NULL DEFAULT ' ' COMMENT '车辆发动机号:车辆发动机唯一标识号',
  `register_date_time` varchar(14) NOT NULL DEFAULT ' ' COMMENT '注册日期:车辆行驶证的注册日期',
  `vehicle_licence_issue_date` varchar(30) NOT NULL DEFAULT ' ' COMMENT '车辆行驶证签发日期:车辆行驶证的签发日期',
  `period_start_date` varchar(30) NOT NULL DEFAULT ' ' COMMENT '期限开始日期:有效期始',
  `period_end_date` varchar(30) NOT NULL DEFAULT ' ' COMMENT '期限结束日期:有效期止',
  `certification_unit` varchar(100) NOT NULL DEFAULT ' ' COMMENT '发证单位:车辆行驶证的签发单位',
  `vehicle_tare` varchar(8) NOT NULL DEFAULT ' ' COMMENT '车辆自重:车辆出厂时额定的车辆自身重量',
  `vehicle_laden_weight` varchar(8) NOT NULL DEFAULT ' ' COMMENT '满载车辆质量:核准的车辆及装运的货物的实际总重量',
  `vehicle_tonnage` varchar(11) NOT NULL DEFAULT ' ' COMMENT '车辆载质量:车辆出厂时额定承载的最大载货质量',
  `vehicle_maximum_traction_weight` varchar(11) NOT NULL DEFAULT ' ' COMMENT '车辆准牵引总质量:车辆牵引车头的质量、被牵引车本体的质量、装载货物的质量三者的总和',
  `vehicle_seats` varchar(6) NOT NULL DEFAULT ' ' COMMENT '车辆座位:驾驶室共乘',
  `internal_dimension` varchar(35) NOT NULL DEFAULT ' ' COMMENT '内部尺寸:车厢的内部尺寸',
  `vehicle_length` varchar(16) NOT NULL DEFAULT ' ' COMMENT '车辆长度:车辆外廓长度',
  `vehicle_width` varchar(16) NOT NULL DEFAULT ' ' COMMENT '车辆宽度:车辆外廓宽度',
  `vehicle_height` varchar(16) NOT NULL DEFAULT ' ' COMMENT '车辆高度:车辆外廓高度',
  `inspection_record` varchar(256) NOT NULL DEFAULT ' ' COMMENT '检验记录:车辆年检记录',
  `operator_id` varchar(32) NOT NULL DEFAULT ' ' COMMENT 'operator_id',
  `create_time` varchar(30) NOT NULL DEFAULT ' ' COMMENT 'create_time',
  `update_time` varchar(30) NOT NULL DEFAULT ' ' COMMENT 'update_time',
  PRIMARY KEY (`driving_licence_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='行驶证信息';

-- ----------------------------
-- Records of hd_driving_licence_information
-- ----------------------------
INSERT INTO `hd_driving_licence_information` VALUES ('4028ac816250a5bf016250a5bfd40000', '冀T88727', 'G01', '通信水电费ISD', '', '华菱之星牌', '', '116L08245', '', '', ' ', ' ', '深州市运输管理站', '456', '456', '789', '40 吨', '5', '789', '7085 mm', '2495 mm', '3850 mm', '', '6791e802ad8747e485024c15fe4fe70c', '2018-03-23 10:17:42', ' ');
INSERT INTO `hd_driving_licence_information` VALUES ('4028b88162504c110162504fb2fd0001', '冀T99929', 'H01', '河北省衡水市武邑县清凉店镇', '12', '陕汽', '1233', '1223', '2018-03-23', '2018-03-23', ' ', ' ', '河北', '12', '12', '12', '12', '2', '12', '12', '12', '12', '', '5d40345cf5aa458abb888ebac8ad53c1', '2018-03-23 08:43:43', ' ');

-- ----------------------------
-- Table structure for hd_dynamic_credit_information
-- ----------------------------
DROP TABLE IF EXISTS `hd_dynamic_credit_information`;
CREATE TABLE `hd_dynamic_credit_information` (
  `dynamic_credit_id` int(32) NOT NULL AUTO_INCREMENT COMMENT '自增长主键',
  `dynamic_credit_object_id` varchar(32) NOT NULL DEFAULT ' ' COMMENT '评价对象编号:企业,个人,司机,车辆',
  `credit_type_code` varchar(30) NOT NULL DEFAULT ' ' COMMENT '诚信类型代码',
  `credit_evaluation_record` varchar(2000) NOT NULL DEFAULT ' ' COMMENT '诚信评价记录:描述企业诚信评价的记录',
  `appraise_date_time` varchar(14) NOT NULL DEFAULT ' ' COMMENT '评价日期时间',
  `warning_identity` varchar(2) NOT NULL DEFAULT ' ' COMMENT '警示标志',
  `operator_id` varchar(32) NOT NULL DEFAULT ' ' COMMENT 'operator_id',
  `create_time` varchar(30) NOT NULL DEFAULT ' ' COMMENT 'create_time',
  `update_time` varchar(30) NOT NULL DEFAULT ' ' COMMENT 'update_time',
  PRIMARY KEY (`dynamic_credit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='动态信用评价信息';

-- ----------------------------
-- Records of hd_dynamic_credit_information
-- ----------------------------

-- ----------------------------
-- Table structure for hd_enterprise
-- ----------------------------
DROP TABLE IF EXISTS `hd_enterprise`;
CREATE TABLE `hd_enterprise` (
  `id` varchar(32) NOT NULL,
  `enterprise_type` varchar(20) DEFAULT NULL COMMENT '企业类型:生产企业,承运企业',
  `enterprise_name` varchar(100) DEFAULT NULL COMMENT '企业名称 :被评价企业名称 ',
  `organization_code` varchar(9) DEFAULT NULL COMMENT '组织机构代码 : ',
  `enterprise_economic_type_code` varchar(3) DEFAULT NULL COMMENT '企业 济类型代码 : ',
  `country_subdivision_name` varchar(70) DEFAULT NULL COMMENT '国家行政区划名称 : ',
  `country_subdivision_code` varchar(12) DEFAULT NULL COMMENT '国家行政区划代码 : ',
  `contact_name` varchar(256) DEFAULT NULL COMMENT '联系人名称 :企业联系人姓名 ',
  `mobile_telephone_number` varchar(20) DEFAULT NULL COMMENT '企业常用联系手机号',
  `telephone_number` varchar(18) DEFAULT NULL COMMENT '电话号码 : ',
  `fax_number` varchar(18) DEFAULT NULL COMMENT '传真号码 : ',
  `communication_number` varchar(512) DEFAULT NULL COMMENT '通讯地址 :企业通讯地址 ',
  `postal_identification_code` varchar(17) DEFAULT NULL COMMENT '邮政标识代码 :企业邮政编码 ',
  `email` varchar(50) DEFAULT NULL COMMENT '电子邮件地址 :企业电子邮件地址 ',
  `network_access_address` varchar(100) DEFAULT NULL COMMENT '网络访问地址 :企业网址 ',
  `enterprise_registration_number` varchar(15) DEFAULT NULL COMMENT '企业注册号 :  ',
  `enterprise_registration_address` varchar(512) DEFAULT NULL COMMENT '企业注册地址 :住所 ',
  `legal_representative` varchar(30) DEFAULT NULL COMMENT '法定代表人 :法定代表人姓名 ',
  `company_type` varchar(50) DEFAULT NULL COMMENT '公司类型 :依据股东对公司承担责任形式的不同对公司类型的分类 ',
  `business_scope` varchar(500) DEFAULT NULL COMMENT '营范围 :企业 营范围 ',
  `registered_capital` varchar(50) DEFAULT NULL COMMENT '注册资本 :企业登记注册时的资本 ',
  `establishment_date` varchar(30) DEFAULT NULL COMMENT '成立日期 : ',
  `period_start_date` varchar(30) DEFAULT NULL COMMENT '期限开始日期 :营业执照有效期开始日期 ',
  `period_end_date` varchar(30) DEFAULT NULL COMMENT '期限结束日期 :营业执照有效期截止日期 ',
  `certification_unit` varchar(100) DEFAULT NULL COMMENT '发证单位 :营业执照的颁发单位 ',
  `business_business_photo` varchar(256) DEFAULT NULL COMMENT '照片 :营业执照的扫 照片名称（含路径） ',
  `permit_number` varchar(50) DEFAULT NULL COMMENT '许可证编号 :道路运输 营许可证编号 ',
  `place_or_location` varchar(256) DEFAULT NULL COMMENT '地点/位置 :企业 营地点 ',
  `transport_business_scope` varchar(500) DEFAULT NULL COMMENT '营范围 :企业 营范围 ',
  `permit_grant_date` varchar(30) DEFAULT NULL COMMENT '许可证发放日期 :YYYYMMDD ',
  `transport_period_start_date` varchar(30) DEFAULT NULL COMMENT '期限开始日期 :道路运输 营许可证有效期开始日期 ',
  `transport_period_end_date` varchar(30) DEFAULT NULL COMMENT '期限结束日期 :道路运输 营许可证有效期截止日期 ',
  `transport_certification_unit` varchar(100) DEFAULT NULL COMMENT '发证单位 : ',
  `transport_photo` varchar(256) DEFAULT NULL COMMENT '照片 :道路运输 营许可证的扫 照片名称（含路径） ',
  `own_cargo_vehicles_number` varchar(30) DEFAULT NULL COMMENT '自有货运车辆数 :企业自有货运车辆的数',
  `transport_capacity_scale` varchar(16) DEFAULT NULL COMMENT '运力规模 :运输企业的运输能力大小 ',
  `workers_number` varchar(30) DEFAULT NULL COMMENT '职工人数 :企业职工的人数 ',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注 :业务信息的附加说明 ',
  `create_time` varchar(20) DEFAULT NULL,
  `account_id` varchar(32) DEFAULT NULL,
  `update_time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mobile_telephone_number` (`mobile_telephone_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hd_enterprise
-- ----------------------------

-- ----------------------------
-- Table structure for hd_enterprise_information
-- ----------------------------
DROP TABLE IF EXISTS `hd_enterprise_information`;
CREATE TABLE `hd_enterprise_information` (
  `enterprise_id` varchar(32) NOT NULL DEFAULT ' ' COMMENT '主键',
  `enterprise_name` varchar(100) DEFAULT ' ' COMMENT '企业名称',
  `logistics_exchange_code` varchar(20) DEFAULT ' ' COMMENT '物流交换代码:空',
  `organization_code` varchar(9) DEFAULT ' ' COMMENT '组织机构代码',
  `enterprise_economic_type_code` varchar(3) DEFAULT ' ' COMMENT '企业经济类型代码',
  `country_subdivision_name` varchar(70) DEFAULT ' ' COMMENT '国家行政区划名称',
  `country_subdivision_code` varchar(12) DEFAULT ' ' COMMENT '国家行政区划代码',
  `contact_name` varchar(256) DEFAULT ' ' COMMENT '联系人名称',
  `telephone_number` varchar(18) DEFAULT ' ' COMMENT '电话号码',
  `fax_number` varchar(18) DEFAULT ' ' COMMENT '传真号码',
  `communication_number` varchar(512) DEFAULT ' ' COMMENT '通讯地址',
  `postal_identification_code` varchar(17) DEFAULT ' ' COMMENT '邮政标识代码:企业邮政编码',
  `email` varchar(50) DEFAULT ' ' COMMENT '电子邮件地址',
  `network_access_address` varchar(256) DEFAULT ' ' COMMENT '网络访问地址',
  `remark` varchar(256) DEFAULT ' ' COMMENT '备注',
  `operator_id` varchar(32) DEFAULT ' ' COMMENT 'operator_id',
  `create_time` varchar(30) DEFAULT ' ' COMMENT 'create_time',
  `update_time` varchar(30) DEFAULT ' ' COMMENT 'update_time',
  PRIMARY KEY (`enterprise_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='企业信息';

-- ----------------------------
-- Records of hd_enterprise_information
-- ----------------------------
INSERT INTO `hd_enterprise_information` VALUES ('2', '武邑衡东物流有限公司', null, '1', '1', null, null, '1', '18632871252', '123', null, null, '1', null, null, '2', null, '2018-03-23 08:51:30');
INSERT INTO `hd_enterprise_information` VALUES ('cd7e05d8afca4af09aa43d495f9a6f4c', '', null, '', '', null, null, '', '', '', null, null, '', null, null, 'cd7e05d8afca4af09aa43d495f9a6f4c', '2018-03-15 08:26:44', null);

-- ----------------------------
-- Table structure for hd_event_information
-- ----------------------------
DROP TABLE IF EXISTS `hd_event_information`;
CREATE TABLE `hd_event_information` (
  `event_id` int(32) NOT NULL AUTO_INCREMENT COMMENT '自增长主键',
  `event_information_id` varchar(32) NOT NULL DEFAULT ' ' COMMENT '动态诚信信息编号',
  `date_or_time_or_period` varchar(35) NOT NULL DEFAULT ' ' COMMENT '日期/时间/期限:事件发生时间',
  `place_or_location` varchar(256) NOT NULL DEFAULT ' ' COMMENT '地点/位置:事件发生地点',
  `free_text` varchar(512) NOT NULL DEFAULT ' ' COMMENT '自由文本:事件描述',
  `operator_id` varchar(32) NOT NULL DEFAULT ' ' COMMENT 'operator_id',
  `create_time` varchar(30) NOT NULL DEFAULT ' ' COMMENT 'create_time',
  `update_time` varchar(30) NOT NULL DEFAULT ' ' COMMENT 'update_time',
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='动态信用评价中的事件信息';

-- ----------------------------
-- Records of hd_event_information
-- ----------------------------

-- ----------------------------
-- Table structure for hd_goods_info
-- ----------------------------
DROP TABLE IF EXISTS `hd_goods_info`;
CREATE TABLE `hd_goods_info` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `account_id` varchar(32) DEFAULT NULL,
  `create_time` varchar(20) DEFAULT NULL,
  `description_of_goods` varchar(50) DEFAULT NULL COMMENT '货物名称',
  `cargo_type_classification_code` varchar(10) DEFAULT NULL COMMENT '货物分类代码',
  `cargo_type_classification` varchar(100) DEFAULT NULL COMMENT '货物分类名称',
  `goods_package_type_code` varchar(10) DEFAULT NULL COMMENT '货物包装类型代码',
  `goods_package_typ` varchar(100) DEFAULT NULL COMMENT '货物包装类型',
  `goods_weight` varchar(20) DEFAULT NULL COMMENT '单件重量（公斤）',
  `goods_cube` varchar(10) DEFAULT NULL COMMENT '单件体积(立方米)',
  `goods_length` varchar(10) DEFAULT NULL COMMENT '货物长度(米)',
  `goods_width` varchar(10) DEFAULT NULL COMMENT '货物宽度(米)',
  `goods_height` varchar(10) DEFAULT NULL COMMENT '货物高度(米)',
  `ower_mobile_telephone_number` varchar(18) DEFAULT NULL COMMENT '所属人手机号码',
  `update_time` varchar(20) DEFAULT NULL,
  `ower_id` varchar(32) DEFAULT NULL COMMENT '所有人id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hd_goods_info
-- ----------------------------
INSERT INTO `hd_goods_info` VALUES ('b821f8caa9ef4ad79751b640c2f5e2c8', '4c40040449054552bd4486fba77da3f3', '2018-02-11 10:27:35', '脚手架', null, '重货', null, '', '12', '1', '1', '1', '1', null, '2018-02-11 10:35:54', '4c40040449054552bd4486fba77da3f3');

-- ----------------------------
-- Table structure for hd_goods_publish
-- ----------------------------
DROP TABLE IF EXISTS `hd_goods_publish`;
CREATE TABLE `hd_goods_publish` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `place_of_loading` varchar(50) DEFAULT NULL COMMENT '发货地',
  `country_subdivision_code_from` varchar(20) DEFAULT NULL COMMENT '发货地代码',
  `consignor` varchar(20) DEFAULT NULL COMMENT '发货人',
  `consignor_mobile_phone_number` varchar(18) DEFAULT NULL COMMENT '发货人手机号',
  `place_of_loading_detail` varchar(512) DEFAULT NULL COMMENT '发货地详细地址',
  `goods_receipt_place` varchar(50) DEFAULT NULL COMMENT '目的地',
  `country_subdivision_code_to` varchar(20) DEFAULT NULL COMMENT '目的地代码',
  `consignee` varchar(20) DEFAULT NULL COMMENT '收货人',
  `consignee_mobile_phone_number` varchar(18) DEFAULT NULL COMMENT '收货人手机号',
  `goods_receipt_place_detail` varchar(512) DEFAULT NULL COMMENT '收货人详细地址',
  `identity_info` varchar(20) DEFAULT NULL COMMENT '认证信息',
  `credit_info` varchar(20) DEFAULT NULL COMMENT '信用信息',
  `business_type_code` varchar(10) DEFAULT NULL COMMENT '业务类型代码',
  `cargo_type_classification` varchar(20) DEFAULT NULL COMMENT '货物类型',
  `cargo_type_classification_code` varchar(20) DEFAULT NULL COMMENT '货物类型代码',
  `goods_weight_total` varchar(20) DEFAULT NULL COMMENT '货物总重量(吨)',
  `goods_cube_total` varchar(20) DEFAULT NULL COMMENT '货物总体积(立方米)',
  `vehicle_length` varchar(20) DEFAULT NULL COMMENT '车长',
  `vehicle_width` varchar(20) DEFAULT NULL COMMENT '车宽',
  `vehicle_height` varchar(20) DEFAULT NULL COMMENT '车高',
  `vehicle_tonnage` varchar(20) DEFAULT NULL COMMENT '车辆载重',
  `vehicle_classification` varchar(20) DEFAULT NULL COMMENT '车辆类型',
  `vehicle_classification_code` varchar(20) DEFAULT NULL COMMENT '车辆类型代码',
  `monetary_amount_min` varchar(20) DEFAULT NULL COMMENT '最低运输价格',
  `monetary_amount_max` varchar(20) DEFAULT NULL COMMENT '最高运输价格',
  `plan_time` varchar(20) DEFAULT NULL COMMENT '计划发货时间',
  `plan_arrive_time` varchar(20) DEFAULT NULL COMMENT '最晚到货时间',
  `last_time` varchar(20) DEFAULT NULL COMMENT '货源信息有效期',
  `transport_status` int(11) DEFAULT '0' COMMENT '运输状态,具体请参考运输状态',
  `remark` varchar(512) DEFAULT NULL COMMENT '其他要求',
  `create_time` varchar(20) DEFAULT NULL,
  `progress_situation` varchar(255) DEFAULT NULL COMMENT '进度',
  `account_id` varchar(32) DEFAULT NULL,
  `update_time` varchar(20) DEFAULT NULL,
  `carrier_contract_id` varchar(32) DEFAULT '' COMMENT '实际承运人运输合同编号',
  `total_monetary_amount` varchar(10) DEFAULT NULL COMMENT '实际运费:与实际承运人最终协商的运费',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hd_goods_publish
-- ----------------------------
INSERT INTO `hd_goods_publish` VALUES ('1a6ae138802b445891f51401f4b3e76a', '河北省/衡水市/桃城区', '', '柳龙', '13146763147', '', '河北省/衡水市/武邑县', '', '柳龙', '13146763147', '', '', '', null, '重货', '', '12.0', '1.0', '', '', '', '', '0', '', '', '', '', '', '2018-02-12 10:35:07', '1', '', '2018-02-11 10:38:10', '待付款', '2', '', 'ce678f66a34341c881a579adb3447f48', '2300');
INSERT INTO `hd_goods_publish` VALUES ('28b6673e101f4d21a905f9ae28a9b20a', '安徽省/芜湖市/弋江区', null, 'sdfghj', '13714785263', '阿斯蒂芬高', '安徽省/芜湖市/弋江区', null, 'qazwsxedc', '13685274196', '巨化股份但是', null, null, null, '而法国23', null, '56.0', '156.0', '', '', '', '', '0', null, '', '', '', '', '', null, '', '2018-03-05 16:15:37', '竞价中', '2', null, null, '4600');
INSERT INTO `hd_goods_publish` VALUES ('297e902362507a0c0162507a0c490000', '河北省秦皇岛市海港区', null, '阿斯蒂芬', '15152415623', '新天地商务中心', '河北省衡水市武邑县', null, '冬耕', '15352634512', '某公司', null, null, null, '/车/床', null, '12010.0', '1210.0', '20', '5', '5', '22', '0', null, '2000', '200000', '2018-03-24 09:20:41', '2018-03-25 09:20:41', '2018-03-26 09:25:41', null, '111111111111111111', '2018-03-23 09:29:58', '竞价中', '4c40040449054552bd4486fba77da3f3', null, null, null);
INSERT INTO `hd_goods_publish` VALUES ('297e902362507a0c01625083578b0003', '河北省衡水市武邑县', null, '吸进瓶', '15125664785', '长河公司', '河北省石家庄市长安区', null, '嘟嘟', '15315246352', '某大学', null, null, null, '/笔', null, '20.0', '2.0', '20', '2', '2', '20', '2', null, '200', '250', '2018-03-24 10:35:59', '2018-03-25 14:50:59', '2018-03-24 10:45:59', null, 'asdfghjkl', '2018-03-23 09:40:07', '竞价中', '4c40040449054552bd4486fba77da3f3', null, null, null);
INSERT INTO `hd_goods_publish` VALUES ('297e902362507a0c0162508c62dc0005', '河北省张家口市', null, '等等', '13852634152', '某某公司', '河北省秦皇岛市海港区', null, '邓邓', '13752418965', '某大学', null, null, null, '/电脑', null, '4.0', '4.0', '20', '2', '2', '20000', '0', null, '2000', '2500', '2018-03-23 18:45:40', '2018-03-24 14:50:40', '2018-03-24 09:25:40', null, '00000000000', '2018-03-23 09:50:00', '竞价中', '4c40040449054552bd4486fba77da3f3', null, null, null);
INSERT INTO `hd_goods_publish` VALUES ('297e902362507a0c0162509b07280007', '河北省衡水市武邑县', null, '俺师傅的说法', '15215426325', '水电费规划局', '河北省衡水市武邑县', null, '淡饭黄齑', '13741528596', '水电费规划局', null, null, null, '/发过火', null, '10.0', '10.0', '儿', '听见没', '人体内', '规划', '0', null, '11', '就', '2018-03-25 13:05:25', '2018-03-21 13:25:25', '2018-03-27 13:25:25', null, '', '2018-03-23 10:05:59', '竞价中', '4c40040449054552bd4486fba77da3f3', null, null, null);
INSERT INTO `hd_goods_publish` VALUES ('297e902362507a0c0162509fa8db0009', '河北省秦皇岛市海港区', null, '是的法规和吗', '15147485962', '河北省 秦皇岛市 海港区 河北大街东段 56号', '河北省衡水市武邑县', null, '大法官好吗', '15147485963', '地方规划局', null, null, null, '/规划局，', null, '4.0', '4.0', '', '', '', '', '0', null, '', '', '', '', '', null, '', '2018-03-23 10:11:03', '竞价中', '4c40040449054552bd4486fba77da3f3', null, null, null);
INSERT INTO `hd_goods_publish` VALUES ('297e902362507a0c016250a24331000b', '河北省张家口市', null, '刘发v', '13341526387', '河北省 张家口市 桥东区 中兴北路辅路', '河北省保定市', null, '腾龙', '13114785296', '河北省 保定市 莲池区 裕华西路 725号', null, null, null, '/杯子', null, '1.0', '1.0', '反倒是', '地方', '地方', '电饭煲', '0', null, '20', '80', '2018-03-24 10:30:08', '2018-03-24 13:25:08', '2018-03-25 13:25:08', null, '22222222222', '2018-03-23 10:13:54', '竞价中', '4c40040449054552bd4486fba77da3f3', null, null, null);
INSERT INTO `hd_goods_publish` VALUES ('297e902362507a0c016250a54e33000d', '河北省保定市', null, '玩儿', '13257489652', '河北省 保定市 莲池区 建华大街 552号', '河北省冀州', null, '刚发的', '13574185296', '河北省衡水市冀州区冀州镇393省道北(冀州区公安局交警大队车管所东南350米)', null, null, null, '/手机', null, '1.0', '1.0', '送人头', '市', '对方过后', '对对对', '0', null, '202', '2222', '2018-03-27 18:50:09', '2018-03-25 13:25:09', '2018-03-27 13:05:09', null, '巨化股份但是', '2018-03-23 10:17:13', '竞价中', '4c40040449054552bd4486fba77da3f3', null, null, null);
INSERT INTO `hd_goods_publish` VALUES ('297e902362507a0c016250a95261000f', '北京市', null, '对方过后', '15125664785', '东长安街路南公安部内', '海南省龙华区', null, '对方过后', '15248484841', '滨海街道龙昆北路19号', null, null, null, '/饮料', null, '4.0', '4.0', '好', '10', '01', '20', '0', null, '200', '300', '2018-03-27 13:30:13', '2018-03-29 14:30:13', '2018-03-28 17:25:13', '1', '\';luydfg', '2018-03-23 10:21:36', '承运人已确定承运', '4c40040449054552bd4486fba77da3f3', null, '4028b8816250acee016250b1210b0002', null);

-- ----------------------------
-- Table structure for hd_goods_publish_detail
-- ----------------------------
DROP TABLE IF EXISTS `hd_goods_publish_detail`;
CREATE TABLE `hd_goods_publish_detail` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `goods_publish_id` varchar(32) DEFAULT NULL COMMENT '货源编号',
  `description_of_goods` varchar(20) DEFAULT NULL COMMENT '货物名称',
  `cargo_type_classification` varchar(20) DEFAULT NULL COMMENT '货物分类名称',
  `cargo_type_classification_code` varchar(20) DEFAULT NULL COMMENT '货物分类代码',
  `goods_package_type_code` varchar(20) DEFAULT NULL COMMENT '货物包装类型代码',
  `goods_package_typ` varchar(20) DEFAULT NULL COMMENT '货物包装类型',
  `goods_weight` varchar(20) DEFAULT NULL COMMENT '单件重量（公斤）',
  `goods_cube` varchar(20) DEFAULT NULL COMMENT '单件体积(立方米)',
  `goods_length` varchar(20) DEFAULT NULL COMMENT '货物长度(米)',
  `goods_width` varchar(20) DEFAULT NULL COMMENT '货物宽度(米)',
  `goods_height` varchar(20) DEFAULT NULL COMMENT '货物高度(米)',
  `ower_mobile_telephone_number` varchar(18) DEFAULT NULL COMMENT '所属人手机号码',
  `create_time` varchar(20) DEFAULT NULL,
  `account_id` varchar(32) DEFAULT NULL,
  `update_time` varchar(20) DEFAULT NULL,
  `goods_quantity` varchar(10) DEFAULT NULL COMMENT '货物数量',
  PRIMARY KEY (`id`),
  KEY `detail_publish_id` (`goods_publish_id`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hd_goods_publish_detail
-- ----------------------------
INSERT INTO `hd_goods_publish_detail` VALUES ('06ff32eda8824b928de259eb749a3988', '0a7622dede444b3fb90f33bcc3e80b55', '脚手架', '重货', null, null, '', '12', '1', '1', '1', '1', null, '2018-02-11 10:38:10', '4c40040449054552bd4486fba77da3f3', '2018-02-11 10:35:54', null);
INSERT INTO `hd_goods_publish_detail` VALUES ('297e902362507a0c0162507a0c490001', '297e902362507a0c0162507a0c490000', '车', '车', null, null, '12吨', '12000', '1200', '1', '1', '1', null, '2018-03-23 09:29:58', '4c40040449054552bd4486fba77da3f3', null, '1');
INSERT INTO `hd_goods_publish_detail` VALUES ('297e902362507a0c0162507a0c490002', '297e902362507a0c0162507a0c490000', '床', '床', null, null, '1个', '10', '10', '1', '1', '1', null, '2018-03-23 09:29:58', '4c40040449054552bd4486fba77da3f3', null, '1');
INSERT INTO `hd_goods_publish_detail` VALUES ('297e902362507a0c01625083578b0004', '297e902362507a0c01625083578b0003', '笔', '笔', null, null, '个', '1', '0.1', '0.1', '0.1', '0.1', null, '2018-03-23 09:40:07', '4c40040449054552bd4486fba77da3f3', null, '20');
INSERT INTO `hd_goods_publish_detail` VALUES ('297e902362507a0c0162508c62dd0006', '297e902362507a0c0162508c62dc0005', '电脑', '电脑', null, null, '台', '2', '2', '2', '2', '2', null, '2018-03-23 09:50:00', '4c40040449054552bd4486fba77da3f3', null, '2');
INSERT INTO `hd_goods_publish_detail` VALUES ('297e902362507a0c0162509b07280008', '297e902362507a0c0162509b07280007', '而同样', '发过火', null, null, '地方规划局', '10', '10', '11', '1', '1', null, '2018-03-23 10:05:59', '4c40040449054552bd4486fba77da3f3', null, '1');
INSERT INTO `hd_goods_publish_detail` VALUES ('297e902362507a0c0162509fa8db000a', '297e902362507a0c0162509fa8db0009', '地方规划局', '规划局，', null, null, '2', '2', '2', '2', '2', '2', null, '2018-03-23 10:11:03', '4c40040449054552bd4486fba77da3f3', null, '2');
INSERT INTO `hd_goods_publish_detail` VALUES ('297e902362507a0c016250a24331000c', '297e902362507a0c016250a24331000b', '杯子', '杯子', null, null, '1', '1', '1', '1', '1', '1', null, '2018-03-23 10:13:54', '4c40040449054552bd4486fba77da3f3', null, '1');
INSERT INTO `hd_goods_publish_detail` VALUES ('297e902362507a0c016250a54e33000e', '297e902362507a0c016250a54e33000d', '手机', '手机', null, null, '1', '1', '1', '1', '1', '1', null, '2018-03-23 10:17:13', '4c40040449054552bd4486fba77da3f3', null, '1');
INSERT INTO `hd_goods_publish_detail` VALUES ('297e902362507a0c016250a952610010', '297e902362507a0c016250a95261000f', '娃哈哈', '饮料', null, null, '2', '2', '2', '2', '2', '2', null, '2018-03-23 10:21:36', '4c40040449054552bd4486fba77da3f3', null, '2');
INSERT INTO `hd_goods_publish_detail` VALUES ('8cc74c7e050743828fad80d36c85ea71', '28b6673e101f4d21a905f9ae28a9b20a', '23', '23', null, null, '4', '33', '33', '2', '1', '1', null, '2018-03-05 16:15:37', '2', null, null);
INSERT INTO `hd_goods_publish_detail` VALUES ('a2220f9310f54201a888a2b76718507d', '28b6673e101f4d21a905f9ae28a9b20a', '摄入工会', '而法国', null, null, '电饭锅保暖', '23', '123', '12', '1', '1', null, '2018-03-05 16:15:37', '2', null, null);

-- ----------------------------
-- Table structure for hd_goods_sign
-- ----------------------------
DROP TABLE IF EXISTS `hd_goods_sign`;
CREATE TABLE `hd_goods_sign` (
  `sign_id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_publish_id` varchar(32) NOT NULL DEFAULT '' COMMENT '货源编号',
  `carrier_contract_id` varchar(32) NOT NULL DEFAULT '' COMMENT '货物运输编号',
  `receive_name` varchar(32) NOT NULL DEFAULT '' COMMENT '货物签收人姓名',
  `receive_identify_number` varchar(18) NOT NULL DEFAULT '' COMMENT '收货人身份证号',
  `receive_photo` varchar(200) NOT NULL DEFAULT '' COMMENT '货物签收图片',
  `operator_name` varchar(36) NOT NULL DEFAULT '' COMMENT '操作人',
  `operator_time` varchar(30) NOT NULL DEFAULT '' COMMENT '签收时间',
  `check_person_id` varchar(32) DEFAULT '' COMMENT '发货人编号',
  `check_person_name` varchar(30) DEFAULT '' COMMENT '发货人姓名',
  `check_time` varchar(30) DEFAULT '' COMMENT '发货人确认收货时间',
  PRIMARY KEY (`sign_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='货物签收';

-- ----------------------------
-- Records of hd_goods_sign
-- ----------------------------
INSERT INTO `hd_goods_sign` VALUES ('1', '297e902362507a0c016250a95261000f', '4028b8816250acee016250b1210b0002', 'wxf', '12121', '/autocarrier/mystatic/img/pic/201803238bdf60d178e346de8684624c8a837d05.bmp', '5d40345cf5aa458abb888ebac8ad53c1', '2018-03-23 10:59:39', null, null, null);
INSERT INTO `hd_goods_sign` VALUES ('2', '1a6ae138802b445891f51401f4b3e76a', 'ce678f66a34341c881a579adb3447f48', 'wqer', 'wqert', '', '2', '2018-04-10 09:30:08', null, null, null);

-- ----------------------------
-- Table structure for hd_identity_documentinformation
-- ----------------------------
DROP TABLE IF EXISTS `hd_identity_documentinformation`;
CREATE TABLE `hd_identity_documentinformation` (
  `identity_documentinformation_id` varchar(32) NOT NULL DEFAULT ' ' COMMENT '主键',
  `nationality` varchar(12) DEFAULT ' ' COMMENT '民族',
  `birth_date` varchar(30) DEFAULT ' ' COMMENT '出生日期',
  `communication_number` varchar(512) DEFAULT ' ' COMMENT '通讯地址:住址',
  `certification_unit` varchar(100) DEFAULT ' ' COMMENT '发证单位',
  `period_start_date` varchar(30) DEFAULT ' ' COMMENT '期限开始日期',
  `period_end_date` varchar(30) DEFAULT ' ' COMMENT '期限结束日期',
  `operator_id` varchar(32) DEFAULT ' ' COMMENT 'operator_id',
  `create_time` varchar(30) DEFAULT ' ' COMMENT 'create_time',
  `update_time` varchar(30) DEFAULT ' ' COMMENT 'update_time',
  PRIMARY KEY (`identity_documentinformation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='身份证信息详情';

-- ----------------------------
-- Records of hd_identity_documentinformation
-- ----------------------------
INSERT INTO `hd_identity_documentinformation` VALUES ('2', null, '2018-03-14', 'asdfghjk', null, null, '2018-03-14', '2', null, '2018-03-30 12:02:19');
INSERT INTO `hd_identity_documentinformation` VALUES ('4028b88162504c110162504c115d0000', null, '2018-03-23', '河北省衡水市武邑县清凉店镇', null, null, '2018-03-23', '5d40345cf5aa458abb888ebac8ad53c1', '2018-03-23 08:55:18', null);
INSERT INTO `hd_identity_documentinformation` VALUES ('4c40040449054552bd4486fba77da3f3', null, '2018-03-15', 'dfghjkl;\'', null, null, '2018-03-08', '4c40040449054552bd4486fba77da3f3', null, '2018-03-23 08:38:02');
INSERT INTO `hd_identity_documentinformation` VALUES ('57735384f6af4992b29d720256b69c7d', null, '2018-03-14', '阿是的法规和借口', null, null, '2018-03-14', '57735384f6af4992b29d720256b69c7d', '2018-03-14 14:44:22', null);
INSERT INTO `hd_identity_documentinformation` VALUES ('5d40345cf5aa458abb888ebac8ad53c1', null, '2018-03-23', '河北省衡水市武邑县清凉店镇', null, null, '2018-03-23', '5d40345cf5aa458abb888ebac8ad53c1', null, '2018-03-23 09:08:30');
INSERT INTO `hd_identity_documentinformation` VALUES ('6791e802ad8747e485024c15fe4fe70c', null, '2018-03-20', '神域', null, null, '2018-03-21', '6791e802ad8747e485024c15fe4fe70c', '2018-03-23 10:06:10', null);
INSERT INTO `hd_identity_documentinformation` VALUES ('bdf135634ac347b8a9284c750daea113', null, '2018-03-06', 'dfghj', null, null, '2018-03-06', '2', '2018-03-09 15:50:42', null);
INSERT INTO `hd_identity_documentinformation` VALUES ('c6916a0ba5a24bd29e4c6528cde6a531', null, '1994-09-27', '我饿UI玩儿会翻倍URVBu我v', null, null, '2018-03-22', 'c6916a0ba5a24bd29e4c6528cde6a531', '2018-03-21 10:40:08', null);
INSERT INTO `hd_identity_documentinformation` VALUES ('cd7e05d8afca4af09aa43d495f9a6f4c', null, '2018-02-01', '北京市/北京市/朝阳区', null, null, '2280-07-15', 'cd7e05d8afca4af09aa43d495f9a6f4c', '2018-03-15 08:29:18', null);

-- ----------------------------
-- Table structure for hd_jixiao
-- ----------------------------
DROP TABLE IF EXISTS `hd_jixiao`;
CREATE TABLE `hd_jixiao` (
  `yonghuid` varchar(100) NOT NULL COMMENT '对应用户表里的id',
  `ynghuming` varchar(100) DEFAULT NULL COMMENT '用户名',
  `yonghuzongfen` int(100) DEFAULT NULL COMMENT '用户总分',
  `jiedanlv` int(100) DEFAULT NULL COMMENT '接单率',
  `zhunshijiaohuo` int(100) DEFAULT NULL COMMENT '准时交货率',
  `songhuozhunque` int(100) DEFAULT NULL COMMENT '送货准确率',
  `huowuzaixian` int(100) DEFAULT NULL COMMENT '货物在线查询',
  `huosun` int(100) DEFAULT NULL COMMENT '货损率',
  `yunshushijian` int(100) DEFAULT NULL COMMENT '运输时间',
  `kehutousu` int(100) DEFAULT NULL COMMENT '客户投诉率',
  `yunshuguimo` int(100) DEFAULT NULL COMMENT '运输规模',
  `yunshushebei` int(100) DEFAULT NULL COMMENT '运输设备',
  `rouxing` int(100) DEFAULT NULL COMMENT '柔性',
  `yunshujiage` int(100) DEFAULT NULL COMMENT '运输价格',
  `yunshujiagerouxing` int(100) DEFAULT NULL COMMENT '运输价格柔性',
  `gonggongshengyu` int(100) DEFAULT NULL COMMENT '公共声誉',
  `caizhengwending` int(100) DEFAULT NULL COMMENT '财政稳定性',
  `jingyingyeji` int(100) DEFAULT NULL COMMENT '经营业绩',
  `zhanluejianrongxing` int(100) DEFAULT NULL COMMENT '战略兼容性',
  `fengxianfendan` int(100) DEFAULT NULL COMMENT '风险分担',
  `yugongsiguanxi` int(100) DEFAULT NULL COMMENT '与公司关系',
  `kaoheren` varchar(100) DEFAULT NULL COMMENT '考核人',
  `kaoheshijian` varchar(100) DEFAULT NULL COMMENT '考核时间',
  `roleid` varchar(100) DEFAULT NULL COMMENT '用户类型',
  PRIMARY KEY (`yonghuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hd_jixiao
-- ----------------------------

-- ----------------------------
-- Table structure for hd_newveh
-- ----------------------------
DROP TABLE IF EXISTS `hd_newveh`;
CREATE TABLE `hd_newveh` (
  `id` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `orderid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `fid` int(11) unsigned zerofill NOT NULL,
  `drivingmode` varchar(255) DEFAULT NULL,
  `maximum` varchar(255) DEFAULT NULL,
  `advance` varchar(255) DEFAULT NULL,
  `engine` varchar(255) DEFAULT NULL,
  `emstandard` varchar(255) DEFAULT NULL,
  `containeelen` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `html` varchar(3000) DEFAULT NULL,
  PRIMARY KEY (`orderid`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hd_newveh
-- ----------------------------
INSERT INTO `hd_newveh` VALUES ('1', '1', '1', '陕汽在售车型', '00000000001', null, null, null, null, null, null, null, '', null);
INSERT INTO `hd_newveh` VALUES ('2', '2', '2', '欧曼在售车型', '00000000002', null, null, null, null, null, null, null, '', null);
INSERT INTO `hd_newveh` VALUES ('3', '3', '3', '轻卡在售车型', '00000000003', null, null, null, null, null, null, null, '', null);
INSERT INTO `hd_newveh` VALUES ('1', '1005', '8', '德龙新M3000', '00000000001', '8X4', '666666', '12', '潍柴', '国四/欧四', '9.5', '10.13-16', '/autocarrier/upload/img/201801260b3b8ad408ae4d5a8163b34f52851bc9.jpg', '<p>12323dfdvef</p><p><strong>wvervwe</strong></p>');
INSERT INTO `hd_newveh` VALUES ('2', '2002', '11', '福田 欧曼GTL超能版 6系重卡 350马力 4X2 牵引车', '00000000002', ' 8X4', ' 336', '12', ' 潍柴', '国四/欧四', '9.5', '10.13-16', '/autocarrier/upload/img/20180124d024348ca8f7435d80ce7f2d67cd6df2.jpg', '<p>12323dfdvef</p><p><strong>wvervwe</strong></p>');
INSERT INTO `hd_newveh` VALUES ('2', '2003', '12', '福田 欧曼GTL超能版 6系重卡 380马力 6X2 牵引车', '00000000002', '8X4', '66666666', '12', '潍柴', '国四/欧四', '9.5', '10.13-16', '/autocarrier/upload/img/20180124d024348ca8f7435d80ce7f2d67cd6df2.jpg', '<p>12323dfdvef</p><p><strong>wvervwe</strong></p>');
INSERT INTO `hd_newveh` VALUES ('2', '2004', '13', '福田 欧曼GTL超能版 6系重卡 430马力 6X4 牵引车(平地板)', '00000000002', ' 8X4', ' 336', '12', ' 潍柴', '国四/欧四', '9.5', '10.13-16', '/autocarrier/upload/img/20180124d024348ca8f7435d80ce7f2d67cd6df2.jpg', '<p><strong style=\"white-space: normal; background-color: rgb(245, 245, 245); padding: 0px; margin: 0px; color: rgb(229, 51, 51); font-family: &quot;sans serif&quot;, tahoma, verdana, helvetica; font-size: 18.1818px; line-height: 24.5455px; text-align: center;\"><span style=\"padding: 0px; margin: 0px; font-size: 16px; color: rgb(255, 153, 0);\">基本信息</span><br style=\"padding: 0px; margin: 0px;\"/><span style=\"padding: 0px; margin: 0px; font-size: 16px; color: rgb(255, 153, 0);\">公告型号：BJ5319CCY-XH； 类型：仓栅载货车</span><br style=\"padding: 0px; margin: 0px;\"/><span style=\"padding: 0px; margin: 0px; font-size: 16px; color: rgb(255, 153, 0);\">驱动形式：8X4； 轴距：1800+4700+1350mm</span><br style=\"padding: 0px; margin: 0px;\"/><span style=\"padding: 0px; margin: 0px; font-size: 16px; color: rgb(255, 153, 0);\">车身长度：12.0米； 车身宽度：2.55米</span><br style=\"padding: 0px; margin: 0px;\"/><span style=\"padding: 0px; margin: 0px; font-size: 16px; color: rgb(255, 153, 0);\">车身高度：3.95米； 轮距：前轮距：2010/2010mm，后轮距：1860/1860mm</span><br style=\"padding: 0px; margin: 0px;\"/><span style=\"padding: 0px; margin: 0px; font-size: 16px; color: rgb(255, 153, 0);\">整车重量：13.92吨； 额定载重：16.95吨</span><br style=\"padding: 0px; margin: 0px;\"/><span style=\"padding: 0px; margin: 0px; font-size: 16px; color: rgb(255, 153, 0);\">总质量：31.0吨； 最高车速：100.0km/h</span><br style=\"padding: 0px; margin: 0px;\"/><span style=\"padding: 0px; margin: 0px; font-size: 16px; color: rgb(255, 153, 0);\">产地：北京； 吨位级别：重卡</span><br style=\"padding: 0px; margin: 0px;\"/><span style=\"padding: 0px; margin: 0px; font-size: 16px; color: rgb(255, 153, 0);\">工况：平原标载备注：&nbsp;</span><br style=\"padding: 0px; margin: 0px;\"/><span style=\"padding: 0px; margin: 0px; font-size: 16px; color: rgb(255, 153, 0);\">系别：6系&nbsp;</span></strong></p>');
INSERT INTO `hd_newveh` VALUES ('2', '2005', '14', '福田 欧曼GTL超能版 6系重卡 460马力 6X4 牵引车', '00000000002', ' 8X4', ' 336', '12', ' 潍柴', '国四/欧四', '9.5', '10.13-16', '/autocarrier/upload/img/20180124d024348ca8f7435d80ce7f2d67cd6df2.jpg', '<p>12323dfdvef</p><p><strong>wvervwe</strong></p>');
INSERT INTO `hd_newveh` VALUES ('3', '3001', '15', '福田欧马可', '00000000003', ' 8X4', ' 336', '12', ' 潍柴', '国四/欧四', '9.5', '10.13-16', '/autocarrier/upload/img/20180124d024348ca8f7435d80ce7f2d67cd6df2.jpg', '<p>12323dfdvef</p><p><strong>wvervwe</strong></p>');
INSERT INTO `hd_newveh` VALUES ('3', '3002', '16', '东风凯普特', '00000000003', ' 8X4', ' 336', '12', ' 潍柴', '国四/欧四', '9.5', '10.13-16', '/autocarrier/upload/img/20180124d024348ca8f7435d80ce7f2d67cd6df2.jpg', '<p>12323dfdvef</p><p><strong>wvervwe</strong></p>');
INSERT INTO `hd_newveh` VALUES ('3', '3003', '17', '重汽豪沃', '00000000003', ' 8X4', ' 336', '12', ' 潍柴', '国四/欧四', '9.5', '10.13-16', '/autocarrier/upload/img/20180124d024348ca8f7435d80ce7f2d67cd6df2.jpg', '<p>12323dfdvef</p><p><strong>wvervwe</strong></p>');
INSERT INTO `hd_newveh` VALUES ('3', '3004', '18', '德龙L3000', '00000000003', ' 8X4', ' 336', '12', ' 潍柴', '国四/欧四', '9.5', '10.13-16', '/autocarrier/upload/img/20180124d024348ca8f7435d80ce7f2d67cd6df2.jpg', '<p>12323dfdvef</p><p><strong>wvervwe</strong></p>');
INSERT INTO `hd_newveh` VALUES ('1', '1007', '19', '德龙新M3000', '00000000001', '8X4', '336', '12', '潍柴', '国四/欧四', '9.5', '10.13-16', '/autocarrier/upload/img/20180126f0d468bcdc1a4efe802b148566676388.jpg', '<p>12323dfdvef</p><p><strong>wvervwe</strong></p>');
INSERT INTO `hd_newveh` VALUES ('3', '3005', '32', '', '00000000003', '', '', '', '', '', '', '', '/autocarrier/upload/img/20180125c517f6bca47245f7ad5ba6c06bc559b1.jpg', '<p>12323dfdvef</p><p><strong>wvervwe</strong></p>');

-- ----------------------------
-- Table structure for hd_oldveh
-- ----------------------------
DROP TABLE IF EXISTS `hd_oldveh`;
CREATE TABLE `hd_oldveh` (
  `id` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `orderid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `fid` int(11) NOT NULL,
  `drivingmode` varchar(255) DEFAULT NULL,
  `maximum` varchar(255) DEFAULT NULL,
  `advance` varchar(255) DEFAULT NULL,
  `engine` varchar(255) DEFAULT NULL,
  `emstandard` varchar(255) DEFAULT NULL,
  `containeelen` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `html` varchar(255) DEFAULT NULL,
  `imgs` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`orderid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hd_oldveh
-- ----------------------------
INSERT INTO `hd_oldveh` VALUES ('1', '1', '1', '陕汽在售车型', '1', null, null, null, null, null, null, null, '', null, null);
INSERT INTO `hd_oldveh` VALUES ('2', '2', '2', '欧曼在售车型', '2', null, null, null, null, null, null, null, '', null, null);
INSERT INTO `hd_oldveh` VALUES ('3', '3', '3', '轻卡在售车型', '3', null, null, null, null, null, null, null, '', null, null);
INSERT INTO `hd_oldveh` VALUES ('1', '1005', '8', '德龙新M3000', '1', ' 8X4', ' 336', '12', ' 潍柴', '国四/欧四', '9.5', '10.13-16', '/autocarrier/upload/img/20180124d024348ca8f7435d80ce7f2d67cd6df2.jpg', null, null);
INSERT INTO `hd_oldveh` VALUES ('2', '2002', '11', '福田 欧曼GTL超能版 6系重卡 350马力 4X2 牵引车', '2', ' 8X4', ' 336', '12', ' 潍柴', '国四/欧四', '9.5', '10.13-16', '/autocarrier/upload/img/20180124d024348ca8f7435d80ce7f2d67cd6df2.jpg', null, null);

-- ----------------------------
-- Table structure for hd_people_owned_enterprise_information
-- ----------------------------
DROP TABLE IF EXISTS `hd_people_owned_enterprise_information`;
CREATE TABLE `hd_people_owned_enterprise_information` (
  `people_owned_enterprise_id` varchar(32) NOT NULL DEFAULT ' ' COMMENT '人员主键',
  `enterprise_name` varchar(100) NOT NULL DEFAULT ' ' COMMENT '企业名称',
  `place_or_location` varchar(256) NOT NULL DEFAULT ' ' COMMENT '地点/位置',
  `operator_id` varchar(32) NOT NULL DEFAULT ' ' COMMENT 'operator_id',
  `create_time` varchar(30) NOT NULL DEFAULT ' ' COMMENT 'create_time',
  `update_time` varchar(30) NOT NULL DEFAULT ' ' COMMENT 'update_time',
  PRIMARY KEY (`people_owned_enterprise_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='人员所属企业信息';

-- ----------------------------
-- Records of hd_people_owned_enterprise_information
-- ----------------------------

-- ----------------------------
-- Table structure for hd_person_information
-- ----------------------------
DROP TABLE IF EXISTS `hd_person_information`;
CREATE TABLE `hd_person_information` (
  `person_id` varchar(32) NOT NULL DEFAULT ' ' COMMENT '主键',
  `name_of_person` varchar(30) DEFAULT ' ' COMMENT '姓名',
  `gender` varchar(12) DEFAULT ' ' COMMENT '性别',
  `identity_document_number` varchar(18) DEFAULT ' ' COMMENT '身份证号',
  `mobile_telephone_number` varchar(18) DEFAULT ' ' COMMENT '移动电话号码',
  `telephone_number` varchar(18) DEFAULT ' ' COMMENT '电话号码:（备用电话号码，可以是移动电话号码）',
  `photo_information` varchar(30) DEFAULT ' ' COMMENT '照片信息:可为身份证头像照片或身份证扫描照片信息,无需填写',
  `photo` varchar(256) DEFAULT ' ' COMMENT '照片:照片路径',
  `photo_description` varchar(256) DEFAULT ' ' COMMENT '照片描述:对照片的自然语言描述',
  `email` varchar(50) DEFAULT ' ' COMMENT '电子邮件地址',
  `remark` varchar(256) DEFAULT ' ' COMMENT '备注',
  `operator_id` varchar(32) DEFAULT ' ' COMMENT 'operator_id',
  `create_time` varchar(30) DEFAULT ' ' COMMENT 'create_time',
  `update_time` varchar(30) DEFAULT ' ' COMMENT 'update_time',
  PRIMARY KEY (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='个人基本信息,不含司机';

-- ----------------------------
-- Records of hd_person_information
-- ----------------------------
INSERT INTO `hd_person_information` VALUES ('2', 'a', 'c', '120141188410204521', '15324284569', 'sdfgn', null, '/autocarrier/mystatic/img/pic/20180330fa079e89d9864fd7938fcbb54d4caf87.jpg', '/autocarrier/mystatic/img/pic/20180314d809d276e2c64c1e893513b69aec9bf0.jpg', 'sdfgh@qq.com', null, '2', null, '2018-03-30 12:02:19');
INSERT INTO `hd_person_information` VALUES ('4c40040449054552bd4486fba77da3f3', 'asdfgh', '男', '130012188401024152', '15133145263', '是是是', null, '/autocarrier/mystatic/img/pic/20180323b3a13b104c254f5fa0cd2a2c8ceb0cb0.jpg', '/autocarrier/mystatic/img/pic/2018032369aef95e74444ef0889e807fc340fde3.jpg', 'asdfghj@qq.com', null, '4c40040449054552bd4486fba77da3f3', null, '2018-03-23 08:38:02');
INSERT INTO `hd_person_information` VALUES ('57735384f6af4992b29d720256b69c7d', 'ddddd', '男', '112015188411024531', '15283849876', '15182869876', null, '/autocarrier/mystatic/img/pic/20180314627c4e52f77a492eac98f6a2069c2e62.jpg', '/autocarrier/mystatic/img/pic/20180314684c5fdea34c47b589bf442af472e69b.jpg', 'asdfgh@qq.com', null, '57735384f6af4992b29d720256b69c7d', '2018-03-14 14:44:22', null);
INSERT INTO `hd_person_information` VALUES ('5d40345cf5aa458abb888ebac8ad53c1', '魏晓飞', '男', '131122199405072817', '18632871252', '13269491680', null, '/autocarrier/mystatic/img/pic/2018032356fa3fe4284442cfb5df1024b16df3f9.bmp', '/autocarrier/mystatic/img/pic/2018032359a6e14708bf46a88d4c14eb7cd9e5e4.bmp', '1692334890@qq.com', null, '5d40345cf5aa458abb888ebac8ad53c1', null, '2018-03-23 09:08:30');
INSERT INTO `hd_person_information` VALUES ('6791e802ad8747e485024c15fe4fe70c', '测试大神', '男', '130529100001011213', '18388888888', '13888888888', null, '/autocarrier/mystatic/img/pic/20180323d692b796224942c590fcbd228925a06d.jpg', '/autocarrier/mystatic/img/pic/201803236d598162c6554e7db90663d2f998500a.jpg', '410@qq.com', null, '6791e802ad8747e485024c15fe4fe70c', '2018-03-23 10:06:10', null);
INSERT INTO `hd_person_information` VALUES ('c6916a0ba5a24bd29e4c6528cde6a531', 'wxf', '男', '131122188405105584', '18632871252', '13269491680', null, '/autocarrier/mystatic/img/pic/201803216f6a87540b914ac994e162a92bbc8922.JPEG', '/autocarrier/mystatic/img/pic/201803218b57dd86b6c74a2f815fe9e241457cd1.JPEG', '1692334890@qq.com', null, 'c6916a0ba5a24bd29e4c6528cde6a531', '2018-03-21 10:40:08', null);
INSERT INTO `hd_person_information` VALUES ('cd7e05d8afca4af09aa43d495f9a6f4c', '测试大神', '未知性别', '131529100010101000', '13856578459', '13888888888', null, '/autocarrier/mystatic/img/pic/20180315352b3d916b894366ba215b3c804773a2.jpg', '/autocarrier/mystatic/img/pic/20180315608d481d3d49494ba87c0b1c14d43ebb.jpg', '411@qq.com', null, 'cd7e05d8afca4af09aa43d495f9a6f4c', '2018-03-15 08:29:18', null);

-- ----------------------------
-- Table structure for hd_qualification_certificate_information
-- ----------------------------
DROP TABLE IF EXISTS `hd_qualification_certificate_information`;
CREATE TABLE `hd_qualification_certificate_information` (
  `qualification_certificate_information_id` varchar(32) NOT NULL DEFAULT ' ' COMMENT '主键',
  `birth_date` varchar(30) NOT NULL DEFAULT ' ' COMMENT '出生日期',
  `qualification_certificate_number` varchar(19) NOT NULL DEFAULT ' ' COMMENT '从业资格证号:从业资格证的编号',
  `qualification_certificate_category_code` varchar(30) NOT NULL DEFAULT ' ' COMMENT '从业资格类别代码',
  `certification_unit` varchar(100) NOT NULL DEFAULT ' ' COMMENT '发证单位',
  `licenseinitial_collection_date` varchar(30) NOT NULL DEFAULT ' ' COMMENT '证件初次领取日期',
  `period_start_date` varchar(30) NOT NULL DEFAULT ' ' COMMENT '期限开始日期',
  `period_end_date` varchar(30) NOT NULL DEFAULT ' ' COMMENT '期限结束日期',
  `communication_number` varchar(512) NOT NULL DEFAULT ' ' COMMENT '通讯地址:住址',
  `photo` varchar(256) NOT NULL DEFAULT ' ' COMMENT '照片:从业资格证扫描照片名称（含路径）',
  `operator_id` varchar(32) NOT NULL DEFAULT ' ' COMMENT 'operator_id',
  `create_time` varchar(30) NOT NULL DEFAULT ' ' COMMENT 'create_time',
  `update_time` varchar(30) NOT NULL DEFAULT ' ' COMMENT 'update_time',
  PRIMARY KEY (`qualification_certificate_information_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='从业资格证信息';

-- ----------------------------
-- Records of hd_qualification_certificate_information
-- ----------------------------

-- ----------------------------
-- Table structure for hd_qualification_check
-- ----------------------------
DROP TABLE IF EXISTS `hd_qualification_check`;
CREATE TABLE `hd_qualification_check` (
  `account_id` varchar(32) NOT NULL COMMENT '用户编号,与基本用户信息中的编号一致',
  `qualification_reviewer_id` varchar(32) DEFAULT '' COMMENT '资质审核人',
  `qualification_reviewer` varchar(32) DEFAULT '' COMMENT '资质审核人',
  `qualification_review_time` varchar(32) DEFAULT '' COMMENT '资质审核时间',
  `margin_reviewer_id` varchar(32) DEFAULT '' COMMENT '保证金审核人',
  `margin_reviewer` varchar(32) DEFAULT '' COMMENT '保证金审核人',
  `margin_review_time` varchar(32) DEFAULT '' COMMENT '保证金审核时间',
  `reviewer_id` varchar(32) DEFAULT '' COMMENT '复核人',
  `reviewer` varchar(32) DEFAULT '' COMMENT '复核人',
  `review_time` varchar(32) DEFAULT '' COMMENT '复核时间',
  `audit_status` varchar(32) DEFAULT '' COMMENT '审核状态',
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资质审核信息';

-- ----------------------------
-- Records of hd_qualification_check
-- ----------------------------
INSERT INTO `hd_qualification_check` VALUES ('5d40345cf5aa458abb888ebac8ad53c1', 'cd7e05d8afca4af09aa43d495f9a6f4c', 'Mr.w', '2018-03-23 09:12:38', 'cd7e05d8afca4af09aa43d495f9a6f4c', 'Mr.w', '2018-03-23 09:12:54', 'cd7e05d8afca4af09aa43d495f9a6f4c', 'Mr.w', '2018-03-23 09:13:20', '');
INSERT INTO `hd_qualification_check` VALUES ('6791e802ad8747e485024c15fe4fe70c', 'cd7e05d8afca4af09aa43d495f9a6f4c', 'Mr.w', '2018-03-23 10:21:59', 'cd7e05d8afca4af09aa43d495f9a6f4c', 'Mr.w', '2018-03-23 10:28:16', 'cd7e05d8afca4af09aa43d495f9a6f4c', 'Mr.w', '2018-03-23 10:28:22', '');

-- ----------------------------
-- Table structure for hd_road_transport_business_operating_permit_information
-- ----------------------------
DROP TABLE IF EXISTS `hd_road_transport_business_operating_permit_information`;
CREATE TABLE `hd_road_transport_business_operating_permit_information` (
  `road_transport_business_id` varchar(32) NOT NULL DEFAULT ' ' COMMENT '主键',
  `permit_number` varchar(50) DEFAULT ' ' COMMENT '许可证编号:道路运输经营许可证编号',
  `enterprise_name` varchar(100) DEFAULT ' ' COMMENT '企业名称',
  `place_or_location` varchar(256) DEFAULT ' ' COMMENT '地点/位置:企业经营地点',
  `business_scope` varchar(500) DEFAULT ' ' COMMENT '经营范围:企业经营范围',
  `permit_grant_date` varchar(30) DEFAULT ' ' COMMENT '许可证发放日期:',
  `period_start_date` varchar(30) DEFAULT ' ' COMMENT '期限开始日期:道路运输经营许可证有效期开始日期',
  `period_end_date` varchar(30) DEFAULT ' ' COMMENT '期限结束日期:道路运输经营许可证有效期截止日期',
  `certification_unit` varchar(100) DEFAULT ' ' COMMENT '发证单位',
  `photo` varchar(256) DEFAULT ' ' COMMENT '照片:道路运输经营许可证的扫描照片名称（含路径）',
  `operator_id` varchar(32) DEFAULT ' ' COMMENT 'operator_id',
  `create_time` varchar(30) DEFAULT ' ' COMMENT 'create_time',
  `update_time` varchar(30) DEFAULT ' ' COMMENT 'update_time',
  PRIMARY KEY (`road_transport_business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='道路运输经营许可信息';

-- ----------------------------
-- Records of hd_road_transport_business_operating_permit_information
-- ----------------------------
INSERT INTO `hd_road_transport_business_operating_permit_information` VALUES ('2', '131122003845', '武邑衡东物流有限公司', '河北省衡水市武邑县清凉店镇团村', '道路普通货物运输,货物专用运输(集装箱),货物专用运输(罐式容器),大型物件运输(一类)', ' ', ' ', '2017-04-16', ' ', '', '2', ' ', '2018-03-21 08:41:05');

-- ----------------------------
-- Table structure for hd_road_transport_certificate_information
-- ----------------------------
DROP TABLE IF EXISTS `hd_road_transport_certificate_information`;
CREATE TABLE `hd_road_transport_certificate_information` (
  `road_transport_certificate_id` varchar(32) NOT NULL DEFAULT ' ',
  `road_transport_certificate_number` varchar(12) NOT NULL DEFAULT ' ' COMMENT '道路运输证号',
  `bussiness_state` varchar(64) NOT NULL DEFAULT ' ' COMMENT '车辆运营状态',
  `bussiness_state_code` varchar(30) NOT NULL DEFAULT ' ' COMMENT '车辆营运状态代码',
  `place_or_location` varchar(256) NOT NULL DEFAULT ' ' COMMENT '地点/位置:车辆所有人（企业）的登记地址',
  `vehicle_number` varchar(35) NOT NULL DEFAULT ' ' COMMENT '车辆牌照号',
  `permit_number` varchar(50) NOT NULL DEFAULT ' ' COMMENT '许可证编号',
  `vehicle_classification` varchar(12) NOT NULL DEFAULT ' ' COMMENT '车辆分类',
  `vehicle_tonnage` varchar(11) NOT NULL DEFAULT ' ' COMMENT '车辆载质量',
  `vehicle_length` varchar(6) NOT NULL DEFAULT ' ' COMMENT '车辆长度',
  `vehicle_width` varchar(6) NOT NULL DEFAULT ' ' COMMENT '车辆宽度',
  `vehicle_height` varchar(6) NOT NULL DEFAULT ' ' COMMENT '车辆高度',
  `business_scope` varchar(500) NOT NULL DEFAULT ' ' COMMENT '经营范围',
  `issuing_date` varchar(30) NOT NULL DEFAULT ' ' COMMENT '发证日期',
  `license_initial_collection_date` varchar(30) NOT NULL DEFAULT ' ' COMMENT '证件初次领取日期',
  `period_start_date` varchar(30) NOT NULL DEFAULT ' ' COMMENT '期限开始日期:有效期始',
  `period_end_date` varchar(30) NOT NULL DEFAULT ' ' COMMENT '期限结束日期:有效期止',
  `certification_unit` varchar(100) NOT NULL DEFAULT ' ' COMMENT '发证单位:发证单位的名称',
  `photo` varchar(256) NOT NULL DEFAULT ' ' COMMENT '照片:照片的名称（含路径）',
  `operator_id` varchar(32) NOT NULL DEFAULT ' ' COMMENT 'operator_id',
  `create_time` varchar(30) NOT NULL DEFAULT ' ' COMMENT 'create_time',
  `update_time` varchar(30) NOT NULL DEFAULT ' ' COMMENT 'update_time',
  PRIMARY KEY (`road_transport_certificate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='道路运输证信息';

-- ----------------------------
-- Records of hd_road_transport_certificate_information
-- ----------------------------
INSERT INTO `hd_road_transport_certificate_information` VALUES ('4028ac816250a5bf016250a5bfd40000', '1234564789', ' ', ' ', '123456', '冀T88727', '159357', ' ', ' ', ' ', ' ', ' ', '道路普通货物运输', '2018-03-07', '2016-12-13', '2016-12-13', '2020-12-12', ' ', '/autocarrier/mystatic/img/pic/201803234b8f043ea23a45e3b37d64ac7d916e1d.jpg', '6791e802ad8747e485024c15fe4fe70c', '2018-03-23 10:17:42', ' ');
INSERT INTO `hd_road_transport_certificate_information` VALUES ('4028b88162504c110162504fb2fd0001', '12123234', ' ', ' ', '121344', '冀T99929', '134567', ' ', ' ', ' ', ' ', ' ', '不知道', '2018-03-23', '2018-04-04', '2018-03-23', '2018-03-23', ' ', '/autocarrier/mystatic/img/pic/2018032367114a8991184e1980644de3bc0a023e.bmp', '5d40345cf5aa458abb888ebac8ad53c1', '2018-03-23 08:43:43', ' ');

-- ----------------------------
-- Table structure for hd_send_car
-- ----------------------------
DROP TABLE IF EXISTS `hd_send_car`;
CREATE TABLE `hd_send_car` (
  `send_car_id` varchar(32) NOT NULL DEFAULT '派车编号',
  `carrier_id` varchar(32) DEFAULT NULL COMMENT '承运人编号',
  `contract_id` varchar(32) DEFAULT '' COMMENT '运输合同编号',
  `goods_publish_id` varchar(32) DEFAULT NULL COMMENT '货源编号',
  `vehicle_publish_id` varchar(32) DEFAULT NULL COMMENT '车源编号id',
  `vehicle_number` varchar(32) DEFAULT NULL COMMENT '车牌号',
  `driver_id` varchar(32) DEFAULT NULL COMMENT '司机编号',
  `place_of_loading` varchar(32) DEFAULT NULL COMMENT '出发地',
  `place_of_loading_coordinate` varchar(32) DEFAULT NULL COMMENT '出发地坐标',
  `goods_receipt_place` varchar(32) DEFAULT NULL COMMENT '目的地',
  `goods_receipt_place_coordinate` varchar(32) DEFAULT NULL COMMENT '目的地坐标',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` varchar(20) DEFAULT NULL COMMENT '发车时间',
  `update_time` varchar(20) DEFAULT NULL,
  `account_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`send_car_id`),
  KEY `send_car_publish_id` (`goods_publish_id`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hd_send_car
-- ----------------------------
INSERT INTO `hd_send_car` VALUES ('4028b8816250acee016250c2aaf90004', '5d40345cf5aa458abb888ebac8ad53c1', '4028b8816250acee016250b1210b0002', '297e902362507a0c016250a95261000f', '4028b88162504c110162508147850006', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hd_send_car` VALUES ('4028b8816250acee016250c2b69a0005', '5d40345cf5aa458abb888ebac8ad53c1', '4028b8816250acee016250b1210b0002', '297e902362507a0c016250a95261000f', '4028b88162504c110162508147850006', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hd_send_car` VALUES ('4028b8816250acee016250c4b1bd0006', '5d40345cf5aa458abb888ebac8ad53c1', '4028b8816250acee016250b1210b0002', '297e902362507a0c016250a95261000f', '4028b88162504c110162508147850006', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hd_send_car` VALUES ('4028b8816250acee016250c5095a0007', '5d40345cf5aa458abb888ebac8ad53c1', '4028b8816250acee016250b1210b0002', '297e902362507a0c016250a95261000f', '4028b88162504c110162508147850006', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hd_send_car` VALUES ('ab764ce9d9e44666b13b300fd91d3072', null, '841a923dc7cd402a890e816c4fb1408c', '0a7622dede444b3fb90f33bcc3e80b55', '', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hd_send_car` VALUES ('f15fd9666299455eacf52586801d3ecd', null, '841a923dc7cd402a890e816c4fb1408b', '28b6673e101f4d21a905f9ae28a9b20a', '794d2503ff724c68a9009756ef8f6b98', '冀T99929', null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for hd_serial_number
-- ----------------------------
DROP TABLE IF EXISTS `hd_serial_number`;
CREATE TABLE `hd_serial_number` (
  `id` int(11) NOT NULL,
  `nub` int(5) NOT NULL,
  `time` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hd_serial_number
-- ----------------------------
INSERT INTO `hd_serial_number` VALUES ('1', '3', '20180410');

-- ----------------------------
-- Table structure for hd_talk_history
-- ----------------------------
DROP TABLE IF EXISTS `hd_talk_history`;
CREATE TABLE `hd_talk_history` (
  `id` varchar(255) NOT NULL COMMENT '聊天记录id',
  `content` varchar(255) DEFAULT NULL COMMENT '聊天记录内容',
  `src_accountId` varchar(255) DEFAULT NULL COMMENT '发送方id',
  `target_accountId` varchar(255) DEFAULT NULL COMMENT '接收方id',
  `time` varchar(30) DEFAULT NULL COMMENT '发送时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hd_talk_history
-- ----------------------------

-- ----------------------------
-- Table structure for hd_talk_message
-- ----------------------------
DROP TABLE IF EXISTS `hd_talk_message`;
CREATE TABLE `hd_talk_message` (
  `id` double(100,0) NOT NULL AUTO_INCREMENT,
  `userid` varchar(32) NOT NULL COMMENT 'userid+chatlog',
  `chatlog` varchar(100) DEFAULT NULL,
  `history` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hd_talk_message
-- ----------------------------

-- ----------------------------
-- Table structure for hd_talk_message_chatlog
-- ----------------------------
DROP TABLE IF EXISTS `hd_talk_message_chatlog`;
CREATE TABLE `hd_talk_message_chatlog` (
  `tid` varchar(100) NOT NULL COMMENT 'Accountid+chatlog    detail的外键',
  `id` varchar(32) NOT NULL,
  `type` varchar(10) NOT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hd_talk_message_chatlog
-- ----------------------------
INSERT INTO `hd_talk_message_chatlog` VALUES ('1893cdc43d0c4580a4bc75243038cf42friendcd7e05d8afca4af09aa43d495f9a6f4c', 'cd7e05d8afca4af09aa43d495f9a6f4c', 'friend', 'http://cdn.firstlinkapp.com/upload/2016_6/1465575923433_33812.jpg');
INSERT INTO `hd_talk_message_chatlog` VALUES ('4c40040449054552bd4486fba77da3f3friendcd7e05d8afca4af09aa43d495f9a6f4c', 'cd7e05d8afca4af09aa43d495f9a6f4c', 'friend', 'http://cdn.firstlinkapp.com/upload/2016_6/1465575923433_33812.jpg');

-- ----------------------------
-- Table structure for hd_talk_message_chatlog_detail
-- ----------------------------
DROP TABLE IF EXISTS `hd_talk_message_chatlog_detail`;
CREATE TABLE `hd_talk_message_chatlog_detail` (
  `detailid` bigint(18) NOT NULL AUTO_INCREMENT,
  `timestamp` bigint(14) NOT NULL,
  `content` varchar(255) NOT NULL,
  `username` varchar(20) NOT NULL,
  `mine` tinyint(1) NOT NULL,
  `state` int(1) NOT NULL,
  `timestate` int(8) DEFAULT NULL,
  `ttid` varchar(100) NOT NULL,
  PRIMARY KEY (`detailid`),
  KEY `ttid` (`ttid`),
  CONSTRAINT `hd_talk_message_chatlog_detail_ibfk_1` FOREIGN KEY (`ttid`) REFERENCES `hd_talk_message_chatlog` (`tid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hd_talk_message_chatlog_detail
-- ----------------------------
INSERT INTO `hd_talk_message_chatlog_detail` VALUES ('19', '1521526206262', '4', 'self', '1', '1', null, '1893cdc43d0c4580a4bc75243038cf42friendcd7e05d8afca4af09aa43d495f9a6f4c');
INSERT INTO `hd_talk_message_chatlog_detail` VALUES ('20', '1521526202939', '3', 'ordinary', '0', '1', null, '1893cdc43d0c4580a4bc75243038cf42friendcd7e05d8afca4af09aa43d495f9a6f4c');
INSERT INTO `hd_talk_message_chatlog_detail` VALUES ('21', '1521526199655', '2', 'self', '1', '1', null, '1893cdc43d0c4580a4bc75243038cf42friendcd7e05d8afca4af09aa43d495f9a6f4c');
INSERT INTO `hd_talk_message_chatlog_detail` VALUES ('22', '1521526196176', '1', 'ordinary', '0', '1', null, '1893cdc43d0c4580a4bc75243038cf42friendcd7e05d8afca4af09aa43d495f9a6f4c');
INSERT INTO `hd_talk_message_chatlog_detail` VALUES ('23', '1521526182120', '老魔4', 'self', '1', '1', null, '1893cdc43d0c4580a4bc75243038cf42friendcd7e05d8afca4af09aa43d495f9a6f4c');
INSERT INTO `hd_talk_message_chatlog_detail` VALUES ('24', '1521792095160', '离线测试', 'self', '1', '1', null, '1893cdc43d0c4580a4bc75243038cf42friendcd7e05d8afca4af09aa43d495f9a6f4c');
INSERT INTO `hd_talk_message_chatlog_detail` VALUES ('25', '1521791609067', '离线测试', 'self', '1', '1', null, '1893cdc43d0c4580a4bc75243038cf42friendcd7e05d8afca4af09aa43d495f9a6f4c');
INSERT INTO `hd_talk_message_chatlog_detail` VALUES ('26', '1521773306104', '121', 'liulong1', '1', '1', null, '4c40040449054552bd4486fba77da3f3friendcd7e05d8afca4af09aa43d495f9a6f4c');
INSERT INTO `hd_talk_message_chatlog_detail` VALUES ('27', '1521773226385', '11232', 'liulong1', '1', '1', null, '4c40040449054552bd4486fba77da3f3friendcd7e05d8afca4af09aa43d495f9a6f4c');

-- ----------------------------
-- Table structure for hd_talk_user_mine
-- ----------------------------
DROP TABLE IF EXISTS `hd_talk_user_mine`;
CREATE TABLE `hd_talk_user_mine` (
  `id` varchar(32) NOT NULL,
  `username` varchar(32) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hd_talk_user_mine
-- ----------------------------

-- ----------------------------
-- Table structure for hd_transport_operating_information
-- ----------------------------
DROP TABLE IF EXISTS `hd_transport_operating_information`;
CREATE TABLE `hd_transport_operating_information` (
  `transport_operating_id` varchar(32) NOT NULL DEFAULT ' ' COMMENT '主键',
  `own_cargo_vehicles_number` varchar(8) NOT NULL DEFAULT ' ' COMMENT '自有货运车辆数:企业自有货运车辆的数量',
  `transport_capacity_scale` varchar(16) NOT NULL DEFAULT ' ' COMMENT '运力规模:运输企业的运输能力大小',
  `workers_number` varchar(8) NOT NULL DEFAULT ' ' COMMENT '职工人数:企业职工的人数',
  `remark` varchar(256) NOT NULL DEFAULT ' ' COMMENT '备注',
  `operator_id` varchar(32) NOT NULL DEFAULT ' ' COMMENT 'operator_id',
  `create_time` varchar(30) NOT NULL DEFAULT ' ' COMMENT 'create_time',
  `update_time` varchar(30) NOT NULL DEFAULT ' ' COMMENT 'update_time',
  PRIMARY KEY (`transport_operating_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='运输经营信息';

-- ----------------------------
-- Records of hd_transport_operating_information
-- ----------------------------

-- ----------------------------
-- Table structure for hd_transport_record
-- ----------------------------
DROP TABLE IF EXISTS `hd_transport_record`;
CREATE TABLE `hd_transport_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_contract_id` varchar(100) DEFAULT NULL COMMENT '托运合同编号',
  `vehicle_contract_id` varchar(100) DEFAULT NULL COMMENT '承运合同编号',
  `start_destination` varchar(100) DEFAULT NULL COMMENT '运输起点',
  `end_destination` varchar(100) DEFAULT NULL COMMENT '运输终点',
  `vehicle_number` varchar(10) DEFAULT NULL COMMENT '车牌号',
  `vehicle_driver` varchar(20) DEFAULT NULL COMMENT '司机姓名',
  `carrier_id` varchar(100) DEFAULT NULL COMMENT '承运人编号',
  `carrier_name` varchar(50) DEFAULT NULL COMMENT '承运人名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='承运人运输记录';

-- ----------------------------
-- Records of hd_transport_record
-- ----------------------------

-- ----------------------------
-- Table structure for hd_vehicle_identity_card_information
-- ----------------------------
DROP TABLE IF EXISTS `hd_vehicle_identity_card_information`;
CREATE TABLE `hd_vehicle_identity_card_information` (
  `vehicle_identity_card_id` varchar(32) NOT NULL DEFAULT ' ',
  `vehicle_identity_card_number` varchar(20) NOT NULL DEFAULT ' ' COMMENT '车辆识别卡号',
  `vehicle_identity_card_type_code` varchar(20) NOT NULL DEFAULT ' ' COMMENT '车辆识别卡类型代码',
  `authenticating_code` varchar(20) NOT NULL DEFAULT ' ' COMMENT '防伪认证码',
  `card_operating_code` varchar(20) NOT NULL DEFAULT ' ' COMMENT '卡操作方式代码',
  `status_change_date_time` varchar(30) NOT NULL DEFAULT ' ' COMMENT '状态变更日期时间',
  `vehicle_corporation_name` varchar(100) NOT NULL DEFAULT ' ' COMMENT '车辆所属单位名称',
  `logistics_exchange_code` varchar(20) NOT NULL DEFAULT ' ' COMMENT '物流交换代码:发卡方的物流交换代码',
  `check_state_expire_date` varchar(30) NOT NULL DEFAULT ' ' COMMENT '审验有效期:车辆年度审验有效期至',
  `issue_card_enterprise` varchar(100) NOT NULL DEFAULT ' ' COMMENT '发卡单位:发卡单位名称',
  `operator_id` varchar(32) NOT NULL DEFAULT ' ' COMMENT 'operator_id',
  `create_time` varchar(30) NOT NULL DEFAULT ' ' COMMENT 'create_time',
  `update_time` varchar(30) NOT NULL DEFAULT ' ' COMMENT 'update_time',
  PRIMARY KEY (`vehicle_identity_card_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='车辆卡基本信息';

-- ----------------------------
-- Records of hd_vehicle_identity_card_information
-- ----------------------------

-- ----------------------------
-- Table structure for hd_vehicle_information
-- ----------------------------
DROP TABLE IF EXISTS `hd_vehicle_information`;
CREATE TABLE `hd_vehicle_information` (
  `vehicle_information_id` varchar(32) NOT NULL DEFAULT ' ' COMMENT '车辆编号',
  `vehicle_number` varchar(35) NOT NULL DEFAULT ' ' COMMENT '车辆牌照号',
  `license_plate_type_code` varchar(20) NOT NULL DEFAULT ' ' COMMENT '牌照类型代码',
  `owner` varchar(256) NOT NULL DEFAULT ' ' COMMENT '所有人:车辆所有人（或企业）的名称或姓名',
  `remark` varchar(256) NOT NULL DEFAULT ' ' COMMENT '备注',
  `operator_id` varchar(32) NOT NULL DEFAULT ' ',
  `create_time` varchar(30) NOT NULL DEFAULT ' ',
  `update_time` varchar(30) NOT NULL DEFAULT ' ',
  PRIMARY KEY (`vehicle_information_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='车辆基本信息';

-- ----------------------------
-- Records of hd_vehicle_information
-- ----------------------------
INSERT INTO `hd_vehicle_information` VALUES ('4028ac816250a5bf016250a5bfd40000', '冀T88727', '01', '酥梨', ' ', '6791e802ad8747e485024c15fe4fe70c', '2018-03-23 10:17:42', ' ');
INSERT INTO `hd_vehicle_information` VALUES ('4028b88162504c110162504fb2fd0001', '冀T99929', '01', '魏晓飞', ' ', '5d40345cf5aa458abb888ebac8ad53c1', '2018-03-23 08:43:43', ' ');

-- ----------------------------
-- Table structure for hd_vehicle_publish
-- ----------------------------
DROP TABLE IF EXISTS `hd_vehicle_publish`;
CREATE TABLE `hd_vehicle_publish` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `vehicle_number` varchar(20) DEFAULT NULL COMMENT '车牌号',
  `license_plate_type_code` varchar(20) DEFAULT NULL COMMENT '车辆牌照类型编号',
  `license_plate_type` varchar(20) DEFAULT NULL COMMENT '车辆牌照类型',
  `place_of_loading` varchar(20) DEFAULT NULL COMMENT '出发地',
  `country_subdivision_code_from` varchar(20) DEFAULT NULL COMMENT '出发地代码',
  `goods_receipt_place` varchar(20) DEFAULT NULL COMMENT '目的地',
  `country_subdivision_code_to` varchar(20) DEFAULT NULL COMMENT '目的地代码',
  `identity_info` varchar(20) DEFAULT NULL COMMENT '认证信息',
  `credit_info` varchar(20) DEFAULT NULL COMMENT '信用信息',
  `vehicle_length` varchar(20) DEFAULT NULL COMMENT '车长',
  `vehicle_width` varchar(20) DEFAULT NULL COMMENT '车宽',
  `vehicle_height` varchar(20) DEFAULT NULL COMMENT '车高',
  `vehicle_tonnage` varchar(20) DEFAULT NULL COMMENT '车辆载重(吨)',
  `vehicle_classification` varchar(20) DEFAULT NULL COMMENT '车辆类型',
  `total_monetary_amount` varchar(20) DEFAULT NULL COMMENT '整车运输价格(元)',
  `owner` varchar(20) DEFAULT NULL COMMENT '所有人',
  `owner_mobile_phone_number` varchar(20) DEFAULT NULL COMMENT '所有人手机号',
  `person` varchar(20) DEFAULT NULL COMMENT '联系人',
  `person_mobile_phone_number` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `plan_time` varchar(20) DEFAULT NULL COMMENT '计划发车时间',
  `last_time` varchar(20) DEFAULT NULL COMMENT '最晚发车时间',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `create_time` varchar(20) DEFAULT NULL,
  `account_id` varchar(32) DEFAULT NULL,
  `update_time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hd_vehicle_publish
-- ----------------------------
INSERT INTO `hd_vehicle_publish` VALUES ('4028b88162504c110162506eaee10003', '冀T88727', null, null, '河北省/衡水市/武邑县', null, '北京市/北京市/东城区', null, null, null, '12', '12', '12', '12', '0', '12', null, null, '魏晓飞', '18632871252', '2018-03-23', '2018-03-23', '请问请问我去而放弃而女人', '2018-03-23 09:17:33', '5d40345cf5aa458abb888ebac8ad53c1', null);
INSERT INTO `hd_vehicle_publish` VALUES ('4028b88162504c1101625071bf950004', '冀T12345', null, null, '海南省/海口市/秀英区', null, '辽宁省/沈阳市/和平区', null, null, null, '34', '34', '34', '34', '0', '45657', null, null, '总平图', '13256894852', '2018-03-07', '2018-03-12', '为人员', '2018-03-23 09:20:54', '5d40345cf5aa458abb888ebac8ad53c1', null);
INSERT INTO `hd_vehicle_publish` VALUES ('4028b88162504c110162507283940005', '冀T78945', null, null, '天津市/天津市/和平区', null, '新疆维吾尔自治区/乌鲁木齐市/天山区', null, null, null, '678', '79', '8', '132', '0', '534', null, null, '柳龙', '18756247852', '2018-03-07', '2018-03-08', '我二哥', '2018-03-23 09:21:44', '5d40345cf5aa458abb888ebac8ad53c1', null);
INSERT INTO `hd_vehicle_publish` VALUES ('4028b88162504c110162508147850006', '冀T88535', null, null, '内蒙古自治区/呼和浩特市/土默特左旗', null, '云南省/迪庆藏族自治州/维西傈僳族自治县', null, null, null, '12', '12', '12', '12', '0', '34564', null, null, '魏凯', '13285781230', '2018-03-23', '2018-03-23', '8273日期不玩', '2018-03-23 09:37:52', '5d40345cf5aa458abb888ebac8ad53c1', null);
INSERT INTO `hd_vehicle_publish` VALUES ('4028b88162504c110162508e39ed0007', '冀T23698', null, null, '北京市/北京市/丰台区', null, '甘肃省/武威市/民勤县', null, null, null, '12', '12', '12', '12', '1', '23456', null, null, 'dxy', '18956232356', '2018-03-23', '2018-03-23', '32456', '2018-03-23 09:52:01', '5d40345cf5aa458abb888ebac8ad53c1', null);
INSERT INTO `hd_vehicle_publish` VALUES ('4028b88162504c110162509ab56d0008', '冀T78502', null, null, '广西壮族自治区/钦州市/灵山县', null, '甘肃省/嘉峪关市', null, null, null, '12', '12', '12', '12', '2', '23', null, null, 'wxf', '13287459630', '2018-03-23', '2018-03-23', '324dfvdfb', '2018-03-23 10:05:39', '5d40345cf5aa458abb888ebac8ad53c1', null);
INSERT INTO `hd_vehicle_publish` VALUES ('794d2503ff724c68a9009756ef8f6b98', '冀T99920', null, null, '安徽省/芜湖市/弋江区', null, '安徽省/芜湖市/鸠江区', null, null, null, '', '', '', '', null, '', null, null, '', '', '', '', '', '2018-02-11 11:32:17', '5d40345cf5aa458abb888ebac8ad53c1', null);

-- ----------------------------
-- Table structure for jy_base_account
-- ----------------------------
DROP TABLE IF EXISTS `jy_base_account`;
CREATE TABLE `jy_base_account` (
  `id` varchar(32) NOT NULL COMMENT '用户Id',
  `loginName` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '用户登录名',
  `password` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '密码',
  `salt` varchar(50) NOT NULL,
  `roleId` varchar(32) DEFAULT '0' COMMENT '用户类型(对应jy_base_role的Id)',
  `picUrl` varchar(255) DEFAULT NULL,
  `name` varchar(64) CHARACTER SET utf8 DEFAULT '' COMMENT '用户名字',
  `email` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '电子邮箱',
  `skin` varchar(64) DEFAULT '',
  `isValid` int(2) DEFAULT '1' COMMENT '是否有效(1:有效，0:无效)',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL,
  `description` varchar(100) CHARACTER SET utf8 DEFAULT '' COMMENT '描述',
  `mobileTelephoneNumber` varchar(20) DEFAULT NULL COMMENT '电话号码',
  `userType` int(1) DEFAULT '1' COMMENT '1:个人用户;2:企业用户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of jy_base_account
-- ----------------------------
INSERT INTO `jy_base_account` VALUES ('0f02dac2c5744f3f8c07c7d3bc03e247', 'asd789456', 'Ixw0ANJf69C129zC8iuOZg==', 'd0c026073469b31bd7228a64134f9802', 'cde1daaf551b41e98bfeded725f119ab', null, null, null, 'skin-0', '1', '2018-03-14 15:08:52', null, null, '15283847896', null);
INSERT INTO `jy_base_account` VALUES ('1', 'sa', 'D5r6e+Ss9h/qEyRYjicXMA==', '139b27063725fab02cfaf3d3156af9df', '4', '/JYSystem/static/images/system/user/hpic1.jpg', 'Joker', 'xx@163.com', 'skin-0', '1', '2015-10-13 11:23:32', '2015-12-14 00:03:59', '', '12345678', '1');
INSERT INTO `jy_base_account` VALUES ('1405e62f8fe642938102953950c6a5c0', 'companymin', 'u1A0OfYYLi5FZzdbwPvsIw==', '7d379a3bce17e3a9401af789c6c7b4bd', 'c3e444b71e744a94b76c79e429f61631', null, 'Mr.w', '', 'skin-0', '1', '2018-01-04 09:55:13', null, '39hm55', null, '1');
INSERT INTO `jy_base_account` VALUES ('159ae13b0acf46128cbaa2d8e6de34cf', 'liulong4', 'Jht9chNOmeFJ58rfLQQs/Q==', '4270ee25d6569b17710a4c39644149ff', '02665eef40a74e9cb22c602676f6b460', null, 'liujian', null, 'skin-0', '1', '2018-01-29 09:27:19', null, null, '13146763150', null);
INSERT INTO `jy_base_account` VALUES ('1893cdc43d0c4580a4bc75243038cf42', 'self', 'FHW0Wu2M0rtE2tqHuxBkPA==', '9d8cda64729de405a29f5e5a19662415', '5b8661cb83114d28b2c733f70dc98f4e', null, 'Mr.w', '', 'skin-0', '1', '2018-01-04 09:21:08', '2018-01-04 09:56:04', 'u338o1', null, '1');
INSERT INTO `jy_base_account` VALUES ('2', 'admin', 'M4t/qU4O3ICaaEOsjmDmTg==', '43270453df7ca64d3303ec4d835b15b8', '4', null, '柳龙', 'xx@163.com', 'skin-0', '1', null, '2017-12-26 20:24:27', '', '12345678', '1');
INSERT INTO `jy_base_account` VALUES ('346b89aec4c1414e8b533729edc466bc', 'wxf', '8mGcuOM+xNAY1Cd5Pyw21g==', 'b1b89ad77cc8da63ec21440883c478da', '4', null, 'wxf', '', 'skin-0', '1', '2018-01-24 19:51:11', null, 'lE6923', null, '1');
INSERT INTO `jy_base_account` VALUES ('4158c04eab3b4bee944b3ee0fdfdf1e4', 'company', '1f2c67N4RXpKErCI3gbP2w==', 'f64db21479aaa9a118dff05608a68aab', '02665eef40a74e9cb22c602676f6b460', null, 'Mr.w', '', 'skin-0', '1', '2018-01-03 16:30:20', '2018-01-04 08:59:53', 'Uu73S2', null, '1');
INSERT INTO `jy_base_account` VALUES ('4c40040449054552bd4486fba77da3f3', 'liulong1', 's6fdV0qGvaSZjMaZEQQGkg==', '8c663ea704d81b241b7efd2f037a0783', 'cde1daaf551b41e98bfeded725f119ab', null, '柳龙', null, 'skin-0', '1', '2018-01-29 09:10:13', null, null, '13146763147', null);
INSERT INTO `jy_base_account` VALUES ('57735384f6af4992b29d720256b69c7d', 'asd123456789', 'iF8zOxwhJVoLModlfVoHGQ==', 'f8cb371b251a59e842ba80cc830f0051', '4ac4ad4eb43d41249823fc2007ce839d', null, null, null, 'skin-0', '1', '2018-03-14 14:41:28', null, null, '15283849876', null);
INSERT INTO `jy_base_account` VALUES ('5d40345cf5aa458abb888ebac8ad53c1', 'liulong3', 'hgOxarqyYjmFQm0xa4SQmw==', '0f79304b1d17a8599b6afea94f82f8e2', '4ac4ad4eb43d41249823fc2007ce839d', null, '柳龙', null, 'skin-0', '1', '2018-01-29 09:26:37', null, null, '13146763149', null);
INSERT INTO `jy_base_account` VALUES ('60b7d5362fc24aef83ea7d0625abd0e3', 'asd456123', 'q8Ixr26b22u+uzvdZ0kFyw==', '5406bb75c8b4212b6dea3666f04ccf83', 'c3e444b71e744a94b76c79e429f61631', null, null, null, 'skin-0', '1', '2018-03-14 15:14:49', null, null, '15283844567', null);
INSERT INTO `jy_base_account` VALUES ('6791e802ad8747e485024c15fe4fe70c', 'selfmin', 'DvzN2Zb22qH6yis9Iwzq9A==', '9e2e7fd590ab9e2804e9c7e0a904a39b', '4ac4ad4eb43d41249823fc2007ce839d', null, 'Mr.w', '', 'skin-0', '1', '2018-01-04 09:54:38', '2018-01-13 10:58:44', '567T24', null, '1');
INSERT INTO `jy_base_account` VALUES ('c252a39a22cd4fe9992460ef507854b7', 'liulong2', 'AOqsot/pVgKDTS2lADrRQg==', '73d11aa7705698ec7c5b5e30309e432c', 'c3e444b71e744a94b76c79e429f61631', null, '刘建', null, 'skin-0', '1', '2018-01-29 09:11:32', null, null, '13146763148', null);
INSERT INTO `jy_base_account` VALUES ('c6916a0ba5a24bd29e4c6528cde6a531', 'wxfcyr', 'LVgtzLjmU/vxvZNmAP0sAQ==', 'd6adf482dc289990798ca7d5bc8629b3', '5b8661cb83114d28b2c733f70dc98f4e', null, null, null, 'skin-0', '1', '2018-03-21 10:36:20', null, null, '18632871252', null);
INSERT INTO `jy_base_account` VALUES ('cd7e05d8afca4af09aa43d495f9a6f4c', 'ordinary', 'uXzcjzH9YI8gzhwG4DnFxw==', 'd8c416bb7dc1a9567f799a7fc5163326', '4', null, 'Mr.w', '', 'skin-0', '1', '2017-12-29 10:46:37', '2018-01-21 08:48:36', '7AB4Xb', null, '1');

-- ----------------------------
-- Table structure for jy_base_account_position
-- ----------------------------
DROP TABLE IF EXISTS `jy_base_account_position`;
CREATE TABLE `jy_base_account_position` (
  `accountId` varchar(32) NOT NULL,
  `posId` varchar(32) NOT NULL,
  PRIMARY KEY (`accountId`,`posId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jy_base_account_position
-- ----------------------------
INSERT INTO `jy_base_account_position` VALUES ('097756af9fb440d795ec9c300b3d56f1', 'c63d54663fcc4e27a10e1e6f17772df8');
INSERT INTO `jy_base_account_position` VALUES ('1', 'c63d54663fcc4e27a10e1e6f17772df8');
INSERT INTO `jy_base_account_position` VALUES ('1', 'f6db550f89824d6bb0009fc04af3f25b');
INSERT INTO `jy_base_account_position` VALUES ('2', 'c63d54663fcc4e27a10e1e6f17772df8');
INSERT INTO `jy_base_account_position` VALUES ('2', 'f6db550f89824d6bb0009fc04af3f25b');
INSERT INTO `jy_base_account_position` VALUES ('628c5aeb288742888d3df93581d45414', 'b2da690b91b64408aba7fb820b1bf9cf');

-- ----------------------------
-- Table structure for jy_base_login_log
-- ----------------------------
DROP TABLE IF EXISTS `jy_base_login_log`;
CREATE TABLE `jy_base_login_log` (
  `id` varchar(32) DEFAULT NULL,
  `accountId` varchar(32) DEFAULT NULL,
  `loginTime` datetime DEFAULT NULL,
  `loginIP` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jy_base_login_log
-- ----------------------------
INSERT INTO `jy_base_login_log` VALUES ('82280177b51e4512b1943d659e1aaca8', '2', '2017-11-22 21:15:55', '0:0:0:0:0:0:0:1');
INSERT INTO `jy_base_login_log` VALUES ('46cd55ca2acb4f4398d4ec67f6db630c', '2', '2017-11-22 22:03:36', '0:0:0:0:0:0:0:1');
INSERT INTO `jy_base_login_log` VALUES ('1ecf4a1ad70c4d08977b5361c592417b', '1', '2017-11-22 22:04:55', '0:0:0:0:0:0:0:1');
INSERT INTO `jy_base_login_log` VALUES ('4eb36c3b0aef42658f40098c275987ed', '2', '2017-11-23 08:11:24', '0:0:0:0:0:0:0:1');
INSERT INTO `jy_base_login_log` VALUES ('280ac988e9964ae684eaa796ac228fbd', '2', '2017-11-23 20:45:32', '0:0:0:0:0:0:0:1');
INSERT INTO `jy_base_login_log` VALUES ('40d1d81375194fbe961a334a48c6da74', '2', '2017-11-23 20:46:27', '0:0:0:0:0:0:0:1');
INSERT INTO `jy_base_login_log` VALUES ('db6eef57912f4403a7b491142f38ce63', '2', '2017-11-23 21:45:10', '0:0:0:0:0:0:0:1');
INSERT INTO `jy_base_login_log` VALUES ('93dc8c9c8c034053b6e8ddfcb91b3a6d', '2', '2017-11-26 14:10:05', '0:0:0:0:0:0:0:1');
INSERT INTO `jy_base_login_log` VALUES ('fa1d18419749473789410fb0d808428b', '2', '2017-11-28 10:33:10', '0:0:0:0:0:0:0:1');
INSERT INTO `jy_base_login_log` VALUES ('a2d6009ed6114292a6007b0d7176805b', '2', '2017-12-01 17:08:39', '0:0:0:0:0:0:0:1');
INSERT INTO `jy_base_login_log` VALUES ('3a879310bf8d4c98a10a048bcedbc8f4', '2', '2017-12-05 22:04:41', '0:0:0:0:0:0:0:1');
INSERT INTO `jy_base_login_log` VALUES ('868f3cfc628949168d08217d1c66be7c', '2', '2017-12-06 14:31:47', '0:0:0:0:0:0:0:1');
INSERT INTO `jy_base_login_log` VALUES ('9e739de07b8542349969d7d1663521f1', '2', '2017-12-15 15:49:08', '0:0:0:0:0:0:0:1');
INSERT INTO `jy_base_login_log` VALUES ('ed1a69aaf81a4950b8023823da6b17c6', '2', '2017-12-18 21:37:09', '0:0:0:0:0:0:0:1');
INSERT INTO `jy_base_login_log` VALUES ('a59b9e6679aa47558bdbd072ffa13ba5', '2', '2017-12-20 10:41:16', '0:0:0:0:0:0:0:1');
INSERT INTO `jy_base_login_log` VALUES ('b04ab2bdfe304b288ce4e199f14bab58', '2', '2017-12-20 10:44:21', '192.168.1.2');
INSERT INTO `jy_base_login_log` VALUES ('efaedf491ca94f198bd25507ad7f6f7f', '2', '2017-12-20 10:46:19', '192.168.1.2');
INSERT INTO `jy_base_login_log` VALUES ('12d8ea9b7ab94614ba47069f24a8eef3', '2', '2017-12-20 10:49:46', '192.168.1.8');
INSERT INTO `jy_base_login_log` VALUES ('6a396f49162c4e1ca7a27a774ac6140c', '2', '2017-12-20 11:11:36', '0:0:0:0:0:0:0:1');
INSERT INTO `jy_base_login_log` VALUES ('99a74a45acb24496b7d961916aa5ff3b', '2', '2017-12-20 12:40:34', '0:0:0:0:0:0:0:1');
INSERT INTO `jy_base_login_log` VALUES ('9d343fc8a48d47cab11ffa12da671769', '2', '2017-12-20 15:44:13', '0:0:0:0:0:0:0:1');
INSERT INTO `jy_base_login_log` VALUES ('1e5c84c67c9f4702a0db763bda78ff5c', '2', '2017-12-22 08:39:54', '0:0:0:0:0:0:0:1');
INSERT INTO `jy_base_login_log` VALUES ('ab759070da314b8b8fd04c6015c31598', '2', '2017-12-26 22:50:34', '0:0:0:0:0:0:0:1');
INSERT INTO `jy_base_login_log` VALUES ('18020a2f52cf449f92c0b6792fac49b1', '2', '2017-12-26 23:21:32', '0:0:0:0:0:0:0:1');
INSERT INTO `jy_base_login_log` VALUES ('cc9cb81d2123464aacb524392dc6b928', '2', '2017-12-26 23:22:56', '0:0:0:0:0:0:0:1');
INSERT INTO `jy_base_login_log` VALUES ('ddeb4953eb0543ae978fb897257b8fbe', '2', '2017-12-26 23:31:56', '0:0:0:0:0:0:0:1');

-- ----------------------------
-- Table structure for jy_base_org
-- ----------------------------
DROP TABLE IF EXISTS `jy_base_org`;
CREATE TABLE `jy_base_org` (
  `id` varchar(32) NOT NULL,
  `pId` varchar(32) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `isValid` int(2) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jy_base_org
-- ----------------------------
INSERT INTO `jy_base_org` VALUES ('1', '0', '沃享技术', '1', null, '2015-12-09 23:01:36', null);
INSERT INTO `jy_base_org` VALUES ('10', '0', '衡东物流', '1', '', '2015-12-09 23:22:29', '2015-12-10 14:44:48');
INSERT INTO `jy_base_org` VALUES ('2', '1', '设计部', '1', null, '2015-12-09 23:22:09', null);
INSERT INTO `jy_base_org` VALUES ('3', '1', '商务部', '1', null, '2015-12-09 23:26:36', null);
INSERT INTO `jy_base_org` VALUES ('4', '1', '开发部', '1', null, '2015-12-09 23:20:59', null);
INSERT INTO `jy_base_org` VALUES ('8f080b6180564157aa173cc26e44d1dd', '1', '人事部', '1', '', '2016-02-27 19:09:49', null);
INSERT INTO `jy_base_org` VALUES ('f1a2bc7677ff4e86b1d07dbdbcacab4c', '0', '公共信息平台', '1', '', '2017-12-27 10:14:01', null);

-- ----------------------------
-- Table structure for jy_base_org_resources
-- ----------------------------
DROP TABLE IF EXISTS `jy_base_org_resources`;
CREATE TABLE `jy_base_org_resources` (
  `org_Id` varchar(32) DEFAULT NULL,
  `resources_id` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jy_base_org_resources
-- ----------------------------
INSERT INTO `jy_base_org_resources` VALUES ('10', '1');
INSERT INTO `jy_base_org_resources` VALUES ('10', '2');
INSERT INTO `jy_base_org_resources` VALUES ('10', 'ae8fea67b8434987b718c51fe83bb45d');
INSERT INTO `jy_base_org_resources` VALUES ('10', '1e2cd5e710224cf0ba09bbe5d4ee0009');
INSERT INTO `jy_base_org_resources` VALUES ('10', 'fa04b6fe03944f2a9c040dbc9071af9b');
INSERT INTO `jy_base_org_resources` VALUES ('10', '83984d22f9da4991833f506695307b6f');
INSERT INTO `jy_base_org_resources` VALUES ('10', '89ff6bdf54ca4501a264adba8eb0ee39');
INSERT INTO `jy_base_org_resources` VALUES ('10', '15a7d1cec70c47bdbfd41c7f9c694481');
INSERT INTO `jy_base_org_resources` VALUES ('10', '3');
INSERT INTO `jy_base_org_resources` VALUES ('10', '4c97ca25b7e940948b3d403c3b091c81');
INSERT INTO `jy_base_org_resources` VALUES ('10', 'd22f22f0bc9a4ad2a6464cca6497a7b4');
INSERT INTO `jy_base_org_resources` VALUES ('10', '51aa6b0b037340b9ae88d22d2a354acf');
INSERT INTO `jy_base_org_resources` VALUES ('10', '4ee50d1722a34edeb6c15bdbf29e556b');
INSERT INTO `jy_base_org_resources` VALUES ('10', '42a2938acb5e4a26b5ec2cc6089b7c2e');
INSERT INTO `jy_base_org_resources` VALUES ('10', '5ba75d14f5b74572bd5ff35d12c58060');
INSERT INTO `jy_base_org_resources` VALUES ('10', '4');
INSERT INTO `jy_base_org_resources` VALUES ('10', '41');
INSERT INTO `jy_base_org_resources` VALUES ('10', '161848b9e16e410e9d3fac6f9c91cad5');
INSERT INTO `jy_base_org_resources` VALUES ('10', '28d4a82889c341bdaceab323b9549245');
INSERT INTO `jy_base_org_resources` VALUES ('10', '3f184c74379c4b668030ba9e55c9caa3');
INSERT INTO `jy_base_org_resources` VALUES ('10', '6d44f1553c424e5c81bd3ed9a4e162f3');
INSERT INTO `jy_base_org_resources` VALUES ('10', '08693c30017e4e45acff89d300067269');
INSERT INTO `jy_base_org_resources` VALUES ('10', '79a76d451f3948f4963b97b6d5bbbf3c');
INSERT INTO `jy_base_org_resources` VALUES ('10', '13');
INSERT INTO `jy_base_org_resources` VALUES ('10', '10');
INSERT INTO `jy_base_org_resources` VALUES ('10', '9575841c8b6a4c58b10e97d82320fd02');
INSERT INTO `jy_base_org_resources` VALUES ('10', 'dde1c043e77d48b4ac2f15806a0aec14');
INSERT INTO `jy_base_org_resources` VALUES ('10', 'cd7ef89bf12f4ceb98861cf2bcbc96b1');
INSERT INTO `jy_base_org_resources` VALUES ('10', '78b1bf1c0723433099c458e75a8c6901');
INSERT INTO `jy_base_org_resources` VALUES ('10', '75288771d60d4510affe8cb97f42897f');
INSERT INTO `jy_base_org_resources` VALUES ('10', '14');
INSERT INTO `jy_base_org_resources` VALUES ('10', '34507436438c4c7eb9803fa160c2af3c');
INSERT INTO `jy_base_org_resources` VALUES ('10', 'dbb1d5db4d7b419db1d221b102a7ad51');
INSERT INTO `jy_base_org_resources` VALUES ('10', 'e9480dd6590a4e14a443ee8f76873fd3');
INSERT INTO `jy_base_org_resources` VALUES ('10', '6ea62cf0820248a6a2780a885b82a99d');
INSERT INTO `jy_base_org_resources` VALUES ('10', '21feb456e503484280232730687149f2');
INSERT INTO `jy_base_org_resources` VALUES ('11', '1');
INSERT INTO `jy_base_org_resources` VALUES ('11', '2');
INSERT INTO `jy_base_org_resources` VALUES ('11', 'ae8fea67b8434987b718c51fe83bb45d');
INSERT INTO `jy_base_org_resources` VALUES ('11', '1e2cd5e710224cf0ba09bbe5d4ee0009');
INSERT INTO `jy_base_org_resources` VALUES ('11', 'fa04b6fe03944f2a9c040dbc9071af9b');
INSERT INTO `jy_base_org_resources` VALUES ('11', '83984d22f9da4991833f506695307b6f');
INSERT INTO `jy_base_org_resources` VALUES ('11', '89ff6bdf54ca4501a264adba8eb0ee39');
INSERT INTO `jy_base_org_resources` VALUES ('11', '15a7d1cec70c47bdbfd41c7f9c694481');
INSERT INTO `jy_base_org_resources` VALUES ('11', '3');
INSERT INTO `jy_base_org_resources` VALUES ('11', '4c97ca25b7e940948b3d403c3b091c81');
INSERT INTO `jy_base_org_resources` VALUES ('11', 'd22f22f0bc9a4ad2a6464cca6497a7b4');
INSERT INTO `jy_base_org_resources` VALUES ('11', '51aa6b0b037340b9ae88d22d2a354acf');
INSERT INTO `jy_base_org_resources` VALUES ('11', '4ee50d1722a34edeb6c15bdbf29e556b');
INSERT INTO `jy_base_org_resources` VALUES ('11', '42a2938acb5e4a26b5ec2cc6089b7c2e');
INSERT INTO `jy_base_org_resources` VALUES ('11', '5ba75d14f5b74572bd5ff35d12c58060');
INSERT INTO `jy_base_org_resources` VALUES ('11', '4');
INSERT INTO `jy_base_org_resources` VALUES ('11', '41');
INSERT INTO `jy_base_org_resources` VALUES ('11', '161848b9e16e410e9d3fac6f9c91cad5');
INSERT INTO `jy_base_org_resources` VALUES ('11', '28d4a82889c341bdaceab323b9549245');
INSERT INTO `jy_base_org_resources` VALUES ('11', '3f184c74379c4b668030ba9e55c9caa3');
INSERT INTO `jy_base_org_resources` VALUES ('11', '6d44f1553c424e5c81bd3ed9a4e162f3');
INSERT INTO `jy_base_org_resources` VALUES ('11', '08693c30017e4e45acff89d300067269');
INSERT INTO `jy_base_org_resources` VALUES ('11', '79a76d451f3948f4963b97b6d5bbbf3c');
INSERT INTO `jy_base_org_resources` VALUES ('2', '08693c30017e4e45acff89d300067269');
INSERT INTO `jy_base_org_resources` VALUES ('2', '79a76d451f3948f4963b97b6d5bbbf3c');
INSERT INTO `jy_base_org_resources` VALUES ('2', '25a4bc9c184a4d6c904ce7a3ccb26aae');
INSERT INTO `jy_base_org_resources` VALUES ('2', 'b7d11fca02b04742814eb664454d7473');
INSERT INTO `jy_base_org_resources` VALUES ('2', '51424721ec1c4574b2f2a7bc1833c17f');
INSERT INTO `jy_base_org_resources` VALUES ('2', '7b30d8d43df347ada558df820bbec28b');
INSERT INTO `jy_base_org_resources` VALUES ('2', '5d1b45e9b6a84bccb212758ce8f2e906');
INSERT INTO `jy_base_org_resources` VALUES ('2', '273e05eb764f48c18f832520e7ce141e');
INSERT INTO `jy_base_org_resources` VALUES ('2', '0576a0a5825a4c1eafb0fb88369e77f6');
INSERT INTO `jy_base_org_resources` VALUES ('2', '40a146e3febf4cafb930a077f1f048d3');
INSERT INTO `jy_base_org_resources` VALUES ('1', '5');
INSERT INTO `jy_base_org_resources` VALUES ('1', '12');
INSERT INTO `jy_base_org_resources` VALUES ('1', '7c1741c605c148c29113ac804f68f52b');
INSERT INTO `jy_base_org_resources` VALUES ('1', '343914e32c3b458ba797c080b0dfbf85');
INSERT INTO `jy_base_org_resources` VALUES ('4', '58230413e8364b67af2bb65e64252260');
INSERT INTO `jy_base_org_resources` VALUES ('4', 'b776518dfdd940e394a15de3974a8610');
INSERT INTO `jy_base_org_resources` VALUES ('4', '52910f91bf3e4b71af4ded1ef67bba48');
INSERT INTO `jy_base_org_resources` VALUES ('4', '18756082926f41329e51d74dda3abc80');
INSERT INTO `jy_base_org_resources` VALUES ('4', 'a201aa381c3447aeaae23bdb478b3a06');
INSERT INTO `jy_base_org_resources` VALUES ('4', 'b8203143736e4e549b2e0fc3c617d4c4');
INSERT INTO `jy_base_org_resources` VALUES ('4', '55e7a2d527564d9790b9f00a00d34634');
INSERT INTO `jy_base_org_resources` VALUES ('4', '17325e24f35348fd9a287152e3ea8b75');
INSERT INTO `jy_base_org_resources` VALUES ('4', '7537535a8b5d44009f52a3e84ca5dfd8');
INSERT INTO `jy_base_org_resources` VALUES ('4', 'c9c822f6c7b94650a6f3944c53738caf');
INSERT INTO `jy_base_org_resources` VALUES ('4', '47ff0c409f314b07b52ba13f1bb81586');
INSERT INTO `jy_base_org_resources` VALUES ('4', '72cbdeff2aea4aea8f348bb6d779a87d');
INSERT INTO `jy_base_org_resources` VALUES ('4', '08693c30017e4e45acff89d300067269');
INSERT INTO `jy_base_org_resources` VALUES ('4', '79a76d451f3948f4963b97b6d5bbbf3c');
INSERT INTO `jy_base_org_resources` VALUES ('4', '25a4bc9c184a4d6c904ce7a3ccb26aae');
INSERT INTO `jy_base_org_resources` VALUES ('4', 'b7d11fca02b04742814eb664454d7473');
INSERT INTO `jy_base_org_resources` VALUES ('4', '82652011fe8549d18d4652567f7b1610');
INSERT INTO `jy_base_org_resources` VALUES ('4', 'bf888841c15e4da5858299ef99376eb4');
INSERT INTO `jy_base_org_resources` VALUES ('4', 'a1b4ef2728d9456aa4e9a85d68c6029e');
INSERT INTO `jy_base_org_resources` VALUES ('4', '747a8ddc90b844c3a12dbe920e777052');
INSERT INTO `jy_base_org_resources` VALUES ('4', 'b78f7224d001404c92479532c614dffa');
INSERT INTO `jy_base_org_resources` VALUES ('4', 'a2eea33defc64462b3b3df9e64c461fb');
INSERT INTO `jy_base_org_resources` VALUES ('4', '1e87cc3913914c8aa80116270ed03a75');
INSERT INTO `jy_base_org_resources` VALUES ('4', '9bd48a7e0ca74b77b577411c8e4b7c2b');
INSERT INTO `jy_base_org_resources` VALUES ('4', '55053558dc4f4ab0983337386969aced');
INSERT INTO `jy_base_org_resources` VALUES ('4', 'ef3a950b6154459589acc7dd7145e0ed');
INSERT INTO `jy_base_org_resources` VALUES ('4', 'de998a250fcb4c2ab88981f2093d54f3');
INSERT INTO `jy_base_org_resources` VALUES ('4', 'a213cc3a8be64a77b9d8673619230a87');
INSERT INTO `jy_base_org_resources` VALUES ('4', 'c669fba98a9446999b62d15bfff1c412');
INSERT INTO `jy_base_org_resources` VALUES ('4', '7579afb168b04a3d99fff9dbe956936e');
INSERT INTO `jy_base_org_resources` VALUES ('4', '7d6a6b7594b14807a3def610f6595804');
INSERT INTO `jy_base_org_resources` VALUES ('4', '9ba1dbda9e414eff8591cda4aea34c32');
INSERT INTO `jy_base_org_resources` VALUES ('4', '51424721ec1c4574b2f2a7bc1833c17f');
INSERT INTO `jy_base_org_resources` VALUES ('4', '7b30d8d43df347ada558df820bbec28b');
INSERT INTO `jy_base_org_resources` VALUES ('4', '5d1b45e9b6a84bccb212758ce8f2e906');
INSERT INTO `jy_base_org_resources` VALUES ('4', '273e05eb764f48c18f832520e7ce141e');
INSERT INTO `jy_base_org_resources` VALUES ('4', '0576a0a5825a4c1eafb0fb88369e77f6');
INSERT INTO `jy_base_org_resources` VALUES ('4', '40a146e3febf4cafb930a077f1f048d3');
INSERT INTO `jy_base_org_resources` VALUES ('1', '58230413e8364b67af2bb65e64252260');
INSERT INTO `jy_base_org_resources` VALUES ('1', 'b776518dfdd940e394a15de3974a8610');
INSERT INTO `jy_base_org_resources` VALUES ('1', '52910f91bf3e4b71af4ded1ef67bba48');
INSERT INTO `jy_base_org_resources` VALUES ('1', '18756082926f41329e51d74dda3abc80');
INSERT INTO `jy_base_org_resources` VALUES ('1', 'a201aa381c3447aeaae23bdb478b3a06');
INSERT INTO `jy_base_org_resources` VALUES ('1', 'b8203143736e4e549b2e0fc3c617d4c4');
INSERT INTO `jy_base_org_resources` VALUES ('1', '55e7a2d527564d9790b9f00a00d34634');
INSERT INTO `jy_base_org_resources` VALUES ('1', '17325e24f35348fd9a287152e3ea8b75');
INSERT INTO `jy_base_org_resources` VALUES ('1', '7537535a8b5d44009f52a3e84ca5dfd8');
INSERT INTO `jy_base_org_resources` VALUES ('1', 'c9c822f6c7b94650a6f3944c53738caf');
INSERT INTO `jy_base_org_resources` VALUES ('1', '47ff0c409f314b07b52ba13f1bb81586');
INSERT INTO `jy_base_org_resources` VALUES ('1', '72cbdeff2aea4aea8f348bb6d779a87d');
INSERT INTO `jy_base_org_resources` VALUES ('1', '08693c30017e4e45acff89d300067269');
INSERT INTO `jy_base_org_resources` VALUES ('1', '79a76d451f3948f4963b97b6d5bbbf3c');
INSERT INTO `jy_base_org_resources` VALUES ('1', '25a4bc9c184a4d6c904ce7a3ccb26aae');
INSERT INTO `jy_base_org_resources` VALUES ('1', 'b7d11fca02b04742814eb664454d7473');
INSERT INTO `jy_base_org_resources` VALUES ('1', '82652011fe8549d18d4652567f7b1610');
INSERT INTO `jy_base_org_resources` VALUES ('1', 'bf888841c15e4da5858299ef99376eb4');
INSERT INTO `jy_base_org_resources` VALUES ('1', 'a1b4ef2728d9456aa4e9a85d68c6029e');
INSERT INTO `jy_base_org_resources` VALUES ('1', '747a8ddc90b844c3a12dbe920e777052');
INSERT INTO `jy_base_org_resources` VALUES ('1', 'b78f7224d001404c92479532c614dffa');
INSERT INTO `jy_base_org_resources` VALUES ('1', 'a2eea33defc64462b3b3df9e64c461fb');
INSERT INTO `jy_base_org_resources` VALUES ('1', '1e87cc3913914c8aa80116270ed03a75');
INSERT INTO `jy_base_org_resources` VALUES ('1', '9bd48a7e0ca74b77b577411c8e4b7c2b');
INSERT INTO `jy_base_org_resources` VALUES ('1', '55053558dc4f4ab0983337386969aced');
INSERT INTO `jy_base_org_resources` VALUES ('1', 'ef3a950b6154459589acc7dd7145e0ed');
INSERT INTO `jy_base_org_resources` VALUES ('1', 'de998a250fcb4c2ab88981f2093d54f3');
INSERT INTO `jy_base_org_resources` VALUES ('1', 'a213cc3a8be64a77b9d8673619230a87');
INSERT INTO `jy_base_org_resources` VALUES ('1', 'c669fba98a9446999b62d15bfff1c412');
INSERT INTO `jy_base_org_resources` VALUES ('1', '7579afb168b04a3d99fff9dbe956936e');
INSERT INTO `jy_base_org_resources` VALUES ('1', '7d6a6b7594b14807a3def610f6595804');
INSERT INTO `jy_base_org_resources` VALUES ('1', '9ba1dbda9e414eff8591cda4aea34c32');
INSERT INTO `jy_base_org_resources` VALUES ('1', '51424721ec1c4574b2f2a7bc1833c17f');
INSERT INTO `jy_base_org_resources` VALUES ('1', '7b30d8d43df347ada558df820bbec28b');
INSERT INTO `jy_base_org_resources` VALUES ('1', '5d1b45e9b6a84bccb212758ce8f2e906');
INSERT INTO `jy_base_org_resources` VALUES ('1', '273e05eb764f48c18f832520e7ce141e');
INSERT INTO `jy_base_org_resources` VALUES ('1', '0576a0a5825a4c1eafb0fb88369e77f6');
INSERT INTO `jy_base_org_resources` VALUES ('1', '40a146e3febf4cafb930a077f1f048d3');
INSERT INTO `jy_base_org_resources` VALUES ('4', '5');
INSERT INTO `jy_base_org_resources` VALUES ('4', '12');
INSERT INTO `jy_base_org_resources` VALUES ('4', '7c1741c605c148c29113ac804f68f52b');
INSERT INTO `jy_base_org_resources` VALUES ('4', '343914e32c3b458ba797c080b0dfbf85');
INSERT INTO `jy_base_org_resources` VALUES ('1', 'e750134d22094ef3a611fe8300c351e9');
INSERT INTO `jy_base_org_resources` VALUES ('1', 'a103f06e9c7f4e8aafc5eaf4c735fd91');
INSERT INTO `jy_base_org_resources` VALUES ('1', 'dc4a83f740f54f6b89916321968cbcd3');
INSERT INTO `jy_base_org_resources` VALUES ('1', '9bc994928cc64fdca432fcad2a0b3ba9');
INSERT INTO `jy_base_org_resources` VALUES ('1', '1d906f69a7274cbd8b316903e66fc580');
INSERT INTO `jy_base_org_resources` VALUES ('1', '9cff3045dd824773a70c5a887a2f71ef');
INSERT INTO `jy_base_org_resources` VALUES ('1', 'f541a86e629d4eefb014309c921a237e');
INSERT INTO `jy_base_org_resources` VALUES ('1', 'e49f8b358da2404293f6ac4e7f7a7a30');
INSERT INTO `jy_base_org_resources` VALUES ('1', '6');
INSERT INTO `jy_base_org_resources` VALUES ('1', '102');
INSERT INTO `jy_base_org_resources` VALUES ('1', '4f057f1a6d05416fbb06206b2aaffb10');
INSERT INTO `jy_base_org_resources` VALUES ('1', '103');
INSERT INTO `jy_base_org_resources` VALUES ('1', '100');
INSERT INTO `jy_base_org_resources` VALUES ('1', '101');
INSERT INTO `jy_base_org_resources` VALUES ('1', '1bc2c9d3d8e644f1a25ce8321f2faf13');
INSERT INTO `jy_base_org_resources` VALUES ('1', '31b0fe86acea4fceb184aecfe521ff0d');
INSERT INTO `jy_base_org_resources` VALUES ('1', '0f5747e8beb24a15899cfd0c0f4c42c0');
INSERT INTO `jy_base_org_resources` VALUES ('1', '9727f259cd8542fc8756b7b9cee9dd54');
INSERT INTO `jy_base_org_resources` VALUES ('1', '404');
INSERT INTO `jy_base_org_resources` VALUES ('1', '332072af224d42a4b2f340f30355b1e1');
INSERT INTO `jy_base_org_resources` VALUES ('4', 'e750134d22094ef3a611fe8300c351e9');
INSERT INTO `jy_base_org_resources` VALUES ('4', 'a103f06e9c7f4e8aafc5eaf4c735fd91');
INSERT INTO `jy_base_org_resources` VALUES ('4', 'dc4a83f740f54f6b89916321968cbcd3');
INSERT INTO `jy_base_org_resources` VALUES ('4', '9bc994928cc64fdca432fcad2a0b3ba9');
INSERT INTO `jy_base_org_resources` VALUES ('4', '1d906f69a7274cbd8b316903e66fc580');
INSERT INTO `jy_base_org_resources` VALUES ('4', '9cff3045dd824773a70c5a887a2f71ef');
INSERT INTO `jy_base_org_resources` VALUES ('4', 'f541a86e629d4eefb014309c921a237e');
INSERT INTO `jy_base_org_resources` VALUES ('4', 'e49f8b358da2404293f6ac4e7f7a7a30');
INSERT INTO `jy_base_org_resources` VALUES ('4', '6');
INSERT INTO `jy_base_org_resources` VALUES ('4', '102');
INSERT INTO `jy_base_org_resources` VALUES ('4', '4f057f1a6d05416fbb06206b2aaffb10');
INSERT INTO `jy_base_org_resources` VALUES ('4', '103');
INSERT INTO `jy_base_org_resources` VALUES ('4', '100');
INSERT INTO `jy_base_org_resources` VALUES ('4', '101');
INSERT INTO `jy_base_org_resources` VALUES ('4', '1bc2c9d3d8e644f1a25ce8321f2faf13');
INSERT INTO `jy_base_org_resources` VALUES ('4', '31b0fe86acea4fceb184aecfe521ff0d');
INSERT INTO `jy_base_org_resources` VALUES ('4', '0f5747e8beb24a15899cfd0c0f4c42c0');
INSERT INTO `jy_base_org_resources` VALUES ('4', '9727f259cd8542fc8756b7b9cee9dd54');
INSERT INTO `jy_base_org_resources` VALUES ('4', '404');
INSERT INTO `jy_base_org_resources` VALUES ('4', '332072af224d42a4b2f340f30355b1e1');
INSERT INTO `jy_base_org_resources` VALUES ('8f080b6180564157aa173cc26e44d1dd', '58230413e8364b67af2bb65e64252260');
INSERT INTO `jy_base_org_resources` VALUES ('8f080b6180564157aa173cc26e44d1dd', 'b776518dfdd940e394a15de3974a8610');
INSERT INTO `jy_base_org_resources` VALUES ('8f080b6180564157aa173cc26e44d1dd', '52910f91bf3e4b71af4ded1ef67bba48');
INSERT INTO `jy_base_org_resources` VALUES ('8f080b6180564157aa173cc26e44d1dd', '18756082926f41329e51d74dda3abc80');
INSERT INTO `jy_base_org_resources` VALUES ('8f080b6180564157aa173cc26e44d1dd', 'a201aa381c3447aeaae23bdb478b3a06');
INSERT INTO `jy_base_org_resources` VALUES ('8f080b6180564157aa173cc26e44d1dd', 'b8203143736e4e549b2e0fc3c617d4c4');
INSERT INTO `jy_base_org_resources` VALUES ('8f080b6180564157aa173cc26e44d1dd', '55e7a2d527564d9790b9f00a00d34634');
INSERT INTO `jy_base_org_resources` VALUES ('8f080b6180564157aa173cc26e44d1dd', '17325e24f35348fd9a287152e3ea8b75');
INSERT INTO `jy_base_org_resources` VALUES ('8f080b6180564157aa173cc26e44d1dd', '7537535a8b5d44009f52a3e84ca5dfd8');
INSERT INTO `jy_base_org_resources` VALUES ('8f080b6180564157aa173cc26e44d1dd', 'c9c822f6c7b94650a6f3944c53738caf');
INSERT INTO `jy_base_org_resources` VALUES ('8f080b6180564157aa173cc26e44d1dd', '47ff0c409f314b07b52ba13f1bb81586');
INSERT INTO `jy_base_org_resources` VALUES ('8f080b6180564157aa173cc26e44d1dd', '72cbdeff2aea4aea8f348bb6d779a87d');
INSERT INTO `jy_base_org_resources` VALUES ('8f080b6180564157aa173cc26e44d1dd', 'e750134d22094ef3a611fe8300c351e9');
INSERT INTO `jy_base_org_resources` VALUES ('8f080b6180564157aa173cc26e44d1dd', 'a103f06e9c7f4e8aafc5eaf4c735fd91');
INSERT INTO `jy_base_org_resources` VALUES ('8f080b6180564157aa173cc26e44d1dd', 'dc4a83f740f54f6b89916321968cbcd3');
INSERT INTO `jy_base_org_resources` VALUES ('8f080b6180564157aa173cc26e44d1dd', '9bc994928cc64fdca432fcad2a0b3ba9');
INSERT INTO `jy_base_org_resources` VALUES ('8f080b6180564157aa173cc26e44d1dd', '1d906f69a7274cbd8b316903e66fc580');
INSERT INTO `jy_base_org_resources` VALUES ('8f080b6180564157aa173cc26e44d1dd', '9cff3045dd824773a70c5a887a2f71ef');
INSERT INTO `jy_base_org_resources` VALUES ('8f080b6180564157aa173cc26e44d1dd', 'f541a86e629d4eefb014309c921a237e');
INSERT INTO `jy_base_org_resources` VALUES ('8f080b6180564157aa173cc26e44d1dd', 'e49f8b358da2404293f6ac4e7f7a7a30');
INSERT INTO `jy_base_org_resources` VALUES ('8f080b6180564157aa173cc26e44d1dd', '11');
INSERT INTO `jy_base_org_resources` VALUES ('8f080b6180564157aa173cc26e44d1dd', '1');
INSERT INTO `jy_base_org_resources` VALUES ('8f080b6180564157aa173cc26e44d1dd', '2');
INSERT INTO `jy_base_org_resources` VALUES ('8f080b6180564157aa173cc26e44d1dd', 'ae8fea67b8434987b718c51fe83bb45d');
INSERT INTO `jy_base_org_resources` VALUES ('8f080b6180564157aa173cc26e44d1dd', '1e2cd5e710224cf0ba09bbe5d4ee0009');
INSERT INTO `jy_base_org_resources` VALUES ('8f080b6180564157aa173cc26e44d1dd', 'fa04b6fe03944f2a9c040dbc9071af9b');
INSERT INTO `jy_base_org_resources` VALUES ('8f080b6180564157aa173cc26e44d1dd', '83984d22f9da4991833f506695307b6f');
INSERT INTO `jy_base_org_resources` VALUES ('8f080b6180564157aa173cc26e44d1dd', '89ff6bdf54ca4501a264adba8eb0ee39');
INSERT INTO `jy_base_org_resources` VALUES ('8f080b6180564157aa173cc26e44d1dd', '15a7d1cec70c47bdbfd41c7f9c694481');
INSERT INTO `jy_base_org_resources` VALUES ('8f080b6180564157aa173cc26e44d1dd', '3');
INSERT INTO `jy_base_org_resources` VALUES ('8f080b6180564157aa173cc26e44d1dd', '4c97ca25b7e940948b3d403c3b091c81');
INSERT INTO `jy_base_org_resources` VALUES ('8f080b6180564157aa173cc26e44d1dd', 'd22f22f0bc9a4ad2a6464cca6497a7b4');
INSERT INTO `jy_base_org_resources` VALUES ('8f080b6180564157aa173cc26e44d1dd', '51aa6b0b037340b9ae88d22d2a354acf');
INSERT INTO `jy_base_org_resources` VALUES ('8f080b6180564157aa173cc26e44d1dd', '4ee50d1722a34edeb6c15bdbf29e556b');
INSERT INTO `jy_base_org_resources` VALUES ('8f080b6180564157aa173cc26e44d1dd', '42a2938acb5e4a26b5ec2cc6089b7c2e');
INSERT INTO `jy_base_org_resources` VALUES ('8f080b6180564157aa173cc26e44d1dd', '5ba75d14f5b74572bd5ff35d12c58060');
INSERT INTO `jy_base_org_resources` VALUES ('8f080b6180564157aa173cc26e44d1dd', 'c73d630ab1004b5a9b71836e8b000de9');
INSERT INTO `jy_base_org_resources` VALUES ('1', '9037c1737a904fc3bf18e0ef7a6b6e05');
INSERT INTO `jy_base_org_resources` VALUES ('4', '9037c1737a904fc3bf18e0ef7a6b6e05');
INSERT INTO `jy_base_org_resources` VALUES ('1', '8cc0bcbb9bae4ebe81d263de37ef15a6');
INSERT INTO `jy_base_org_resources` VALUES ('4', '8cc0bcbb9bae4ebe81d263de37ef15a6');
INSERT INTO `jy_base_org_resources` VALUES ('1', '4021171e506b47c083c77a2b96660031');
INSERT INTO `jy_base_org_resources` VALUES ('4', '4021171e506b47c083c77a2b96660031');
INSERT INTO `jy_base_org_resources` VALUES ('1', 'b1ba61f394cd499c9304e995f881a764');
INSERT INTO `jy_base_org_resources` VALUES ('4', 'b1ba61f394cd499c9304e995f881a764');
INSERT INTO `jy_base_org_resources` VALUES ('1', '13baa4cc73184b9b800cd46b22121e3b');
INSERT INTO `jy_base_org_resources` VALUES ('4', '13baa4cc73184b9b800cd46b22121e3b');
INSERT INTO `jy_base_org_resources` VALUES ('1', '85e2c80eb4f3430881c20f556b7fdbb5');
INSERT INTO `jy_base_org_resources` VALUES ('4', '85e2c80eb4f3430881c20f556b7fdbb5');
INSERT INTO `jy_base_org_resources` VALUES ('1', '1add9a6057c94ac1842aacbcb64b4be1');
INSERT INTO `jy_base_org_resources` VALUES ('4', '1add9a6057c94ac1842aacbcb64b4be1');
INSERT INTO `jy_base_org_resources` VALUES ('1', '6fab62b407fd4df29cd315b7ce970ca5');
INSERT INTO `jy_base_org_resources` VALUES ('4', '6fab62b407fd4df29cd315b7ce970ca5');
INSERT INTO `jy_base_org_resources` VALUES ('1', 'eca65d56fb61495ebcfd7c572c2ea91b');
INSERT INTO `jy_base_org_resources` VALUES ('4', 'eca65d56fb61495ebcfd7c572c2ea91b');
INSERT INTO `jy_base_org_resources` VALUES ('1', '085b223aae3b463fbe606e9a6432f8ca');
INSERT INTO `jy_base_org_resources` VALUES ('4', '085b223aae3b463fbe606e9a6432f8ca');
INSERT INTO `jy_base_org_resources` VALUES ('1', '000183b0dcde4924917a36cf19061006');
INSERT INTO `jy_base_org_resources` VALUES ('4', '000183b0dcde4924917a36cf19061006');
INSERT INTO `jy_base_org_resources` VALUES ('1', 'd7419f56ce154ff2ba335c1f8f4ade17');
INSERT INTO `jy_base_org_resources` VALUES ('4', 'd7419f56ce154ff2ba335c1f8f4ade17');
INSERT INTO `jy_base_org_resources` VALUES ('1', 'cbf35392bc534d5fa8fbd94a1122e0b6');
INSERT INTO `jy_base_org_resources` VALUES ('4', 'cbf35392bc534d5fa8fbd94a1122e0b6');
INSERT INTO `jy_base_org_resources` VALUES ('f1a2bc7677ff4e86b1d07dbdbcacab4c', '3bfe84bade44428581b5102b5fabff36');
INSERT INTO `jy_base_org_resources` VALUES ('f1a2bc7677ff4e86b1d07dbdbcacab4c', 'ed76bf221dd04ad5a2a8a724f11f1f4a');
INSERT INTO `jy_base_org_resources` VALUES ('f1a2bc7677ff4e86b1d07dbdbcacab4c', 'f6ec54ae6b1941f9af8ae6aaa65fa667');
INSERT INTO `jy_base_org_resources` VALUES ('f1a2bc7677ff4e86b1d07dbdbcacab4c', '32db697c9ec34011afe8bee1dee59389');
INSERT INTO `jy_base_org_resources` VALUES ('f1a2bc7677ff4e86b1d07dbdbcacab4c', '4028818462a3f2730162a3f273790000');
INSERT INTO `jy_base_org_resources` VALUES ('f1a2bc7677ff4e86b1d07dbdbcacab4c', '402880e9624b9e2801624b9e28080000');
INSERT INTO `jy_base_org_resources` VALUES ('f1a2bc7677ff4e86b1d07dbdbcacab4c', 'b7e74a818e6c4a879a8c0dcdd28d3526');
INSERT INTO `jy_base_org_resources` VALUES ('f1a2bc7677ff4e86b1d07dbdbcacab4c', '2c663bd9a2fc4d82b26eb1032d5c00b1');
INSERT INTO `jy_base_org_resources` VALUES ('f1a2bc7677ff4e86b1d07dbdbcacab4c', '7f2059c3963f4c85ad79877fc39d0f87');
INSERT INTO `jy_base_org_resources` VALUES ('f1a2bc7677ff4e86b1d07dbdbcacab4c', '4028818462a3f2730162a3f3e72c0001');
INSERT INTO `jy_base_org_resources` VALUES ('f1a2bc7677ff4e86b1d07dbdbcacab4c', 'b8c7e7b96d274095a5494277793d39b4');
INSERT INTO `jy_base_org_resources` VALUES ('f1a2bc7677ff4e86b1d07dbdbcacab4c', '783938b7cdc947c68cf48d734aed51cc');
INSERT INTO `jy_base_org_resources` VALUES ('f1a2bc7677ff4e86b1d07dbdbcacab4c', 'bdda4065d9904e718e8dd70e035bdb43');
INSERT INTO `jy_base_org_resources` VALUES ('f1a2bc7677ff4e86b1d07dbdbcacab4c', 'ba8c2c172df54fc992369b3671b6c787');
INSERT INTO `jy_base_org_resources` VALUES ('f1a2bc7677ff4e86b1d07dbdbcacab4c', '219b4e8b576345b285c7232642ff5172');
INSERT INTO `jy_base_org_resources` VALUES ('f1a2bc7677ff4e86b1d07dbdbcacab4c', 'ee4ae52c7759417698651a48a4686979');
INSERT INTO `jy_base_org_resources` VALUES ('f1a2bc7677ff4e86b1d07dbdbcacab4c', 'fca408a363044f95bf12dc51d1b75105');
INSERT INTO `jy_base_org_resources` VALUES ('f1a2bc7677ff4e86b1d07dbdbcacab4c', 'bda72211ff08493fa9f0d50097b9cc2a');
INSERT INTO `jy_base_org_resources` VALUES ('f1a2bc7677ff4e86b1d07dbdbcacab4c', '153208eb05c549898a91e0a1a04b13a6');
INSERT INTO `jy_base_org_resources` VALUES ('f1a2bc7677ff4e86b1d07dbdbcacab4c', 'cdd36f994952404cb73fc5b4727754d7');
INSERT INTO `jy_base_org_resources` VALUES ('f1a2bc7677ff4e86b1d07dbdbcacab4c', '415d9d3109234cc9a0ad15c612e63bdd');
INSERT INTO `jy_base_org_resources` VALUES ('f1a2bc7677ff4e86b1d07dbdbcacab4c', 'b2763b8c73e6475e8b332e0dafda92e7');
INSERT INTO `jy_base_org_resources` VALUES ('f1a2bc7677ff4e86b1d07dbdbcacab4c', '958a6acbe39f48009714ba1bcb1232e0');
INSERT INTO `jy_base_org_resources` VALUES ('f1a2bc7677ff4e86b1d07dbdbcacab4c', 'c5851423b69449a2b6f92a6e43d7c154');
INSERT INTO `jy_base_org_resources` VALUES ('f1a2bc7677ff4e86b1d07dbdbcacab4c', '0cd4f53a9a5a49eb81058d94c3baeed8');
INSERT INTO `jy_base_org_resources` VALUES ('f1a2bc7677ff4e86b1d07dbdbcacab4c', '4a18aa13302b48dd98f7005aaa4096e2');
INSERT INTO `jy_base_org_resources` VALUES ('f1a2bc7677ff4e86b1d07dbdbcacab4c', 'b20375c2bc9a48b098b000d02a770a62');
INSERT INTO `jy_base_org_resources` VALUES ('f1a2bc7677ff4e86b1d07dbdbcacab4c', '31018b89dde34513ad30c3b4b55256a7');
INSERT INTO `jy_base_org_resources` VALUES ('f1a2bc7677ff4e86b1d07dbdbcacab4c', 'f7f1f90af08e4b06b9dcc750226efd8f');
INSERT INTO `jy_base_org_resources` VALUES ('f1a2bc7677ff4e86b1d07dbdbcacab4c', '567c82ba52af488ea079f3b04d157590');
INSERT INTO `jy_base_org_resources` VALUES ('f1a2bc7677ff4e86b1d07dbdbcacab4c', '7eba58c432d04a38a51918e37b7cb124');
INSERT INTO `jy_base_org_resources` VALUES ('f1a2bc7677ff4e86b1d07dbdbcacab4c', 'db620a86882840ee92026006343781ea');
INSERT INTO `jy_base_org_resources` VALUES ('f1a2bc7677ff4e86b1d07dbdbcacab4c', '3e633338e5344731895964a4de7f8271');
INSERT INTO `jy_base_org_resources` VALUES ('f1a2bc7677ff4e86b1d07dbdbcacab4c', '35504db0bf5b49e09a5b631d29e08e8e');
INSERT INTO `jy_base_org_resources` VALUES ('f1a2bc7677ff4e86b1d07dbdbcacab4c', 'a2a465e7c7ae4f92b1ad2b2afec1a7b9');
INSERT INTO `jy_base_org_resources` VALUES ('f1a2bc7677ff4e86b1d07dbdbcacab4c', '3a2033170be54a74b03c9a578415eabd');
INSERT INTO `jy_base_org_resources` VALUES ('f1a2bc7677ff4e86b1d07dbdbcacab4c', '23f40d71d1ad4421873046e30be16f8e');
INSERT INTO `jy_base_org_resources` VALUES ('f1a2bc7677ff4e86b1d07dbdbcacab4c', '83079eb98aa24f73bfb1be11852ac9fc');
INSERT INTO `jy_base_org_resources` VALUES ('f1a2bc7677ff4e86b1d07dbdbcacab4c', '439756a806314420971daf5d6787d62d');
INSERT INTO `jy_base_org_resources` VALUES ('f1a2bc7677ff4e86b1d07dbdbcacab4c', '83718e6be30b4d37894038eb5c8f8f2d');
INSERT INTO `jy_base_org_resources` VALUES ('f1a2bc7677ff4e86b1d07dbdbcacab4c', 'd4e7a2fccd19447ebf8bdb26fba18c5e');
INSERT INTO `jy_base_org_resources` VALUES ('1', '11');
INSERT INTO `jy_base_org_resources` VALUES ('1', '3bfe84bade44428581b5102b5fabff36');
INSERT INTO `jy_base_org_resources` VALUES ('1', 'ed76bf221dd04ad5a2a8a724f11f1f4a');
INSERT INTO `jy_base_org_resources` VALUES ('1', 'f6ec54ae6b1941f9af8ae6aaa65fa667');
INSERT INTO `jy_base_org_resources` VALUES ('1', '32db697c9ec34011afe8bee1dee59389');
INSERT INTO `jy_base_org_resources` VALUES ('1', '4028818462a3f2730162a3f273790000');
INSERT INTO `jy_base_org_resources` VALUES ('1', '402880e9624b9e2801624b9e28080000');
INSERT INTO `jy_base_org_resources` VALUES ('1', 'b7e74a818e6c4a879a8c0dcdd28d3526');
INSERT INTO `jy_base_org_resources` VALUES ('1', '2c663bd9a2fc4d82b26eb1032d5c00b1');
INSERT INTO `jy_base_org_resources` VALUES ('1', '7f2059c3963f4c85ad79877fc39d0f87');
INSERT INTO `jy_base_org_resources` VALUES ('1', '4028818462a3f2730162a3f3e72c0001');
INSERT INTO `jy_base_org_resources` VALUES ('1', 'b8c7e7b96d274095a5494277793d39b4');
INSERT INTO `jy_base_org_resources` VALUES ('1', '783938b7cdc947c68cf48d734aed51cc');
INSERT INTO `jy_base_org_resources` VALUES ('1', 'ba9a4be6005d4bdf9040e20ae0ee4db5');
INSERT INTO `jy_base_org_resources` VALUES ('1', 'bdda4065d9904e718e8dd70e035bdb43');
INSERT INTO `jy_base_org_resources` VALUES ('1', 'ba8c2c172df54fc992369b3671b6c787');
INSERT INTO `jy_base_org_resources` VALUES ('1', 'bda72211ff08493fa9f0d50097b9cc2a');
INSERT INTO `jy_base_org_resources` VALUES ('1', '153208eb05c549898a91e0a1a04b13a6');
INSERT INTO `jy_base_org_resources` VALUES ('1', 'cdd36f994952404cb73fc5b4727754d7');
INSERT INTO `jy_base_org_resources` VALUES ('1', '415d9d3109234cc9a0ad15c612e63bdd');
INSERT INTO `jy_base_org_resources` VALUES ('1', 'c924250d1b184982a89b499ba7a3f5cc');
INSERT INTO `jy_base_org_resources` VALUES ('1', 'b2763b8c73e6475e8b332e0dafda92e7');
INSERT INTO `jy_base_org_resources` VALUES ('1', '219b4e8b576345b285c7232642ff5172');
INSERT INTO `jy_base_org_resources` VALUES ('1', 'ee4ae52c7759417698651a48a4686979');
INSERT INTO `jy_base_org_resources` VALUES ('1', 'fca408a363044f95bf12dc51d1b75105');
INSERT INTO `jy_base_org_resources` VALUES ('1', '958a6acbe39f48009714ba1bcb1232e0');
INSERT INTO `jy_base_org_resources` VALUES ('1', '297e9023628516d801628516d8940000');
INSERT INTO `jy_base_org_resources` VALUES ('1', 'c5851423b69449a2b6f92a6e43d7c154');
INSERT INTO `jy_base_org_resources` VALUES ('1', '0cd4f53a9a5a49eb81058d94c3baeed8');
INSERT INTO `jy_base_org_resources` VALUES ('1', '4a18aa13302b48dd98f7005aaa4096e2');
INSERT INTO `jy_base_org_resources` VALUES ('1', 'b20375c2bc9a48b098b000d02a770a62');
INSERT INTO `jy_base_org_resources` VALUES ('1', '31018b89dde34513ad30c3b4b55256a7');
INSERT INTO `jy_base_org_resources` VALUES ('1', 'f7f1f90af08e4b06b9dcc750226efd8f');
INSERT INTO `jy_base_org_resources` VALUES ('1', '567c82ba52af488ea079f3b04d157590');
INSERT INTO `jy_base_org_resources` VALUES ('1', '7eba58c432d04a38a51918e37b7cb124');
INSERT INTO `jy_base_org_resources` VALUES ('1', '23f40d71d1ad4421873046e30be16f8e');
INSERT INTO `jy_base_org_resources` VALUES ('1', '83079eb98aa24f73bfb1be11852ac9fc');
INSERT INTO `jy_base_org_resources` VALUES ('1', '439756a806314420971daf5d6787d62d');
INSERT INTO `jy_base_org_resources` VALUES ('1', '83718e6be30b4d37894038eb5c8f8f2d');
INSERT INTO `jy_base_org_resources` VALUES ('1', 'd4e7a2fccd19447ebf8bdb26fba18c5e');
INSERT INTO `jy_base_org_resources` VALUES ('1', 'db620a86882840ee92026006343781ea');
INSERT INTO `jy_base_org_resources` VALUES ('1', '3e633338e5344731895964a4de7f8271');
INSERT INTO `jy_base_org_resources` VALUES ('1', '35504db0bf5b49e09a5b631d29e08e8e');
INSERT INTO `jy_base_org_resources` VALUES ('1', 'a2a465e7c7ae4f92b1ad2b2afec1a7b9');
INSERT INTO `jy_base_org_resources` VALUES ('1', '3a2033170be54a74b03c9a578415eabd');
INSERT INTO `jy_base_org_resources` VALUES ('1', '5bbadca08ef748e4a7dd9bbc2304b300');
INSERT INTO `jy_base_org_resources` VALUES ('1', '0353d45d93f341178fc6dad970311072');
INSERT INTO `jy_base_org_resources` VALUES ('1', 'e32736e5780640908fdb166bad8877d8');
INSERT INTO `jy_base_org_resources` VALUES ('1', '2fca910ce5fb499ebeeae4351cc26240');
INSERT INTO `jy_base_org_resources` VALUES ('1', 'ea87935658a44519a5d77d0d4bac7296');
INSERT INTO `jy_base_org_resources` VALUES ('1', '45b89aec81dc4ff0b8d014ffe92a05bb');
INSERT INTO `jy_base_org_resources` VALUES ('1', 'b4ef74f46fd849128836b8f2776b4570');
INSERT INTO `jy_base_org_resources` VALUES ('1', '80fd6468064440cf8beaa9a5691c4330');
INSERT INTO `jy_base_org_resources` VALUES ('1', 'fc94dfb51c8a49bea189eef1433c6ce5');
INSERT INTO `jy_base_org_resources` VALUES ('1', '0049e7df73f7449aac602629d6092855');
INSERT INTO `jy_base_org_resources` VALUES ('1', '7dda6657629342618c81797be0a4c5d4');
INSERT INTO `jy_base_org_resources` VALUES ('1', '7defb04cc0784ba1b80c0540e7877545');
INSERT INTO `jy_base_org_resources` VALUES ('1', '90c2e721d4694d0b930bf976e6353f38');
INSERT INTO `jy_base_org_resources` VALUES ('1', 'c1cd51388c2a4527ba202ea5502fbf59');
INSERT INTO `jy_base_org_resources` VALUES ('1', '4c95475b93c944f89d185cd175960768');
INSERT INTO `jy_base_org_resources` VALUES ('1', 'c16165aa1f274c0f83199c0b4b197a30');
INSERT INTO `jy_base_org_resources` VALUES ('1', 'ce50302a3ca84a2fac042d30cb171961');
INSERT INTO `jy_base_org_resources` VALUES ('1', 'fe3b1d7478804c079d3e0489bad16b09');
INSERT INTO `jy_base_org_resources` VALUES ('1', 'c5aad93b3c6747a0bdbbcf58cf260a6b');
INSERT INTO `jy_base_org_resources` VALUES ('1', '5aa30b82be4642da8d63d14614b165b0');
INSERT INTO `jy_base_org_resources` VALUES ('1', '9c43dbd6fd2745b78b72bb6a816d1d54');
INSERT INTO `jy_base_org_resources` VALUES ('1', '034880665a9e4a0faebce4357e67b127');
INSERT INTO `jy_base_org_resources` VALUES ('1', '1');
INSERT INTO `jy_base_org_resources` VALUES ('1', '2');
INSERT INTO `jy_base_org_resources` VALUES ('1', 'ae8fea67b8434987b718c51fe83bb45d');
INSERT INTO `jy_base_org_resources` VALUES ('1', '1e2cd5e710224cf0ba09bbe5d4ee0009');
INSERT INTO `jy_base_org_resources` VALUES ('1', 'fa04b6fe03944f2a9c040dbc9071af9b');
INSERT INTO `jy_base_org_resources` VALUES ('1', '83984d22f9da4991833f506695307b6f');
INSERT INTO `jy_base_org_resources` VALUES ('1', '89ff6bdf54ca4501a264adba8eb0ee39');
INSERT INTO `jy_base_org_resources` VALUES ('1', '15a7d1cec70c47bdbfd41c7f9c694481');
INSERT INTO `jy_base_org_resources` VALUES ('1', '3');
INSERT INTO `jy_base_org_resources` VALUES ('1', '4c97ca25b7e940948b3d403c3b091c81');
INSERT INTO `jy_base_org_resources` VALUES ('1', 'd22f22f0bc9a4ad2a6464cca6497a7b4');
INSERT INTO `jy_base_org_resources` VALUES ('1', '51aa6b0b037340b9ae88d22d2a354acf');
INSERT INTO `jy_base_org_resources` VALUES ('1', '4ee50d1722a34edeb6c15bdbf29e556b');
INSERT INTO `jy_base_org_resources` VALUES ('1', '42a2938acb5e4a26b5ec2cc6089b7c2e');
INSERT INTO `jy_base_org_resources` VALUES ('1', '5ba75d14f5b74572bd5ff35d12c58060');
INSERT INTO `jy_base_org_resources` VALUES ('1', 'c73d630ab1004b5a9b71836e8b000de9');
INSERT INTO `jy_base_org_resources` VALUES ('1', '4');
INSERT INTO `jy_base_org_resources` VALUES ('1', '41');
INSERT INTO `jy_base_org_resources` VALUES ('1', '161848b9e16e410e9d3fac6f9c91cad5');
INSERT INTO `jy_base_org_resources` VALUES ('1', '28d4a82889c341bdaceab323b9549245');
INSERT INTO `jy_base_org_resources` VALUES ('1', '3f184c74379c4b668030ba9e55c9caa3');
INSERT INTO `jy_base_org_resources` VALUES ('1', '6d44f1553c424e5c81bd3ed9a4e162f3');
INSERT INTO `jy_base_org_resources` VALUES ('1', '13');
INSERT INTO `jy_base_org_resources` VALUES ('1', '10');
INSERT INTO `jy_base_org_resources` VALUES ('1', '9575841c8b6a4c58b10e97d82320fd02');
INSERT INTO `jy_base_org_resources` VALUES ('1', 'dde1c043e77d48b4ac2f15806a0aec14');
INSERT INTO `jy_base_org_resources` VALUES ('1', 'cd7ef89bf12f4ceb98861cf2bcbc96b1');
INSERT INTO `jy_base_org_resources` VALUES ('1', '78b1bf1c0723433099c458e75a8c6901');
INSERT INTO `jy_base_org_resources` VALUES ('1', '75288771d60d4510affe8cb97f42897f');
INSERT INTO `jy_base_org_resources` VALUES ('1', '14');
INSERT INTO `jy_base_org_resources` VALUES ('1', '34507436438c4c7eb9803fa160c2af3c');
INSERT INTO `jy_base_org_resources` VALUES ('1', 'dbb1d5db4d7b419db1d221b102a7ad51');
INSERT INTO `jy_base_org_resources` VALUES ('1', 'e9480dd6590a4e14a443ee8f76873fd3');
INSERT INTO `jy_base_org_resources` VALUES ('1', '6ea62cf0820248a6a2780a885b82a99d');
INSERT INTO `jy_base_org_resources` VALUES ('1', '21feb456e503484280232730687149f2');
INSERT INTO `jy_base_org_resources` VALUES ('4', '11');
INSERT INTO `jy_base_org_resources` VALUES ('4', '3bfe84bade44428581b5102b5fabff36');
INSERT INTO `jy_base_org_resources` VALUES ('4', 'ed76bf221dd04ad5a2a8a724f11f1f4a');
INSERT INTO `jy_base_org_resources` VALUES ('4', 'f6ec54ae6b1941f9af8ae6aaa65fa667');
INSERT INTO `jy_base_org_resources` VALUES ('4', '32db697c9ec34011afe8bee1dee59389');
INSERT INTO `jy_base_org_resources` VALUES ('4', '4028818462a3f2730162a3f273790000');
INSERT INTO `jy_base_org_resources` VALUES ('4', '402880e9624b9e2801624b9e28080000');
INSERT INTO `jy_base_org_resources` VALUES ('4', 'b7e74a818e6c4a879a8c0dcdd28d3526');
INSERT INTO `jy_base_org_resources` VALUES ('4', '2c663bd9a2fc4d82b26eb1032d5c00b1');
INSERT INTO `jy_base_org_resources` VALUES ('4', '7f2059c3963f4c85ad79877fc39d0f87');
INSERT INTO `jy_base_org_resources` VALUES ('4', '4028818462a3f2730162a3f3e72c0001');
INSERT INTO `jy_base_org_resources` VALUES ('4', 'b8c7e7b96d274095a5494277793d39b4');
INSERT INTO `jy_base_org_resources` VALUES ('4', '783938b7cdc947c68cf48d734aed51cc');
INSERT INTO `jy_base_org_resources` VALUES ('4', 'ba9a4be6005d4bdf9040e20ae0ee4db5');
INSERT INTO `jy_base_org_resources` VALUES ('4', 'bdda4065d9904e718e8dd70e035bdb43');
INSERT INTO `jy_base_org_resources` VALUES ('4', 'ba8c2c172df54fc992369b3671b6c787');
INSERT INTO `jy_base_org_resources` VALUES ('4', '219b4e8b576345b285c7232642ff5172');
INSERT INTO `jy_base_org_resources` VALUES ('4', 'ee4ae52c7759417698651a48a4686979');
INSERT INTO `jy_base_org_resources` VALUES ('4', 'fca408a363044f95bf12dc51d1b75105');
INSERT INTO `jy_base_org_resources` VALUES ('4', 'bda72211ff08493fa9f0d50097b9cc2a');
INSERT INTO `jy_base_org_resources` VALUES ('4', '153208eb05c549898a91e0a1a04b13a6');
INSERT INTO `jy_base_org_resources` VALUES ('4', 'cdd36f994952404cb73fc5b4727754d7');
INSERT INTO `jy_base_org_resources` VALUES ('4', '415d9d3109234cc9a0ad15c612e63bdd');
INSERT INTO `jy_base_org_resources` VALUES ('4', 'c924250d1b184982a89b499ba7a3f5cc');
INSERT INTO `jy_base_org_resources` VALUES ('4', 'b2763b8c73e6475e8b332e0dafda92e7');
INSERT INTO `jy_base_org_resources` VALUES ('4', '958a6acbe39f48009714ba1bcb1232e0');
INSERT INTO `jy_base_org_resources` VALUES ('4', '297e9023628516d801628516d8940000');
INSERT INTO `jy_base_org_resources` VALUES ('4', '0cd4f53a9a5a49eb81058d94c3baeed8');
INSERT INTO `jy_base_org_resources` VALUES ('4', 'c5851423b69449a2b6f92a6e43d7c154');
INSERT INTO `jy_base_org_resources` VALUES ('4', '4a18aa13302b48dd98f7005aaa4096e2');
INSERT INTO `jy_base_org_resources` VALUES ('4', 'b20375c2bc9a48b098b000d02a770a62');
INSERT INTO `jy_base_org_resources` VALUES ('4', '31018b89dde34513ad30c3b4b55256a7');
INSERT INTO `jy_base_org_resources` VALUES ('4', 'f7f1f90af08e4b06b9dcc750226efd8f');
INSERT INTO `jy_base_org_resources` VALUES ('4', '567c82ba52af488ea079f3b04d157590');
INSERT INTO `jy_base_org_resources` VALUES ('4', '7eba58c432d04a38a51918e37b7cb124');
INSERT INTO `jy_base_org_resources` VALUES ('4', '23f40d71d1ad4421873046e30be16f8e');
INSERT INTO `jy_base_org_resources` VALUES ('4', '83079eb98aa24f73bfb1be11852ac9fc');
INSERT INTO `jy_base_org_resources` VALUES ('4', '439756a806314420971daf5d6787d62d');
INSERT INTO `jy_base_org_resources` VALUES ('4', '83718e6be30b4d37894038eb5c8f8f2d');
INSERT INTO `jy_base_org_resources` VALUES ('4', 'd4e7a2fccd19447ebf8bdb26fba18c5e');
INSERT INTO `jy_base_org_resources` VALUES ('4', 'db620a86882840ee92026006343781ea');
INSERT INTO `jy_base_org_resources` VALUES ('4', '3e633338e5344731895964a4de7f8271');
INSERT INTO `jy_base_org_resources` VALUES ('4', '35504db0bf5b49e09a5b631d29e08e8e');
INSERT INTO `jy_base_org_resources` VALUES ('4', 'a2a465e7c7ae4f92b1ad2b2afec1a7b9');
INSERT INTO `jy_base_org_resources` VALUES ('4', '3a2033170be54a74b03c9a578415eabd');
INSERT INTO `jy_base_org_resources` VALUES ('4', '5bbadca08ef748e4a7dd9bbc2304b300');
INSERT INTO `jy_base_org_resources` VALUES ('4', '0353d45d93f341178fc6dad970311072');
INSERT INTO `jy_base_org_resources` VALUES ('4', 'e32736e5780640908fdb166bad8877d8');
INSERT INTO `jy_base_org_resources` VALUES ('4', '2fca910ce5fb499ebeeae4351cc26240');
INSERT INTO `jy_base_org_resources` VALUES ('4', 'ea87935658a44519a5d77d0d4bac7296');
INSERT INTO `jy_base_org_resources` VALUES ('4', '45b89aec81dc4ff0b8d014ffe92a05bb');
INSERT INTO `jy_base_org_resources` VALUES ('4', 'b4ef74f46fd849128836b8f2776b4570');
INSERT INTO `jy_base_org_resources` VALUES ('4', '80fd6468064440cf8beaa9a5691c4330');
INSERT INTO `jy_base_org_resources` VALUES ('4', 'fc94dfb51c8a49bea189eef1433c6ce5');
INSERT INTO `jy_base_org_resources` VALUES ('4', '0049e7df73f7449aac602629d6092855');
INSERT INTO `jy_base_org_resources` VALUES ('4', '7dda6657629342618c81797be0a4c5d4');
INSERT INTO `jy_base_org_resources` VALUES ('4', '7defb04cc0784ba1b80c0540e7877545');
INSERT INTO `jy_base_org_resources` VALUES ('4', '90c2e721d4694d0b930bf976e6353f38');
INSERT INTO `jy_base_org_resources` VALUES ('4', 'c1cd51388c2a4527ba202ea5502fbf59');
INSERT INTO `jy_base_org_resources` VALUES ('4', '4c95475b93c944f89d185cd175960768');
INSERT INTO `jy_base_org_resources` VALUES ('4', 'c16165aa1f274c0f83199c0b4b197a30');
INSERT INTO `jy_base_org_resources` VALUES ('4', 'ce50302a3ca84a2fac042d30cb171961');
INSERT INTO `jy_base_org_resources` VALUES ('4', 'fe3b1d7478804c079d3e0489bad16b09');
INSERT INTO `jy_base_org_resources` VALUES ('4', 'c5aad93b3c6747a0bdbbcf58cf260a6b');
INSERT INTO `jy_base_org_resources` VALUES ('4', '5aa30b82be4642da8d63d14614b165b0');
INSERT INTO `jy_base_org_resources` VALUES ('4', '9c43dbd6fd2745b78b72bb6a816d1d54');
INSERT INTO `jy_base_org_resources` VALUES ('4', '034880665a9e4a0faebce4357e67b127');
INSERT INTO `jy_base_org_resources` VALUES ('4', '1');
INSERT INTO `jy_base_org_resources` VALUES ('4', '2');
INSERT INTO `jy_base_org_resources` VALUES ('4', 'ae8fea67b8434987b718c51fe83bb45d');
INSERT INTO `jy_base_org_resources` VALUES ('4', '1e2cd5e710224cf0ba09bbe5d4ee0009');
INSERT INTO `jy_base_org_resources` VALUES ('4', 'fa04b6fe03944f2a9c040dbc9071af9b');
INSERT INTO `jy_base_org_resources` VALUES ('4', '83984d22f9da4991833f506695307b6f');
INSERT INTO `jy_base_org_resources` VALUES ('4', '89ff6bdf54ca4501a264adba8eb0ee39');
INSERT INTO `jy_base_org_resources` VALUES ('4', '15a7d1cec70c47bdbfd41c7f9c694481');
INSERT INTO `jy_base_org_resources` VALUES ('4', '3');
INSERT INTO `jy_base_org_resources` VALUES ('4', '4c97ca25b7e940948b3d403c3b091c81');
INSERT INTO `jy_base_org_resources` VALUES ('4', 'd22f22f0bc9a4ad2a6464cca6497a7b4');
INSERT INTO `jy_base_org_resources` VALUES ('4', '51aa6b0b037340b9ae88d22d2a354acf');
INSERT INTO `jy_base_org_resources` VALUES ('4', '4ee50d1722a34edeb6c15bdbf29e556b');
INSERT INTO `jy_base_org_resources` VALUES ('4', '42a2938acb5e4a26b5ec2cc6089b7c2e');
INSERT INTO `jy_base_org_resources` VALUES ('4', '5ba75d14f5b74572bd5ff35d12c58060');
INSERT INTO `jy_base_org_resources` VALUES ('4', 'c73d630ab1004b5a9b71836e8b000de9');
INSERT INTO `jy_base_org_resources` VALUES ('4', '4');
INSERT INTO `jy_base_org_resources` VALUES ('4', '41');
INSERT INTO `jy_base_org_resources` VALUES ('4', '161848b9e16e410e9d3fac6f9c91cad5');
INSERT INTO `jy_base_org_resources` VALUES ('4', '28d4a82889c341bdaceab323b9549245');
INSERT INTO `jy_base_org_resources` VALUES ('4', '3f184c74379c4b668030ba9e55c9caa3');
INSERT INTO `jy_base_org_resources` VALUES ('4', '6d44f1553c424e5c81bd3ed9a4e162f3');
INSERT INTO `jy_base_org_resources` VALUES ('4', '13');
INSERT INTO `jy_base_org_resources` VALUES ('4', '10');
INSERT INTO `jy_base_org_resources` VALUES ('4', '9575841c8b6a4c58b10e97d82320fd02');
INSERT INTO `jy_base_org_resources` VALUES ('4', 'dde1c043e77d48b4ac2f15806a0aec14');
INSERT INTO `jy_base_org_resources` VALUES ('4', 'cd7ef89bf12f4ceb98861cf2bcbc96b1');
INSERT INTO `jy_base_org_resources` VALUES ('4', '78b1bf1c0723433099c458e75a8c6901');
INSERT INTO `jy_base_org_resources` VALUES ('4', '75288771d60d4510affe8cb97f42897f');
INSERT INTO `jy_base_org_resources` VALUES ('4', '14');
INSERT INTO `jy_base_org_resources` VALUES ('4', '34507436438c4c7eb9803fa160c2af3c');
INSERT INTO `jy_base_org_resources` VALUES ('4', 'dbb1d5db4d7b419db1d221b102a7ad51');
INSERT INTO `jy_base_org_resources` VALUES ('4', 'e9480dd6590a4e14a443ee8f76873fd3');
INSERT INTO `jy_base_org_resources` VALUES ('4', '6ea62cf0820248a6a2780a885b82a99d');
INSERT INTO `jy_base_org_resources` VALUES ('4', '21feb456e503484280232730687149f2');

-- ----------------------------
-- Table structure for jy_base_position
-- ----------------------------
DROP TABLE IF EXISTS `jy_base_position`;
CREATE TABLE `jy_base_position` (
  `id` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL,
  `orgId` varchar(32) NOT NULL,
  `type` varchar(32) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jy_base_position
-- ----------------------------
INSERT INTO `jy_base_position` VALUES ('1', '经理', '2', 'manager', '', '2016-01-22 00:02:55', null);
INSERT INTO `jy_base_position` VALUES ('b2da690b91b64408aba7fb820b1bf9cf', '人事经理', '8f080b6180564157aa173cc26e44d1dd', 'manager', '', '2016-02-27 19:13:06', null);
INSERT INTO `jy_base_position` VALUES ('c63d54663fcc4e27a10e1e6f17772df8', '董事长', '1', 'president', '', '2016-01-22 00:45:00', '2016-01-22 19:09:46');
INSERT INTO `jy_base_position` VALUES ('f6db550f89824d6bb0009fc04af3f25b', '总经理', '1', 'gmanager', '', '2016-01-22 00:47:01', null);

-- ----------------------------
-- Table structure for jy_base_resources
-- ----------------------------
DROP TABLE IF EXISTS `jy_base_resources`;
CREATE TABLE `jy_base_resources` (
  `id` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT 'Id',
  `name` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '菜单名字',
  `parentId` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '0' COMMENT '父Id',
  `layer` int(11) NOT NULL,
  `type` int(4) NOT NULL DEFAULT '1' COMMENT '资源类型(1:为菜单，2:功能，3:按钮)',
  `resUrl` varchar(512) CHARACTER SET utf8 DEFAULT NULL COMMENT '菜单链接',
  `btnId` varchar(32) DEFAULT NULL,
  `btnFun` varchar(64) DEFAULT NULL,
  `icon` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '菜单Icon',
  `sort` int(10) DEFAULT NULL COMMENT '菜单顺序(由小到大排列)',
  `isValid` int(2) DEFAULT NULL COMMENT '是否有效(1:有效,0:无效)',
  `description` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '描述',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of jy_base_resources
-- ----------------------------
INSERT INTO `jy_base_resources` VALUES ('000183b0dcde4924917a36cf19061006', '系统监控', '5', '4', '1', '/backstage/monitor/sys/index', '', '', 'icon-camera-retro ', '1', '1', '', '2017-11-10 17:40:51', null);
INSERT INTO `jy_base_resources` VALUES ('0049e7df73f7449aac602629d6092855', '路径规划', '5bbadca08ef748e4a7dd9bbc2304b300', '1', '1', '/html/echarts/ecartshtml/lujingguihua.html', '', '', 'icon-glass ', '4', '1', '', '2018-01-12 10:08:38', null);
INSERT INTO `jy_base_resources` VALUES ('034880665a9e4a0faebce4357e67b127', '资金流水单', '5aa30b82be4642da8d63d14614b165b0', '1', '1', '/hdcaptitalupload/tocaptitalupload', '', '', '', '2', '1', '', '2018-03-21 09:10:43', '2018-03-21 09:18:29');
INSERT INTO `jy_base_resources` VALUES ('0353d45d93f341178fc6dad970311072', '大屏展示', '5bbadca08ef748e4a7dd9bbc2304b300', '1', '1', '/html/echarts/ecartshtml/chaolianjie.html', '', '', 'icon-th ', '1', '1', '', '2018-01-12 10:33:46', null);
INSERT INTO `jy_base_resources` VALUES ('0576a0a5825a4c1eafb0fb88369e77f6', '自动义菜单', '51424721ec1c4574b2f2a7bc1833c17f', '2', '1', '/backstage/weixin/menu/index', '', '', 'icon-ellipsis-horizontal ', '2', '1', '', '2015-12-30 22:44:19', '2015-12-30 23:12:47');
INSERT INTO `jy_base_resources` VALUES ('085b223aae3b463fbe606e9a6432f8ca', '在线PDF', '08693c30017e4e45acff89d300067269', '2', '1', '/backstage/tool/document/index', '', '', 'icon-facetime-video ', '10', '1', '', '2017-04-10 11:28:28', '2017-04-10 11:41:34');
INSERT INTO `jy_base_resources` VALUES ('08693c30017e4e45acff89d300067269', '系统工具', '0', '2', '1', '', '', '', 'icon-legal ', '4', '1', '', '2015-12-07 18:27:41', '2016-01-30 00:24:22');
INSERT INTO `jy_base_resources` VALUES ('0cd4f53a9a5a49eb81058d94c3baeed8', '我的投诉', '958a6acbe39f48009714ba1bcb1232e0', '1', '1', '/html/comprehensive/complain/complain.html', '', '', 'icon-trello ', '3', '1', '', '2018-01-05 21:15:05', '2018-02-22 16:17:17');
INSERT INTO `jy_base_resources` VALUES ('0f5747e8beb24a15899cfd0c0f4c42c0', 'zTree3.5', '6', '3', '1', '/static/apidoc/zTree/API_cn.html', '', '', 'icon-adn', '35', '1', '', '2015-12-13 14:54:53', '2016-01-30 18:36:38');
INSERT INTO `jy_base_resources` VALUES ('1', '基础管理', '0', '1', '1', '', '', '', 'icon-qrcode', '4', '1', '', '2015-07-15 16:35:17', '2018-03-05 11:03:56');
INSERT INTO `jy_base_resources` VALUES ('10', '系统字典', '13', '1', '1', '/backstage/sysDict/index', '', '', 'icon-dropbox', '1', '1', '', '2015-09-14 16:57:39', '2016-01-30 00:28:18');
INSERT INTO `jy_base_resources` VALUES ('100', 'jQuery UI', '6', '3', '1', '/static/apidoc/jquery/index.html', '', '', 'icon-adn', '9', '1', 'jQuery UI', '2015-10-09 17:35:39', '2016-01-30 18:36:56');
INSERT INTO `jy_base_resources` VALUES ('101', 'Shiro', '6', '3', '1', '/static/apidoc/shiro/index.html', '', '', 'icon-adn', '10', '1', '', '2015-10-23 10:30:14', '2016-01-30 18:36:18');
INSERT INTO `jy_base_resources` VALUES ('102', 'JY', '6', '3', '1', '/static/apidoc/jy/index.html', null, null, 'icon-adn', '1', '1', 'JY', '2015-11-04 15:32:19', null);
INSERT INTO `jy_base_resources` VALUES ('103', 'StringUtils', '6', '3', '1', '/static/apidoc/StringUtils/index.html', null, null, 'icon-adn', '4', '1', 'StringUtils', '2015-11-06 09:55:48', null);
INSERT INTO `jy_base_resources` VALUES ('11', '系统首页', '0', '1', '1', '/backstage/adv', '', '', 'icon-windows', '1', '1', '自定义广告页', '2015-08-11 11:37:44', '2018-03-05 11:04:10');
INSERT INTO `jy_base_resources` VALUES ('12', 'Web监控', '5', '4', '1', '/druid/index.html', null, null, 'icon-bar-chart', '1', '1', 'Web监控', '2015-09-08 10:45:18', null);
INSERT INTO `jy_base_resources` VALUES ('13', '字典管理', '0', '1', '1', '', '', '', 'icon-book ', '6', '1', '', '2015-09-25 13:20:42', '2018-03-05 11:04:04');
INSERT INTO `jy_base_resources` VALUES ('13baa4cc73184b9b800cd46b22121e3b', '批量删除', 'b1ba61f394cd499c9304e995f881a764', '4', '2', '/backstage/optLog/delBatch', 'delBatchBtn', '', 'icon-trash color-red', '1', '1', '', '2016-12-20 18:09:47', null);
INSERT INTO `jy_base_resources` VALUES ('14', '数据字典', '13', '1', '1', '/backstage/dataDict/index', '', '', 'icon-stackexchange', '2', '1', '', '2015-09-25 13:30:49', '2016-01-30 00:28:55');
INSERT INTO `jy_base_resources` VALUES ('153208eb05c549898a91e0a1a04b13a6', '司机信息', 'bda72211ff08493fa9f0d50097b9cc2a', '1', '1', '/hdDriverLicense/todriverlist', '', '', '', '3', '1', '', '2018-02-27 12:00:44', '2018-03-11 10:26:44');
INSERT INTO `jy_base_resources` VALUES ('15a7d1cec70c47bdbfd41c7f9c694481', '删除', '2', '1', '3', '/backstage/account/del', '', 'del', 'icon-remove-sign color-red', '4', '1', '', '2015-11-16 10:29:46', '2015-11-24 14:53:34');
INSERT INTO `jy_base_resources` VALUES ('161848b9e16e410e9d3fac6f9c91cad5', '批量删除', '4', '1', '2', '/backstage/resources/delBatch', 'delBatchBtn', '', 'icon-trash color-red', '2', '1', '', '2015-11-11 16:01:20', '2015-11-13 15:21:27');
INSERT INTO `jy_base_resources` VALUES ('17325e24f35348fd9a287152e3ea8b75', '创建模型', '55e7a2d527564d9790b9f00a00d34634', '2', '2', '/backstage/workflow/model/create', 'addBtn', '', 'icon-plus-sign color-green', '1', '1', '', '2016-01-18 17:42:36', '2016-01-18 17:47:29');
INSERT INTO `jy_base_resources` VALUES ('18756082926f41329e51d74dda3abc80', '流程定义', '58230413e8364b67af2bb65e64252260', '2', '1', '/backstage/workflow/process/index', '', '', 'icon-flickr ', '5', '1', '', '2016-01-19 14:21:40', '2016-01-19 20:13:21');
INSERT INTO `jy_base_resources` VALUES ('1add9a6057c94ac1842aacbcb64b4be1', '查看数据', '6fab62b407fd4df29cd315b7ce970ca5', '4', '3', '/backstage/db/dbManage/dbData', '', 'checkData', 'icon-zoom-in color-purple', '1', '1', '', '2017-03-26 16:07:08', '2017-03-26 16:55:42');
INSERT INTO `jy_base_resources` VALUES ('1bc2c9d3d8e644f1a25ce8321f2faf13', 'UEditor', '6', '3', '1', '/static/plugins/ueditor/index.html', '', '', 'icon-play-circle ', '12', '1', '', '2015-12-05 15:38:12', '2016-01-30 18:36:26');
INSERT INTO `jy_base_resources` VALUES ('1d906f69a7274cbd8b316903e66fc580', '签收任务', '9bc994928cc64fdca432fcad2a0b3ba9', '3', '1', '/backstage/workflow/online/myTask/signList', '', '', 'icon-envelope-alt ', '1', '1', '', '2016-02-11 23:53:11', null);
INSERT INTO `jy_base_resources` VALUES ('1e2cd5e710224cf0ba09bbe5d4ee0009', '批量删除', '2', '1', '2', '/backstage/account/delBatch', 'delBatchBtn', '', 'icon-trash color-red', '2', '1', '', '2015-11-16 09:36:13', '2016-01-22 18:39:20');
INSERT INTO `jy_base_resources` VALUES ('1e87cc3913914c8aa80116270ed03a75', '增加', 'a2eea33defc64462b3b3df9e64c461fb', '2', '2', '/backstage/task/scheduleJob/add', 'addBtn', '', 'icon-plus-sign color-green', '1', '1', '', '2015-12-24 11:28:59', '2015-12-24 20:34:47');
INSERT INTO `jy_base_resources` VALUES ('2', '用户管理', '1', '1', '1', '/backstage/account/index', '', '', 'icon-group', '1', '1', '', '2015-07-15 16:35:19', '2016-01-30 00:28:06');
INSERT INTO `jy_base_resources` VALUES ('219b4e8b576345b285c7232642ff5172', '车辆资料', '3bfe84bade44428581b5102b5fabff36', '1', '1', '', '', '', 'icon-file-text-alt ', '3', '1', '', '2018-03-06 16:53:06', null);
INSERT INTO `jy_base_resources` VALUES ('21feb456e503484280232730687149f2', '删除', '14', '1', '3', '/backstage/dataDict/del', '', 'del', 'icon-remove-sign color-red', '3', '1', '', '2015-11-18 16:10:03', '2015-11-24 14:25:00');
INSERT INTO `jy_base_resources` VALUES ('23f40d71d1ad4421873046e30be16f8e', '新车市场', '7eba58c432d04a38a51918e37b7cb124', '1', '1', '', '', '', 'icon-truck ', '1', '1', '', '2018-01-25 19:28:00', null);
INSERT INTO `jy_base_resources` VALUES ('25a4bc9c184a4d6c904ce7a3ccb26aae', '图表处理', '08693c30017e4e45acff89d300067269', '2', '1', '/backstage/tool/echarts/index', '', '', 'icon-align-left ', '2', '1', '', '2015-12-16 15:36:29', '2015-12-27 12:08:42');
INSERT INTO `jy_base_resources` VALUES ('273e05eb764f48c18f832520e7ce141e', '查看', '7b30d8d43df347ada558df820bbec28b', '2', '3', '/backstage/weixin/follower/find', '', 'check', 'icon-zoom-in color-purple', '1', '1', '', '2015-12-30 15:43:34', '2015-12-30 15:48:10');
INSERT INTO `jy_base_resources` VALUES ('28d4a82889c341bdaceab323b9549245', '查看', '4', '1', '3', '/backstage/resources/find', '', 'check', 'icon-zoom-in color-purple', '1', '1', '', '2015-11-12 15:33:53', '2015-11-12 16:19:30');
INSERT INTO `jy_base_resources` VALUES ('297e9023628516d801628516d8940000', '我的投诉列表', '958a6acbe39f48009714ba1bcb1232e0', '1', '1', '/hdComplain/tomycomplainlist', '', '', '', '1', '1', '', '2018-04-02 14:41:29', '2018-04-04 10:05:26');
INSERT INTO `jy_base_resources` VALUES ('2c663bd9a2fc4d82b26eb1032d5c00b1', '企业资质', '402880e9624b9e2801624b9e28080000', '1', '1', '/menber/toqualificationcom', '', '', '', '5', '1', '', '2018-01-02 20:25:43', '2018-03-22 10:58:45');
INSERT INTO `jy_base_resources` VALUES ('2fca910ce5fb499ebeeae4351cc26240', '运营质量多维度分析', '5bbadca08ef748e4a7dd9bbc2304b300', '1', '1', '/html/echarts/ecartshtml/tranquality8.html', '', '', 'icon-picture ', '1', '1', '', '2018-01-11 20:00:40', null);
INSERT INTO `jy_base_resources` VALUES ('3', '组织管理', '1', '1', '1', '/backstage/org/role/index', '', '', 'icon-github-alt', '2', '1', '', '2015-07-15 16:35:21', '2016-01-30 00:28:12');
INSERT INTO `jy_base_resources` VALUES ('31018b89dde34513ad30c3b4b55256a7', '托运订单管理', '958a6acbe39f48009714ba1bcb1232e0', '1', '1', '/html/common/all-info/consign-order.html', '', '', '', '7', '1', '', '2018-01-21 11:05:44', '2018-01-21 11:38:39');
INSERT INTO `jy_base_resources` VALUES ('31b0fe86acea4fceb184aecfe521ff0d', 'Quartz', '6', '3', '1', '/static/apidoc/quartz/index.html', '', '', 'icon-adn ', '33', '1', '', '2015-12-24 23:03:43', '2015-12-24 23:04:22');
INSERT INTO `jy_base_resources` VALUES ('32db697c9ec34011afe8bee1dee59389', '认证信息', 'ed76bf221dd04ad5a2a8a724f11f1f4a', '1', '1', '/menber/toaccreditation', '', '', '', '3', '1', '', '2017-12-26 17:45:37', '2017-12-28 14:15:18');
INSERT INTO `jy_base_resources` VALUES ('332072af224d42a4b2f340f30355b1e1', '500', '9727f259cd8542fc8756b7b9cee9dd54', '3', '1', '/500.jsp', '', '', 'icon-exclamation-sign ', '100', '1', '', '2015-11-25 11:28:27', '2015-12-13 14:51:32');
INSERT INTO `jy_base_resources` VALUES ('343914e32c3b458ba797c080b0dfbf85', '批量删除', '7c1741c605c148c29113ac804f68f52b', '4', '2', '/backstage/loginLog/delBatch', 'delBatchBtn', '', 'icon-trash color-red', '1', '1', '', '2015-12-24 21:04:24', '2015-12-24 21:09:33');
INSERT INTO `jy_base_resources` VALUES ('34507436438c4c7eb9803fa160c2af3c', '增加', '14', '1', '2', '/backstage/dataDict/add', 'addBtn', '', 'icon-plus-sign color-green', '1', '1', '', '2015-11-18 16:03:55', '2015-11-24 14:09:42');
INSERT INTO `jy_base_resources` VALUES ('35504db0bf5b49e09a5b631d29e08e8e', '二手车详情编辑', 'db620a86882840ee92026006343781ea', '1', '1', '/html/oldcarlist/oldcarmsgeditor.html', '', '', 'icon-edit ', '3', '1', '', '2018-03-02 16:31:53', null);
INSERT INTO `jy_base_resources` VALUES ('3a2033170be54a74b03c9a578415eabd', '询价客户信息', 'db620a86882840ee92026006343781ea', '1', '1', '/html/oldcarlist/oldaskprice.html', '', '', 'icon-user ', '4', '1', '', '2018-01-26 09:55:35', '2018-01-26 09:55:54');
INSERT INTO `jy_base_resources` VALUES ('3bfe84bade44428581b5102b5fabff36', '信息平台', '0', '1', '1', '', '', '', 'icon-cloud ', '2', '1', '', '2017-12-26 17:29:44', '2018-03-22 10:49:48');
INSERT INTO `jy_base_resources` VALUES ('3e633338e5344731895964a4de7f8271', '二手车列表', 'db620a86882840ee92026006343781ea', '1', '1', '/hdOldveh/oldveh', '', '', 'icon-ambulance ', '1', '1', '', '2018-01-26 08:35:33', '2018-01-26 08:42:53');
INSERT INTO `jy_base_resources` VALUES ('3f184c74379c4b668030ba9e55c9caa3', '修改', '4', '1', '3', '/backstage/resources/update', '', 'edit', 'icon-edit color-blue', '2', '1', '', '2015-11-11 16:50:47', '2015-11-12 16:19:24');
INSERT INTO `jy_base_resources` VALUES ('4', '菜单管理', '1', '1', '1', '/backstage/resources/index', '', '', 'icon-th-large', '4', '1', '', '2015-07-15 16:35:24', '2016-01-30 00:28:27');
INSERT INTO `jy_base_resources` VALUES ('4021171e506b47c083c77a2b96660031', '上传流程模型', '18756082926f41329e51d74dda3abc80', '2', '2', '/backstage/workflow/process/uploadModel', 'uploadModel', '', 'icon-cloud-upload ', '1', '1', '', '2016-03-19 18:00:59', '2016-03-19 18:01:21');
INSERT INTO `jy_base_resources` VALUES ('402880e9624b9e2801624b9e28080000', '企业会员', '3bfe84bade44428581b5102b5fabff36', '1', '1', '/html/common/menber-center.html', '', '', 'icon-user ', '2', '1', '', '2018-03-22 10:51:18', '2018-04-03 11:34:27');
INSERT INTO `jy_base_resources` VALUES ('4028818462a3f2730162a3f273790000', '修改密码', 'ed76bf221dd04ad5a2a8a724f11f1f4a', '1', '1', '/html/common/updataPass.html', '', '', '', '4', '1', '', '2018-04-08 14:29:58', '2018-04-08 14:30:47');
INSERT INTO `jy_base_resources` VALUES ('4028818462a3f2730162a3f3e72c0001', '修改密码', '402880e9624b9e2801624b9e28080000', '1', '1', '/html/common/updataPass.html', '', '', '', '7', '1', '', '2018-04-08 14:31:33', null);
INSERT INTO `jy_base_resources` VALUES ('404', '404', '9727f259cd8542fc8756b7b9cee9dd54', '3', '1', '/404', '', '', 'icon-exclamation-sign ', '99', '1', '404', '2015-10-30 17:18:31', '2015-12-13 14:51:24');
INSERT INTO `jy_base_resources` VALUES ('40a146e3febf4cafb930a077f1f048d3', '配置管理', '51424721ec1c4574b2f2a7bc1833c17f', '2', '1', '/backstage/weixin/config/index', '', '', 'icon-cog ', '10', '1', '', '2015-12-30 21:27:02', '2015-12-30 21:34:33');
INSERT INTO `jy_base_resources` VALUES ('41', '增加', '4', '1', '2', '/backstage/resources/add', 'addBtn', '', 'icon-plus-sign color-green', '1', '1', '增加', '2015-11-06 11:21:29', '2015-11-12 17:32:36');
INSERT INTO `jy_base_resources` VALUES ('415d9d3109234cc9a0ad15c612e63bdd', '发布车源', 'cdd36f994952404cb73fc5b4727754d7', '1', '1', '/car/tocaradd', '', '', '', '1', '1', '', '2017-12-28 09:43:40', '2018-01-03 15:18:55');
INSERT INTO `jy_base_resources` VALUES ('42a2938acb5e4a26b5ec2cc6089b7c2e', '修改角色', '3', '1', '3', '/backstage/org/role/update', '', 'edit', 'icon-edit color-blue', '3', '1', '', '2015-11-13 17:13:52', '2016-01-22 12:42:42');
INSERT INTO `jy_base_resources` VALUES ('439756a806314420971daf5d6787d62d', '新车信息表格', '23f40d71d1ad4421873046e30be16f8e', '1', '1', '/html/newcarlist/editcarlist.html', '', '', 'icon-bar-chart ', '2', '1', '', '2018-01-24 19:49:10', '2018-01-25 19:32:52');
INSERT INTO `jy_base_resources` VALUES ('45b89aec81dc4ff0b8d014ffe92a05bb', '运价走势和指数分析', '5bbadca08ef748e4a7dd9bbc2304b300', '1', '1', '/html/echarts/ecartshtml/pricetrend3.html', '', '', 'icon-picture ', '1', '1', '', '2018-01-11 19:54:02', '2018-01-11 20:05:16');
INSERT INTO `jy_base_resources` VALUES ('47ff0c409f314b07b52ba13f1bb81586', '导出', '55e7a2d527564d9790b9f00a00d34634', '2', '3', '/backstage/workflow/model/export', '', 'exportForm', 'icon-cloud-download color-pale-orange', '3', '1', '', '2016-01-18 19:04:39', '2016-01-18 19:13:50');
INSERT INTO `jy_base_resources` VALUES ('4a18aa13302b48dd98f7005aaa4096e2', '定位监控', '958a6acbe39f48009714ba1bcb1232e0', '1', '1', '/hdGps/getlocation', '', '', 'icon-bullseye ', '4', '1', '', '2018-03-05 16:30:16', '2018-03-05 16:34:03');
INSERT INTO `jy_base_resources` VALUES ('4c95475b93c944f89d185cd175960768', '运费管理', '7dda6657629342618c81797be0a4c5d4', '1', '1', '', '', '', 'icon-jpy ', '2', '1', '', '2018-03-05 11:06:24', null);
INSERT INTO `jy_base_resources` VALUES ('4c97ca25b7e940948b3d403c3b091c81', '增加角色', '3', '1', '2', '/backstage/org/role/add', 'addBtn', '', 'icon-plus-sign color-green', '1', '1', '', '2015-11-13 10:12:20', '2016-01-22 12:43:20');
INSERT INTO `jy_base_resources` VALUES ('4ee50d1722a34edeb6c15bdbf29e556b', '查看角色', '3', '1', '3', '/backstage/org/role/find', '', 'check', 'icon-zoom-in color-purple', '2', '1', '', '2015-11-13 16:27:36', '2016-01-22 12:42:52');
INSERT INTO `jy_base_resources` VALUES ('4f057f1a6d05416fbb06206b2aaffb10', '页面UI', '6', '3', '1', '/static/apidoc/JYUI/index.html', '', '', 'icon-html5 ', '2', '1', '', '2016-01-30 18:33:58', '2016-01-30 18:38:16');
INSERT INTO `jy_base_resources` VALUES ('5', '监控管理', '0', '4', '1', '', '', '', 'icon-linux', '10', '1', '', '2015-07-15 16:35:25', '2016-01-30 03:32:24');
INSERT INTO `jy_base_resources` VALUES ('51424721ec1c4574b2f2a7bc1833c17f', '微信管理', '0', '2', '1', '', '', '', 'icon-comments-alt ', '8', '1', '', '2015-12-27 15:22:08', '2016-01-30 00:24:04');
INSERT INTO `jy_base_resources` VALUES ('51aa6b0b037340b9ae88d22d2a354acf', '授权角色权限', '3', '1', '3', '/backstage/org/role/listAuthorized', '', 'authorized', 'icon-key color-dark-green', '1', '1', '', '2015-11-13 17:41:57', '2016-01-22 12:43:02');
INSERT INTO `jy_base_resources` VALUES ('52910f91bf3e4b71af4ded1ef67bba48', '历史流程', '58230413e8364b67af2bb65e64252260', '2', '1', '/backstage/workflow/instance/his/index', '', '', 'icon-save ', '4', '1', '', '2016-01-20 11:45:23', '2016-02-12 13:02:46');
INSERT INTO `jy_base_resources` VALUES ('55053558dc4f4ab0983337386969aced', '启动任务', 'a2eea33defc64462b3b3df9e64c461fb', '2', '3', '/backstage/task/scheduleJob/resumeJob', '', 'resumeJob', 'icon-play color-bright-blue', '2', '1', '', '2015-12-24 18:03:54', '2015-12-24 20:35:11');
INSERT INTO `jy_base_resources` VALUES ('55e7a2d527564d9790b9f00a00d34634', '模型工作区', '58230413e8364b67af2bb65e64252260', '2', '1', '/backstage/workflow/model/index', '', '', 'icon-edit-sign ', '10', '1', '', '2016-01-08 00:28:33', '2016-01-19 14:05:01');
INSERT INTO `jy_base_resources` VALUES ('567c82ba52af488ea079f3b04d157590', '承运人订单查询', '958a6acbe39f48009714ba1bcb1232e0', '1', '1', '/html/carrier/carrier-list.html', '', '', '', '8', '1', '', '2018-03-01 14:05:41', '2018-03-01 14:06:22');
INSERT INTO `jy_base_resources` VALUES ('58230413e8364b67af2bb65e64252260', '工作流管理', '0', '2', '1', '', '', '', 'icon-briefcase ', '3', '1', '', '2016-01-08 00:27:03', '2016-01-30 00:24:53');
INSERT INTO `jy_base_resources` VALUES ('5aa30b82be4642da8d63d14614b165b0', '电子报文', '7dda6657629342618c81797be0a4c5d4', '1', '1', '', '', '', 'icon-upload ', '5', '1', '', '2018-03-21 09:07:42', null);
INSERT INTO `jy_base_resources` VALUES ('5ba75d14f5b74572bd5ff35d12c58060', '删除角色', '3', '1', '3', '/backstage/org/role/del', '', 'del', 'icon-remove-sign color-red', '4', '1', '', '2015-11-13 17:21:08', '2016-01-22 12:42:29');
INSERT INTO `jy_base_resources` VALUES ('5bbadca08ef748e4a7dd9bbc2304b300', '统计信息', '3bfe84bade44428581b5102b5fabff36', '1', '1', '', '', '', 'icon-th ', '6', '1', '', '2018-01-11 19:03:06', '2018-01-11 19:03:29');
INSERT INTO `jy_base_resources` VALUES ('5d1b45e9b6a84bccb212758ce8f2e906', '同步关注者数据', '7b30d8d43df347ada558df820bbec28b', '2', '2', '/backstage/weixin/follower/syncFollower', 'syncFollowerBtn', '', 'icon-cloud-download color-pale-blue', '1', '1', '', '2015-12-30 15:42:47', '2015-12-30 15:46:04');
INSERT INTO `jy_base_resources` VALUES ('6', 'Api', '0', '3', '1', '', '', '', 'icon-adn', '98', '1', 'Api', '2015-09-23 15:56:37', '2016-01-30 00:24:45');
INSERT INTO `jy_base_resources` VALUES ('6d44f1553c424e5c81bd3ed9a4e162f3', '删除', '4', '1', '3', '/backstage/resources/del', '', 'del', 'icon-remove-sign color-red', '3', '1', '', '2015-11-12 16:23:58', '2015-11-12 16:31:33');
INSERT INTO `jy_base_resources` VALUES ('6ea62cf0820248a6a2780a885b82a99d', '修改', '14', '1', '3', '/backstage/dataDict/update', '', 'edit', 'icon-edit color-blue', '2', '1', '', '2015-11-18 16:11:53', '2015-11-24 14:10:05');
INSERT INTO `jy_base_resources` VALUES ('6fab62b407fd4df29cd315b7ce970ca5', '监控数据', '85e2c80eb4f3430881c20f556b7fdbb5', '4', '1', '/backstage/db/dbManage/index', '', '', 'icon-screenshot ', '1', '1', '', '2017-03-26 15:44:41', '2017-03-26 16:57:08');
INSERT INTO `jy_base_resources` VALUES ('72cbdeff2aea4aea8f348bb6d779a87d', '删除模型', '55e7a2d527564d9790b9f00a00d34634', '2', '3', '/backstage/workflow/model/del', '', 'del', 'icon-remove-sign color-red', '6', '1', '', '2016-01-18 18:27:01', '2016-01-18 18:27:32');
INSERT INTO `jy_base_resources` VALUES ('747a8ddc90b844c3a12dbe920e777052', '可拖动上传', '82652011fe8549d18d4652567f7b1610', '2', '1', '/backstage/tool/webuploader/test/more', '', '', 'icon-folder-open-alt ', '3', '1', '', '2016-01-06 17:55:19', '2016-01-06 17:55:48');
INSERT INTO `jy_base_resources` VALUES ('75288771d60d4510affe8cb97f42897f', '删除', '10', '1', '3', '/backstage/sysDict/del', '', 'del', 'icon-remove-sign color-red', '3', '1', '', '2015-11-16 16:38:16', '2015-11-24 11:33:16');
INSERT INTO `jy_base_resources` VALUES ('7537535a8b5d44009f52a3e84ca5dfd8', '编辑模型', '55e7a2d527564d9790b9f00a00d34634', '2', '3', '/backstage/workflow/model/edit', '', 'edit', 'icon-edit color-blue', '1', '1', '', '2016-01-18 18:02:28', '2016-01-18 18:28:08');
INSERT INTO `jy_base_resources` VALUES ('7579afb168b04a3d99fff9dbe956936e', '定时任务日志', 'b78f7224d001404c92479532c614dffa', '2', '1', '/backstage/task/taskLog/index', '', '', 'icon-eye-open ', '2', '1', '', '2015-12-24 19:51:42', '2015-12-24 20:30:38');
INSERT INTO `jy_base_resources` VALUES ('783938b7cdc947c68cf48d734aed51cc', '发布货源', 'b8c7e7b96d274095a5494277793d39b4', '1', '1', '/goods/togoodsadd', '', '', '', '1', '1', '', '2017-12-28 09:41:24', '2018-01-03 15:17:26');
INSERT INTO `jy_base_resources` VALUES ('78b1bf1c0723433099c458e75a8c6901', '修改', '10', '1', '3', '/backstage/sysDict/update', '', 'edit', 'icon-edit color-blue', '2', '1', '', '2015-11-16 16:37:44', '2015-11-24 14:08:26');
INSERT INTO `jy_base_resources` VALUES ('79a76d451f3948f4963b97b6d5bbbf3c', '邮箱中心', '08693c30017e4e45acff89d300067269', '2', '1', '/backstage/tool/email/index', '', '', 'icon-envelope-alt ', '1', '1', '', '2015-12-02 15:57:52', '2015-12-25 17:32:49');
INSERT INTO `jy_base_resources` VALUES ('7b30d8d43df347ada558df820bbec28b', '关注者管理', '51424721ec1c4574b2f2a7bc1833c17f', '2', '1', '/backstage/weixin/follower/index', '', '', 'icon-group ', '1', '1', '', '2015-12-29 23:52:59', '2015-12-29 23:53:34');
INSERT INTO `jy_base_resources` VALUES ('7c1741c605c148c29113ac804f68f52b', '登录日志', '5', '4', '1', '/backstage/loginLog/index', '', '', 'icon-eye-open ', '2', '1', '', '2015-11-25 16:56:41', '2015-11-25 17:17:37');
INSERT INTO `jy_base_resources` VALUES ('7d6a6b7594b14807a3def610f6595804', '导出日志', '7579afb168b04a3d99fff9dbe956936e', '2', '2', '/backstage/task/taskLog/exportXls', 'exportXls', '', 'icon-table color-dark-green', '1', '1', '', '2016-01-07 19:24:05', '2016-01-07 23:10:20');
INSERT INTO `jy_base_resources` VALUES ('7dda6657629342618c81797be0a4c5d4', '平台管理', '0', '1', '1', '', '', '', 'icon-th ', '3', '1', '', '2018-03-05 08:22:57', '2018-03-05 11:03:28');
INSERT INTO `jy_base_resources` VALUES ('7defb04cc0784ba1b80c0540e7877545', '资质审核', '7dda6657629342618c81797be0a4c5d4', '1', '1', '', '', '', 'icon-calendar-empty ', '1', '1', '', '2018-03-05 11:04:53', '2018-03-05 11:10:09');
INSERT INTO `jy_base_resources` VALUES ('7eba58c432d04a38a51918e37b7cb124', '货车市场', '3bfe84bade44428581b5102b5fabff36', '1', '1', '', '', '', 'icon-ambulance ', '5', '1', '', '2018-01-08 14:08:46', '2018-01-08 14:08:59');
INSERT INTO `jy_base_resources` VALUES ('7f2059c3963f4c85ad79877fc39d0f87', '企业认证', '402880e9624b9e2801624b9e28080000', '1', '1', '/menber/toaccreditation', '', '', '', '6', '1', '', '2018-01-02 20:28:36', '2018-03-22 11:00:39');
INSERT INTO `jy_base_resources` VALUES ('80fd6468064440cf8beaa9a5691c4330', '车辆周期', '5bbadca08ef748e4a7dd9bbc2304b300', '1', '1', '/html/echarts/ecartshtml/cheliangzhouqi.html', '', '', 'icon-off ', '2', '1', '', '2018-01-12 10:02:58', '2018-01-12 10:06:48');
INSERT INTO `jy_base_resources` VALUES ('82652011fe8549d18d4652567f7b1610', '上传工具', '08693c30017e4e45acff89d300067269', '2', '1', '', '', '', 'icon-cloud-upload ', '5', '1', '', '2016-01-06 17:52:47', null);
INSERT INTO `jy_base_resources` VALUES ('83079eb98aa24f73bfb1be11852ac9fc', '新车列表', '23f40d71d1ad4421873046e30be16f8e', '1', '1', '/hdNewveh/newveh', '', '', 'icon-ambulance ', '1', '1', '', '2018-01-08 14:10:26', '2018-01-25 19:32:35');
INSERT INTO `jy_base_resources` VALUES ('83718e6be30b4d37894038eb5c8f8f2d', '新车详情编辑', '23f40d71d1ad4421873046e30be16f8e', '1', '1', '/html/newcarlist/newcarmsgeditor.html', '', '', 'icon-edit ', '3', '1', '', '2018-01-25 17:59:03', '2018-01-25 19:33:17');
INSERT INTO `jy_base_resources` VALUES ('83984d22f9da4991833f506695307b6f', '查看', '2', '1', '3', '/backstage/account/find', '', 'check', 'icon-zoom-in color-purple', '2', '1', '', '2015-11-16 09:49:48', '2015-11-24 14:52:57');
INSERT INTO `jy_base_resources` VALUES ('85e2c80eb4f3430881c20f556b7fdbb5', '数据库管理', '0', '4', '1', '', '', '', 'icon-list-alt ', '2', '1', '', '2017-03-26 15:41:18', null);
INSERT INTO `jy_base_resources` VALUES ('89ff6bdf54ca4501a264adba8eb0ee39', '修改', '2', '1', '3', '/backstage/account/update', '', 'edit', 'icon-edit color-blue', '3', '1', '', '2015-11-16 10:29:15', '2015-11-24 14:53:21');
INSERT INTO `jy_base_resources` VALUES ('8cc0bcbb9bae4ebe81d263de37ef15a6', '二维码处理', '08693c30017e4e45acff89d300067269', '2', '1', '/backstage/tool/qrCode/index', '', '', 'icon-barcode ', '3', '1', '', '2016-04-03 16:24:40', null);
INSERT INTO `jy_base_resources` VALUES ('9037c1737a904fc3bf18e0ef7a6b6e05', '接口工具', '08693c30017e4e45acff89d300067269', '2', '1', '/backstage/tool/interfaceTest/index', '', '', 'icon-resize-small ', '5', '1', '', '2016-04-09 19:24:49', null);
INSERT INTO `jy_base_resources` VALUES ('90c2e721d4694d0b930bf976e6353f38', '个人承运人', '7defb04cc0784ba1b80c0540e7877545', '1', '1', '/html/common/self/personal-verify.html', '', '', '', '1', '1', '', '2018-03-05 11:09:20', '2018-03-05 15:16:09');
INSERT INTO `jy_base_resources` VALUES ('9575841c8b6a4c58b10e97d82320fd02', '增加', '10', '1', '2', '/backstage/sysDict/add', 'addBtn', '', 'icon-plus-sign color-green', '1', '1', '', '2015-11-16 16:30:02', '2015-11-24 11:19:42');
INSERT INTO `jy_base_resources` VALUES ('958a6acbe39f48009714ba1bcb1232e0', '订单信息', '3bfe84bade44428581b5102b5fabff36', '1', '1', '', '', '', 'icon-file-text-alt ', '4', '1', '', '2017-12-28 09:45:58', '2017-12-28 14:48:36');
INSERT INTO `jy_base_resources` VALUES ('9727f259cd8542fc8756b7b9cee9dd54', '错误页', '6', '3', '1', '', '', '', 'icon-tag ', '200', '1', '', '2015-12-13 14:51:00', '2016-02-10 17:58:46');
INSERT INTO `jy_base_resources` VALUES ('9ba1dbda9e414eff8591cda4aea34c32', '批量删除', '7579afb168b04a3d99fff9dbe956936e', '2', '2', '/backstage/task/taskLog/delBatch', 'delBatchBtn', '', 'icon-trash color-red', '2', '1', '', '2015-12-24 21:05:06', '2016-01-07 22:59:22');
INSERT INTO `jy_base_resources` VALUES ('9bc994928cc64fdca432fcad2a0b3ba9', '我的任务', 'e750134d22094ef3a611fe8300c351e9', '3', '1', '', '', '', 'icon-signout ', '2', '1', '', '2016-01-20 11:59:17', '2016-02-12 13:12:35');
INSERT INTO `jy_base_resources` VALUES ('9bd48a7e0ca74b77b577411c8e4b7c2b', '运行一次任务', 'a2eea33defc64462b3b3df9e64c461fb', '2', '3', '/backstage/task/scheduleJob/runOnce', '', 'runOnce', 'icon-step-forward color-yellow', '1', '1', '', '2015-12-24 18:08:11', '2015-12-24 20:34:54');
INSERT INTO `jy_base_resources` VALUES ('9c43dbd6fd2745b78b72bb6a816d1d54', '托运单上传', '5aa30b82be4642da8d63d14614b165b0', '1', '1', '/hdConsignmentUpload/toConsignmentUpload', '', '', '', '1', '1', '', '2018-03-21 09:09:45', '2018-03-26 11:23:38');
INSERT INTO `jy_base_resources` VALUES ('9cff3045dd824773a70c5a887a2f71ef', '待办任务', '9bc994928cc64fdca432fcad2a0b3ba9', '3', '1', '/backstage/workflow/online/myTask/todoList', '', '', 'icon-tags ', '2', '1', '', '2016-02-11 23:53:52', null);
INSERT INTO `jy_base_resources` VALUES ('a103f06e9c7f4e8aafc5eaf4c735fd91', '任务申请', 'e750134d22094ef3a611fe8300c351e9', '3', '1', '', '', '', 'icon-paste ', '1', '1', '', '2016-01-20 12:33:14', '2016-01-20 16:35:43');
INSERT INTO `jy_base_resources` VALUES ('a1b4ef2728d9456aa4e9a85d68c6029e', '文件上传', '82652011fe8549d18d4652567f7b1610', '2', '1', '/backstage/tool/webuploader/test/file', '', '', 'icon-folder-close ', '2', '1', '', '2016-01-06 17:54:09', null);
INSERT INTO `jy_base_resources` VALUES ('a201aa381c3447aeaae23bdb478b3a06', '删除流程', '18756082926f41329e51d74dda3abc80', '2', '3', '/backstage/workflow/process/del', '', 'del', 'icon-remove-sign color-red', '1', '1', '', '2016-01-19 17:47:55', '2016-01-19 18:03:39');
INSERT INTO `jy_base_resources` VALUES ('a213cc3a8be64a77b9d8673619230a87', '修改任务', 'a2eea33defc64462b3b3df9e64c461fb', '2', '3', '/backstage/task/scheduleJob/update', '', 'edit', 'icon-edit color-blue', '5', '1', '', '2015-12-24 12:42:10', '2015-12-24 20:35:35');
INSERT INTO `jy_base_resources` VALUES ('a2a465e7c7ae4f92b1ad2b2afec1a7b9', '二手车信息表格', 'db620a86882840ee92026006343781ea', '1', '1', '/html/oldcarlist/oldeditlist.html', '', '', 'icon-th ', '3', '1', '', '2018-01-26 11:05:22', null);
INSERT INTO `jy_base_resources` VALUES ('a2eea33defc64462b3b3df9e64c461fb', '定时任务管理', 'b78f7224d001404c92479532c614dffa', '2', '1', '/backstage/task/scheduleJob/index', '', '', 'icon-list-alt ', '1', '1', '', '2015-12-23 18:17:34', '2015-12-24 20:34:40');
INSERT INTO `jy_base_resources` VALUES ('ae8fea67b8434987b718c51fe83bb45d', '增加', '2', '1', '2', '/backstage/account/add', 'addBtn', '', 'icon-plus-sign color-green', '1', '1', '', '2015-11-15 17:34:33', '2015-11-24 14:52:44');
INSERT INTO `jy_base_resources` VALUES ('b1ba61f394cd499c9304e995f881a764', '操作日志', '5', '4', '1', '/backstage/optLog/index', '', '', 'icon-list-alt ', '2', '1', '', '2016-12-20 17:49:15', null);
INSERT INTO `jy_base_resources` VALUES ('b20375c2bc9a48b098b000d02a770a62', '所有订单信息管理', '958a6acbe39f48009714ba1bcb1232e0', '1', '1', '/html/common/all-info/allinfo.html', '', '', '', '6', '1', '', '2018-01-19 10:54:01', '2018-01-21 11:04:34');
INSERT INTO `jy_base_resources` VALUES ('b2763b8c73e6475e8b332e0dafda92e7', '我的车源列表', 'cdd36f994952404cb73fc5b4727754d7', '1', '1', '/car/tomycarlist', '', '', '', '4', '1', '', '2018-01-04 17:38:51', '2018-01-04 17:48:31');
INSERT INTO `jy_base_resources` VALUES ('b4ef74f46fd849128836b8f2776b4570', '物流节点控制和异常记录', '5bbadca08ef748e4a7dd9bbc2304b300', '1', '1', '/html/echarts/ecartshtml/nodecontrol5.html', '', '', 'icon-picture ', '1', '1', '', '2018-01-11 19:59:33', null);
INSERT INTO `jy_base_resources` VALUES ('b776518dfdd940e394a15de3974a8610', '运行中流程', '58230413e8364b67af2bb65e64252260', '2', '1', '/backstage/workflow/instance/pro/index', '', '', 'icon-expand ', '1', '1', '', '2016-01-19 14:01:38', '2016-02-12 13:02:37');
INSERT INTO `jy_base_resources` VALUES ('b78f7224d001404c92479532c614dffa', '任务中心', '0', '2', '1', '', '', '', 'icon-bell-alt ', '7', '1', '', '2015-12-23 18:15:23', '2016-01-30 00:24:15');
INSERT INTO `jy_base_resources` VALUES ('b7d11fca02b04742814eb664454d7473', '地图工具', '08693c30017e4e45acff89d300067269', '2', '1', '/backstage/tool/map/index', '', '', 'icon-screenshot ', '3', '1', '', '2015-12-25 17:32:30', '2015-12-25 17:33:12');
INSERT INTO `jy_base_resources` VALUES ('b7e74a818e6c4a879a8c0dcdd28d3526', '企业信息', '402880e9624b9e2801624b9e28080000', '1', '1', '/menber/tobasiccom', '', '', '', '4', '1', '', '2018-01-02 20:24:47', '2018-03-22 10:57:58');
INSERT INTO `jy_base_resources` VALUES ('b8203143736e4e549b2e0fc3c617d4c4', '转换模型', '18756082926f41329e51d74dda3abc80', '2', '3', '/backstage/workflow/process/convertToModel', '', 'convertToModel', 'icon-edit-sign color-gray', '2', '1', '', '2016-01-19 17:50:41', '2016-01-19 18:18:46');
INSERT INTO `jy_base_resources` VALUES ('b8c7e7b96d274095a5494277793d39b4', '货源中心', '3bfe84bade44428581b5102b5fabff36', '1', '1', '', '', '', 'icon-folder-close ', '2', '1', '', '2017-12-26 17:36:46', '2017-12-28 10:46:39');
INSERT INTO `jy_base_resources` VALUES ('ba8c2c172df54fc992369b3671b6c787', '我的货源列表', 'b8c7e7b96d274095a5494277793d39b4', '1', '1', '/goods/tomygoodslist', '', '', '', '4', '1', '', '2018-01-06 08:56:11', null);
INSERT INTO `jy_base_resources` VALUES ('ba9a4be6005d4bdf9040e20ae0ee4db5', '货源查询', 'b8c7e7b96d274095a5494277793d39b4', '1', '1', '/goods/togoodslist', '', '', '', '2', '1', '', '2017-12-28 09:42:40', '2018-01-04 17:39:29');
INSERT INTO `jy_base_resources` VALUES ('bda72211ff08493fa9f0d50097b9cc2a', '司机管理', '3bfe84bade44428581b5102b5fabff36', '1', '1', '', '', '', 'icon-user ', '3', '1', '', '2018-03-06 17:13:59', '2018-03-06 17:18:35');
INSERT INTO `jy_base_resources` VALUES ('bdda4065d9904e718e8dd70e035bdb43', '货物基本信息', 'b8c7e7b96d274095a5494277793d39b4', '1', '1', '/goods/togoodsbasic', '', '', '', '3', '1', '', '2017-12-28 08:56:00', '2018-01-29 18:46:26');
INSERT INTO `jy_base_resources` VALUES ('bf888841c15e4da5858299ef99376eb4', '图片上传', '82652011fe8549d18d4652567f7b1610', '2', '1', '/backstage/tool/webuploader/test/img', '', '', 'icon-picture ', '1', '1', '', '2016-01-06 17:53:33', '2016-01-06 18:02:58');
INSERT INTO `jy_base_resources` VALUES ('c16165aa1f274c0f83199c0b4b197a30', '托运人费用管理', '4c95475b93c944f89d185cd175960768', '1', '1', '/html/common/all-info/captitalpayconfirm.html', '', '', 'icon-bar-chart ', '1', '1', '', '2018-03-12 15:51:20', null);
INSERT INTO `jy_base_resources` VALUES ('c1cd51388c2a4527ba202ea5502fbf59', '企业承运人', '7defb04cc0784ba1b80c0540e7877545', '1', '1', '/html/common/enterprise/company-verify.html', '', '', '', '2', '1', '', '2018-03-05 11:10:41', '2018-03-05 15:05:21');
INSERT INTO `jy_base_resources` VALUES ('c5851423b69449a2b6f92a6e43d7c154', '我的竞价列表信息', '958a6acbe39f48009714ba1bcb1232e0', '1', '1', '/bidpage/tomybidlist', '', '', '', '3', '1', '', '2018-01-16 17:16:32', null);
INSERT INTO `jy_base_resources` VALUES ('c5aad93b3c6747a0bdbbcf58cf260a6b', '投诉管理', '7dda6657629342618c81797be0a4c5d4', '1', '1', '/hdComplain/todealcomplain', '', '', 'icon-question ', '4', '1', '', '2018-03-05 11:07:05', '2018-04-04 10:05:40');
INSERT INTO `jy_base_resources` VALUES ('c669fba98a9446999b62d15bfff1c412', '删除任务', 'a2eea33defc64462b3b3df9e64c461fb', '2', '3', '/backstage/task/scheduleJob/del', '', 'del', 'icon-remove-sign color-red', '6', '1', '', '2015-12-24 12:42:59', '2015-12-24 20:35:02');
INSERT INTO `jy_base_resources` VALUES ('c73d630ab1004b5a9b71836e8b000de9', '职务管理', '1', '1', '1', '/backstage/org/position/index', '', '', 'icon-user-md ', '3', '1', '', '2016-01-21 23:13:00', '2016-01-22 00:17:08');
INSERT INTO `jy_base_resources` VALUES ('c924250d1b184982a89b499ba7a3f5cc', '车源查询', 'cdd36f994952404cb73fc5b4727754d7', '1', '1', '/car/tocarlist', '', '', '', '2', '1', '', '2017-12-28 09:44:14', '2018-01-03 15:19:23');
INSERT INTO `jy_base_resources` VALUES ('c9c822f6c7b94650a6f3944c53738caf', '部署', '55e7a2d527564d9790b9f00a00d34634', '2', '3', '/backstage/workflow/model/deploy', '', 'deployModel', 'icon-retweet color-bright-blue', '2', '1', '', '2016-01-18 19:11:59', '2016-01-18 23:08:04');
INSERT INTO `jy_base_resources` VALUES ('cbf35392bc534d5fa8fbd94a1122e0b6', 'Cron在线生成', '6', '3', '1', '/static/apidoc/cronGenerator/index.html', '', '', 'icon-adn ', '34', '1', '', '2017-11-10 18:22:58', '2017-11-10 18:25:30');
INSERT INTO `jy_base_resources` VALUES ('cd7ef89bf12f4ceb98861cf2bcbc96b1', '查看', '10', '1', '3', '/backstage/sysDict/find', '', 'check', 'icon-zoom-in color-purple', '1', '1', '', '2015-11-16 16:37:11', '2015-11-24 14:25:48');
INSERT INTO `jy_base_resources` VALUES ('cdd36f994952404cb73fc5b4727754d7', '车源中心', '3bfe84bade44428581b5102b5fabff36', '1', '1', '', '', '', 'icon-truck ', '3', '1', '', '2017-12-26 17:38:01', '2017-12-28 14:46:17');
INSERT INTO `jy_base_resources` VALUES ('ce50302a3ca84a2fac042d30cb171961', '承运人费用管理', '4c95475b93c944f89d185cd175960768', '1', '1', '/html/common/all-info/captiytalgiveout.html', '', '', 'icon-bar-chart ', '2', '1', '', '2018-03-12 15:54:00', null);
INSERT INTO `jy_base_resources` VALUES ('d22f22f0bc9a4ad2a6464cca6497a7b4', '批量删除角色', '3', '1', '2', '/backstage/org/role/delBatch', 'delBatchBtn', '', 'icon-trash color-red', '2', '1', '', '2015-11-13 15:21:16', '2016-01-22 12:43:12');
INSERT INTO `jy_base_resources` VALUES ('d4e7a2fccd19447ebf8bdb26fba18c5e', '询价客户信息', '23f40d71d1ad4421873046e30be16f8e', '1', '1', '/html/newcarlist/askpricelist.html', '', '', 'icon-user ', '4', '1', '', '2018-01-21 17:52:47', '2018-01-25 19:33:33');
INSERT INTO `jy_base_resources` VALUES ('d7419f56ce154ff2ba335c1f8f4ade17', 'SQL编辑器', '85e2c80eb4f3430881c20f556b7fdbb5', '4', '1', '/backstage/db/dbEditor/index', '', '', 'icon-bolt ', '2', '1', '', '2017-11-10 17:58:14', null);
INSERT INTO `jy_base_resources` VALUES ('db620a86882840ee92026006343781ea', '二手车市场', '7eba58c432d04a38a51918e37b7cb124', '1', '1', '', '', '', 'icon-ambulance ', '1', '1', '', '2018-01-25 19:30:34', null);
INSERT INTO `jy_base_resources` VALUES ('dbb1d5db4d7b419db1d221b102a7ad51', '批量删除', '14', '1', '2', '/backstage/dataDict/delBatch', 'delBatchBtn', '', 'icon-trash color-red', '2', '1', '', '2015-11-18 16:06:31', '2015-11-24 14:16:46');
INSERT INTO `jy_base_resources` VALUES ('dc4a83f740f54f6b89916321968cbcd3', '请假申请', 'a103f06e9c7f4e8aafc5eaf4c735fd91', '3', '1', '/backstage/workflow/online/apply/index', '', '', 'icon-paste ', '1', '1', '', '2016-01-20 16:45:09', '2016-01-20 17:40:09');
INSERT INTO `jy_base_resources` VALUES ('dde1c043e77d48b4ac2f15806a0aec14', '批量删除', '10', '1', '2', '/backstage/sysDict/delBatch', 'delBatchBtn', '', 'icon-trash color-red', '2', '1', '', '2015-11-16 16:30:33', '2015-11-24 14:24:50');
INSERT INTO `jy_base_resources` VALUES ('de998a250fcb4c2ab88981f2093d54f3', '查看任务', 'a2eea33defc64462b3b3df9e64c461fb', '2', '3', '/backstage/task/scheduleJob/find', '', 'check', 'icon-zoom-in color-purple', '4', '1', '', '2015-12-24 12:40:39', '2015-12-24 20:35:27');
INSERT INTO `jy_base_resources` VALUES ('e32736e5780640908fdb166bad8877d8', '货物位置', '5bbadca08ef748e4a7dd9bbc2304b300', '1', '1', '/html/echarts/ecartshtml/goods.html', '', '', 'icon-off ', '1', '1', '', '2018-01-11 19:48:47', null);
INSERT INTO `jy_base_resources` VALUES ('e49f8b358da2404293f6ac4e7f7a7a30', '已结束任务', 'e750134d22094ef3a611fe8300c351e9', '3', '1', '/backstage/workflow/online/his/index', '', '', 'icon-save ', '4', '1', '', '2016-01-20 12:32:28', '2016-01-28 19:04:14');
INSERT INTO `jy_base_resources` VALUES ('e750134d22094ef3a611fe8300c351e9', '在线办公', '0', '3', '1', '', '', '', 'icon-bell ', '3', '1', '', '2016-01-20 11:49:47', '2016-01-30 00:24:41');
INSERT INTO `jy_base_resources` VALUES ('e9480dd6590a4e14a443ee8f76873fd3', '查看', '14', '1', '3', '/backstage/dataDict/find', '', 'check', 'icon-zoom-in color-purple', '1', '1', '', '2015-11-18 16:11:18', '2015-11-24 14:10:24');
INSERT INTO `jy_base_resources` VALUES ('ea87935658a44519a5d77d0d4bac7296', '运营效率多维度分析', '5bbadca08ef748e4a7dd9bbc2304b300', '1', '1', '/html/echarts/ecartshtml/tranefficiency9.html', '', '', 'icon-picture ', '1', '1', '', '2018-01-11 20:01:32', null);
INSERT INTO `jy_base_resources` VALUES ('eca65d56fb61495ebcfd7c572c2ea91b', '查看表结构', '6fab62b407fd4df29cd315b7ce970ca5', '4', '3', '/backstage/db/dbManage/dbStructure', '', 'checkStructure', 'icon-sitemap color-bright-blue', '2', '1', '', '2017-03-26 16:08:53', '2017-03-26 17:06:33');
INSERT INTO `jy_base_resources` VALUES ('ed76bf221dd04ad5a2a8a724f11f1f4a', '会员中心', '3bfe84bade44428581b5102b5fabff36', '1', '1', '/html/common/menber-center.html', '', '', 'icon-user ', '1', '1', '', '2017-12-26 17:30:13', '2018-04-03 11:34:02');
INSERT INTO `jy_base_resources` VALUES ('ee4ae52c7759417698651a48a4686979', '车辆信息录入', '219b4e8b576345b285c7232642ff5172', '1', '1', '/car/tocarinfo', '', '', '', '1', '1', '', '2017-12-28 09:44:53', '2018-03-06 17:12:19');
INSERT INTO `jy_base_resources` VALUES ('ef3a950b6154459589acc7dd7145e0ed', '暂停任务', 'a2eea33defc64462b3b3df9e64c461fb', '2', '3', '/backstage/task/scheduleJob/pauseJob', '', 'pauseJob', 'icon-pause color-dark-gray', '3', '1', '', '2015-12-24 18:05:55', '2015-12-24 20:35:19');
INSERT INTO `jy_base_resources` VALUES ('f541a86e629d4eefb014309c921a237e', '运行中任务', 'e750134d22094ef3a611fe8300c351e9', '3', '1', '/backstage/workflow/online/run/index', '', '', 'icon-expand ', '3', '1', '', '2016-01-20 12:31:55', '2016-01-28 18:24:09');
INSERT INTO `jy_base_resources` VALUES ('f6ec54ae6b1941f9af8ae6aaa65fa667', '基本信息', 'ed76bf221dd04ad5a2a8a724f11f1f4a', '1', '1', '/menber/tobasic', '', '', '', '1', '1', '', '2017-12-26 17:42:52', '2017-12-28 14:07:56');
INSERT INTO `jy_base_resources` VALUES ('f7f1f90af08e4b06b9dcc750226efd8f', '承运订单管理', '958a6acbe39f48009714ba1bcb1232e0', '1', '1', '/html/common/all-info/accept-order.html', '', '', '', '8', '1', '', '2018-01-21 11:11:26', '2018-01-21 11:39:14');
INSERT INTO `jy_base_resources` VALUES ('fa04b6fe03944f2a9c040dbc9071af9b', '密码重置', '2', '1', '3', '/backstage/account/resetPwd', '', 'resetPwd', 'icon-unlock-alt color-pale-orange', '1', '1', '', '2015-11-16 10:49:17', '2015-11-26 17:16:54');
INSERT INTO `jy_base_resources` VALUES ('fc94dfb51c8a49bea189eef1433c6ce5', '货车流向', '5bbadca08ef748e4a7dd9bbc2304b300', '1', '1', '/html/echarts/ecartshtml/feiji.html', '', '', 'icon-zoom-in ', '3', '1', '', '2018-01-12 10:07:27', '2018-01-12 10:13:07');
INSERT INTO `jy_base_resources` VALUES ('fca408a363044f95bf12dc51d1b75105', '车辆基本信息', '219b4e8b576345b285c7232642ff5172', '1', '1', '/car/tocarbasic', '', '', '', '2', '1', '', '2018-01-31 15:29:26', '2018-03-06 17:10:49');
INSERT INTO `jy_base_resources` VALUES ('fdefc2595ad941e5852e03ad7f4fe864', '我的保险', '958a6acbe39f48009714ba1bcb1232e0', '1', '1', '', '', '', 'icon-linux ', '4', '1', '只对货物保险有效', '2018-01-05 21:16:17', '2018-01-05 21:16:36');
INSERT INTO `jy_base_resources` VALUES ('fe3b1d7478804c079d3e0489bad16b09', '绩效考核', '7dda6657629342618c81797be0a4c5d4', '1', '1', '/html/jixiao/jixiao.html', '', '', 'icon-foursquare ', '3', '1', '', '2018-03-05 11:08:10', '2018-04-08 08:14:23');

-- ----------------------------
-- Table structure for jy_base_role
-- ----------------------------
DROP TABLE IF EXISTS `jy_base_role`;
CREATE TABLE `jy_base_role` (
  `id` varchar(32) NOT NULL,
  `orgId` varchar(32) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `isValid` int(2) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jy_base_role
-- ----------------------------
INSERT INTO `jy_base_role` VALUES ('02665eef40a74e9cb22c602676f6b460', 'f1a2bc7677ff4e86b1d07dbdbcacab4c', '企业承运人', '1', '注册时选择的角色', '2017-12-29 10:00:30', '2018-03-05 15:41:22');
INSERT INTO `jy_base_role` VALUES ('05c149e71c1a495789b2d507d61e08af', 'f1a2bc7677ff4e86b1d07dbdbcacab4c', '企业正式会员', '1', '企业完善资质信息后成为正式会员', '2018-03-05 15:39:34', null);
INSERT INTO `jy_base_role` VALUES ('0f9600afc9274f74b16db37a784a84dc', '11', '业务员', '1', '', '2015-12-14 23:07:42', null);
INSERT INTO `jy_base_role` VALUES ('1', '2', '普通角色', '1', '普通角色', null, '2015-11-24 15:12:08');
INSERT INTO `jy_base_role` VALUES ('2', '2', '管理员', '1', '管理员', null, null);
INSERT INTO `jy_base_role` VALUES ('20bd50a12fdf4290ba719c72bfc91849', '8f080b6180564157aa173cc26e44d1dd', '人事经理', '1', '', '2016-02-27 19:10:00', null);
INSERT INTO `jy_base_role` VALUES ('3', '4', '超级管理员', '1', '超级管理员', null, '2015-12-10 01:28:51');
INSERT INTO `jy_base_role` VALUES ('3f84f0a74e9e4c58a926d5a75fd91e21', 'f1a2bc7677ff4e86b1d07dbdbcacab4c', '个人正式会员', '1', '个人完善资质信息后可以正式发货', '2018-03-05 15:38:59', '2018-03-05 15:39:57');
INSERT INTO `jy_base_role` VALUES ('4', '4', '开发者', '1', '开发者', null, null);
INSERT INTO `jy_base_role` VALUES ('4ac4ad4eb43d41249823fc2007ce839d', 'f1a2bc7677ff4e86b1d07dbdbcacab4c', '个人正式承运人', '1', '个人完善资质信息后可以正式承运货物', '2018-03-05 15:38:31', '2018-03-05 15:40:43');
INSERT INTO `jy_base_role` VALUES ('5b8661cb83114d28b2c733f70dc98f4e', 'f1a2bc7677ff4e86b1d07dbdbcacab4c', '个人承运人', '1', '注册时选择的角色', '2017-12-29 10:00:21', '2018-03-05 15:41:09');
INSERT INTO `jy_base_role` VALUES ('676ce458606440b5a4eded5485647e48', 'f1a2bc7677ff4e86b1d07dbdbcacab4c', '企业正式承运人', '1', '企业完成资质认证后可以承运货物', '2018-03-05 15:38:44', '2018-03-05 15:40:21');
INSERT INTO `jy_base_role` VALUES ('90fc68b9c6dd4baa8be265805118171f', 'f1a2bc7677ff4e86b1d07dbdbcacab4c', '公共信息平台', '1', '', '2017-12-28 10:55:48', null);
INSERT INTO `jy_base_role` VALUES ('c3e444b71e744a94b76c79e429f61631', 'f1a2bc7677ff4e86b1d07dbdbcacab4c', '企业会员', '1', '注册时选择的角色', '2017-12-29 10:00:57', '2018-03-05 15:43:31');
INSERT INTO `jy_base_role` VALUES ('cde1daaf551b41e98bfeded725f119ab', 'f1a2bc7677ff4e86b1d07dbdbcacab4c', '个人会员', '1', '注册时选择的角色', '2017-12-29 10:00:43', '2018-03-05 15:43:23');

-- ----------------------------
-- Table structure for jy_base_role_resources
-- ----------------------------
DROP TABLE IF EXISTS `jy_base_role_resources`;
CREATE TABLE `jy_base_role_resources` (
  `role_id` varchar(32) NOT NULL,
  `resources_id` varchar(32) NOT NULL,
  PRIMARY KEY (`role_id`,`resources_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jy_base_role_resources
-- ----------------------------
INSERT INTO `jy_base_role_resources` VALUES ('02665eef40a74e9cb22c602676f6b460', '153208eb05c549898a91e0a1a04b13a6');
INSERT INTO `jy_base_role_resources` VALUES ('02665eef40a74e9cb22c602676f6b460', '219b4e8b576345b285c7232642ff5172');
INSERT INTO `jy_base_role_resources` VALUES ('02665eef40a74e9cb22c602676f6b460', '2c663bd9a2fc4d82b26eb1032d5c00b1');
INSERT INTO `jy_base_role_resources` VALUES ('02665eef40a74e9cb22c602676f6b460', '3bfe84bade44428581b5102b5fabff36');
INSERT INTO `jy_base_role_resources` VALUES ('02665eef40a74e9cb22c602676f6b460', '402880e9624b9e2801624b9e28080000');
INSERT INTO `jy_base_role_resources` VALUES ('02665eef40a74e9cb22c602676f6b460', '4028818462a3f2730162a3f3e72c0001');
INSERT INTO `jy_base_role_resources` VALUES ('02665eef40a74e9cb22c602676f6b460', '7f2059c3963f4c85ad79877fc39d0f87');
INSERT INTO `jy_base_role_resources` VALUES ('02665eef40a74e9cb22c602676f6b460', 'b7e74a818e6c4a879a8c0dcdd28d3526');
INSERT INTO `jy_base_role_resources` VALUES ('02665eef40a74e9cb22c602676f6b460', 'bda72211ff08493fa9f0d50097b9cc2a');
INSERT INTO `jy_base_role_resources` VALUES ('02665eef40a74e9cb22c602676f6b460', 'ee4ae52c7759417698651a48a4686979');
INSERT INTO `jy_base_role_resources` VALUES ('02665eef40a74e9cb22c602676f6b460', 'fca408a363044f95bf12dc51d1b75105');
INSERT INTO `jy_base_role_resources` VALUES ('05c149e71c1a495789b2d507d61e08af', '0cd4f53a9a5a49eb81058d94c3baeed8');
INSERT INTO `jy_base_role_resources` VALUES ('05c149e71c1a495789b2d507d61e08af', '2c663bd9a2fc4d82b26eb1032d5c00b1');
INSERT INTO `jy_base_role_resources` VALUES ('05c149e71c1a495789b2d507d61e08af', '31018b89dde34513ad30c3b4b55256a7');
INSERT INTO `jy_base_role_resources` VALUES ('05c149e71c1a495789b2d507d61e08af', '3bfe84bade44428581b5102b5fabff36');
INSERT INTO `jy_base_role_resources` VALUES ('05c149e71c1a495789b2d507d61e08af', '402880e9624b9e2801624b9e28080000');
INSERT INTO `jy_base_role_resources` VALUES ('05c149e71c1a495789b2d507d61e08af', '4028818462a3f2730162a3f3e72c0001');
INSERT INTO `jy_base_role_resources` VALUES ('05c149e71c1a495789b2d507d61e08af', '783938b7cdc947c68cf48d734aed51cc');
INSERT INTO `jy_base_role_resources` VALUES ('05c149e71c1a495789b2d507d61e08af', '7f2059c3963f4c85ad79877fc39d0f87');
INSERT INTO `jy_base_role_resources` VALUES ('05c149e71c1a495789b2d507d61e08af', '958a6acbe39f48009714ba1bcb1232e0');
INSERT INTO `jy_base_role_resources` VALUES ('05c149e71c1a495789b2d507d61e08af', 'b7e74a818e6c4a879a8c0dcdd28d3526');
INSERT INTO `jy_base_role_resources` VALUES ('05c149e71c1a495789b2d507d61e08af', 'b8c7e7b96d274095a5494277793d39b4');
INSERT INTO `jy_base_role_resources` VALUES ('05c149e71c1a495789b2d507d61e08af', 'ba8c2c172df54fc992369b3671b6c787');
INSERT INTO `jy_base_role_resources` VALUES ('05c149e71c1a495789b2d507d61e08af', 'bdda4065d9904e718e8dd70e035bdb43');
INSERT INTO `jy_base_role_resources` VALUES ('0f9600afc9274f74b16db37a784a84dc', '08693c30017e4e45acff89d300067269');
INSERT INTO `jy_base_role_resources` VALUES ('0f9600afc9274f74b16db37a784a84dc', '79a76d451f3948f4963b97b6d5bbbf3c');
INSERT INTO `jy_base_role_resources` VALUES ('1', '1');
INSERT INTO `jy_base_role_resources` VALUES ('1', '2');
INSERT INTO `jy_base_role_resources` VALUES ('2', '1');
INSERT INTO `jy_base_role_resources` VALUES ('2', '10');
INSERT INTO `jy_base_role_resources` VALUES ('2', '13');
INSERT INTO `jy_base_role_resources` VALUES ('2', '14');
INSERT INTO `jy_base_role_resources` VALUES ('2', '15a7d1cec70c47bdbfd41c7f9c694481');
INSERT INTO `jy_base_role_resources` VALUES ('2', '161848b9e16e410e9d3fac6f9c91cad5');
INSERT INTO `jy_base_role_resources` VALUES ('2', '1e2cd5e710224cf0ba09bbe5d4ee0009');
INSERT INTO `jy_base_role_resources` VALUES ('2', '2');
INSERT INTO `jy_base_role_resources` VALUES ('2', '21feb456e503484280232730687149f2');
INSERT INTO `jy_base_role_resources` VALUES ('2', '28d4a82889c341bdaceab323b9549245');
INSERT INTO `jy_base_role_resources` VALUES ('2', '3');
INSERT INTO `jy_base_role_resources` VALUES ('2', '34507436438c4c7eb9803fa160c2af3c');
INSERT INTO `jy_base_role_resources` VALUES ('2', '3f184c74379c4b668030ba9e55c9caa3');
INSERT INTO `jy_base_role_resources` VALUES ('2', '4');
INSERT INTO `jy_base_role_resources` VALUES ('2', '42a2938acb5e4a26b5ec2cc6089b7c2e');
INSERT INTO `jy_base_role_resources` VALUES ('2', '4c97ca25b7e940948b3d403c3b091c81');
INSERT INTO `jy_base_role_resources` VALUES ('2', '4ee50d1722a34edeb6c15bdbf29e556b');
INSERT INTO `jy_base_role_resources` VALUES ('2', '51aa6b0b037340b9ae88d22d2a354acf');
INSERT INTO `jy_base_role_resources` VALUES ('2', '5ba75d14f5b74572bd5ff35d12c58060');
INSERT INTO `jy_base_role_resources` VALUES ('2', '6d44f1553c424e5c81bd3ed9a4e162f3');
INSERT INTO `jy_base_role_resources` VALUES ('2', '6ea62cf0820248a6a2780a885b82a99d');
INSERT INTO `jy_base_role_resources` VALUES ('2', '75288771d60d4510affe8cb97f42897f');
INSERT INTO `jy_base_role_resources` VALUES ('2', '78b1bf1c0723433099c458e75a8c6901');
INSERT INTO `jy_base_role_resources` VALUES ('2', '83984d22f9da4991833f506695307b6f');
INSERT INTO `jy_base_role_resources` VALUES ('2', '89ff6bdf54ca4501a264adba8eb0ee39');
INSERT INTO `jy_base_role_resources` VALUES ('2', '9575841c8b6a4c58b10e97d82320fd02');
INSERT INTO `jy_base_role_resources` VALUES ('2', 'ae8fea67b8434987b718c51fe83bb45d');
INSERT INTO `jy_base_role_resources` VALUES ('2', 'cd7ef89bf12f4ceb98861cf2bcbc96b1');
INSERT INTO `jy_base_role_resources` VALUES ('2', 'd22f22f0bc9a4ad2a6464cca6497a7b4');
INSERT INTO `jy_base_role_resources` VALUES ('2', 'dbb1d5db4d7b419db1d221b102a7ad51');
INSERT INTO `jy_base_role_resources` VALUES ('2', 'dde1c043e77d48b4ac2f15806a0aec14');
INSERT INTO `jy_base_role_resources` VALUES ('2', 'e9480dd6590a4e14a443ee8f76873fd3');
INSERT INTO `jy_base_role_resources` VALUES ('2', 'fa04b6fe03944f2a9c040dbc9071af9b');
INSERT INTO `jy_base_role_resources` VALUES ('20bd50a12fdf4290ba719c72bfc91849', '1');
INSERT INTO `jy_base_role_resources` VALUES ('20bd50a12fdf4290ba719c72bfc91849', '11');
INSERT INTO `jy_base_role_resources` VALUES ('20bd50a12fdf4290ba719c72bfc91849', '15a7d1cec70c47bdbfd41c7f9c694481');
INSERT INTO `jy_base_role_resources` VALUES ('20bd50a12fdf4290ba719c72bfc91849', '17325e24f35348fd9a287152e3ea8b75');
INSERT INTO `jy_base_role_resources` VALUES ('20bd50a12fdf4290ba719c72bfc91849', '18756082926f41329e51d74dda3abc80');
INSERT INTO `jy_base_role_resources` VALUES ('20bd50a12fdf4290ba719c72bfc91849', '1d906f69a7274cbd8b316903e66fc580');
INSERT INTO `jy_base_role_resources` VALUES ('20bd50a12fdf4290ba719c72bfc91849', '1e2cd5e710224cf0ba09bbe5d4ee0009');
INSERT INTO `jy_base_role_resources` VALUES ('20bd50a12fdf4290ba719c72bfc91849', '2');
INSERT INTO `jy_base_role_resources` VALUES ('20bd50a12fdf4290ba719c72bfc91849', '3');
INSERT INTO `jy_base_role_resources` VALUES ('20bd50a12fdf4290ba719c72bfc91849', '42a2938acb5e4a26b5ec2cc6089b7c2e');
INSERT INTO `jy_base_role_resources` VALUES ('20bd50a12fdf4290ba719c72bfc91849', '47ff0c409f314b07b52ba13f1bb81586');
INSERT INTO `jy_base_role_resources` VALUES ('20bd50a12fdf4290ba719c72bfc91849', '4c97ca25b7e940948b3d403c3b091c81');
INSERT INTO `jy_base_role_resources` VALUES ('20bd50a12fdf4290ba719c72bfc91849', '4ee50d1722a34edeb6c15bdbf29e556b');
INSERT INTO `jy_base_role_resources` VALUES ('20bd50a12fdf4290ba719c72bfc91849', '51aa6b0b037340b9ae88d22d2a354acf');
INSERT INTO `jy_base_role_resources` VALUES ('20bd50a12fdf4290ba719c72bfc91849', '52910f91bf3e4b71af4ded1ef67bba48');
INSERT INTO `jy_base_role_resources` VALUES ('20bd50a12fdf4290ba719c72bfc91849', '55e7a2d527564d9790b9f00a00d34634');
INSERT INTO `jy_base_role_resources` VALUES ('20bd50a12fdf4290ba719c72bfc91849', '58230413e8364b67af2bb65e64252260');
INSERT INTO `jy_base_role_resources` VALUES ('20bd50a12fdf4290ba719c72bfc91849', '5ba75d14f5b74572bd5ff35d12c58060');
INSERT INTO `jy_base_role_resources` VALUES ('20bd50a12fdf4290ba719c72bfc91849', '72cbdeff2aea4aea8f348bb6d779a87d');
INSERT INTO `jy_base_role_resources` VALUES ('20bd50a12fdf4290ba719c72bfc91849', '7537535a8b5d44009f52a3e84ca5dfd8');
INSERT INTO `jy_base_role_resources` VALUES ('20bd50a12fdf4290ba719c72bfc91849', '83984d22f9da4991833f506695307b6f');
INSERT INTO `jy_base_role_resources` VALUES ('20bd50a12fdf4290ba719c72bfc91849', '89ff6bdf54ca4501a264adba8eb0ee39');
INSERT INTO `jy_base_role_resources` VALUES ('20bd50a12fdf4290ba719c72bfc91849', '9bc994928cc64fdca432fcad2a0b3ba9');
INSERT INTO `jy_base_role_resources` VALUES ('20bd50a12fdf4290ba719c72bfc91849', '9cff3045dd824773a70c5a887a2f71ef');
INSERT INTO `jy_base_role_resources` VALUES ('20bd50a12fdf4290ba719c72bfc91849', 'a103f06e9c7f4e8aafc5eaf4c735fd91');
INSERT INTO `jy_base_role_resources` VALUES ('20bd50a12fdf4290ba719c72bfc91849', 'a201aa381c3447aeaae23bdb478b3a06');
INSERT INTO `jy_base_role_resources` VALUES ('20bd50a12fdf4290ba719c72bfc91849', 'ae8fea67b8434987b718c51fe83bb45d');
INSERT INTO `jy_base_role_resources` VALUES ('20bd50a12fdf4290ba719c72bfc91849', 'b776518dfdd940e394a15de3974a8610');
INSERT INTO `jy_base_role_resources` VALUES ('20bd50a12fdf4290ba719c72bfc91849', 'b8203143736e4e549b2e0fc3c617d4c4');
INSERT INTO `jy_base_role_resources` VALUES ('20bd50a12fdf4290ba719c72bfc91849', 'c73d630ab1004b5a9b71836e8b000de9');
INSERT INTO `jy_base_role_resources` VALUES ('20bd50a12fdf4290ba719c72bfc91849', 'c9c822f6c7b94650a6f3944c53738caf');
INSERT INTO `jy_base_role_resources` VALUES ('20bd50a12fdf4290ba719c72bfc91849', 'd22f22f0bc9a4ad2a6464cca6497a7b4');
INSERT INTO `jy_base_role_resources` VALUES ('20bd50a12fdf4290ba719c72bfc91849', 'dc4a83f740f54f6b89916321968cbcd3');
INSERT INTO `jy_base_role_resources` VALUES ('20bd50a12fdf4290ba719c72bfc91849', 'e49f8b358da2404293f6ac4e7f7a7a30');
INSERT INTO `jy_base_role_resources` VALUES ('20bd50a12fdf4290ba719c72bfc91849', 'e750134d22094ef3a611fe8300c351e9');
INSERT INTO `jy_base_role_resources` VALUES ('20bd50a12fdf4290ba719c72bfc91849', 'f541a86e629d4eefb014309c921a237e');
INSERT INTO `jy_base_role_resources` VALUES ('20bd50a12fdf4290ba719c72bfc91849', 'fa04b6fe03944f2a9c040dbc9071af9b');
INSERT INTO `jy_base_role_resources` VALUES ('3', '0576a0a5825a4c1eafb0fb88369e77f6');
INSERT INTO `jy_base_role_resources` VALUES ('3', '08693c30017e4e45acff89d300067269');
INSERT INTO `jy_base_role_resources` VALUES ('3', '0f5747e8beb24a15899cfd0c0f4c42c0');
INSERT INTO `jy_base_role_resources` VALUES ('3', '1');
INSERT INTO `jy_base_role_resources` VALUES ('3', '10');
INSERT INTO `jy_base_role_resources` VALUES ('3', '100');
INSERT INTO `jy_base_role_resources` VALUES ('3', '101');
INSERT INTO `jy_base_role_resources` VALUES ('3', '102');
INSERT INTO `jy_base_role_resources` VALUES ('3', '103');
INSERT INTO `jy_base_role_resources` VALUES ('3', '11');
INSERT INTO `jy_base_role_resources` VALUES ('3', '12');
INSERT INTO `jy_base_role_resources` VALUES ('3', '13');
INSERT INTO `jy_base_role_resources` VALUES ('3', '14');
INSERT INTO `jy_base_role_resources` VALUES ('3', '15a7d1cec70c47bdbfd41c7f9c694481');
INSERT INTO `jy_base_role_resources` VALUES ('3', '161848b9e16e410e9d3fac6f9c91cad5');
INSERT INTO `jy_base_role_resources` VALUES ('3', '18756082926f41329e51d74dda3abc80');
INSERT INTO `jy_base_role_resources` VALUES ('3', '1bc2c9d3d8e644f1a25ce8321f2faf13');
INSERT INTO `jy_base_role_resources` VALUES ('3', '1d906f69a7274cbd8b316903e66fc580');
INSERT INTO `jy_base_role_resources` VALUES ('3', '1e2cd5e710224cf0ba09bbe5d4ee0009');
INSERT INTO `jy_base_role_resources` VALUES ('3', '1e87cc3913914c8aa80116270ed03a75');
INSERT INTO `jy_base_role_resources` VALUES ('3', '2');
INSERT INTO `jy_base_role_resources` VALUES ('3', '21feb456e503484280232730687149f2');
INSERT INTO `jy_base_role_resources` VALUES ('3', '25a4bc9c184a4d6c904ce7a3ccb26aae');
INSERT INTO `jy_base_role_resources` VALUES ('3', '273e05eb764f48c18f832520e7ce141e');
INSERT INTO `jy_base_role_resources` VALUES ('3', '28d4a82889c341bdaceab323b9549245');
INSERT INTO `jy_base_role_resources` VALUES ('3', '3');
INSERT INTO `jy_base_role_resources` VALUES ('3', '31b0fe86acea4fceb184aecfe521ff0d');
INSERT INTO `jy_base_role_resources` VALUES ('3', '343914e32c3b458ba797c080b0dfbf85');
INSERT INTO `jy_base_role_resources` VALUES ('3', '34507436438c4c7eb9803fa160c2af3c');
INSERT INTO `jy_base_role_resources` VALUES ('3', '3f184c74379c4b668030ba9e55c9caa3');
INSERT INTO `jy_base_role_resources` VALUES ('3', '4');
INSERT INTO `jy_base_role_resources` VALUES ('3', '40a146e3febf4cafb930a077f1f048d3');
INSERT INTO `jy_base_role_resources` VALUES ('3', '42a2938acb5e4a26b5ec2cc6089b7c2e');
INSERT INTO `jy_base_role_resources` VALUES ('3', '47ff0c409f314b07b52ba13f1bb81586');
INSERT INTO `jy_base_role_resources` VALUES ('3', '4c97ca25b7e940948b3d403c3b091c81');
INSERT INTO `jy_base_role_resources` VALUES ('3', '4ee50d1722a34edeb6c15bdbf29e556b');
INSERT INTO `jy_base_role_resources` VALUES ('3', '4f057f1a6d05416fbb06206b2aaffb10');
INSERT INTO `jy_base_role_resources` VALUES ('3', '5');
INSERT INTO `jy_base_role_resources` VALUES ('3', '51424721ec1c4574b2f2a7bc1833c17f');
INSERT INTO `jy_base_role_resources` VALUES ('3', '51aa6b0b037340b9ae88d22d2a354acf');
INSERT INTO `jy_base_role_resources` VALUES ('3', '52910f91bf3e4b71af4ded1ef67bba48');
INSERT INTO `jy_base_role_resources` VALUES ('3', '55053558dc4f4ab0983337386969aced');
INSERT INTO `jy_base_role_resources` VALUES ('3', '55e7a2d527564d9790b9f00a00d34634');
INSERT INTO `jy_base_role_resources` VALUES ('3', '58230413e8364b67af2bb65e64252260');
INSERT INTO `jy_base_role_resources` VALUES ('3', '5ba75d14f5b74572bd5ff35d12c58060');
INSERT INTO `jy_base_role_resources` VALUES ('3', '5d1b45e9b6a84bccb212758ce8f2e906');
INSERT INTO `jy_base_role_resources` VALUES ('3', '6');
INSERT INTO `jy_base_role_resources` VALUES ('3', '6d44f1553c424e5c81bd3ed9a4e162f3');
INSERT INTO `jy_base_role_resources` VALUES ('3', '6ea62cf0820248a6a2780a885b82a99d');
INSERT INTO `jy_base_role_resources` VALUES ('3', '72cbdeff2aea4aea8f348bb6d779a87d');
INSERT INTO `jy_base_role_resources` VALUES ('3', '747a8ddc90b844c3a12dbe920e777052');
INSERT INTO `jy_base_role_resources` VALUES ('3', '75288771d60d4510affe8cb97f42897f');
INSERT INTO `jy_base_role_resources` VALUES ('3', '7579afb168b04a3d99fff9dbe956936e');
INSERT INTO `jy_base_role_resources` VALUES ('3', '78b1bf1c0723433099c458e75a8c6901');
INSERT INTO `jy_base_role_resources` VALUES ('3', '79a76d451f3948f4963b97b6d5bbbf3c');
INSERT INTO `jy_base_role_resources` VALUES ('3', '7b30d8d43df347ada558df820bbec28b');
INSERT INTO `jy_base_role_resources` VALUES ('3', '7c1741c605c148c29113ac804f68f52b');
INSERT INTO `jy_base_role_resources` VALUES ('3', '7d6a6b7594b14807a3def610f6595804');
INSERT INTO `jy_base_role_resources` VALUES ('3', '82652011fe8549d18d4652567f7b1610');
INSERT INTO `jy_base_role_resources` VALUES ('3', '83984d22f9da4991833f506695307b6f');
INSERT INTO `jy_base_role_resources` VALUES ('3', '89ff6bdf54ca4501a264adba8eb0ee39');
INSERT INTO `jy_base_role_resources` VALUES ('3', '9575841c8b6a4c58b10e97d82320fd02');
INSERT INTO `jy_base_role_resources` VALUES ('3', '9ba1dbda9e414eff8591cda4aea34c32');
INSERT INTO `jy_base_role_resources` VALUES ('3', '9bc994928cc64fdca432fcad2a0b3ba9');
INSERT INTO `jy_base_role_resources` VALUES ('3', '9bd48a7e0ca74b77b577411c8e4b7c2b');
INSERT INTO `jy_base_role_resources` VALUES ('3', '9cff3045dd824773a70c5a887a2f71ef');
INSERT INTO `jy_base_role_resources` VALUES ('3', 'a103f06e9c7f4e8aafc5eaf4c735fd91');
INSERT INTO `jy_base_role_resources` VALUES ('3', 'a1b4ef2728d9456aa4e9a85d68c6029e');
INSERT INTO `jy_base_role_resources` VALUES ('3', 'a201aa381c3447aeaae23bdb478b3a06');
INSERT INTO `jy_base_role_resources` VALUES ('3', 'a213cc3a8be64a77b9d8673619230a87');
INSERT INTO `jy_base_role_resources` VALUES ('3', 'a2eea33defc64462b3b3df9e64c461fb');
INSERT INTO `jy_base_role_resources` VALUES ('3', 'ae8fea67b8434987b718c51fe83bb45d');
INSERT INTO `jy_base_role_resources` VALUES ('3', 'b776518dfdd940e394a15de3974a8610');
INSERT INTO `jy_base_role_resources` VALUES ('3', 'b78f7224d001404c92479532c614dffa');
INSERT INTO `jy_base_role_resources` VALUES ('3', 'b7d11fca02b04742814eb664454d7473');
INSERT INTO `jy_base_role_resources` VALUES ('3', 'b8203143736e4e549b2e0fc3c617d4c4');
INSERT INTO `jy_base_role_resources` VALUES ('3', 'bf888841c15e4da5858299ef99376eb4');
INSERT INTO `jy_base_role_resources` VALUES ('3', 'c669fba98a9446999b62d15bfff1c412');
INSERT INTO `jy_base_role_resources` VALUES ('3', 'c9c822f6c7b94650a6f3944c53738caf');
INSERT INTO `jy_base_role_resources` VALUES ('3', 'cd7ef89bf12f4ceb98861cf2bcbc96b1');
INSERT INTO `jy_base_role_resources` VALUES ('3', 'd22f22f0bc9a4ad2a6464cca6497a7b4');
INSERT INTO `jy_base_role_resources` VALUES ('3', 'dbb1d5db4d7b419db1d221b102a7ad51');
INSERT INTO `jy_base_role_resources` VALUES ('3', 'dc4a83f740f54f6b89916321968cbcd3');
INSERT INTO `jy_base_role_resources` VALUES ('3', 'dde1c043e77d48b4ac2f15806a0aec14');
INSERT INTO `jy_base_role_resources` VALUES ('3', 'de998a250fcb4c2ab88981f2093d54f3');
INSERT INTO `jy_base_role_resources` VALUES ('3', 'e49f8b358da2404293f6ac4e7f7a7a30');
INSERT INTO `jy_base_role_resources` VALUES ('3', 'e750134d22094ef3a611fe8300c351e9');
INSERT INTO `jy_base_role_resources` VALUES ('3', 'e9480dd6590a4e14a443ee8f76873fd3');
INSERT INTO `jy_base_role_resources` VALUES ('3', 'ef3a950b6154459589acc7dd7145e0ed');
INSERT INTO `jy_base_role_resources` VALUES ('3', 'f541a86e629d4eefb014309c921a237e');
INSERT INTO `jy_base_role_resources` VALUES ('3', 'fa04b6fe03944f2a9c040dbc9071af9b');
INSERT INTO `jy_base_role_resources` VALUES ('3f84f0a74e9e4c58a926d5a75fd91e21', '0cd4f53a9a5a49eb81058d94c3baeed8');
INSERT INTO `jy_base_role_resources` VALUES ('3f84f0a74e9e4c58a926d5a75fd91e21', '31018b89dde34513ad30c3b4b55256a7');
INSERT INTO `jy_base_role_resources` VALUES ('3f84f0a74e9e4c58a926d5a75fd91e21', '3bfe84bade44428581b5102b5fabff36');
INSERT INTO `jy_base_role_resources` VALUES ('3f84f0a74e9e4c58a926d5a75fd91e21', '4028818462a3f2730162a3f273790000');
INSERT INTO `jy_base_role_resources` VALUES ('3f84f0a74e9e4c58a926d5a75fd91e21', '783938b7cdc947c68cf48d734aed51cc');
INSERT INTO `jy_base_role_resources` VALUES ('3f84f0a74e9e4c58a926d5a75fd91e21', '958a6acbe39f48009714ba1bcb1232e0');
INSERT INTO `jy_base_role_resources` VALUES ('3f84f0a74e9e4c58a926d5a75fd91e21', 'b8c7e7b96d274095a5494277793d39b4');
INSERT INTO `jy_base_role_resources` VALUES ('3f84f0a74e9e4c58a926d5a75fd91e21', 'ba8c2c172df54fc992369b3671b6c787');
INSERT INTO `jy_base_role_resources` VALUES ('3f84f0a74e9e4c58a926d5a75fd91e21', 'bdda4065d9904e718e8dd70e035bdb43');
INSERT INTO `jy_base_role_resources` VALUES ('3f84f0a74e9e4c58a926d5a75fd91e21', 'ed76bf221dd04ad5a2a8a724f11f1f4a');
INSERT INTO `jy_base_role_resources` VALUES ('3f84f0a74e9e4c58a926d5a75fd91e21', 'f6ec54ae6b1941f9af8ae6aaa65fa667');
INSERT INTO `jy_base_role_resources` VALUES ('4', '000183b0dcde4924917a36cf19061006');
INSERT INTO `jy_base_role_resources` VALUES ('4', '0049e7df73f7449aac602629d6092855');
INSERT INTO `jy_base_role_resources` VALUES ('4', '034880665a9e4a0faebce4357e67b127');
INSERT INTO `jy_base_role_resources` VALUES ('4', '0353d45d93f341178fc6dad970311072');
INSERT INTO `jy_base_role_resources` VALUES ('4', '0576a0a5825a4c1eafb0fb88369e77f6');
INSERT INTO `jy_base_role_resources` VALUES ('4', '085b223aae3b463fbe606e9a6432f8ca');
INSERT INTO `jy_base_role_resources` VALUES ('4', '08693c30017e4e45acff89d300067269');
INSERT INTO `jy_base_role_resources` VALUES ('4', '0cd4f53a9a5a49eb81058d94c3baeed8');
INSERT INTO `jy_base_role_resources` VALUES ('4', '0f5747e8beb24a15899cfd0c0f4c42c0');
INSERT INTO `jy_base_role_resources` VALUES ('4', '1');
INSERT INTO `jy_base_role_resources` VALUES ('4', '10');
INSERT INTO `jy_base_role_resources` VALUES ('4', '100');
INSERT INTO `jy_base_role_resources` VALUES ('4', '101');
INSERT INTO `jy_base_role_resources` VALUES ('4', '102');
INSERT INTO `jy_base_role_resources` VALUES ('4', '103');
INSERT INTO `jy_base_role_resources` VALUES ('4', '11');
INSERT INTO `jy_base_role_resources` VALUES ('4', '12');
INSERT INTO `jy_base_role_resources` VALUES ('4', '13');
INSERT INTO `jy_base_role_resources` VALUES ('4', '13baa4cc73184b9b800cd46b22121e3b');
INSERT INTO `jy_base_role_resources` VALUES ('4', '14');
INSERT INTO `jy_base_role_resources` VALUES ('4', '153208eb05c549898a91e0a1a04b13a6');
INSERT INTO `jy_base_role_resources` VALUES ('4', '15a7d1cec70c47bdbfd41c7f9c694481');
INSERT INTO `jy_base_role_resources` VALUES ('4', '161848b9e16e410e9d3fac6f9c91cad5');
INSERT INTO `jy_base_role_resources` VALUES ('4', '17325e24f35348fd9a287152e3ea8b75');
INSERT INTO `jy_base_role_resources` VALUES ('4', '18756082926f41329e51d74dda3abc80');
INSERT INTO `jy_base_role_resources` VALUES ('4', '1add9a6057c94ac1842aacbcb64b4be1');
INSERT INTO `jy_base_role_resources` VALUES ('4', '1bc2c9d3d8e644f1a25ce8321f2faf13');
INSERT INTO `jy_base_role_resources` VALUES ('4', '1d906f69a7274cbd8b316903e66fc580');
INSERT INTO `jy_base_role_resources` VALUES ('4', '1e2cd5e710224cf0ba09bbe5d4ee0009');
INSERT INTO `jy_base_role_resources` VALUES ('4', '1e87cc3913914c8aa80116270ed03a75');
INSERT INTO `jy_base_role_resources` VALUES ('4', '2');
INSERT INTO `jy_base_role_resources` VALUES ('4', '219b4e8b576345b285c7232642ff5172');
INSERT INTO `jy_base_role_resources` VALUES ('4', '21feb456e503484280232730687149f2');
INSERT INTO `jy_base_role_resources` VALUES ('4', '23f40d71d1ad4421873046e30be16f8e');
INSERT INTO `jy_base_role_resources` VALUES ('4', '25a4bc9c184a4d6c904ce7a3ccb26aae');
INSERT INTO `jy_base_role_resources` VALUES ('4', '273e05eb764f48c18f832520e7ce141e');
INSERT INTO `jy_base_role_resources` VALUES ('4', '28d4a82889c341bdaceab323b9549245');
INSERT INTO `jy_base_role_resources` VALUES ('4', '297e9023628516d801628516d8940000');
INSERT INTO `jy_base_role_resources` VALUES ('4', '2c663bd9a2fc4d82b26eb1032d5c00b1');
INSERT INTO `jy_base_role_resources` VALUES ('4', '2fca910ce5fb499ebeeae4351cc26240');
INSERT INTO `jy_base_role_resources` VALUES ('4', '3');
INSERT INTO `jy_base_role_resources` VALUES ('4', '31018b89dde34513ad30c3b4b55256a7');
INSERT INTO `jy_base_role_resources` VALUES ('4', '31b0fe86acea4fceb184aecfe521ff0d');
INSERT INTO `jy_base_role_resources` VALUES ('4', '32db697c9ec34011afe8bee1dee59389');
INSERT INTO `jy_base_role_resources` VALUES ('4', '332072af224d42a4b2f340f30355b1e1');
INSERT INTO `jy_base_role_resources` VALUES ('4', '343914e32c3b458ba797c080b0dfbf85');
INSERT INTO `jy_base_role_resources` VALUES ('4', '34507436438c4c7eb9803fa160c2af3c');
INSERT INTO `jy_base_role_resources` VALUES ('4', '35504db0bf5b49e09a5b631d29e08e8e');
INSERT INTO `jy_base_role_resources` VALUES ('4', '3a2033170be54a74b03c9a578415eabd');
INSERT INTO `jy_base_role_resources` VALUES ('4', '3bfe84bade44428581b5102b5fabff36');
INSERT INTO `jy_base_role_resources` VALUES ('4', '3e633338e5344731895964a4de7f8271');
INSERT INTO `jy_base_role_resources` VALUES ('4', '3f184c74379c4b668030ba9e55c9caa3');
INSERT INTO `jy_base_role_resources` VALUES ('4', '4');
INSERT INTO `jy_base_role_resources` VALUES ('4', '4021171e506b47c083c77a2b96660031');
INSERT INTO `jy_base_role_resources` VALUES ('4', '402880e9624b9e2801624b9e28080000');
INSERT INTO `jy_base_role_resources` VALUES ('4', '4028818462a3f2730162a3f273790000');
INSERT INTO `jy_base_role_resources` VALUES ('4', '4028818462a3f2730162a3f3e72c0001');
INSERT INTO `jy_base_role_resources` VALUES ('4', '404');
INSERT INTO `jy_base_role_resources` VALUES ('4', '40a146e3febf4cafb930a077f1f048d3');
INSERT INTO `jy_base_role_resources` VALUES ('4', '41');
INSERT INTO `jy_base_role_resources` VALUES ('4', '415d9d3109234cc9a0ad15c612e63bdd');
INSERT INTO `jy_base_role_resources` VALUES ('4', '42a2938acb5e4a26b5ec2cc6089b7c2e');
INSERT INTO `jy_base_role_resources` VALUES ('4', '439756a806314420971daf5d6787d62d');
INSERT INTO `jy_base_role_resources` VALUES ('4', '45b89aec81dc4ff0b8d014ffe92a05bb');
INSERT INTO `jy_base_role_resources` VALUES ('4', '47ff0c409f314b07b52ba13f1bb81586');
INSERT INTO `jy_base_role_resources` VALUES ('4', '4a18aa13302b48dd98f7005aaa4096e2');
INSERT INTO `jy_base_role_resources` VALUES ('4', '4c95475b93c944f89d185cd175960768');
INSERT INTO `jy_base_role_resources` VALUES ('4', '4c97ca25b7e940948b3d403c3b091c81');
INSERT INTO `jy_base_role_resources` VALUES ('4', '4ee50d1722a34edeb6c15bdbf29e556b');
INSERT INTO `jy_base_role_resources` VALUES ('4', '4f057f1a6d05416fbb06206b2aaffb10');
INSERT INTO `jy_base_role_resources` VALUES ('4', '5');
INSERT INTO `jy_base_role_resources` VALUES ('4', '51424721ec1c4574b2f2a7bc1833c17f');
INSERT INTO `jy_base_role_resources` VALUES ('4', '51aa6b0b037340b9ae88d22d2a354acf');
INSERT INTO `jy_base_role_resources` VALUES ('4', '52910f91bf3e4b71af4ded1ef67bba48');
INSERT INTO `jy_base_role_resources` VALUES ('4', '55053558dc4f4ab0983337386969aced');
INSERT INTO `jy_base_role_resources` VALUES ('4', '55e7a2d527564d9790b9f00a00d34634');
INSERT INTO `jy_base_role_resources` VALUES ('4', '567c82ba52af488ea079f3b04d157590');
INSERT INTO `jy_base_role_resources` VALUES ('4', '58230413e8364b67af2bb65e64252260');
INSERT INTO `jy_base_role_resources` VALUES ('4', '5aa30b82be4642da8d63d14614b165b0');
INSERT INTO `jy_base_role_resources` VALUES ('4', '5ba75d14f5b74572bd5ff35d12c58060');
INSERT INTO `jy_base_role_resources` VALUES ('4', '5bbadca08ef748e4a7dd9bbc2304b300');
INSERT INTO `jy_base_role_resources` VALUES ('4', '5d1b45e9b6a84bccb212758ce8f2e906');
INSERT INTO `jy_base_role_resources` VALUES ('4', '6');
INSERT INTO `jy_base_role_resources` VALUES ('4', '6d44f1553c424e5c81bd3ed9a4e162f3');
INSERT INTO `jy_base_role_resources` VALUES ('4', '6ea62cf0820248a6a2780a885b82a99d');
INSERT INTO `jy_base_role_resources` VALUES ('4', '6fab62b407fd4df29cd315b7ce970ca5');
INSERT INTO `jy_base_role_resources` VALUES ('4', '72cbdeff2aea4aea8f348bb6d779a87d');
INSERT INTO `jy_base_role_resources` VALUES ('4', '747a8ddc90b844c3a12dbe920e777052');
INSERT INTO `jy_base_role_resources` VALUES ('4', '75288771d60d4510affe8cb97f42897f');
INSERT INTO `jy_base_role_resources` VALUES ('4', '7537535a8b5d44009f52a3e84ca5dfd8');
INSERT INTO `jy_base_role_resources` VALUES ('4', '7579afb168b04a3d99fff9dbe956936e');
INSERT INTO `jy_base_role_resources` VALUES ('4', '783938b7cdc947c68cf48d734aed51cc');
INSERT INTO `jy_base_role_resources` VALUES ('4', '78b1bf1c0723433099c458e75a8c6901');
INSERT INTO `jy_base_role_resources` VALUES ('4', '79a76d451f3948f4963b97b6d5bbbf3c');
INSERT INTO `jy_base_role_resources` VALUES ('4', '7b30d8d43df347ada558df820bbec28b');
INSERT INTO `jy_base_role_resources` VALUES ('4', '7c1741c605c148c29113ac804f68f52b');
INSERT INTO `jy_base_role_resources` VALUES ('4', '7d6a6b7594b14807a3def610f6595804');
INSERT INTO `jy_base_role_resources` VALUES ('4', '7dda6657629342618c81797be0a4c5d4');
INSERT INTO `jy_base_role_resources` VALUES ('4', '7defb04cc0784ba1b80c0540e7877545');
INSERT INTO `jy_base_role_resources` VALUES ('4', '7eba58c432d04a38a51918e37b7cb124');
INSERT INTO `jy_base_role_resources` VALUES ('4', '7f2059c3963f4c85ad79877fc39d0f87');
INSERT INTO `jy_base_role_resources` VALUES ('4', '80fd6468064440cf8beaa9a5691c4330');
INSERT INTO `jy_base_role_resources` VALUES ('4', '82652011fe8549d18d4652567f7b1610');
INSERT INTO `jy_base_role_resources` VALUES ('4', '83079eb98aa24f73bfb1be11852ac9fc');
INSERT INTO `jy_base_role_resources` VALUES ('4', '83718e6be30b4d37894038eb5c8f8f2d');
INSERT INTO `jy_base_role_resources` VALUES ('4', '83984d22f9da4991833f506695307b6f');
INSERT INTO `jy_base_role_resources` VALUES ('4', '85e2c80eb4f3430881c20f556b7fdbb5');
INSERT INTO `jy_base_role_resources` VALUES ('4', '89ff6bdf54ca4501a264adba8eb0ee39');
INSERT INTO `jy_base_role_resources` VALUES ('4', '8cc0bcbb9bae4ebe81d263de37ef15a6');
INSERT INTO `jy_base_role_resources` VALUES ('4', '9037c1737a904fc3bf18e0ef7a6b6e05');
INSERT INTO `jy_base_role_resources` VALUES ('4', '90c2e721d4694d0b930bf976e6353f38');
INSERT INTO `jy_base_role_resources` VALUES ('4', '9575841c8b6a4c58b10e97d82320fd02');
INSERT INTO `jy_base_role_resources` VALUES ('4', '958a6acbe39f48009714ba1bcb1232e0');
INSERT INTO `jy_base_role_resources` VALUES ('4', '9727f259cd8542fc8756b7b9cee9dd54');
INSERT INTO `jy_base_role_resources` VALUES ('4', '9ba1dbda9e414eff8591cda4aea34c32');
INSERT INTO `jy_base_role_resources` VALUES ('4', '9bc994928cc64fdca432fcad2a0b3ba9');
INSERT INTO `jy_base_role_resources` VALUES ('4', '9bd48a7e0ca74b77b577411c8e4b7c2b');
INSERT INTO `jy_base_role_resources` VALUES ('4', '9c43dbd6fd2745b78b72bb6a816d1d54');
INSERT INTO `jy_base_role_resources` VALUES ('4', '9cff3045dd824773a70c5a887a2f71ef');
INSERT INTO `jy_base_role_resources` VALUES ('4', 'a103f06e9c7f4e8aafc5eaf4c735fd91');
INSERT INTO `jy_base_role_resources` VALUES ('4', 'a1b4ef2728d9456aa4e9a85d68c6029e');
INSERT INTO `jy_base_role_resources` VALUES ('4', 'a201aa381c3447aeaae23bdb478b3a06');
INSERT INTO `jy_base_role_resources` VALUES ('4', 'a213cc3a8be64a77b9d8673619230a87');
INSERT INTO `jy_base_role_resources` VALUES ('4', 'a2a465e7c7ae4f92b1ad2b2afec1a7b9');
INSERT INTO `jy_base_role_resources` VALUES ('4', 'a2eea33defc64462b3b3df9e64c461fb');
INSERT INTO `jy_base_role_resources` VALUES ('4', 'ae8fea67b8434987b718c51fe83bb45d');
INSERT INTO `jy_base_role_resources` VALUES ('4', 'b1ba61f394cd499c9304e995f881a764');
INSERT INTO `jy_base_role_resources` VALUES ('4', 'b20375c2bc9a48b098b000d02a770a62');
INSERT INTO `jy_base_role_resources` VALUES ('4', 'b2763b8c73e6475e8b332e0dafda92e7');
INSERT INTO `jy_base_role_resources` VALUES ('4', 'b4ef74f46fd849128836b8f2776b4570');
INSERT INTO `jy_base_role_resources` VALUES ('4', 'b776518dfdd940e394a15de3974a8610');
INSERT INTO `jy_base_role_resources` VALUES ('4', 'b78f7224d001404c92479532c614dffa');
INSERT INTO `jy_base_role_resources` VALUES ('4', 'b7d11fca02b04742814eb664454d7473');
INSERT INTO `jy_base_role_resources` VALUES ('4', 'b7e74a818e6c4a879a8c0dcdd28d3526');
INSERT INTO `jy_base_role_resources` VALUES ('4', 'b8203143736e4e549b2e0fc3c617d4c4');
INSERT INTO `jy_base_role_resources` VALUES ('4', 'b8c7e7b96d274095a5494277793d39b4');
INSERT INTO `jy_base_role_resources` VALUES ('4', 'ba8c2c172df54fc992369b3671b6c787');
INSERT INTO `jy_base_role_resources` VALUES ('4', 'ba9a4be6005d4bdf9040e20ae0ee4db5');
INSERT INTO `jy_base_role_resources` VALUES ('4', 'bda72211ff08493fa9f0d50097b9cc2a');
INSERT INTO `jy_base_role_resources` VALUES ('4', 'bdda4065d9904e718e8dd70e035bdb43');
INSERT INTO `jy_base_role_resources` VALUES ('4', 'bf888841c15e4da5858299ef99376eb4');
INSERT INTO `jy_base_role_resources` VALUES ('4', 'c16165aa1f274c0f83199c0b4b197a30');
INSERT INTO `jy_base_role_resources` VALUES ('4', 'c1cd51388c2a4527ba202ea5502fbf59');
INSERT INTO `jy_base_role_resources` VALUES ('4', 'c5851423b69449a2b6f92a6e43d7c154');
INSERT INTO `jy_base_role_resources` VALUES ('4', 'c5aad93b3c6747a0bdbbcf58cf260a6b');
INSERT INTO `jy_base_role_resources` VALUES ('4', 'c669fba98a9446999b62d15bfff1c412');
INSERT INTO `jy_base_role_resources` VALUES ('4', 'c73d630ab1004b5a9b71836e8b000de9');
INSERT INTO `jy_base_role_resources` VALUES ('4', 'c924250d1b184982a89b499ba7a3f5cc');
INSERT INTO `jy_base_role_resources` VALUES ('4', 'c9c822f6c7b94650a6f3944c53738caf');
INSERT INTO `jy_base_role_resources` VALUES ('4', 'cbf35392bc534d5fa8fbd94a1122e0b6');
INSERT INTO `jy_base_role_resources` VALUES ('4', 'cd7ef89bf12f4ceb98861cf2bcbc96b1');
INSERT INTO `jy_base_role_resources` VALUES ('4', 'cdd36f994952404cb73fc5b4727754d7');
INSERT INTO `jy_base_role_resources` VALUES ('4', 'ce50302a3ca84a2fac042d30cb171961');
INSERT INTO `jy_base_role_resources` VALUES ('4', 'd22f22f0bc9a4ad2a6464cca6497a7b4');
INSERT INTO `jy_base_role_resources` VALUES ('4', 'd4e7a2fccd19447ebf8bdb26fba18c5e');
INSERT INTO `jy_base_role_resources` VALUES ('4', 'd7419f56ce154ff2ba335c1f8f4ade17');
INSERT INTO `jy_base_role_resources` VALUES ('4', 'db620a86882840ee92026006343781ea');
INSERT INTO `jy_base_role_resources` VALUES ('4', 'dbb1d5db4d7b419db1d221b102a7ad51');
INSERT INTO `jy_base_role_resources` VALUES ('4', 'dc4a83f740f54f6b89916321968cbcd3');
INSERT INTO `jy_base_role_resources` VALUES ('4', 'dde1c043e77d48b4ac2f15806a0aec14');
INSERT INTO `jy_base_role_resources` VALUES ('4', 'de998a250fcb4c2ab88981f2093d54f3');
INSERT INTO `jy_base_role_resources` VALUES ('4', 'e32736e5780640908fdb166bad8877d8');
INSERT INTO `jy_base_role_resources` VALUES ('4', 'e49f8b358da2404293f6ac4e7f7a7a30');
INSERT INTO `jy_base_role_resources` VALUES ('4', 'e750134d22094ef3a611fe8300c351e9');
INSERT INTO `jy_base_role_resources` VALUES ('4', 'e9480dd6590a4e14a443ee8f76873fd3');
INSERT INTO `jy_base_role_resources` VALUES ('4', 'ea87935658a44519a5d77d0d4bac7296');
INSERT INTO `jy_base_role_resources` VALUES ('4', 'eca65d56fb61495ebcfd7c572c2ea91b');
INSERT INTO `jy_base_role_resources` VALUES ('4', 'ed76bf221dd04ad5a2a8a724f11f1f4a');
INSERT INTO `jy_base_role_resources` VALUES ('4', 'ee4ae52c7759417698651a48a4686979');
INSERT INTO `jy_base_role_resources` VALUES ('4', 'ef3a950b6154459589acc7dd7145e0ed');
INSERT INTO `jy_base_role_resources` VALUES ('4', 'f541a86e629d4eefb014309c921a237e');
INSERT INTO `jy_base_role_resources` VALUES ('4', 'f6ec54ae6b1941f9af8ae6aaa65fa667');
INSERT INTO `jy_base_role_resources` VALUES ('4', 'f7f1f90af08e4b06b9dcc750226efd8f');
INSERT INTO `jy_base_role_resources` VALUES ('4', 'fa04b6fe03944f2a9c040dbc9071af9b');
INSERT INTO `jy_base_role_resources` VALUES ('4', 'fc94dfb51c8a49bea189eef1433c6ce5');
INSERT INTO `jy_base_role_resources` VALUES ('4', 'fca408a363044f95bf12dc51d1b75105');
INSERT INTO `jy_base_role_resources` VALUES ('4', 'fe3b1d7478804c079d3e0489bad16b09');
INSERT INTO `jy_base_role_resources` VALUES ('4ac4ad4eb43d41249823fc2007ce839d', '153208eb05c549898a91e0a1a04b13a6');
INSERT INTO `jy_base_role_resources` VALUES ('4ac4ad4eb43d41249823fc2007ce839d', '219b4e8b576345b285c7232642ff5172');
INSERT INTO `jy_base_role_resources` VALUES ('4ac4ad4eb43d41249823fc2007ce839d', '32db697c9ec34011afe8bee1dee59389');
INSERT INTO `jy_base_role_resources` VALUES ('4ac4ad4eb43d41249823fc2007ce839d', '3bfe84bade44428581b5102b5fabff36');
INSERT INTO `jy_base_role_resources` VALUES ('4ac4ad4eb43d41249823fc2007ce839d', '4028818462a3f2730162a3f273790000');
INSERT INTO `jy_base_role_resources` VALUES ('4ac4ad4eb43d41249823fc2007ce839d', '415d9d3109234cc9a0ad15c612e63bdd');
INSERT INTO `jy_base_role_resources` VALUES ('4ac4ad4eb43d41249823fc2007ce839d', '567c82ba52af488ea079f3b04d157590');
INSERT INTO `jy_base_role_resources` VALUES ('4ac4ad4eb43d41249823fc2007ce839d', '958a6acbe39f48009714ba1bcb1232e0');
INSERT INTO `jy_base_role_resources` VALUES ('4ac4ad4eb43d41249823fc2007ce839d', 'b2763b8c73e6475e8b332e0dafda92e7');
INSERT INTO `jy_base_role_resources` VALUES ('4ac4ad4eb43d41249823fc2007ce839d', 'bda72211ff08493fa9f0d50097b9cc2a');
INSERT INTO `jy_base_role_resources` VALUES ('4ac4ad4eb43d41249823fc2007ce839d', 'c5851423b69449a2b6f92a6e43d7c154');
INSERT INTO `jy_base_role_resources` VALUES ('4ac4ad4eb43d41249823fc2007ce839d', 'cdd36f994952404cb73fc5b4727754d7');
INSERT INTO `jy_base_role_resources` VALUES ('4ac4ad4eb43d41249823fc2007ce839d', 'ed76bf221dd04ad5a2a8a724f11f1f4a');
INSERT INTO `jy_base_role_resources` VALUES ('4ac4ad4eb43d41249823fc2007ce839d', 'ee4ae52c7759417698651a48a4686979');
INSERT INTO `jy_base_role_resources` VALUES ('4ac4ad4eb43d41249823fc2007ce839d', 'f6ec54ae6b1941f9af8ae6aaa65fa667');
INSERT INTO `jy_base_role_resources` VALUES ('4ac4ad4eb43d41249823fc2007ce839d', 'f7f1f90af08e4b06b9dcc750226efd8f');
INSERT INTO `jy_base_role_resources` VALUES ('4ac4ad4eb43d41249823fc2007ce839d', 'fca408a363044f95bf12dc51d1b75105');
INSERT INTO `jy_base_role_resources` VALUES ('5b8661cb83114d28b2c733f70dc98f4e', '153208eb05c549898a91e0a1a04b13a6');
INSERT INTO `jy_base_role_resources` VALUES ('5b8661cb83114d28b2c733f70dc98f4e', '219b4e8b576345b285c7232642ff5172');
INSERT INTO `jy_base_role_resources` VALUES ('5b8661cb83114d28b2c733f70dc98f4e', '32db697c9ec34011afe8bee1dee59389');
INSERT INTO `jy_base_role_resources` VALUES ('5b8661cb83114d28b2c733f70dc98f4e', '3bfe84bade44428581b5102b5fabff36');
INSERT INTO `jy_base_role_resources` VALUES ('5b8661cb83114d28b2c733f70dc98f4e', '4028818462a3f2730162a3f273790000');
INSERT INTO `jy_base_role_resources` VALUES ('5b8661cb83114d28b2c733f70dc98f4e', 'bda72211ff08493fa9f0d50097b9cc2a');
INSERT INTO `jy_base_role_resources` VALUES ('5b8661cb83114d28b2c733f70dc98f4e', 'ed76bf221dd04ad5a2a8a724f11f1f4a');
INSERT INTO `jy_base_role_resources` VALUES ('5b8661cb83114d28b2c733f70dc98f4e', 'ee4ae52c7759417698651a48a4686979');
INSERT INTO `jy_base_role_resources` VALUES ('5b8661cb83114d28b2c733f70dc98f4e', 'f6ec54ae6b1941f9af8ae6aaa65fa667');
INSERT INTO `jy_base_role_resources` VALUES ('5b8661cb83114d28b2c733f70dc98f4e', 'fca408a363044f95bf12dc51d1b75105');
INSERT INTO `jy_base_role_resources` VALUES ('676ce458606440b5a4eded5485647e48', '153208eb05c549898a91e0a1a04b13a6');
INSERT INTO `jy_base_role_resources` VALUES ('676ce458606440b5a4eded5485647e48', '219b4e8b576345b285c7232642ff5172');
INSERT INTO `jy_base_role_resources` VALUES ('676ce458606440b5a4eded5485647e48', '2c663bd9a2fc4d82b26eb1032d5c00b1');
INSERT INTO `jy_base_role_resources` VALUES ('676ce458606440b5a4eded5485647e48', '3bfe84bade44428581b5102b5fabff36');
INSERT INTO `jy_base_role_resources` VALUES ('676ce458606440b5a4eded5485647e48', '402880e9624b9e2801624b9e28080000');
INSERT INTO `jy_base_role_resources` VALUES ('676ce458606440b5a4eded5485647e48', '4028818462a3f2730162a3f3e72c0001');
INSERT INTO `jy_base_role_resources` VALUES ('676ce458606440b5a4eded5485647e48', '415d9d3109234cc9a0ad15c612e63bdd');
INSERT INTO `jy_base_role_resources` VALUES ('676ce458606440b5a4eded5485647e48', '567c82ba52af488ea079f3b04d157590');
INSERT INTO `jy_base_role_resources` VALUES ('676ce458606440b5a4eded5485647e48', '7f2059c3963f4c85ad79877fc39d0f87');
INSERT INTO `jy_base_role_resources` VALUES ('676ce458606440b5a4eded5485647e48', '958a6acbe39f48009714ba1bcb1232e0');
INSERT INTO `jy_base_role_resources` VALUES ('676ce458606440b5a4eded5485647e48', 'b2763b8c73e6475e8b332e0dafda92e7');
INSERT INTO `jy_base_role_resources` VALUES ('676ce458606440b5a4eded5485647e48', 'b7e74a818e6c4a879a8c0dcdd28d3526');
INSERT INTO `jy_base_role_resources` VALUES ('676ce458606440b5a4eded5485647e48', 'bda72211ff08493fa9f0d50097b9cc2a');
INSERT INTO `jy_base_role_resources` VALUES ('676ce458606440b5a4eded5485647e48', 'c5851423b69449a2b6f92a6e43d7c154');
INSERT INTO `jy_base_role_resources` VALUES ('676ce458606440b5a4eded5485647e48', 'cdd36f994952404cb73fc5b4727754d7');
INSERT INTO `jy_base_role_resources` VALUES ('676ce458606440b5a4eded5485647e48', 'ee4ae52c7759417698651a48a4686979');
INSERT INTO `jy_base_role_resources` VALUES ('676ce458606440b5a4eded5485647e48', 'f7f1f90af08e4b06b9dcc750226efd8f');
INSERT INTO `jy_base_role_resources` VALUES ('676ce458606440b5a4eded5485647e48', 'fca408a363044f95bf12dc51d1b75105');
INSERT INTO `jy_base_role_resources` VALUES ('90fc68b9c6dd4baa8be265805118171f', '2c663bd9a2fc4d82b26eb1032d5c00b1');
INSERT INTO `jy_base_role_resources` VALUES ('90fc68b9c6dd4baa8be265805118171f', '31018b89dde34513ad30c3b4b55256a7');
INSERT INTO `jy_base_role_resources` VALUES ('90fc68b9c6dd4baa8be265805118171f', '32db697c9ec34011afe8bee1dee59389');
INSERT INTO `jy_base_role_resources` VALUES ('90fc68b9c6dd4baa8be265805118171f', '3bfe84bade44428581b5102b5fabff36');
INSERT INTO `jy_base_role_resources` VALUES ('90fc68b9c6dd4baa8be265805118171f', '415d9d3109234cc9a0ad15c612e63bdd');
INSERT INTO `jy_base_role_resources` VALUES ('90fc68b9c6dd4baa8be265805118171f', '783938b7cdc947c68cf48d734aed51cc');
INSERT INTO `jy_base_role_resources` VALUES ('90fc68b9c6dd4baa8be265805118171f', '7f2059c3963f4c85ad79877fc39d0f87');
INSERT INTO `jy_base_role_resources` VALUES ('90fc68b9c6dd4baa8be265805118171f', '958a6acbe39f48009714ba1bcb1232e0');
INSERT INTO `jy_base_role_resources` VALUES ('90fc68b9c6dd4baa8be265805118171f', 'b20375c2bc9a48b098b000d02a770a62');
INSERT INTO `jy_base_role_resources` VALUES ('90fc68b9c6dd4baa8be265805118171f', 'b2763b8c73e6475e8b332e0dafda92e7');
INSERT INTO `jy_base_role_resources` VALUES ('90fc68b9c6dd4baa8be265805118171f', 'b7e74a818e6c4a879a8c0dcdd28d3526');
INSERT INTO `jy_base_role_resources` VALUES ('90fc68b9c6dd4baa8be265805118171f', 'b8c7e7b96d274095a5494277793d39b4');
INSERT INTO `jy_base_role_resources` VALUES ('90fc68b9c6dd4baa8be265805118171f', 'bdda4065d9904e718e8dd70e035bdb43');
INSERT INTO `jy_base_role_resources` VALUES ('90fc68b9c6dd4baa8be265805118171f', 'cdd36f994952404cb73fc5b4727754d7');
INSERT INTO `jy_base_role_resources` VALUES ('90fc68b9c6dd4baa8be265805118171f', 'ed76bf221dd04ad5a2a8a724f11f1f4a');
INSERT INTO `jy_base_role_resources` VALUES ('90fc68b9c6dd4baa8be265805118171f', 'ee4ae52c7759417698651a48a4686979');
INSERT INTO `jy_base_role_resources` VALUES ('90fc68b9c6dd4baa8be265805118171f', 'f6ec54ae6b1941f9af8ae6aaa65fa667');
INSERT INTO `jy_base_role_resources` VALUES ('90fc68b9c6dd4baa8be265805118171f', 'f7f1f90af08e4b06b9dcc750226efd8f');
INSERT INTO `jy_base_role_resources` VALUES ('c3e444b71e744a94b76c79e429f61631', '3bfe84bade44428581b5102b5fabff36');
INSERT INTO `jy_base_role_resources` VALUES ('c3e444b71e744a94b76c79e429f61631', '402880e9624b9e2801624b9e28080000');
INSERT INTO `jy_base_role_resources` VALUES ('c3e444b71e744a94b76c79e429f61631', '4028818462a3f2730162a3f3e72c0001');
INSERT INTO `jy_base_role_resources` VALUES ('c3e444b71e744a94b76c79e429f61631', '783938b7cdc947c68cf48d734aed51cc');
INSERT INTO `jy_base_role_resources` VALUES ('c3e444b71e744a94b76c79e429f61631', 'b7e74a818e6c4a879a8c0dcdd28d3526');
INSERT INTO `jy_base_role_resources` VALUES ('c3e444b71e744a94b76c79e429f61631', 'b8c7e7b96d274095a5494277793d39b4');
INSERT INTO `jy_base_role_resources` VALUES ('c3e444b71e744a94b76c79e429f61631', 'ba8c2c172df54fc992369b3671b6c787');
INSERT INTO `jy_base_role_resources` VALUES ('c3e444b71e744a94b76c79e429f61631', 'bdda4065d9904e718e8dd70e035bdb43');
INSERT INTO `jy_base_role_resources` VALUES ('cde1daaf551b41e98bfeded725f119ab', '3bfe84bade44428581b5102b5fabff36');
INSERT INTO `jy_base_role_resources` VALUES ('cde1daaf551b41e98bfeded725f119ab', '4028818462a3f2730162a3f273790000');
INSERT INTO `jy_base_role_resources` VALUES ('cde1daaf551b41e98bfeded725f119ab', '783938b7cdc947c68cf48d734aed51cc');
INSERT INTO `jy_base_role_resources` VALUES ('cde1daaf551b41e98bfeded725f119ab', 'b8c7e7b96d274095a5494277793d39b4');
INSERT INTO `jy_base_role_resources` VALUES ('cde1daaf551b41e98bfeded725f119ab', 'ba8c2c172df54fc992369b3671b6c787');
INSERT INTO `jy_base_role_resources` VALUES ('cde1daaf551b41e98bfeded725f119ab', 'bdda4065d9904e718e8dd70e035bdb43');
INSERT INTO `jy_base_role_resources` VALUES ('cde1daaf551b41e98bfeded725f119ab', 'ed76bf221dd04ad5a2a8a724f11f1f4a');
INSERT INTO `jy_base_role_resources` VALUES ('cde1daaf551b41e98bfeded725f119ab', 'f6ec54ae6b1941f9af8ae6aaa65fa667');

-- ----------------------------
-- Table structure for jy_data_dict
-- ----------------------------
DROP TABLE IF EXISTS `jy_data_dict`;
CREATE TABLE `jy_data_dict` (
  `id` varchar(32) NOT NULL,
  `dataKey` varchar(32) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `isValid` int(2) NOT NULL DEFAULT '0',
  `description` varchar(128) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jy_data_dict
-- ----------------------------
INSERT INTO `jy_data_dict` VALUES ('0aa8a73cbbb14b8bbbe69925bc4fce6d', 'status1', '托运单运输状态', '1', 'hd_goods_publish中的transport_status', '2018-02-01 14:50:13', '2018-02-01 14:53:29');
INSERT INTO `jy_data_dict` VALUES ('3900a412e51e43ff83a08c732095b2a3', 'leaveType', '请假类型', '1', '请假申请使用', '2016-01-21 12:56:25', null);
INSERT INTO `jy_data_dict` VALUES ('741cae2856aa43d3bb6cc60c8ed2d8a9', 'isTask', '任务状态', '1', '任务使用', '2015-12-24 13:01:11', '2015-12-30 20:12:35');
INSERT INTO `jy_data_dict` VALUES ('89d7a71055c34d6f85cd6f6b192a9c25', 'VehicleClassific', '车辆分类代码', '1', '', '2018-03-12 20:04:46', null);
INSERT INTO `jy_data_dict` VALUES ('9f5bf53e0027414c96002f8a1114aaf6', 'positionType', '职务类别', '1', '职务管理使用', '2016-01-22 16:13:58', '2016-01-22 16:14:13');
INSERT INTO `jy_data_dict` VALUES ('aac903e055014b68a3f09f8eb9ace6bc', 'logType', '日志类型', '1', '日志使用', '2015-12-24 20:39:15', '2015-12-24 20:39:25');
INSERT INTO `jy_data_dict` VALUES ('d6336e1e3ba64dfd885e930eb9d88e32', 'isValid', '状态', '1', '全局使用', '2015-11-20 15:56:20', '2015-12-09 20:56:38');
INSERT INTO `jy_data_dict` VALUES ('e6408ac8c10f43c99f04f6116103429f', 'PlateType', '车牌类型', '1', '', '2018-03-12 08:29:47', '2018-03-12 19:56:00');
INSERT INTO `jy_data_dict` VALUES ('ebf0c2e03e0340048ee53e3e7c3f0805', 'wxSubscribe', '订阅情况', '1', '微信关注者使用', '2015-12-30 15:33:27', null);

-- ----------------------------
-- Table structure for jy_data_dict_item
-- ----------------------------
DROP TABLE IF EXISTS `jy_data_dict_item`;
CREATE TABLE `jy_data_dict_item` (
  `dictId` varchar(32) NOT NULL,
  `value` varchar(64) NOT NULL,
  `name` varchar(32) NOT NULL,
  `sort` int(10) NOT NULL,
  PRIMARY KEY (`dictId`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jy_data_dict_item
-- ----------------------------
INSERT INTO `jy_data_dict_item` VALUES ('0aa8a73cbbb14b8bbbe69925bc4fce6d', '1', '待付款', '1');
INSERT INTO `jy_data_dict_item` VALUES ('0aa8a73cbbb14b8bbbe69925bc4fce6d', '2', '待发货', '2');
INSERT INTO `jy_data_dict_item` VALUES ('0aa8a73cbbb14b8bbbe69925bc4fce6d', '3', '待收货', '3');
INSERT INTO `jy_data_dict_item` VALUES ('0aa8a73cbbb14b8bbbe69925bc4fce6d', '4', '待评价', '4');
INSERT INTO `jy_data_dict_item` VALUES ('0aa8a73cbbb14b8bbbe69925bc4fce6d', '5', '交易完成', '5');
INSERT INTO `jy_data_dict_item` VALUES ('3900a412e51e43ff83a08c732095b2a3', 'bj', '病假', '3');
INSERT INTO `jy_data_dict_item` VALUES ('3900a412e51e43ff83a08c732095b2a3', 'gsj', '工伤假', '2');
INSERT INTO `jy_data_dict_item` VALUES ('3900a412e51e43ff83a08c732095b2a3', 'hj', '婚假', '6');
INSERT INTO `jy_data_dict_item` VALUES ('3900a412e51e43ff83a08c732095b2a3', 'nj', '年假', '1');
INSERT INTO `jy_data_dict_item` VALUES ('3900a412e51e43ff83a08c732095b2a3', 'sangj', '丧假', '7');
INSERT INTO `jy_data_dict_item` VALUES ('3900a412e51e43ff83a08c732095b2a3', 'shij', '事假', '4');
INSERT INTO `jy_data_dict_item` VALUES ('3900a412e51e43ff83a08c732095b2a3', 'syj', '生育假', '5');
INSERT INTO `jy_data_dict_item` VALUES ('741cae2856aa43d3bb6cc60c8ed2d8a9', '0', '停用', '2');
INSERT INTO `jy_data_dict_item` VALUES ('741cae2856aa43d3bb6cc60c8ed2d8a9', '1', '启用', '1');
INSERT INTO `jy_data_dict_item` VALUES ('89d7a71055c34d6f85cd6f6b192a9c25', 'G01', '普通挂车', '5');
INSERT INTO `jy_data_dict_item` VALUES ('89d7a71055c34d6f85cd6f6b192a9c25', 'G02', '厢式挂车', '15');
INSERT INTO `jy_data_dict_item` VALUES ('89d7a71055c34d6f85cd6f6b192a9c25', 'G03', '罐式挂车', '6');
INSERT INTO `jy_data_dict_item` VALUES ('89d7a71055c34d6f85cd6f6b192a9c25', 'G04', '平板挂车', '17');
INSERT INTO `jy_data_dict_item` VALUES ('89d7a71055c34d6f85cd6f6b192a9c25', 'G05', '集装箱挂车', '7');
INSERT INTO `jy_data_dict_item` VALUES ('89d7a71055c34d6f85cd6f6b192a9c25', 'G06', '自卸挂车', '18');
INSERT INTO `jy_data_dict_item` VALUES ('89d7a71055c34d6f85cd6f6b192a9c25', 'G07', '仓栅式挂车', '16');
INSERT INTO `jy_data_dict_item` VALUES ('89d7a71055c34d6f85cd6f6b192a9c25', 'G09', '专项作业挂车', '19');
INSERT INTO `jy_data_dict_item` VALUES ('89d7a71055c34d6f85cd6f6b192a9c25', 'H01', '普通货车', '1');
INSERT INTO `jy_data_dict_item` VALUES ('89d7a71055c34d6f85cd6f6b192a9c25', 'H02', '厢式货车', '2');
INSERT INTO `jy_data_dict_item` VALUES ('89d7a71055c34d6f85cd6f6b192a9c25', 'H03', '封闭货车', '9');
INSERT INTO `jy_data_dict_item` VALUES ('89d7a71055c34d6f85cd6f6b192a9c25', 'H04', '罐式货车', '3');
INSERT INTO `jy_data_dict_item` VALUES ('89d7a71055c34d6f85cd6f6b192a9c25', 'H05', '平板货车', '10');
INSERT INTO `jy_data_dict_item` VALUES ('89d7a71055c34d6f85cd6f6b192a9c25', 'H06', '集装箱车', '11');
INSERT INTO `jy_data_dict_item` VALUES ('89d7a71055c34d6f85cd6f6b192a9c25', 'H07', '自卸货车', '12');
INSERT INTO `jy_data_dict_item` VALUES ('89d7a71055c34d6f85cd6f6b192a9c25', 'H08', '特殊结构货车', '13');
INSERT INTO `jy_data_dict_item` VALUES ('89d7a71055c34d6f85cd6f6b192a9c25', 'H09', '仓栅式货车', '8');
INSERT INTO `jy_data_dict_item` VALUES ('89d7a71055c34d6f85cd6f6b192a9c25', 'Q00', '牵引车', '4');
INSERT INTO `jy_data_dict_item` VALUES ('89d7a71055c34d6f85cd6f6b192a9c25', 'X91', '车辆运输车', '20');
INSERT INTO `jy_data_dict_item` VALUES ('89d7a71055c34d6f85cd6f6b192a9c25', 'X92', '车辆运输车(单排)', '21');
INSERT INTO `jy_data_dict_item` VALUES ('89d7a71055c34d6f85cd6f6b192a9c25', 'Z00', '专项作业车', '14');
INSERT INTO `jy_data_dict_item` VALUES ('9f5bf53e0027414c96002f8a1114aaf6', 'gmanager', '总经理', '2');
INSERT INTO `jy_data_dict_item` VALUES ('9f5bf53e0027414c96002f8a1114aaf6', 'manager', '经理', '1');
INSERT INTO `jy_data_dict_item` VALUES ('9f5bf53e0027414c96002f8a1114aaf6', 'president', '董事长', '3');
INSERT INTO `jy_data_dict_item` VALUES ('aac903e055014b68a3f09f8eb9ace6bc', '1', '正常', '1');
INSERT INTO `jy_data_dict_item` VALUES ('aac903e055014b68a3f09f8eb9ace6bc', '2', '异常', '2');
INSERT INTO `jy_data_dict_item` VALUES ('d6336e1e3ba64dfd885e930eb9d88e32', '0', '无效', '2');
INSERT INTO `jy_data_dict_item` VALUES ('d6336e1e3ba64dfd885e930eb9d88e32', '1', '有效', '1');
INSERT INTO `jy_data_dict_item` VALUES ('e6408ac8c10f43c99f04f6116103429f', '01', '黄底黑字', '1');
INSERT INTO `jy_data_dict_item` VALUES ('e6408ac8c10f43c99f04f6116103429f', '02', '蓝底白字', '2');
INSERT INTO `jy_data_dict_item` VALUES ('e6408ac8c10f43c99f04f6116103429f', '99', '其他号牌', '3');
INSERT INTO `jy_data_dict_item` VALUES ('ebf0c2e03e0340048ee53e3e7c3f0805', '0', '退订', '2');
INSERT INTO `jy_data_dict_item` VALUES ('ebf0c2e03e0340048ee53e3e7c3f0805', '1', '订阅', '1');

-- ----------------------------
-- Table structure for jy_opt_log
-- ----------------------------
DROP TABLE IF EXISTS `jy_opt_log`;
CREATE TABLE `jy_opt_log` (
  `id` varchar(32) NOT NULL,
  `optName` varchar(100) DEFAULT NULL,
  `method` varchar(500) DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL,
  `data` longtext,
  `ip` varchar(40) DEFAULT NULL,
  `optTime` datetime DEFAULT NULL,
  `userId` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jy_opt_log
-- ----------------------------
INSERT INTO `jy_opt_log` VALUES ('0143fdb0eea44bd68b79d096112eb3bb', '更新用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.update(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"accountId\":\"cd7e05d8afca4af09aa43d495f9a6f4c\",\"name\":\"Mr.w\",\"roleId\":\"90fc68b9c6dd4baa8be265805118171f\",\"email\":\"\",\"description\":\"7AB4Xb\",\"isValid\":1,\"loginLog\":{},\"poss\":[]}]', '0:0:0:0:0:0:0:1', '2018-01-04 16:44:05', '2');
INSERT INTO `jy_opt_log` VALUES ('01b120a55beb488584e9c4b86f451be0', '新增用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.add(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"loginName\":\"asd456123\",\"password\":\"asd456123\",\"roleId\":\"c3e444b71e744a94b76c79e429f61631\",\"loginLog\":{},\"mobileTelephoneNumber\":\"15283844567\",\"poss\":[]}]', '0:0:0:0:0:0:0:1', '2018-03-14 15:14:49', '');
INSERT INTO `jy_opt_log` VALUES ('03ee889ac82f4a6a90b19627aa5c16b6', '更新用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.update(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"accountId\":2,\"name\":\"柳龙\",\"roleId\":\"3\",\"email\":\"xx@163.com\",\"description\":\"\",\"isValid\":1,\"loginLog\":{},\"poss\":[]}]', '0:0:0:0:0:0:0:1', '2017-12-26 20:24:26', '2');
INSERT INTO `jy_opt_log` VALUES ('0961f4e76a034e8490870b69f3088ba4', '更新用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.update(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"accountId\":\"cd7e05d8afca4af09aa43d495f9a6f4c\",\"name\":\"Mr.w\",\"roleId\":\"5b8661cb83114d28b2c733f70dc98f4e\",\"email\":\"\",\"description\":\"7AB4Xb\",\"isValid\":1,\"loginLog\":{},\"poss\":[]}]', '0:0:0:0:0:0:0:1', '2018-01-04 11:02:15', '2');
INSERT INTO `jy_opt_log` VALUES ('0a6c6b0370cf4b4097bbecd351c4904f', '新增用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.add(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"accountId\":\"1893cdc43d0c4580a4bc75243038cf42\",\"loginName\":\"selfmin\",\"name\":\"\",\"roleId\":\"cde1daaf551b41e98bfeded725f119ab\",\"email\":\"\",\"description\":\"\",\"isValid\":1,\"loginLog\":{},\"poss\":[]}]', '192.168.0.18', '2018-01-04 09:54:38', '2');
INSERT INTO `jy_opt_log` VALUES ('145aa360b5ec4d15a60d1f9d5eb81b54', '新增用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.add(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"loginName\":\"liulong1\",\"password\":\"lxtx1234\",\"roleId\":\"cde1daaf551b41e98bfeded725f119ab\",\"loginLog\":{},\"mobileTelephoneNumber\":\"13146763147\",\"poss\":[]}]', '0:0:0:0:0:0:0:1', '2018-01-28 22:12:28', '');
INSERT INTO `jy_opt_log` VALUES ('185ef80916904ac7a8a118b6f0b9f8ef', '更新用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.update(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"accountId\":4,\"name\":\"\",\"roleId\":\"2\",\"email\":\"\",\"description\":\"\",\"isValid\":1,\"loginLog\":{},\"poss\":[]}]', '0:0:0:0:0:0:0:1', '2017-12-26 20:24:00', '2');
INSERT INTO `jy_opt_log` VALUES ('188c5c857e8442549a23e1931971a7ba', '新增用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.add(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"loginName\":\"liulong4\",\"password\":\"lxtx1234\",\"roleId\":\"cde1daaf551b41e98bfeded725f119ab\",\"loginLog\":{},\"mobileTelephoneNumber\":\"13146763147\",\"poss\":[]}]', '0:0:0:0:0:0:0:1', '2018-01-28 11:30:12', '');
INSERT INTO `jy_opt_log` VALUES ('1896c52e6ce742f1911936cd9d3f901d', '新增用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.add(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"loginName\":\"liulong\",\"password\":\"lxtx1234\",\"userType\":\"1\",\"loginLog\":{},\"mobileTelephoneNumber\":\"13146763147\",\"poss\":[]}]', '0:0:0:0:0:0:0:1', '2018-01-28 10:21:29', '');
INSERT INTO `jy_opt_log` VALUES ('1f13c4a1e6644728a79544ba852e2284', '新增用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.add(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"loginName\":\"liulong4\",\"password\":\"lxtx1234\",\"roleId\":\"02665eef40a74e9cb22c602676f6b460\",\"loginLog\":{},\"mobileTelephoneNumber\":\"13146763150\",\"poss\":[]}]', '0:0:0:0:0:0:0:1', '2018-01-29 09:27:19', '');
INSERT INTO `jy_opt_log` VALUES ('260d010d5f9b467e974ae4f628a9835c', '新增用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.add(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"loginName\":\"liulong\",\"password\":\"hdwl1234\",\"loginLog\":{},\"mobileTelephoneNumber\":\"13146763314\",\"poss\":[]}]', '0:0:0:0:0:0:0:1', '2017-12-26 16:58:08', '');
INSERT INTO `jy_opt_log` VALUES ('26c2fbc2c9844bc186cda13b7cf62a7a', '新增用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.add(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"accountId\":\"8cbf3393a1a4490e9184317a1ac95cae\",\"loginName\":\"发货人\",\"name\":\"发货人\",\"roleId\":\"f845a8d2167c40f39088b837f985bbdb\",\"email\":\"\",\"description\":\"\",\"isValid\":1,\"loginLog\":{},\"poss\":[]}]', '0:0:0:0:0:0:0:1', '2017-12-27 10:20:07', '4');
INSERT INTO `jy_opt_log` VALUES ('350e9462805c4e988b95e045f1a5cb4d', '新增用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.add(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"accountId\":\"\",\"loginName\":\"liulong3\",\"name\":\"个人承运人\",\"roleId\":\"5b8661cb83114d28b2c733f70dc98f4e\",\"email\":\"\",\"description\":\"\",\"isValid\":1,\"loginLog\":{},\"poss\":[]}]', '0:0:0:0:0:0:0:1', '2018-01-29 09:21:15', '2');
INSERT INTO `jy_opt_log` VALUES ('353560445a6347a09fac3fc25815664a', '新增用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.add(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"loginName\":\"asd789456\",\"password\":\"asd789456\",\"roleId\":\"cde1daaf551b41e98bfeded725f119ab\",\"loginLog\":{},\"mobileTelephoneNumber\":\"15283847896\",\"poss\":[]}]', '0:0:0:0:0:0:0:1', '2018-03-14 15:08:52', '');
INSERT INTO `jy_opt_log` VALUES ('3a15c7e62e3b49938b3b15f5b781be17', '新增用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.add(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"loginName\":\"dxy\",\"password\":\"qazwsx123\",\"loginLog\":{},\"mobileTelephoneNumber\":\"13452698700\",\"poss\":[]}]', '0:0:0:0:0:0:0:1', '2017-12-26 17:39:58', '');
INSERT INTO `jy_opt_log` VALUES ('3a8c53d266b744128d20fc00c0335c02', '新增用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.add(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"accountId\":\"2\",\"loginName\":\"ordinary\",\"name\":\"Mr.w\",\"roleId\":\"95ba5f0500f8431f981186152e16d953\",\"email\":\"\",\"description\":\"\",\"isValid\":1,\"loginLog\":{},\"poss\":[]}]', '192.168.0.11', '2017-12-29 10:46:37', '2');
INSERT INTO `jy_opt_log` VALUES ('3c95759dfc754569900478069b4409f0', '更新用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.update(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"accountId\":\"4\",\"name\":\"\",\"roleId\":\"f845a8d2167c40f39088b837f985bbdb\",\"email\":\"\",\"description\":\"\",\"isValid\":0,\"loginLog\":{},\"poss\":[]}]', '0:0:0:0:0:0:0:1', '2017-12-27 10:45:18', '2');
INSERT INTO `jy_opt_log` VALUES ('42757d209ad04e2fa08151b767220dde', '新增用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.add(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"loginName\":\"liulong2\",\"password\":\"lxtx1234,lxtx1234\",\"userType\":\"1\",\"loginLog\":{},\"mobileTelephoneNumber\":\"13146763147\",\"poss\":[]}]', '0:0:0:0:0:0:0:1', '2018-01-28 10:23:28', '');
INSERT INTO `jy_opt_log` VALUES ('4c35333c32aa4783880d1b32ff639366', '新增用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.add(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"loginName\":\"liulong2\",\"password\":\"lxtx1234\",\"roleId\":\"c3e444b71e744a94b76c79e429f61631\",\"loginLog\":{},\"mobileTelephoneNumber\":\"13146763148\",\"poss\":[]}]', '0:0:0:0:0:0:0:1', '2018-01-29 09:11:32', '');
INSERT INTO `jy_opt_log` VALUES ('4c415c8727ea4e1b881aa17cb927e8df', '新增用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.add(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"accountId\":\"\",\"loginName\":\"company\",\"name\":\"\",\"roleId\":\"90fc68b9c6dd4baa8be265805118171f\",\"email\":\"\",\"description\":\"\",\"isValid\":1,\"loginLog\":{},\"poss\":[]}]', '192.168.0.18', '2018-01-03 16:30:20', '2');
INSERT INTO `jy_opt_log` VALUES ('50fb1b0fe9a848699daba091b6ff2c33', '新增用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.add(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"loginName\":\"liulong1\",\"password\":\"lxtx1234\",\"roleId\":\"cde1daaf551b41e98bfeded725f119ab\",\"loginLog\":{},\"mobileTelephoneNumber\":\"13146763147\",\"poss\":[]}]', '0:0:0:0:0:0:0:1', '2018-01-29 09:10:13', '');
INSERT INTO `jy_opt_log` VALUES ('51eb7400f4b14e34b451b594722faaaa', '新增用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.add(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"loginName\":\"liulong\",\"password\":\"lxtx8025\",\"loginLog\":{},\"mobileTelephoneNumber\":\"13146763147\",\"poss\":[]}]', '0:0:0:0:0:0:0:1', '2018-01-28 10:07:58', '');
INSERT INTO `jy_opt_log` VALUES ('52a86ec6c3d74c2e9d7bca658ada84a9', '新增用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.add(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"loginName\":\"liulong\",\"password\":\"lxtx1234\",\"roleId\":\"cde1daaf551b41e98bfeded725f119ab\",\"loginLog\":{},\"mobileTelephoneNumber\":\"13146763147\",\"poss\":[]}]', '0:0:0:0:0:0:0:1', '2018-01-28 14:33:29', '');
INSERT INTO `jy_opt_log` VALUES ('53d9e293d19841afa94d92387e9b9dd3', '更新用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.update(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"accountId\":\"4\",\"name\":\"\",\"roleId\":\"90fc68b9c6dd4baa8be265805118171f\",\"email\":\"\",\"description\":\"\",\"isValid\":1,\"loginLog\":{},\"poss\":[]}]', '0:0:0:0:0:0:0:1', '2017-12-28 20:32:42', '2');
INSERT INTO `jy_opt_log` VALUES ('58de4dd08166421da0e8e3cb34111afd', '新增用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.add(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"loginName\":\"liulong\",\"password\":\"lxtx1234\",\"roleId\":\"cde1daaf551b41e98bfeded725f119ab\",\"loginLog\":{},\"mobileTelephoneNumber\":\"13146763147\",\"poss\":[]}]', '0:0:0:0:0:0:0:1', '2018-01-28 14:55:55', '');
INSERT INTO `jy_opt_log` VALUES ('5e0da546865349469577527cd58b1c14', '更新用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.update(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"accountId\":\"6791e802ad8747e485024c15fe4fe70c\",\"name\":\"Mr.w\",\"roleId\":\"5b8661cb83114d28b2c733f70dc98f4e\",\"email\":\"\",\"description\":\"567T24\",\"isValid\":0,\"loginLog\":{},\"poss\":[]}]', '0:0:0:0:0:0:0:1', '2018-01-13 10:58:05', '2');
INSERT INTO `jy_opt_log` VALUES ('5f73b8420621438a8560bc557126e895', '更新用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.update(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"accountId\":\"4\",\"name\":\"\",\"roleId\":\"45aa136ddbbd47f1b1cc77bb390748cc\",\"email\":\"\",\"description\":\"\",\"isValid\":1,\"loginLog\":{},\"poss\":[]}]', '0:0:0:0:0:0:0:1', '2017-12-27 10:47:10', '2');
INSERT INTO `jy_opt_log` VALUES ('600ca625c36c4585891eb311afdeb7fc', '更新用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.update(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"accountId\":\"6791e802ad8747e485024c15fe4fe70c\",\"name\":\"Mr.w\",\"roleId\":\"cde1daaf551b41e98bfeded725f119ab\",\"email\":\"\",\"description\":\"567T24\",\"isValid\":1,\"loginLog\":{},\"poss\":[]}]', '192.168.0.18', '2018-01-04 09:55:25', '2');
INSERT INTO `jy_opt_log` VALUES ('611ce85fecf94dfbb49bbe32e85399b0', '新增用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.add(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"loginName\":\"wxfcyr\",\"password\":\"wei168000\",\"roleId\":\"5b8661cb83114d28b2c733f70dc98f4e\",\"loginLog\":{},\"mobileTelephoneNumber\":\"18632871252\",\"poss\":[]}]', '221.192.178.67', '2018-03-21 10:36:20', '');
INSERT INTO `jy_opt_log` VALUES ('61988f1d0e6445aba7d42426689c5b75', '更新用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.update(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"accountId\":\"1893cdc43d0c4580a4bc75243038cf42\",\"name\":\"Mr.w\",\"roleId\":\"cde1daaf551b41e98bfeded725f119ab\",\"email\":\"\",\"description\":\"u338o1\",\"isValid\":1,\"loginLog\":{},\"poss\":[]}]', '192.168.0.18', '2018-01-04 09:21:20', '2');
INSERT INTO `jy_opt_log` VALUES ('6354cc7e3ec946a0934ced4e7b061723', '更新用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.update(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"accountId\":\"6791e802ad8747e485024c15fe4fe70c\",\"name\":\"Mr.w\",\"roleId\":\"5b8661cb83114d28b2c733f70dc98f4e\",\"email\":\"\",\"description\":\"567T24\",\"isValid\":1,\"loginLog\":{},\"poss\":[]}]', '0:0:0:0:0:0:0:1', '2018-01-13 10:58:44', '2');
INSERT INTO `jy_opt_log` VALUES ('740e3bca68ff4487b42199b0825c641a', '更新用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.update(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"accountId\":\"4\",\"name\":\"\",\"roleId\":\"32fb4a183270473bacd9ad7ed784e904\",\"email\":\"\",\"description\":\"\",\"isValid\":1,\"loginLog\":{},\"poss\":[]}]', '0:0:0:0:0:0:0:1', '2017-12-27 21:59:13', '2');
INSERT INTO `jy_opt_log` VALUES ('7552900ce77f4afc8867c29a5aafb1ad', '更新用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.update(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"accountId\":\"4\",\"name\":\"\",\"roleId\":\"f845a8d2167c40f39088b837f985bbdb\",\"email\":\"\",\"description\":\"\",\"isValid\":1,\"loginLog\":{},\"poss\":[]}]', '0:0:0:0:0:0:0:1', '2017-12-27 11:03:39', '2');
INSERT INTO `jy_opt_log` VALUES ('762b743f3ba94d31a77302759e69faea', '新增用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.add(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"loginName\":\"liulong\",\"password\":\"lxtx8025\",\"loginLog\":{},\"mobileTelephoneNumber\":\"13146763147\",\"poss\":[]}]', '0:0:0:0:0:0:0:1', '2018-01-28 09:21:35', '');
INSERT INTO `jy_opt_log` VALUES ('7705535ccc3941d9940e33739a7b3354', '新增用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.add(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"loginName\":\"liulong3\",\"password\":\"lxtx1234\",\"roleId\":\"cde1daaf551b41e98bfeded725f119ab\",\"loginLog\":{},\"mobileTelephoneNumber\":\"13146763147\",\"poss\":[]}]', '0:0:0:0:0:0:0:1', '2018-01-28 10:33:31', '');
INSERT INTO `jy_opt_log` VALUES ('8458e206fc74468ba411fa2444b72aaa', '新增用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.add(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"loginName\":\"liulong\",\"password\":\"lxtx8025\",\"loginLog\":{},\"mobileTelephoneNumber\":\"13146763147\",\"poss\":[]}]', '0:0:0:0:0:0:0:1', '2018-01-28 10:07:34', '');
INSERT INTO `jy_opt_log` VALUES ('86bf776dc61e445f91910ceb4d5a5a95', '更新用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.update(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"accountId\":\"4\",\"name\":\"\",\"roleId\":\"45aa136ddbbd47f1b1cc77bb390748cc\",\"email\":\"\",\"description\":\"\",\"isValid\":1,\"loginLog\":{},\"poss\":[]}]', '0:0:0:0:0:0:0:1', '2017-12-27 10:45:46', '2');
INSERT INTO `jy_opt_log` VALUES ('87240be3f1644d439322d3f5f59d4763', '更新用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.update(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"accountId\":\"1893cdc43d0c4580a4bc75243038cf42\",\"name\":\"Mr.w\",\"roleId\":\"5b8661cb83114d28b2c733f70dc98f4e\",\"email\":\"\",\"description\":\"u338o1\",\"isValid\":1,\"loginLog\":{},\"poss\":[]}]', '192.168.0.18', '2018-01-04 09:56:04', '2');
INSERT INTO `jy_opt_log` VALUES ('8a424c0a9a7847bbb384e8d61a238f6b', '新增用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.add(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"loginName\":\"liulong\",\"password\":\"lxtx8025\",\"loginLog\":{},\"mobileTelephoneNumber\":\"13146763147\",\"poss\":[]}]', '0:0:0:0:0:0:0:1', '2018-01-28 10:08:47', '');
INSERT INTO `jy_opt_log` VALUES ('8c3a8f63d1424066a984f10233f217cc', '更新用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.update(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"accountId\":\"4158c04eab3b4bee944b3ee0fdfdf1e4\",\"name\":\"Mr.w\",\"roleId\":\"90fc68b9c6dd4baa8be265805118171f\",\"email\":\"\",\"description\":\"Uu73S2\",\"isValid\":1,\"loginLog\":{},\"poss\":[]}]', '192.168.0.18', '2018-01-03 16:30:36', '2');
INSERT INTO `jy_opt_log` VALUES ('8f4d0acdf63b440191cbf25d12e9d77c', '新增用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.add(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"loginName\":\"liulong\",\"password\":\"hdwl1234\",\"loginLog\":{},\"mobileTelephoneNumber\":\"13146763147\",\"poss\":[]}]', '0:0:0:0:0:0:0:1', '2018-01-27 09:32:05', '');
INSERT INTO `jy_opt_log` VALUES ('9b8095be4a874432949b1cac5de34df4', '新增用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.add(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"loginName\":\"liulong1\",\"password\":\"lxtx1234\",\"roleId\":\"cde1daaf551b41e98bfeded725f119ab\",\"loginLog\":{},\"mobileTelephoneNumber\":\"13146763147\",\"poss\":[]}]', '0:0:0:0:0:0:0:1', '2018-01-28 22:10:01', '');
INSERT INTO `jy_opt_log` VALUES ('a106f523915d45158169de5ca121e0c1', '新增用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.add(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"loginName\":\"liulong\",\"password\":\"lxtx1234,lxtx1234\",\"roleId\":\"cde1daaf551b41e98bfeded725f119ab\",\"loginLog\":{},\"mobileTelephoneNumber\":\"13146763147\",\"poss\":[]}]', '0:0:0:0:0:0:0:1', '2018-01-28 14:28:34', '');
INSERT INTO `jy_opt_log` VALUES ('a5c472c2511348219ea262847f8e93ec', '更新用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.update(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"accountId\":\"4158c04eab3b4bee944b3ee0fdfdf1e4\",\"name\":\"Mr.w\",\"roleId\":\"02665eef40a74e9cb22c602676f6b460\",\"email\":\"\",\"description\":\"Uu73S2\",\"isValid\":1,\"loginLog\":{},\"poss\":[]}]', '192.168.0.18', '2018-01-04 08:59:53', '2');
INSERT INTO `jy_opt_log` VALUES ('aae7e4a197e646db92963d215d2fe7f5', '更新用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.update(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"accountId\":\"4\",\"name\":\"\",\"roleId\":\"45aa136ddbbd47f1b1cc77bb390748cc\",\"email\":\"\",\"description\":\"\",\"isValid\":1,\"loginLog\":{},\"poss\":[]}]', '0:0:0:0:0:0:0:1', '2017-12-27 10:47:21', '2');
INSERT INTO `jy_opt_log` VALUES ('ac37555de1884f73a0c8a789e92feb21', '更新用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.update(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"accountId\":\"cd7e05d8afca4af09aa43d495f9a6f4c\",\"name\":\"Mr.w\",\"roleId\":\"90fc68b9c6dd4baa8be265805118171f\",\"email\":\"\",\"description\":\"7AB4Xb\",\"isValid\":1,\"loginLog\":{},\"poss\":[]}]', '192.168.0.18', '2018-01-02 19:29:30', '2');
INSERT INTO `jy_opt_log` VALUES ('b11501ff811f4c81a772a118077151d3', '更新用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.update(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"accountId\":\"4\",\"name\":\"\",\"roleId\":\"90fc68b9c6dd4baa8be265805118171f\",\"email\":\"\",\"description\":\"\",\"isValid\":1,\"loginLog\":{},\"poss\":[]}]', '192.168.0.11', '2017-12-28 10:56:50', '2');
INSERT INTO `jy_opt_log` VALUES ('b64273bf65544b01aeb0bb6d47d85663', '更新用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.update(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"accountId\":\"4\",\"name\":\"\",\"roleId\":\"95ba5f0500f8431f981186152e16d953\",\"email\":\"\",\"description\":\"\",\"isValid\":1,\"loginLog\":{},\"poss\":[]}]', '192.168.0.11', '2017-12-29 11:16:35', '2');
INSERT INTO `jy_opt_log` VALUES ('b8a6251ece0943b3a1d48cfa58a1dd75', '更新用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.update(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"accountId\":\"cd7e05d8afca4af09aa43d495f9a6f4c\",\"name\":\"Mr.w\",\"roleId\":\"4\",\"email\":\"\",\"description\":\"7AB4Xb\",\"isValid\":1,\"loginLog\":{},\"poss\":[]}]', '0:0:0:0:0:0:0:1', '2018-01-21 08:48:36', '2');
INSERT INTO `jy_opt_log` VALUES ('c1bf3be6663c40c99cf07163f3f1954c', '新增用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.add(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"loginName\":\"liulong\",\"password\":\"lxtx1234\",\"loginLog\":{},\"mobileTelephoneNumber\":\"13146763147\",\"poss\":[]}]', '0:0:0:0:0:0:0:1', '2018-01-28 09:12:08', '');
INSERT INTO `jy_opt_log` VALUES ('c1d8cc6767a449848e711cb3d83fb035', '新增用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.add(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"loginName\":\"zhangsan\",\"password\":\"lxtx1234\",\"loginLog\":{},\"mobileTelephoneNumber\":\"13146763147\",\"poss\":[]}]', '0:0:0:0:0:0:0:1', '2018-01-27 15:19:37', '');
INSERT INTO `jy_opt_log` VALUES ('c276b33d186a4534b8c3434ee7842ff4', '新增用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.add(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"accountId\":\"1893cdc43d0c4580a4bc75243038cf42\",\"loginName\":\"companymin\",\"name\":\"Mr.w\",\"roleId\":\"c3e444b71e744a94b76c79e429f61631\",\"email\":\"\",\"description\":\"\",\"isValid\":1,\"loginLog\":{},\"poss\":[]}]', '192.168.0.18', '2018-01-04 09:55:13', '2');
INSERT INTO `jy_opt_log` VALUES ('c5d3777ae2b6453d8242bd53aba863a2', '新增用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.add(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"accountId\":\"4158c04eab3b4bee944b3ee0fdfdf1e4\",\"loginName\":\"self\",\"name\":\"\",\"roleId\":\"cde1daaf551b41e98bfeded725f119ab\",\"email\":\"\",\"description\":\"\",\"isValid\":1,\"loginLog\":{},\"poss\":[]}]', '192.168.0.18', '2018-01-04 09:21:08', '2');
INSERT INTO `jy_opt_log` VALUES ('ce3f93549b4b4ad5a9eece329cc96161', '新增用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.add(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"loginName\":\"liulong\",\"password\":\"lxtx8025\",\"loginLog\":{},\"mobileTelephoneNumber\":\"13146763147\",\"poss\":[]}]', '0:0:0:0:0:0:0:1', '2018-01-28 10:13:56', '');
INSERT INTO `jy_opt_log` VALUES ('ce63c36ad38445a8bbb4aabdd5845cac', '新增用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.add(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"loginName\":\"liulong3\",\"password\":\"lxtx1234\",\"roleId\":\"5b8661cb83114d28b2c733f70dc98f4e\",\"loginLog\":{},\"mobileTelephoneNumber\":\"13146763149\",\"poss\":[]}]', '0:0:0:0:0:0:0:1', '2018-01-29 09:26:37', '');
INSERT INTO `jy_opt_log` VALUES ('d7478a2ae8cb4f568238600714da7fb2', '新增用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.add(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"loginName\":\"ordinary\",\"password\":\"hdwl1234\",\"loginLog\":{},\"mobileTelephoneNumber\":\"13833183856\",\"poss\":[]}]', '0:0:0:0:0:0:0:1', '2017-12-29 11:13:54', '');
INSERT INTO `jy_opt_log` VALUES ('d97b824724104b4aa28b319bba15a9f0', '更新用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.update(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"accountId\":\"cd7e05d8afca4af09aa43d495f9a6f4c\",\"name\":\"Mr.w\",\"roleId\":\"02665eef40a74e9cb22c602676f6b460\",\"email\":\"\",\"description\":\"7AB4Xb\",\"isValid\":1,\"loginLog\":{},\"poss\":[]}]', '0:0:0:0:0:0:0:1', '2018-01-04 11:17:48', '2');
INSERT INTO `jy_opt_log` VALUES ('d9ef8b9e2a9b48ab9703534ad2fc6244', '更新用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.update(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"accountId\":\"4\",\"name\":\"\",\"roleId\":\"90fc68b9c6dd4baa8be265805118171f\",\"email\":\"\",\"description\":\"\",\"isValid\":1,\"loginLog\":{},\"poss\":[]}]', '0:0:0:0:0:0:0:1', '2017-12-28 20:32:52', '2');
INSERT INTO `jy_opt_log` VALUES ('db1274f321a14733ba413428b2f4e361', '新增用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.add(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"loginName\":\"liulong4\",\"password\":\"lxtx1234,lxtx1234\",\"roleId\":\"cde1daaf551b41e98bfeded725f119ab\",\"loginLog\":{},\"mobileTelephoneNumber\":\"13146763147\",\"poss\":[]}]', '0:0:0:0:0:0:0:1', '2018-01-28 11:25:59', '');
INSERT INTO `jy_opt_log` VALUES ('ddfb86d57c434cc4b2f917fc4c2fa0f9', '新增用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.add(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"loginName\":\"liulong\",\"password\":\"lxtx1234\",\"loginLog\":{},\"mobileTelephoneNumber\":\"13146763147\",\"poss\":[]}]', '0:0:0:0:0:0:0:1', '2018-01-28 09:16:26', '');
INSERT INTO `jy_opt_log` VALUES ('e14310f051eb45138cc8aa4b56646662', '更新用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.update(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"accountId\":\"4\",\"name\":\"\",\"roleId\":\"f845a8d2167c40f39088b837f985bbdb\",\"email\":\"\",\"description\":\"\",\"isValid\":1,\"loginLog\":{},\"poss\":[]}]', '0:0:0:0:0:0:0:1', '2017-12-27 10:45:12', '2');
INSERT INTO `jy_opt_log` VALUES ('e4845fa6036042b5beb031d649380006', '更新用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.update(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"accountId\":\"4\",\"name\":\"\",\"roleId\":\"f845a8d2167c40f39088b837f985bbdb\",\"email\":\"\",\"description\":\"\",\"isValid\":1,\"loginLog\":{},\"poss\":[]}]', '0:0:0:0:0:0:0:1', '2017-12-27 10:45:08', '2');
INSERT INTO `jy_opt_log` VALUES ('e70dce25b4df454a80d9834138c917ac', '新增用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.add(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"loginName\":\"liulong\",\"password\":\"lxtx1234\",\"roleId\":\"cde1daaf551b41e98bfeded725f119ab\",\"loginLog\":{},\"mobileTelephoneNumber\":\"13146763147\",\"poss\":[]}]', '0:0:0:0:0:0:0:1', '2018-01-28 14:29:45', '');
INSERT INTO `jy_opt_log` VALUES ('e7e04fa5b18a40b18590d21c0c05e13b', '新增用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.add(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"accountId\":\"\",\"loginName\":\"wxf\",\"name\":\"wxf\",\"roleId\":\"4\",\"email\":\"\",\"description\":\"\",\"isValid\":1,\"loginLog\":{},\"poss\":[]}]', '0:0:0:0:0:0:0:1', '2018-01-24 19:51:10', '2');
INSERT INTO `jy_opt_log` VALUES ('ee16f7a836144df2a28766d46abbe6a0', '新增用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.add(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"loginName\":\"asd123456789\",\"password\":\"123456asd\",\"roleId\":\"5b8661cb83114d28b2c733f70dc98f4e\",\"loginLog\":{},\"mobileTelephoneNumber\":\"15283849876\",\"poss\":[]}]', '0:0:0:0:0:0:0:1', '2018-03-14 14:41:28', '');
INSERT INTO `jy_opt_log` VALUES ('f4061ad4a2b0483591fd3c8baa040ce4', '新增用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.add(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"loginName\":\"liulong\",\"password\":\"hdwl1234\",\"loginLog\":{},\"mobileTelephoneNumber\":\"13146763147\",\"poss\":[]}]', '0:0:0:0:0:0:0:1', '2017-12-26 16:52:20', '');
INSERT INTO `jy_opt_log` VALUES ('f59f14bd2d924a7fb6182867b15c1009', '新增用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.add(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"loginName\":\"liulong1\",\"password\":\"lxtx1234\",\"userType\":\"1\",\"loginLog\":{},\"mobileTelephoneNumber\":\"13146763147\",\"poss\":[]}]', '0:0:0:0:0:0:0:1', '2018-01-28 10:21:59', '');
INSERT INTO `jy_opt_log` VALUES ('f8239fe3a050432eaff7b955bf323c7a', '新增用户', 'public com.jy.common.ajax.AjaxRes com.jy.controller.system.account.AccountController.add(com.jy.entity.system.account.Account)', '/backstage/account/', '[{\"loginName\":\"liulong\",\"password\":\"lxtx8025\",\"loginLog\":{},\"mobileTelephoneNumber\":\"13146763147\",\"poss\":[]}]', '0:0:0:0:0:0:0:1', '2018-01-28 10:10:11', '');

-- ----------------------------
-- Table structure for jy_sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `jy_sys_dict`;
CREATE TABLE `jy_sys_dict` (
  `id` varchar(32) NOT NULL,
  `paramKey` varchar(64) DEFAULT NULL,
  `paramName` varchar(128) DEFAULT NULL,
  `paramValue` varchar(128) DEFAULT NULL,
  `isValid` int(2) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jy_sys_dict
-- ----------------------------
INSERT INTO `jy_sys_dict` VALUES ('66a38d9aba5142cb9f07ce5e73e5cb5e', 'gjcss', '高级测试师', '3', '1', '', '2015-12-13 23:39:26', null);
INSERT INTO `jy_sys_dict` VALUES ('a1b4403be93a417897269fcabed19c06', 'kfgcs', '开发工程师', '1', '1', '', '2015-12-13 23:38:15', '2015-12-13 23:38:46');
INSERT INTO `jy_sys_dict` VALUES ('d8a7e57a1447450c97d61aa1df65e41a', 'xtfxs', '系统分析师', '2', '1', '', '2015-12-13 23:38:36', '2016-01-30 17:29:59');

-- ----------------------------
-- Table structure for jy_task_log
-- ----------------------------
DROP TABLE IF EXISTS `jy_task_log`;
CREATE TABLE `jy_task_log` (
  `id` varchar(32) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `className` varchar(128) DEFAULT NULL,
  `type` int(2) DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jy_task_log
-- ----------------------------
INSERT INTO `jy_task_log` VALUES ('006250cd80dc419b98df96728abd0d5b', 'dataWork:myTask', 'com.jy.task.job.WeatherJob', '2', 'java.lang.NullPointerException', '2018-01-05 09:47:00');
INSERT INTO `jy_task_log` VALUES ('8fc57ae7c4d14156862ab1b7c5bec49f', 'weixin:syncFollower', 'com.jy.task.job.weixn.SyncFollowerJob', '2', 'java.lang.RuntimeException: com.jy.common.utils.weixin.exception.WechatApiException: {\"errcode\":41002,\"errmsg\":\"appid missing hint: [gblEoA0016e606]\"}', '2017-11-22 21:23:24');

-- ----------------------------
-- Table structure for jy_task_schedule
-- ----------------------------
DROP TABLE IF EXISTS `jy_task_schedule`;
CREATE TABLE `jy_task_schedule` (
  `scheduleJobId` varchar(32) NOT NULL,
  `jobName` varchar(64) DEFAULT NULL,
  `jobGroup` varchar(64) DEFAULT NULL,
  `aliasName` varchar(64) DEFAULT NULL,
  `jobClass` varchar(128) DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  `cronExpression` varchar(64) DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`scheduleJobId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jy_task_schedule
-- ----------------------------
INSERT INTO `jy_task_schedule` VALUES ('10001', 'myTask', 'dataWork', '获取天气', 'com.jy.task.job.WeatherJob', '0', '0 0 0,13,18,21 * * ?', '通过接口获取天气：每天的0点、13点、18点、21点都执行一次', '2015-12-23 13:37:45', '2018-01-05 10:00:35');
INSERT INTO `jy_task_schedule` VALUES ('18cd508664204f65b491aca8336e0748', 'syncFollower', 'weixin', null, 'com.jy.task.job.weixn.SyncFollowerJob', '0', '0 0 1 * * ?', '微信：每天凌晨1点执行', '2015-12-30 18:56:33', '2016-01-30 18:05:27');
INSERT INTO `jy_task_schedule` VALUES ('2bad38cb73364ac8b63ca47752307133', 'normal', 'test', '测正常任务', 'com.jy.task.job.Test', '0', '/10 * * * * ?', '测试正常任务', '2015-12-24 17:16:22', '2015-12-30 20:10:46');
INSERT INTO `jy_task_schedule` VALUES ('a4aa30d39df849648553d9141dc23ace', 'exception', 'test', '测异常任务', 'com.jy.task.job.Test2', '0', '/10 * * * * ?', '测试异常任务', '2015-12-24 22:52:57', '2015-12-30 20:10:39');

-- ----------------------------
-- Table structure for jy_tool_email
-- ----------------------------
DROP TABLE IF EXISTS `jy_tool_email`;
CREATE TABLE `jy_tool_email` (
  `id` varchar(32) NOT NULL,
  `subject` varchar(200) DEFAULT NULL,
  `body` text,
  `toList` text,
  `ccList` text,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jy_tool_email
-- ----------------------------

-- ----------------------------
-- Table structure for oa_leave
-- ----------------------------
DROP TABLE IF EXISTS `oa_leave`;
CREATE TABLE `oa_leave` (
  `id` varchar(32) NOT NULL,
  `org` varchar(64) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `approver` varchar(32) DEFAULT NULL,
  `type` varchar(4) DEFAULT NULL,
  `beginTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `rejectReason` varchar(256) DEFAULT NULL,
  `pId` varchar(32) DEFAULT NULL,
  `account_id` varchar(32) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_leave
-- ----------------------------

-- ----------------------------
-- Table structure for wx_event_click
-- ----------------------------
DROP TABLE IF EXISTS `wx_event_click`;
CREATE TABLE `wx_event_click` (
  `id` varchar(32) NOT NULL,
  `keyId` varchar(32) DEFAULT NULL,
  `title` varchar(64) DEFAULT NULL,
  `content` varchar(128) DEFAULT NULL,
  `picUrl` varchar(1024) DEFAULT NULL,
  `url` varchar(1024) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `sort` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_event_click
-- ----------------------------

-- ----------------------------
-- Table structure for wx_follower
-- ----------------------------
DROP TABLE IF EXISTS `wx_follower`;
CREATE TABLE `wx_follower` (
  `openid` varchar(32) NOT NULL,
  `subscribe` int(4) DEFAULT NULL,
  `nickname` varchar(32) DEFAULT NULL,
  `sex` int(4) DEFAULT NULL,
  `city` varchar(64) DEFAULT NULL,
  `country` varchar(64) DEFAULT NULL,
  `province` varchar(64) DEFAULT NULL,
  `language` varchar(32) DEFAULT NULL,
  `headimgurl` varchar(512) DEFAULT NULL,
  `subscribeTime` datetime DEFAULT NULL,
  `unionid` varchar(32) DEFAULT NULL,
  `remark` varchar(128) DEFAULT NULL,
  `groupid` varchar(32) DEFAULT '',
  PRIMARY KEY (`openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_follower
-- ----------------------------

-- ----------------------------
-- Table structure for wx_menu
-- ----------------------------
DROP TABLE IF EXISTS `wx_menu`;
CREATE TABLE `wx_menu` (
  `id` varchar(32) NOT NULL,
  `pId` varchar(32) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  `keyId` varchar(32) DEFAULT NULL,
  `url` varchar(1024) DEFAULT NULL,
  `sort` int(10) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `selectType` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_menu
-- ----------------------------
INSERT INTO `wx_menu` VALUES ('0f21bd2be6204b86adf68b6a820c1480', '0', '测试', 'view', null, '/index.jsp', '1', null, '2017-12-27 22:40:26', null, null);

-- ----------------------------
-- Procedure structure for upData
-- ----------------------------
DROP PROCEDURE IF EXISTS `upData`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `upData`()
BEGIN
DECLARE i INT;
DECLARE n INT;
SET i=1;
WHILE i<=(SELECT count(*) FROM `course`) DO
SET n=i-1;
UPDATE `hd_cargoload_message` SET `original_document_number`=i WHERE `carrier`=(SELECT temp.couID FROM (
SELECT `carrier` FROM `hd_cargoload_message` LIMIT n,1)temp);
SET i=i+1;
END WHILE;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for upData123
-- ----------------------------
DROP PROCEDURE IF EXISTS `upData123`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `upData123`()
BEGIN
DECLARE i INT;
DECLARE n INT;
SET i=1;
WHILE i<=(SELECT count(*) FROM `course`) DO
SET n=i-1;
UPDATE `hd_cargoload_message` SET `original_document_number`=i WHERE carrier=(
SELECT `carrier` FROM `hd_cargoload_message` LIMIT n,1);
SET i=i+1;
END WHILE;
END
;;
DELIMITER ;

select ENV_ORDER_ID,ORDER_NUMBER,ORDER_TYPE,ORDER_CLASSIFY,VERSION_NUMBER,PREV_PASS_ENV_ORDER_ID,ORDER_STATUS,WORK_GROUP,ERROR_CODE,SERVICE_TYPE,RECEIVE_DATE,PROJECT_ID,ENTERPRISE_ID,LOCATION_ID,SOURCE_ADDR,VZ_ID 
        from TBL_ENV_ORDER where ORDER_NUMBER='AT706031005' order by receive_date desc; 
select ORDER_ID,ENV_ORDER_ID,UPSTREAM_TASK_ID,FLOW_PATH,VERSION_NO,ORDER_STATUS,ACCOUNT_NUMBER,ORDER_TYPE,RECVD_DATE,APPTYPE_ID,aps_state from TBL_ORDER where ENV_ORDER_ID IN (4537890); --AND ORDER_ID = 5962805; 4510585
select * from TBL_ORDER_DETAILS where ORDER_ID=6091665 order by order_detail_id;--AuthFeatureType7100228
select * from TBL_ORDER_SERVICE where order_id='6267480' AND SKIP_FLAG IS NULL; --6491818

select DISTINCT ACCOUNT_NUMBER from TBL_ORDER WHERE ACCOUNT_NUMBER like '%TN%' ;

select * from TBL_ORDER_DETAILS where ORDER_ID IN (select ORDER_ID from TBL_ORDER where ENV_ORDER_ID = '4654850') order by order_detail_id; --VALIDATE TOD 

select * from TBL_ORDER_SERVICE where order_id IN (select ORDER_ID from TBL_ORDER where ENV_ORDER_ID IN (4646316)) AND SKIP_FLAG IS NULL; --Fetches the services for all entities in an order.

select * from TBL_NBS_CLUSTER_INFO where GROUP_ID = '8604657051';

select * from TBL_ORDER_DETAILS where ORDER_ID=6470318 AND PARAM_NAME='GroupId' order by order_detail_id;
select ORDER_ID from TBL_ORDER where ENV_ORDER_ID = 4642882 AND UPSTREAM_TASK_ID=64;
select ENV_ORDER_ID from TBL_ENV_ORDER where ORDER_NUMBER='46000455' AND ORDER_CLASSIFY = 18;

select * from TBL_NBS_CLUSTER_INFO where GROUP_ID IN 
    (select PARAM_VALUE from TBL_ORDER_DETAILS where ORDER_ID IN 
        (select ORDER_ID from TBL_ORDER where ENV_ORDER_ID IN 
            (select ENV_ORDER_ID from TBL_ENV_ORDER where ORDER_NUMBER='86000314' AND ORDER_CLASSIFY = 18) AND UPSTREAM_TASK_ID=64) AND PARAM_NAME='GroupId'); --Cluster Info is there for given order.


select * from TBL_PARENT_ORDERS where order_id IN ('6361159','6361158','6361160','6361161','6361162','6361163','6361188');
---6361159 - 6361158
---6361188 - 6361158
select * from TBL_PARENT_ORDERS where order_id IN ('6368097','6368098','6368099','6368100','6368101'); ----test
6368098	6368097	N
6368099	6368098	N
6368100	6368099	N
6368101	6368100	N
select * from TBL_PARENT_ORDERS where order_id IN ('6391367','6391369','6391370','6391371','6391372','6391392','6391393');
6402971	6388136	N
6402971	6388151	Y
6388138	6402971	Y
6388139	6388138	Y
6388140	6388139	Y
6388151	6388150	Y
select * from TBL_PARENT_ORDERS where order_id = '6377286';

6371490	6371489	N
6371491	6371530	Y
6371491	6371490	N
6371492	6371491	Y
6371493	6371492	Y
6371494	6371493	Y

6371529 6371489 - reverse
6371530 6371529


select ORDER_ID,ENV_ORDER_ID,UPSTREAM_TASK_ID,FLOW_PATH,VERSION_NO,ORDER_STATUS,ACCOUNT_NUMBER,ORDER_TYPE,RECVD_DATE 
from TBL_ORDER 
where ENV_ORDER_ID IN (4602819)
AND VERSION_NO = 1
AND ORDER_STATUS != 104
AND FLOW_PATH = 'F'
AND ORDER_TYPE IN ('I','C')
;

--------------------Force Complete-----------------------------------------
--update tbl_env_order set order_status=102 where env_order_id=4604360;

select o.ORDER_ID, od.PARAM_NAME, o.RECVD_DATE
from TBL_ORDER o INNER JOIN TBL_ORDER_DETAILS od
ON o.ORDER_ID = od.ORDER_ID
AND PARAM_NAME = 'AuthService' --AuthService / DeltaCount
ORDER BY o.RECVD_DATE DESC;

select e.ORDER_NUMBER, e.SERVICE_TYPE
from TBL_ENV_ORDER e INNER JOIN TBL_ORDER o
ON e.ENV_ORDER_ID = O.ENV_ORDER_ID
AND o.ORDER_ID = '6267088';

select * from TBL_ORDER_DETAILS where ORDER_ID=6085759 AND UPPER(PARAM_NAME) IN ('ENTERPRISE','LOCATION', 'GROUP','DEVICE','ENTERPRISETRUNK','SONUSNBS') ORDER BY ORDER_DETAIL_ID;
select ENV_ORDER_ID,ORDER_NUMBER,VERSION_NUMBER,ORDER_STATUS,ORDER_CLASSIFY,ORDER_TYPE,SERVICE_TYPE,RECEIVE_DATE,PROJECT_ID from TBL_ENV_ORDER where SERVICE_TYPE='HPBX' order by receive_date desc;
select * from TBL_ENV_ORDER where ORDER_NUMBER='8200054' order by receive_date desc;
select ENV_ORDER_ID,PREV_PASS_ENV_ORDER_ID,ORDER_NUMBER,VERSION_NUMBER,ORDER_STATUS,ORDER_CLASSIFY,ORDER_TYPE,SERVICE_TYPE,RECEIVE_DATE,PROJECT_ID,ENTERPRISE_ID,LOCATION_ID,VZ_ID from TBL_ENV_ORDER where LOCATION_ID='9311003' order by receive_date desc;
--UPDATE TBL_ENV_ORDER SET ORDER_STATUS='104' WHERE ORDER_NUMBER='7100226' AND ORDER_CLASSIFY='18' AND ENV_ORDER_ID='4568346';
select ORDER_ID,ENV_ORDER_ID,UPSTREAM_TASK_ID,FLOW_PATH,VERSION_NO,ORDER_STATUS,ACCOUNT_NUMBER,ORDER_TYPE from TBL_ENV_ORDER ON TBL_ORDER where UPSTREAM_TASK_ID IN (65);
-------------------------------OTHER TYPE TN DESIGN---------------------------------------------------------------
select * from TBL_ORDER_DETAILS where PARAM_NAME = 'TnAssignment';
select distinct PARAM_VALUE from TBL_ORDER_DETAILS where PARAM_NAME = 'TnAssignment';
select * from TBL_ORDER_DETAILS where PARAM_NAME = 'SubscriberId';
select ENV_ORDER_ID,ORDER_NUMBER,VERSION_NUMBER,ORDER_STATUS,ORDER_CLASSIFY,ORDER_TYPE,SERVICE_TYPE,RECEIVE_DATE,PROJECT_ID from TBL_ENV_ORDER 
            where ENV_ORDER_ID=(select ENV_ORDER_ID from TBL_ORDER where ORDER_ID = (select ORDER_ID from TBL_ORDER_DETAILS where PARAM_NAME = 'TnAssignment') ) order by receive_date desc;

----------------------------------------------------------------REVERSE----------------------------------------------------------------
select * from TBL_ORDER_DETAILS WHERE ORDER_DETAIL_ID = 2501562917;
select ORDER_ID,ENV_ORDER_ID,UPSTREAM_TASK_ID,FLOW_PATH,ORDER_STATUS,ACCOUNT_NUMBER from TBL_ORDER where ORDER_ID = 4234234;
select ENV_ORDER_ID,ORDER_NUMBER,VERSION_NUMBER,ORDER_STATUS,ORDER_CLASSIFY,ORDER_TYPE,SERVICE_TYPE,RECEIVE_DATE,PROJECT_ID from TBL_ENV_ORDER where ENV_ORDER_ID='3797476' order by receive_date desc;
select ENV_ORDER_ID,ORDER_NUMBER,VERSION_NUMBER,ORDER_STATUS,ORDER_CLASSIFY,ORDER_TYPE,SERVICE_TYPE,RECEIVE_DATE,PROJECT_ID from TBL_ENV_ORDER 
            where ENV_ORDER_ID=(select ENV_ORDER_ID from TBL_ORDER where ORDER_ID = 6074118) order by receive_date desc;
----------------------------------------------------------------ORDER SEARCH----------------------------------------------------------------
select e.ORDER_NUMBER,o.ORDER_ID, o.UPSTREAM_TASK_ID, o.ACCOUNT_NUMBER, o.FLOW_PATH, e.ENV_ORDER_ID,e.VERSION_NUMBER,e.ORDER_STATUS,e.ORDER_CLASSIFY,e.ORDER_TYPE,e.LOCATION_ID,e.SERVICE_TYPE,e.RECEIVE_DATE,e.PROJECT_ID 
from TBL_ENV_ORDER e INNER JOIN TBL_ORDER o
ON e.ENV_ORDER_ID = O.ENV_ORDER_ID
AND e.ORDER_TYPE='3'
--AND e.ORDER_CLASSIFY='24' --18
AND e.VERSION_NUMBER = 0
AND e.ORDER_STATUS = '104'
AND o.UPSTREAM_TASK_ID = '67'
--AND o.ACCOUNT_NUMBER = 'LINE_TN'--INBOUND_TN/
AND SERVICE_TYPE like '%EBL%' --FLEX/ESL/HPBX/EBL
--AND SERVICE_TYPE NOT IN ('ESIP_ESL,NBS','ESIP_EBL','IPFLEX','HPBX')--'%FLEX%' --BAU ORDER
--AND o.FLOW_PATH = 'R'
order by receive_date desc;
--BAU ORDER SEARCH
select RECEIVE_DATE,SERVICE_TYPE,ORDER_NUMBER,ORDER_TYPE,ENV_ORDER_ID,ORDER_CLASSIFY,VERSION_NUMBER,PREV_PASS_ENV_ORDER_ID,ORDER_STATUS,WORK_GROUP,ERROR_CODE,PROJECT_ID,ENTERPRISE_ID,LOCATION_ID,SOURCE_ADDR,VZ_ID 
        from TBL_ENV_ORDER where ORDER_STATUS = '104' AND SERVICE_TYPE NOT IN ('ESIP_ESL,NBS','ESIP_EBL','IPFLEX','HPBX') order by receive_date desc;
----------------------------------------------------------------TN SEARCH----------------------------------------------------------------
SELECT e.ORDER_NUMBER, e.SERVICE_TYPE, lor.SPEC_CODE, lor.SPEC_VALUE, e.RECEIVE_DATE FROM TBL_ENV_ORDER e INNER JOIN TBL_LOR_TN_DETAILS lor
ON e.ORDER_NUMBER = lor.ORDER_NUMBER
AND SERVICE_TYPE like '%FLEX%'
AND lor.SPEC_CODE = 'SP_XO_TEL'
order by receive_date desc;
----------------------------------------------------------------TN DATA----------------------------------------------------------------
select TRUNK_CALL_CAPACITY from TBL_GROUP where GROUP_ID='8604257051'; --trunkGroupid (or) groupId (or) trunkId / TRUNK_CALL_CAPACITY
select * from TBL_GROUP where GROUP_ID='1557719';
select * FROM TBL_PUBLIC_TN_POOL where TN='6233866148';
select TN, TRUNK, TN_STATUS, PORTED_STATUS, ENV_ORDER_ID, TN_TYPE, ACT_DEACT, PORTIN_TYPE FROM TBL_PUBLIC_TN_POOL where TN IN ('8803740120','8805940524','7868940123');
select TN, TRUNK, TN_STATUS, PORTED_STATUS, ENV_ORDER_ID, TN_TYPE, ACT_DEACT, PORTIN_TYPE FROM TBL_PUBLIC_TN_POOL where ENV_ORDER_ID='4538943';
select * from TBL_GROUP_TN where GROUP_ID='87045728';
select * from TBL_GROUP_TN where GROUP_ID = (select GROUP_ID from TBL_GROUP where GROUP_ID='87045728'); --SEARCH with groupId, get tn pool ids
select TN, TRUNK, TN_STATUS, PORTED_STATUS, ENV_ORDER_ID, TN_TYPE, ACT_DEACT, PORTIN_TYPE FROM TBL_PUBLIC_TN_POOL where TN_POOL_ID IN ('2798647','2798648','2798649','2798735');
select distinct TN_TYPE FROM TBL_PUBLIC_TN_POOL;
--AUTO_ATTENDANT(7)  HUNT_GROUP(10) VOICE_PORTAL(11) ALTERNATE_TN(12)
desc TBL_GROUP;
desc TBL_GROUP_TN;
desc TBL_PUBLIC_TN_POOL;
--------GROUP_ID-------TN-------tns under a group Id-------------------------------------------------------------
select g.GROUP_ID, p.TN_POOL_ID, p.TN, g.ENV_ORDER_ID from TBL_GROUP_TN g INNER JOIN TBL_PUBLIC_TN_POOL p
ON g.TN_POOL_ID = p.TN_POOL_ID
AND g.GROUP_ID = '1559727'
ORDER BY p.TN;

------------------------------------------------------------Issue debugging----------------------------------------------------------------
--v0 device - 6077518 // v0 validate - 6077515
select * from TBL_ORDER_DETAILS where ORDER_ID='6077515' AND ACTION='n' AND PARENT_ID='2281463893'; --v0 validate
select * from TBL_ORDER_DETAILS where ORDER_ID='6079212' AND ACTION='n' AND PARENT_ID='2281571485'; --v0 release
select * from TBL_ORDER where order_id='6080252';
--
select * from TBL_CUSTOMER WHERE gch_id='91002926';
select gch_id, CUSTOMER_ID from TBL_CUSTOMER WHERE gch_id='91002926';
select ENTERPRISE_ID, BW_ENTERPRISE_ID from TBL_ENTERPRISE WHERE ENTERPRISE_ID='6906072163';

select * from TBL_LOR_TN_DETAILS where 1=1 and order_number = '4611380';
select * from TBL_LOR_TN_DETAILS where 1=1 and order_number = '4500187' AND SPEC_CODE='SP_XO_TRU'; --SPEC code will change for each product
select * from TBL_LOR_TN_DETAILS where 1=1 and order_number = '86609985' and TN_TYPE ='TrunkTn' order by LOR_US_TN_ID desc;
select * from TBL_LOR_TN_DETAILS where 1=1 and order_number = '86609985' and TN_TYPE ='TrunkTn' AND SPEC_CODE='SP_XO_TEL' order by LOR_US_TN_ID desc;
select * from TBL_LOR_TN_DETAILS where 1=1 and ORDER_NUMBER='86609985' and ORDER_VERSION = '1';
select distinct CAP_ACTION_CODE from TBL_LOR_TN_DETAILS;
select MAX(BOD_SVC_CAPABILITY_ID) from TBL_LOR_TN_DETAILS;
select count(LOR_US_TN_ID) from TBL_LOR_TN_DETAILS;
--update TBL_LOR_TN_DETAILS set ORDER_NUMBER = '86609985C' where 1=1 and ORDER_NUMBER='86609985' and ORDER_VERSION = '1';
----------------------------------------------------------------------SERVICES------------------------------------------------------------------------------
--Region : [US, ALL] Entity Action: C Entity Type: DEVICE Function Code: [RELEASE, ALL] orderTypeList: [I, *] Param Name : FXO_LINE
select * from TBL_RETAIL_SERVICE_FXO_NO_UPD 
where PRODUCT='RE' AND ORDER_TYPE IN ('I', '*') AND FUNCTION_CODE IN ('RELEASE', 'ALL') AND ENTITY_TYPE='ENTERPRISE' AND ENTITY_ACTION='I' AND REGION IN ('US', 'ALL') AND PARAM_NAME='FXO';
select distinct ENTITY_TYPE from TBL_RETAIL_SERVICE_FXO_NO_UPD;

select * from TBL_RETAIL_SERVICE_FXO_NO_UPD  
where PRODUCT='RE' 
AND ORDER_TYPE IN ('I', '*') 
AND FUNCTION_CODE IN ('RELEASE', 'ALL') 
--AND ENTITY_TYPE='TWO_WAY_TN'--LOCATION/TWO_WAY_TN
AND ENTITY_ACTION='C' --I C D 
AND REGION IN ('US', 'ALL') 
AND PARAM_NAME='FXO'
--AND MILESTONE IS NULL
--AND WF_SERVICE LIKE '%BS%'
--AND WF_SERVICE = 'VZB_BS_DEACT_DID_TN_SYSTEM_UPDATE_20'
;

select * from TBL_RETAIL_SERVICE_FXO_NO_UPD 
where PRODUCT='RE'
AND ORDER_TYPE IN ('D', '*') 
AND FUNCTION_CODE IN ('REL_DEACTIVATE', 'ALL') 
AND ENTITY_TYPE='BULK_SYSTEM_UPDATE' 
AND ENTITY_ACTION='O' 
AND REGION IN ('US', 'ALL') 
--AND PARAM_NAME='FXO'
;
--------Issue debugging---------------------------------------
select ORDER_ID,ENV_ORDER_ID,UPSTREAM_TASK_ID,FLOW_PATH,ORDER_STATUS,ACCOUNT_NUMBER,VERSION_NO,ORDER_TYPE from TBL_ORDER where ENV_ORDER_ID='4531428' AND VERSION_NO=0 AND FLOW_PATH='F' AND ORDER_TYPE='C';

DESC TBL_ORDER;
select distinct SERVICE_TYPE from TBL_ENV_ORDER;
select * from TBL_ENV_ORDER where SERVICE_TYPE like '%EBL%' order by receive_date desc;
Desc TBL_ENV_ORDER;
------ALL COULUMNS---------------
select * from TBL_ENV_ORDER where ORDER_NUMBER='ENT_DIG_STR_181015014423817' order by receive_date desc;
select * from TBL_ORDER where ENV_ORDER_ID IN (4123188); --AND ORDER_ID = 5962805;
select * from TBL_ORDER_DETAILS where ORDER_ID IN ('6052712','6052713','6052714','6052715','6052716','6052717')  order by order_detail_id;
------------------SERVICES-----------------------------------------------------------------
select * from TBL_ORDER_SERVICE where order_id='6361159';
select SERVICE_STATUS  from Tbl_order_service where order_id='6351170';

select * from TBL_SERVICE_INFO  WHERE service='VZB_BS_MOD_LOCATION_FXO';
select * from TBL_SERVICE_TASK WHERE service = 'VZB_BS_MOD_LOCATION_FXO'; --E 'equal' A 'always' D 'dependent'
------SAFE STORE TABLE---------------
SELECT UPSTREAM_RECORD FROM TBL_SAFE_STORE WHERE SEQUENCE_NO IN (SELECT SEQUENCE_NO FROM TBL_ENV_ORDER where ENV_ORDER_ID IN (4642547));
SELECT * FROM TBL_ENV_ORDER where ENV_ORDER_ID IN (4529504);
SELECT * FROM TBL_SAFE_STORE WHERE SEQUENCE_NO = '17328471';
select * from TBL_ENV_ORDER_RESP where ENV_ORDER_ID='4529504';

SELECT * FROM TBL_SAFE_STORE;
--------------CUSTOMER------------------------------------------------------------------------------------------
select * from TBL_CUSTOMER WHERE CUSTOMER_ID='310174624';
select * from TBL_CUSTOMER WHERE GCH_ID='91002882';
select GCH_ID, CUSTOMER_ID from TBL_CUSTOMER WHERE GCH_ID='9023105';
select CUSTOMER_ID,ENV_ORDER_ID,ENTERPRISE_TRUNKING_TYPE from TBL_CUSTOMER WHERE GCH_ID='8200055';
desc TBL_CUSTOMER;
--------------LOCATION------------------------------------------------------------------------------------------
--Location id usually ends with '1004'
select * from TBL_LOCATION where ENTERPRISE_ID = '6906058857';
select * from TBL_LOCATION where LOCATION_ID = '5102141'; --ESL Disconnect
select * from TBL_LOCATION where hub_location_id = '4202254'; --ESL Disconnect
select LOCATION_ID, BILLINGTN from TBL_LOCATION where BILLINGTN = '6062142024';  --Group BTN
select * from TBL_LOCATION order by creation_date desc; --get your location_id
select * from TBL_LOCATION where LOCATION_ID='5102124';
select LOCATION_TYPE, LOCATION_NAME, ENTERPRISE_ID from TBL_LOCATION where LOCATION_ID='4200322';
select AS_ID from TBL_ENTERPRISE WHERE ENTERPRISE_ID = '6906083757'; 
select * from TBL_LOCATION where LOCATION_TYPE = '7' order by LOCATION_ID desc; --ENTERPRISE_ID = '6906045671';
DESC TBL_LOCATION;
select GCH_ID, CUSTOMER_ID, ENV_ORDER_ID from TBL_CUSTOMER WHERE GCH_ID='5102110';
select BW_ENTERPRISE_ID, ENV_ORDER_ID, ENTERPRISE_ID from TBL_ENTERPRISE WHERE ENTERPRISE_ID = '6906057163';
select c.GCH_ID, c.CUSTOMER_ID, c.VPN_NAME, e.ENV_ORDER_ID, e.ORDER_NUMBER, e.LOCATION_ID from TBL_CUSTOMER c, TBL_ENV_ORDER e WHERE c.GCH_ID='5102110' AND c.ENV_ORDER_ID = e.ENV_ORDER_ID order by e.ENV_ORDER_ID;
select e.ORDER_NUMBER, c.GCH_ID, l.VPN_NAME, c.CUSTOMER_ID from TBL_CUSTOMER c, TBL_LOCATION l, TBL_ENV_ORDER e WHERE c.GCH_ID='5102110' AND c.CUSTOMER_ID = l.ENTERPRISE_ID AND l.ENV_ORDER_ID = e.ENV_ORDER_ID order by l.CREATION_DATE ; ---GCHID - VPN - ENTERPRISE ID.
select LOCATION_ID, ENTERPRISE_ID, VPN_NAME from TBL_LOCATION where VPN_NAME IN ('VPN_5102110','VPN_5102111');  --VPN Name ESP_XO_ASSOCIATED_VPN_NAME E2E-EDGE-32
select CUSTOMER_ID from TBL_CUSTOMER WHERE GCH_ID='7100225';
select distinct CAP_ACTION_CODE from TBL_LOR_TN_DETAILS; --CANCEL
select * from TBL_LOR_TN_DETAILS where 1=1 and order_number = '1200055';
select * from TBL_LOR_TN_DETAILS where 1=1 and BOD_SVC_CAPABILITY_ID = '8104409';

select * from TBL_LOR_TN_DETAILS where 1=1 and BOD_SVC_CAPABILITY_ID = '8104409' AND ORDER_NUMBER = '8200055';

--update TBL_LOR_TN_DETAILS set ORDER_VERSION=1, CAP_ACTION_CODE='CANCEL' WHERE 1=1 and ORDER_NUMBER = '8200055' AND BOD_SVC_CAPABILITY_ID = '8104409';

--select * from TBL_LOR_TN_DETAILS where 1=1 and order_number = '86009912'; --REDUCE this order number for next attempts.

--
--update TBL_LOR_TN_DETAILS set ORDER_VERSION=1 WHERE 1=1 and ORDER_NUMBER = '111994005';
--(4)
--update TBL_LOR_TN_DETAILS set ORDER_NUMBER = '228024005'--  ORDER_VERSION=1  Only change this with the order num
--FEATURE_CODE = 'FET_XO_TNC'
--where LOR_US_TN_ID in (select LOR_US_TN_ID from TBL_LOR_TN_DETAILS where 1=1 and BOD_SVC_CAPABILITY_ID = '7673211');
--(5) 
select * from TBL_LOR_TN_DETAILS where 1=1 and order_number = '86609985' and TN_TYPE ='TrunkTn' order by LOR_US_TN_ID desc;

--(6)
update TBL_LOR_TN_DETAILS set SPEC_VALUE = '228021007'  -- Only change this with the instance id of FET_XO_TRU of EBL JSON
    where LOR_US_TN_ID in 
    ( select LOR_US_TN_ID from TBL_LOR_TN_DETAILS where 1=1 and 
    order_number = '228024005' -- Only change this with the order num
    and (SPEC_VALUE ='228011007') -- Replace what we have for SP_XO_TRU FROM above query in TBL_LOR_TN_DETAILS
    );
--(7)
update TBL_LOR_TN_DETAILS set SPEC_VALUE = '4228024005'  -- Must me 10 digits
where LOR_US_TN_ID in (
select LOR_US_TN_ID from TBL_LOR_TN_DETAILS
where 1=1
and order_number = '228024005' -- Only change this with the order num
and (SPEC_VALUE ='4228011007') -- Replace what we have for SP_XO_TEL in TBL_LOR_TN_DETAILS
);
--supp START
--Change value of spec
update TBL_LOR_TN_DETAILS set SPEC_VALUE = 'PRASAD'
where LOR_US_TN_ID in (
select LOR_US_TN_ID from TBL_LOR_TN_DETAILS
where 1=1
and order_number = '228024005' -- Only change this with the order num
and (SPEC_VALUE ='PRASADv1') -- Replace what we have for SP_XO_TEL in TBL_LOR_TN_DETAILS
);
--update version number
update TBL_LOR_TN_DETAILS set ORDER_VERSION = 1
where LOR_US_TN_ID in (
select LOR_US_TN_ID from TBL_LOR_TN_DETAILS
where 1=1
and order_number = '228024005');

select * from TBL_LOR_TN_DETAILS where 1=1 and order_number = '86609985';
--supp END


SELECT * FROM TBL_LOR_TN_DETAILS tltd, (SELECT rn, unique_svc_cap_id FROM (SELECT rownum rn, unique_svc_cap_id FROM
		( SELECT DISTINCT(SVC_CAP_ID) unique_svc_cap_id FROM
		TBL_LOR_TN_DETAILS WHERE
		SVC_CAP_ID NOT IN ( SELECT DISTINCT SVC_CAP_ID FROM TBL_LOR_TN_DETAILS WHERE
		ORDER_NUMBER = '227714005'
		AND ORDER_VERSION = 1 AND ((spec_code='ESP_TRANSITION_TYPE' AND
		(Upper(spec_value) = 'W2R')) OR
		(spec_code ='SP_VOIP_TN_DISPOSITION' AND (Upper(spec_value) = 'R' or
		Upper(spec_value) = 'RETAINED'
		or Upper(spec_value) = 'DISCONNECT' OR Upper(spec_value) = 'D'))) )
		AND ORDER_NUMBER = '227714005' AND ORDER_VERSION
		= 1 ORDER BY svc_cap_id)) WHERE 
		rn >= 1
		AND rn <= 100)
		unicapids WHERE tltd.SVC_CAP_ID = unicapids.unique_svc_cap_id AND ORDER_NUMBER
		= '227714005' AND ORDER_VERSION = 1 ORDER BY
		tltd.SVC_CAP_ID,tltd.SPEC_CODE desc;

SELECT DISTINCT(SVC_CAP_ID) unique_svc_cap_id FROM
		TBL_LOR_TN_DETAILS WHERE ORDER_NUMBER = '227714005' AND ORDER_VERSION
		= 1 ORDER BY svc_cap_id;

SELECT DISTINCT(SVC_CAP_ID) unique_svc_cap_id FROM
		TBL_LOR_TN_DETAILS WHERE
		SVC_CAP_ID NOT IN ( SELECT DISTINCT SVC_CAP_ID FROM TBL_LOR_TN_DETAILS WHERE
		ORDER_NUMBER = '227714005'
		AND ORDER_VERSION = 0 AND ((spec_code='ESP_TRANSITION_TYPE' AND
		(Upper(spec_value) = 'W2R')) OR
		(spec_code ='SP_VOIP_TN_DISPOSITION' AND (Upper(spec_value) = 'R' or
		Upper(spec_value) = 'RETAINED'
		or Upper(spec_value) = 'DISCONNECT' OR Upper(spec_value) = 'D'))) )
		AND ORDER_NUMBER = '227714005' AND ORDER_VERSION
		= 1 ORDER BY svc_cap_id;
        
select * from TBL_RETAIL_SERVICE_FXO_NO_UPD 
where PRODUCT='RE' AND ORDER_TYPE IN ('I', '*') AND FUNCTION_CODE IN ('RELEASE', 'ALL') AND ENTITY_TYPE='TWO_WAY_TN' AND ENTITY_ACTION='C' AND REGION IN ('US', 'ALL') AND PARAM_NAME='FXO';

select * from TBL_RETAIL_SERVICE_FXO
where PRODUCT='RE' AND ORDER_TYPE IN ('I', '*') AND FUNCTION_CODE IN ('RELEASE', 'ALL') AND ENTITY_TYPE='BULK_SYSTEM_UPDATE' AND ENTITY_ACTION='C' AND REGION IN ('US', 'ALL') AND PARAM_NAME='FXO';

select * from TBL_RETAIL_SERVICE_FXO_NO_UPD
where 
ENTITY_ACTION='C'; AND
ENTITY_TYPE='TWO_WAY_TN'
;

select * from TBL_RETAIL_SERVICE
where 
FUNCTION_CODE='LNP_ACTIVATE'
AND ENTITY_TYPE='BULK_SYSTEM_UPDATE'
order by ENTITY_TYPE,SEQ_NO
;

SELECT * FROM TBL_SERVICE_TASK WHERE SERVICE='VZB_BS_BULK_MOD_2W_TN_SYSTEM_UPDATE_20';

--[US, ALL] Entity Action: C Entity Type: DID_TN Function Code: [RELEASE, ALL] orderTypeList: [I, I, *] Param Name : FXO 
--[US, ALL] Entity Action: C Entity Type: TWO_WAY_TN Function Code: [RELEASE, ALL] orderTypeList: [I, *] Param Name : FXO 

select distinct PARAM_NAME from TBL_RETAIL_SERVICE_FXO_NO_UPD;

select * from TBL_PARENT_ORDERS;
-------------------------------TBL_CONFIG_PARAMS-----------------------------------------
select * from tbl_config_params 
where PROCESS_NAME = 'FXO_INV_MICRO_SERVICE_GROUP' --FXO_BS_MICRO_SERVICE
AND PARAM_GROUP = 'INBOUND' 
--AND PARAM_NAME LIKE '%MOD%'
;
select * from tbl_config_params where param_name='VZB_INV_ADD_IB_GROUP_FXO'; -- VZB_SONUS_GSX_ADD_2W_GROUP_FXO  VZB_BS_MOD_LOCATION_20
select * from tbl_config_params where param_name like '%VALIDATE%';
select * from tbl_config_params where param_name='VZB_SONUS_PSX_ADD_IB_GROUP_FXO';
select PARAM_NAME, PARAM_VALUE from tbl_config_params where PROCESS_NAME = 'INV_MICRO_SERVICE';--FXO_INV_MICRO_SERVICE_GROUP/FXO_SONUS_MICRO_SERVICE
select * from tbl_config_params where PROCESS_NAME ='INV_MICRO_SERVICE' and PARAM_NAME = 'SERVICE_URL';

select PARAM_NAME, PARAM_VALUE from tbl_config_params where PARAM_VALUE LIKE '%40002%';

--update tbl_config_params set PARAM_VALUE = 'buildSonusGsxNbs' WHERE PARAM_NAME = 'VZB_SONUS_GSX_ADD_IB_GROUP_FXO' AND PROCESS_NAME = 'FXO_SONUS_MICRO_SERVICE';
--update tbl_config_params set PARAM_VALUE = 'buildSonusPsxNbs' WHERE PARAM_NAME = 'VZB_SONUS_PSX_ADD_IB_GROUP_FXO' AND PROCESS_NAME = 'FXO_SONUS_MICRO_SERVICE';
select PARAM_NAME, PARAM_VALUE from tbl_config_params where PROCESS_NAME = 'FXO_SONUS_MICRO_SERVICE' AND PARAM_NAME IN ('VZB_SONUS_GSX_ADD_IB_GROUP_FXO', 'VZB_SONUS_PSX_ADD_IB_GROUP_FXO');

select * from tbl_config_params where PROCESS_NAME LIKE '%BS%';
select distinct param_name from tbl_config_params;
select * from tbl_config_params where param_name='VZB_INV_DEL_SIP_DEVICE_FXO';
select * from tbl_config_params where param_name like '%SYSTEM_UPDATE%';

select * from TBL_ORDER_SERVICE where order_id = 6443189;

select * from tbl_config_params where param_name
IN ('VZB_SONUS_PSX_MOD_IB_GROUP_FXO','VZB_SONUS_PSX_MOD_2W_GROUP_FXO','VZB_SONUS_PSX_DEL_IB_GROUP_FXO','VZB_SONUS_PSX_DEL_2W_GROUP_FXO','VZB_SONUS_GSX_MOD_IB_GROUP_FXO','VZB_SONUS_GSX_MOD_2W_GROUP_FXO','VZB_SONUS_GSX_DEL_IB_GROUP_FXO','VZB_SONUS_GSX_DEL_2W_GROUP_FXO','VZB_INV_MOD_SIP_DEVICE_FXO','VZB_INV_MOD_MGCP_DEVICE_FXO','VZB_INV_MOD_LINE_GROUP_FXO','VZB_INV_MOD_IB_DEVICE_FXO','VZB_INV_MOD_DID_GROUP_FXO','VZB_INV_DEL_SIP_DEVICE_FXO','VZB_INV_DEL_MGCP_DEVICE_FXO','VZB_INV_DEL_LINE_GROUP_FXO','VZB_INV_DEL_IB_DEVICE_FXO','VZB_INV_DEL_DID_GROUP_FXO');

select * from tbl_config_params where param_name LIKE '%SONUS_NBS%';
SELECT MAX(CONFIG_PARAMS_ID) FROM tbl_config_params;

select * from tbl_config_params where CONFIG_PARAMS_ID=999999;
select * from tbl_config_params where PROCESS_NAME='BULK_API' AND PARAM_NAME='BULK_API_ENABLED';

select * from tbl_config_params where param_name='SONUS_TYPE_GSX_RULE';

--INSERT INTO tbl_config_params (CONFIG_PARAMS_ID, PROCESS_NAME, PARAM_GROUP, PARAM_NAME, PARAM_VALUE, STATUS, DESCRIPTION) VALUES
--(2410859, 'FXO_INV_SONUS_MICRO_SERVICE', 'SONUS_NBS', 'VZB_INV_MOD_SONUS_NBS_IB_FXO', 'modifyInboundSonusNbs', 'E', 'Redirection endpoint for FXO_INV_SONUS_MICRO_SERVICE, SONUS_NBS, VZB_INV_MOD_SONUS_NBS_IB_FXO');
--INSERT INTO tbl_config_params (CONFIG_PARAMS_ID, PROCESS_NAME, PARAM_GROUP, PARAM_NAME, PARAM_VALUE, STATUS, DESCRIPTION) VALUES
--(2410860, 'FXO_INV_SONUS_MICRO_SERVICE', 'SONUS_NBS', 'VZB_INV_MOD_SONUS_NBS_2W_FXO', 'modifyTwoWaySonusNbs', 'E', 'Redirection endpoint for FXO_INV_SONUS_MICRO_SERVICE, SONUS_NBS, VZB_INV_MOD_SONUS_NBS_2W_FXO');
--INSERT INTO tbl_config_params (CONFIG_PARAMS_ID, PROCESS_NAME, PARAM_GROUP, PARAM_NAME, PARAM_VALUE, STATUS, DESCRIPTION) VALUES
--(2410861, 'FXO_INV_SONUS_MICRO_SERVICE', 'SONUS_NBS', 'VZB_INV_DEL_SONUS_NBS_IB_FXO', 'deleteInboundSonusNbs', 'E', 'Redirection endpoint for FXO_INV_SONUS_MICRO_SERVICE, SONUS_NBS, VZB_INV_DEL_SONUS_NBS_IB_FXO');
--INSERT INTO tbl_config_params (CONFIG_PARAMS_ID, PROCESS_NAME, PARAM_GROUP, PARAM_NAME, PARAM_VALUE, STATUS, DESCRIPTION) VALUES
--(2410862, 'FXO_INV_SONUS_MICRO_SERVICE', 'SONUS_NBS', 'VZB_INV_DEL_SONUS_NBS_2W_FXO', 'deleteTwoWaySonusNbs', 'E', 'Redirection endpoint for FXO_INV_SONUS_MICRO_SERVICE, SONUS_NBS, VZB_INV_DEL_SONUS_NBS_2W_FXO');


SELECT * FROM TBL_RETAIL_SERVICE_FXO_DISCON;
select * from TBL_ENV_ORDER where ORDER_NUMBER='ENT_DIG_STR_181015014423817' order by receive_date desc;
select ENV_ORDER_ID,ORDER_NUMBER,VERSION_NUMBER,ORDER_TYPE,ORDER_STATUS,ORDER_CLASSIFY,SERVICE_TYPE,RECEIVE_DATE,PROJECT_ID from TBL_ENV_ORDER where ORDER_NUMBER like '%AT%';
select distinct SERVICE_TYPE from TBL_ENV_ORDER where ORDER_NUMBER like '%AT%';

select * from TBL_HPBX_NNI_CONFIG where status=1;
SELECT LOCATION_ID_SEQ.NEXTVAL FROM DUAL;--2070116

---------------------------------------------HPBX SUPP FIX---------------------------------------------
select LOC_GROUP_ID from TBL_LOCATION 
where LOCATION_ID = '8200063'; --ebl id
--Resultset is true then execute 2
select LOCATION_ID, LOCATION_TYPE from TBL_LOCATION where 1=1
and LOCATION_TYPE = '8'
and LOC_GROUP_ID = '2069500';--LOC_GROUP_ID from 1

select LOCATION_ID, LOCATION_TYPE from TBL_LOCATION where 1=1
and LOCATION_TYPE = '8'
and LOC_GROUP_ID = (select LOC_GROUP_ID from TBL_LOCATION where LOCATION_ID = '8200055');

select distinct LOR_US_TN_ID, BOD_SVC_CAPABILITY_ID, SVC_CAP_ID, FEATURE_CODE, FEATURE_NAME, CAP_ACTION_CODE, SPEC_CODE, SPEC_VALUE, ACTION, ORDER_VERSION, ORDER_NUMBER, TN_TYPE 
from TBL_LOR_TN_DETAILS
where ORDER_NUMBER='8200054'
AND ORDER_VERSION=0
AND SPEC_CODE='SP_XO_TRUID';
-----------------------------VALIDATION FAILURE---------------------------------------------------
select order_id from tbl_order where order_id in (select * from
              (SELECT o.order_id FROM tbl_order o, tbl_env_order e WHERE
                o.env_order_id = e.env_order_id
                AND e.order_status in (102,103,253, 307, 254 , 246, 436, 437 )
                AND (e.new_pass_waiting is NULL OR e.new_pass_waiting = 'N')
                AND o.order_status in (102,433) AND o.due_date < sysdate
                AND (o.parent_order is NULL OR o.parent_order = 0 OR o.parent_order in (select order_id from tbl_order where order_status in (104,252,250, 299, 312)))
                AND NOT EXISTS(
                SELECT 1
                FROM tbl_parent_orders pp
                WHERE
                pp.order_id = o.order_id
                AND (pp.parent_pending is null OR pp.parent_pending = 'Y'))
                ORDER BY o.priority, o.due_date,o.recvd_date, o.order_id) ); --and ORDER_ID=6249691 ;
                
--Insert into ESAP.TBL_LOR_TN_DETAILS (LOR_US_TN_ID,BOD_SVC_CAPABILITY_ID,SVC_CAP_ID,FEATURE_CODE,FEATURE_NAME,CAP_ACTION_CODE,SPEC_CODE,SPEC_VALUE,ACTION,ORDER_VERSION,ORDER_NUMBER,TN_TYPE) values (LOR_US_TN_ID_SEQ.NEXTVAL ,8220378,'8745940120','FET_XO_TNC','TN Configuration','ADD','ESP_SWITCH_CLLI','WASHDCINDS0',null,'0','8700045','TrunkTn');

SELECT * FROM TBL_ORDER_DETAILS WHERE order_id = '6113906'
		AND ( action in ('n', 'c') OR (param_type like
		'%,3,%' AND
		action='r' AND (parent_id = '2284201903' OR
		EXISTS
		(SELECT 1 FROM tbl_order_details d2 WHERE
		d2.order_id='6113906' AND
		d2.order_detail_id=tbl_order_details.parent_id AND (d2.param_type like
		'%,3,%' OR d2.action!='r'))))) AND action in
		('n', 'r', 'c') CONNECT BY (prior
		order_detail_id=parent_id AND order_id='6113906')
		START WITH (order_id='6113906' AND parent_id=
		'2284201903' ) ORDER SIBLINGS BY order_detail_id; 

desc LOR_US_FXO_V1;

select * from TBL_ORDER_SERVICE where order_id='6133808';
select * from TBL_ORDER_MILESTONE where ORDER_ID='6133808';
select * from TBL_ORDER_MILESTONE where ENV_ORDER_ID='4545020';
select * from TBL_RETAIL_SERVICE_FXO_NO_UPD 
where PRODUCT='RE' AND ORDER_TYPE IN ('D') AND FUNCTION_CODE IN ('REL_SUSPEND') AND ENTITY_TYPE='BULK_SYSTEM_UPDATE' AND ENTITY_ACTION='C' AND REGION IN ('US', 'ALL') AND PARAM_NAME='FXO_LINE';

desc TBL_RETAIL_SERVICE;
TBL_RETAIL_SERVICE_FXO_DISCON
--create table TBL_RETAIL_SERVICE_BS2 as select * from TBL_RETAIL_SERVICE where 1=0;
SELECT * FROM TBL_RETAIL_SERVICE_BS2;

desc TBL_RETAIL_SERVICE_FXO;
-----------------------------ERROR HANDLING------------------------------------------------------
select * from TBL_ORDER_RSP where ORDER_ID=6214442; --5702078

select * from TBL_ORDER_RSP where 
PARAM_NAME='ERROR_SOURCE' 
--AND PARAM_VALUE='INV';
--AND PARAM_VALUE like '%sonus%';
AND PARAM_VALUE like '%NUS%'; --Broadsoft  Sonus
select distinct PARAM_VALUE from TBL_ORDER_RSP where PARAM_NAME='ERROR_SOURCE';
select * From TBL_ORDER_RSP where PARAM_VALUE LIKE '%nus%';
select * from TBL_ESAP_ERROR_MAP;
select distinct ERROR_SOURCE from TBL_ESAP_ERROR_MAP;
select * from TBL_ESAP_ERROR_MAP where ERROR_SOURCE in ('IASA'); --IASA SONUS INV
select * from TBL_ESAP_ERROR_MAP where SOURCE_ERROR_CODE = 'VZBIASA_ERR_101';
select * from TBL_FALLOUT_DETAILS;
select * from TBL_ENTITY_SET;

select * from tbl_package WHERE ACTIVE_IND=2;
select DISTINCT PACKAGE_TYPE from tbl_package;
select DISTINCT ACTIVE_IND from tbl_package;
----------------------------Subscriber TN----------------------------------------------------
select * from TBL_PUBLIC_TN_POOL order by LAST_MODIFIED_DATE desc;
desc TBL_PUBLIC_TN_POOL;
select * from Tbl_Subscriber_Tn order by LAST_MODIFIED_DATE desc;
select * from Tbl_Subscriber_Tn where SUB_ID='1669137';
desc Tbl_Subscriber_Tn;
select * from Tbl_Subscriber order by LAST_MODIFIED_DATE desc;
desc Tbl_Subscriber;
select * from TblSubFeature;

SELECT * FROM tbl_task_action where task in (select task from tbl_service_task where service='VZB_CSSOP_MOD_ENTERPRISE_PUSH_FXO');
select TBL_ESAP_ERROR_MAP_ID_SEQ.nextval FROM DUAL;
select * from TBL_ESAP_ERROR_MAP;
desc TBL_ESAP_ERROR_MAP;

-----------------PC TABLE------------------------
select * from tn_bod_details;
--------------------------------------------------------------------------------------------------------------------------------
select * from TBL_NBS_CLUSTER_INFO where GROUP_ID = '8604657051';

--------------------------PC Connection TN DATA------------------------------------------------------------------------------
SELECT bod_svc_capability_id,
        svc_cap_id,
        feature_code,
        feature_name,
        cap_action_code,
        spec_code,
        spec_name,
        spec_value,
        value_code
      FROM esap_ad_app.tn_bod_details@PC
      WHERE order_number= '9237002';
------------------TABLE ORDERS CLEANUP -------------------------------------------------
select ENV_ORDER_ID,ORDER_NUMBER,ORDER_TYPE,ORDER_CLASSIFY,VERSION_NUMBER,PREV_PASS_ENV_ORDER_ID,ORDER_STATUS,WORK_GROUP,ERROR_CODE,SERVICE_TYPE,RECEIVE_DATE,PROJECT_ID,ENTERPRISE_ID,LOCATION_ID,SOURCE_ADDR,VZ_ID 
        from TBL_ENV_ORDER where ORDER_NUMBER='4102120' order by receive_date desc;
select ORDER_ID,ENV_ORDER_ID,UPSTREAM_TASK_ID,FLOW_PATH,VERSION_NO,ORDER_STATUS,ACCOUNT_NUMBER,ORDER_TYPE,RECVD_DATE from TBL_ORDER where ENV_ORDER_ID IN (4600905); --AND ORDER_ID = 5962805; 4510585
select * from TBL_ORDER_DETAILS where ORDER_ID=6355126 order by order_detail_id;--AuthFeatureType7100228

--RELEASE
--delete from TBL_ORDER_DETAILS where order_id IN (6355127,6355128,6355129,6355130,6355131,6355132); --ORDER IDs
--delete from TBL_ORDER where ENV_ORDER_ID = 4600906; --env ORDER ID
--VALIDATE
--delete from TBL_ORDER_DETAILS where order_id IN (6355126); --ORDER IDs
--delete from TBL_ORDER where ENV_ORDER_ID = 4600905; --env ORDER ID
--ORDER
--delete from TBL_ENV_ORDER where ORDER_NUMBER='4102120' AND ENV_ORDER_ID IN (4600905, 4600906) AND VERSION_NUMBER = 0;

--------------service or task retry /force complete--------------------------------

select * from tbl_order  where env_order_id=4622130;

select order_status, env_order_id from tbl_order where order_id=6468577;
select * from tbl_pending_wo_task where order_id = 6468577;
select * from tbl_order_service where order_id=6468577;
select order_status from tbl_env_order  where env_order_id=4637081;

update tbl_order_service set service_status = 102 where order_id = 6468577 and service = 'VZB_BS_CREATE_DEVICE_IB_20'; --102-reinitialize / 104-force complete
delete from tbl_pending_wo_task where order_id = 6468577;
update tbl_order set order_status = 102 where order_id = 6468577;
update tbl_env_order set order_status=102 where env_order_id=4637081;

--UPDATE TBL_ORDER_DETAILS set PARAM_VALUE = 7862343006  where PARAM_NAME IN ('CallingLineIdPhoneNumber','PilotTn','PhoneNumber') AND ORDER_ID=91647937; Updating TWO WAY - PILOT_TN SP_XO_PILNUM

--UPDATE TBL_ORDER_SERVICE SET SERVICE_STATUS = 403 WHERE SERVICE = 'VZB_BS_MOD_LOCATION_FXO' AND ORDER_ID = 6364560 AND SKIP_FLAG = 1; --403
-----------------------ESL INSTALL----------------------------------------------------
select * from TBL_LOCATION where BROADWORKSPORTALNUMBER = '5102144210';  -- BW Portal Number
select * from TBL_LOCATION where BILLINGTN = '6062142043';  --Group BTN 6226040120
select * from TBL_GROUP where GROUP_ID='510212026'; -- Trunk Id FET_XO_TRU
select * from TBL_GROUP where PILOT_TN='8205491346'; -- Pilot Number --7862343001
--//////EBL INSTALL
select * FROM TBL_PUBLIC_TN_POOL where TN='9511100203';
--//////REVERTING SUPP scenario
update TBL_ORDER set env_order_id = 4622048 where order_id = 6414281 AND upstream_task_id = 1; --Moving order to previous version
--update TBL_ORDER set env_order_id = 4622048 where order_id = 6406620 AND upstream_task_id = 3; --Moving order to previous version
update TBL_ORDER set env_order_id = 4622048 where order_id = 6414291 AND upstream_task_id = 4; --Moving order to previous version
update TBL_ORDER set env_order_id = 4622048 where order_id = 6414303 AND upstream_task_id = 43; --Moving order to previous version
update TBL_ORDER set env_order_id = 4622048 where order_id = 6414294 AND upstream_task_id = 64; --Moving order to previous version
update TBL_ORDER set env_order_id = 4622048 where order_id = 6414304 AND upstream_task_id = 66; --Moving order to previous version

--update TBL_ORDER set order_status=253 where order_id=6406623; -- cancelled -- update order status to failed from cancelled

--update tbl_env_order set order_status=102 where env_order_id=4614094; --To process LOCATION order / init-102 cancel-250
--update TBL_ENV_ORDER set ORDER_STATUS = 102 where ENV_ORDER_ID=4612952 and order_number=5102125;
--update TBL_ORDER set ORDER_STATUS = 104 where order_id = 6388150;
--update TBL_ORDER_DETAILS set PARAM_VALUE = '51.0.21.34' where PARAM_NAME IN ('Address','IpAddress','InternalIp') AND order_id = 6402971; -DEVICE retriggering, updating ip address

--Insert into TBL_ORDER_DETAILS (ORDER_DETAIL_ID,ORDER_ID,DATA_TYPE,SEQ_NO,PARAM_TYPE,ACTION,PARAM_NAME,PARAM_VALUE,PARENT_ID,FLOW_STATUS,LEAF)
--values (ORDER_DETAIL_ID_SEQ.NEXTVAL,6402971,null,0,',','n','Address','51.0.21.36',2308901424,0,1);
--Insert into TBL_ORDER_DETAILS (ORDER_DETAIL_ID,ORDER_ID,DATA_TYPE,SEQ_NO,PARAM_TYPE,ACTION,PARAM_NAME,PARAM_VALUE,PARENT_ID,FLOW_STATUS,LEAF)
--values (ORDER_DETAIL_ID_SEQ.NEXTVAL,6402971,null,0,',','n','IpAddress','51.0.21.36',2308901424,0,1);
--Insert into TBL_ORDER_DETAILS (ORDER_DETAIL_ID,ORDER_ID,DATA_TYPE,SEQ_NO,PARAM_TYPE,ACTION,PARAM_NAME,PARAM_VALUE,PARENT_ID,FLOW_STATUS,LEAF)
--values (ORDER_DETAIL_ID_SEQ.NEXTVAL,6402971,null,0,',','n','InternalIp','51.0.21.36',2308901424,0,1);
----------------------TASK SKIPPING----------------------------------
select * from TBL_ORDER_DETAILS where ACTION = 'S' AND PARAM_NAME LIKE '%_GROUP_%' order by ORDER_DETAIL_ID desc;
select * from TBL_ORDER_SERVICE where ORDER_ID = 6339247; --6377260
select SERVICE, SKIP_FLAG from TBL_ORDER_SERVICE where ORDER_ID = 91647753;--91647718;
SELECT * FROM aqm_task where work_id = '7352614';
SELECT work_id, workstep_id, required_status, completion_status, ready_status  FROM aqm_task where work_id = '7352613';
SELECT * FROM tbl_service_task where service = 'VZB_BS_ADD_INST_DID_TN_FXO'; --VZB_BS_ADD_LOCATION_FXO, VZB_INV_ADD_LOCATION_FXO, VZB_BS_ADD_2W_GROUP_FXO, VZB_BS_ADD_KEY_GROUP
SELECT * FROM tbl_service_task where service = 'VZB_BS_ACT_DID_TN_SYSTEM_UPDATE_20';
SELECT TASK, condition_flag, PARAM_NAME FROM tbl_service_task where service = 'VZB_CSSOP_ADD_ENTERPRISE_PUSH_FXO';
SELECT * FROM tbl_service_task where service like '%BS%GROUP%' AND REVERSE_TASK IS NOT NULL;
SELECT * FROM tbl_service_task where service NOT like '%FXO%' AND REVERSE_TASK IS NOT NULL;
select * from aqm_workstep;
select * from tbl_task_action where task = 'VZB_INV_ADD_LOCATION_FXO';

SELECT reverse_task
FROM tbl_service_task st, aqm_workstep ws, aqm_task t
WHERE t.workstep_id = ws.workstep_id
AND ws.name = st.task
AND ( t.required_status = 1
OR t.completion_status = 1
OR (t.ready_status = 1 AND start_date = 0) )
AND reverse_task is not null
AND t.work_id = '7380484'
AND st.service = 'VZB_INV_ADD_2W_GROUP_FXO';--VZB_INV_ADD_2W_GROUP_FXO / VZB_BS_ADD_2W_GROUP_FXO

select * from TBL_ORDER_SERVICE where ORDER_ID = 6404887 AND SKIP_FLAG IS NULL;

--------------BROADSOFT CLLI------------------------------------------------------------------------------------
select * from TBL_CONFIG_PARAMS where PARAM_NAME IN ('INV_CLLI','BS_CLLI','CSSOP_CLLI','IASA_CLLI','VPLAN_CLLI','IPRO_CLLI') AND PROCESS_NAME = 'OrderManager';
select distinct PARAM_NAME, PARAM_VALUE from TBL_CONFIG_PARAMS where PROCESS_NAME = 'OrderManager';

select * from STG_TBL_BS_AS_MAPPING_FXO where STATE = 'MA' AND VOIP_SERVICE_TYPE = 9; --ENTERPRISE_SIP - 9
select * from TBL_BS_AS WHERE bs_as_id = 15024;

-----------SEQUENCE of primary key udpation------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
select MAX(order_detail_id) from TBL_ORDER_DETAILS ;
SELECT * FROM user_constraints WHERE table_name = 'TBL_ORDER_DETAILS';
SELECT * FROM user_constraints WHERE table_name = 'TBL_ORDER_DETAILS' AND CONSTRAINT_NAME = 'SYS_C0023747';
SELECT count(*) from TBL_ORDER_DETAILS where order_detail_id > 7946859402;
SELECT order_detail_id from TBL_ORDER_DETAILS where order_detail_id > 7946859403 and ROWNUM <5;
SELECT order_detail_id_seq.nextval FROM DUAL;
SELECT count(*) from TBL_ORDER_DETAILS where order_detail_id > 7946858724;
--ALTER SEQUENCE order_detail_id_seq INCREMENT BY 1;

select param_value from tbl_config_params where process_name='CMDB' AND param_name='QUEUE';


select * from TBL_ENV_ORDER_RESP where RESP_TYPE = 'ACK' and ROWNUM <= 3 order by RESP_DATE desc;
select * from TBL_ENV_ORDER_RESP where RESP_TYPE = 'ACK' and RESP_DESC like '%7110037%' AND ROWNUM <10;
select * from TBL_ENV_ORDER_RESP where SEQUENCE_NO = 17468006;
--Top 5 salaries
select * from TBL_ENV_ORDER_RESP where ROWNUM <= 5 order by TBL_ENV_ORDER_RESP_ID desc;
select * from
    (select * from TBL_ENV_ORDER_RESP where ROWNUM <= 5 order by TBL_ENV_ORDER_RESP_ID desc)
where ROWNUM >= 1;

select distinct BS_AS_ID from STG_TBL_BS_AS_MAPPING_FXO where VOIP_SERVICE_TYPE = 8;
select * from TBL_BS_AS where BS_AS_ID IN (select distinct BS_AS_ID from STG_TBL_BS_AS_MAPPING_FXO where VOIP_SERVICE_TYPE = 8);

select * from TBL_ORDER_LOG where LOG_TEXT like '%NBS SipTrunks%'; --Successfully added XO Worktime NBS SipTrunks data.
select * from TBL_ORDER_LOG where ORDER_ID = 6443189;

select * from TBL_ORDER_DETAILS WHERE ORDER_ID=6443189 AND PARAM_NAME = 'LogSeqVal';

select * from TBL_TASK_COMPLETION_LOG WHERE ORDER_ID=6443189 and  svc_seq_no=6; 
select TASK_NAME, svc_seq_no, EVENT_DATE, ORDER_ID, STATUS, seq_no, DESCRIPTION from TBL_TASK_COMPLETION_LOG WHERE DESCRIPTION like '%Successfully added PSX and NBS SipTrunks data%' AND ORDER_ID = 6443189;
select TASK_NAME, svc_seq_no, EVENT_DATE, ORDER_ID, STATUS, seq_no, DESCRIPTION from TBL_TASK_COMPLETION_LOG WHERE DESCRIPTION like '%PSX Test%' AND ORDER_ID = 6443189; --PSX Test Log-0821
select TASK_NAME, svc_seq_no, EVENT_DATE, ORDER_ID, STATUS, seq_no, DESCRIPTION from TBL_TASK_COMPLETION_LOG WHERE DESCRIPTION like '%Govi%' AND ORDER_ID = 6443189; --PSX Test Log-0821
select TASK_NAME, svc_seq_no, DESCRIPTION from TBL_TASK_COMPLETION_LOG WHERE DESCRIPTION like '%Successfully added PSX and NBS SipTrunks data%';
select TASK_NAME, svc_seq_no, EVENT_DATE, ORDER_ID, STATUS, seq_no, DESCRIPTION from TBL_TASK_COMPLETION_LOG WHERE DESCRIPTION like '%Successfully added GSX data.%' order by EVENT_DATE desc;

select e.* from 
(select * from TBL_ENV_ORDER where ORDER_NUMBER='5102142' order by receive_date desc) e
where ROWNUM = 2
;

SELECT * FROM
    (select * from TBL_ORDER_SERVICE where order_id='6368088' ORDER BY SEQ_NO)
WHERE ROWNUM <= 3
;

select * from TBL_ORDER_SERVICE where order_id='6368088' AND ROWNUM <= 2 ORDER BY SEQ_NO ;

select * from TBL_ENV_ORDER where ORDER_NUMBER='5102142' order by receive_date desc LIMIT 1;

select * from TBL_ORDER_DETAILS where ORDER_ID=6469973 order by order_detail_id;
update TBL_ORDER_DETAILS set PARAM_VALUE = 'Ramya-5678' where ORDER_ID=6469973 AND PARAM_NAME = 'Name';

----CSSOP----------
select env_order_id, ENTERPRISE_ID, BW_ENTERPRISE_ID, auth_services_id from TBL_ENTERPRISE WHERE ENTERPRISE_ID='6906083757';
select env_order_id, auth_services_id from TBL_ENTERPRISE WHERE ENTERPRISE_ID='900034257';
select ORDER_ID,ENV_ORDER_ID,UPSTREAM_TASK_ID,FLOW_PATH,VERSION_NO,ORDER_STATUS,ACCOUNT_NUMBER,ORDER_TYPE,RECVD_DATE,APPTYPE_ID,aps_state from TBL_ORDER where ENV_ORDER_ID IN (4637753);
select ORDER_NUMBER from TBL_ENV_ORDER where ENV_ORDER_ID IN (select env_order_id from TBL_ENTERPRISE WHERE ENTERPRISE_ID='900034257');
select BW_ENTERPRISE_ID from TBL_ENTERPRISE WHERE ENTERPRISE_ID='900034257'

SELECT * FROM TBL_TSO_ENTERPRISE_TRUNK WHERE ENTERPRISE_ID = '6906083757' AND ENTERPRISE_TRUNK_ID = '';
select * from TBL_CONFIG_PARAMS where PARAM_NAME = 'BS_CLLI';-- AND PROCESS_NAME =''
select * from TBL_BS_AS_MAPPING_FXO where STATE='MA' AND VOIP_SERVICE_TYPE =8 ; --BS_AS_ID = 15025
select * from TBL_ORDER_SERVICE where order_id='6485640';
select bs_as_id, AS_CLLI from TBL_BS_AS where bs_as_id IN (15000,15025);--15000[DLLSTXSQHI1]/15025[NYCMNY83IDJ]
select * from TBL_CONFIG_PARAMS where PARAM_NAME = 'BS_SELECTION' AND PROCESS_NAME = 'ORDER_MANAGER'; --Always gives 15000
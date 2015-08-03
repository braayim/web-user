--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: add_console_user(character varying, character varying, character varying, character varying, character varying, character varying, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION add_console_user(_username character varying, _password character varying, _fullname character varying, _email character varying, _mobile character varying, _user_level character varying, _parent_insurance_company integer) RETURNS SETOF record
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$

declare 

this_id int = null;
this_message varchar;

begin
--Query the DB

if exists (select 1 from console_users where username = _username) then
this_message = 'USER '||_username||' ALREADY EXISTS'; 
return query SELECT  303, this_message, this_id;
RETURN;
end if;


INSERT INTO console_users (username, fullname, mobile_number, email_address, password, user_level, parent_insurance_company)
VALUES (_username, _fullname, _mobile, _email, _password, _user_level, _parent_insurance_company) returning id into this_id;

--All ok
this_message = 'USER HAS BEEN ADDED'; 
return query SELECT  0, this_message, this_id;



end;

$$;


ALTER FUNCTION public.add_console_user(_username character varying, _password character varying, _fullname character varying, _email character varying, _mobile character varying, _user_level character varying, _parent_insurance_company integer) OWNER TO postgres;

--
-- Name: add_menu(character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION add_menu(this_description character varying, this_header character varying) RETURNS integer
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$

declare 
this_id int;

begin

		INSERT INTO menus(menu_description, menu_header) VALUES (this_description, this_header) returning "menu_id" into this_id;
	
		RETURN this_id;
end;

$$;


ALTER FUNCTION public.add_menu(this_description character varying, this_header character varying) OWNER TO postgres;

--
-- Name: add_menu_item(character varying, integer, character varying, integer, boolean, integer, integer, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION add_menu_item(this_description character varying, this_menu_id integer, this_next_type character varying, this_next_id integer, this_is_leaf boolean, this_item_order integer, this_application_id integer, this_data_template character varying, this_continue_data_template character varying) RETURNS integer
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$

declare 
this_id int;

begin

		INSERT INTO menu_items(menu_item_description, menu_id, next_type, next_id, 
		            is_leaf, item_order, status, application_id, data_template, continue_data_template)
		    VALUES (this_description, this_menu_id, this_next_type, this_next_id, 
		            this_is_leaf, this_item_order, 'ACTIVE', this_application_id, this_data_template, this_continue_data_template) returning "menu_item_id" into this_id;
	
		RETURN this_id;
end;

$$;


ALTER FUNCTION public.add_menu_item(this_description character varying, this_menu_id integer, this_next_type character varying, this_next_id integer, this_is_leaf boolean, this_item_order integer, this_application_id integer, this_data_template character varying, this_continue_data_template character varying) OWNER TO postgres;

--
-- Name: add_mobile_user(character varying, character varying, character varying, character varying, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION add_mobile_user(_phone character varying, _pin character varying, _name character varying, _type character varying, _insurance_company integer) RETURNS SETOF record
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$



declare 



	this_id int = null;

	this_message varchar;



begin

		--Query the DB



if exists (select 1 from mobile_users where phone_number = _phone) then

this_message = 'MOBILE USER '||_phone||' ALREADY EXISTS'; 

return query SELECT  303, this_message, this_id;

RETURN;

end if;





INSERT INTO mobile_users(

            phone_number, pin, name, type, parent_insurance_company)

    VALUES (_phone, _pin, _name, _type, _insurance_company) returning id into this_id;





--All ok

this_message = 'MOBILE USER HAS BEEN ADDED'; 

return query SELECT  0, this_message, this_id;







end;



$$;


ALTER FUNCTION public.add_mobile_user(_phone character varying, _pin character varying, _name character varying, _type character varying, _insurance_company integer) OWNER TO postgres;

--
-- Name: add_payment_aggregator(character varying, character varying, character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION add_payment_aggregator(_name character varying, _access_code character varying, _access_password character varying, _security_code character varying, _email_address character varying) RETURNS SETOF record
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$



declare 



	this_id int = null;

	this_message varchar;



begin

		--Query the DB



if exists (select 1 from payment_aggregators where access_code = _access_code) then

this_message = 'PAYMENT AGGREGATOR '||_access_code||' ALREADY EXISTS'; 

return query SELECT  303, this_message, this_id;

RETURN;

end if;







INSERT INTO payment_aggregators(name, access_code, access_password, security_code, email_address)

    VALUES (_name, _access_code, _access_password, _security_code, _email_address);



--All ok

this_message = 'PAYMENT AGGREGATOR HAS BEEN ADDED'; 

return query SELECT  0, this_message, this_id;







end;



$$;


ALTER FUNCTION public.add_payment_aggregator(_name character varying, _access_code character varying, _access_password character varying, _security_code character varying, _email_address character varying) OWNER TO postgres;

--
-- Name: add_prompt(character varying, character varying, integer, boolean, integer, character varying, character varying, character varying, boolean, boolean, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION add_prompt(this_description character varying, this_next_type character varying, this_next_id integer, this_is_leaf boolean, this_application_id integer, this_data_template character varying, this_variable_name character varying, this_continue_data_template character varying, this_is_confirmation boolean, this_is_account_prompt boolean, this_is_auth boolean) RETURNS integer
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$

declare 
this_id int;

begin

		INSERT INTO prompts(description,next_type, next_id, 
		            is_leaf, application_id, data_template, continue_data_template, is_confirmation, variable_name, is_account_prompt, is_auth)
		    VALUES (this_description, this_next_type, this_next_id, 
		            this_is_leaf, this_application_id, this_data_template, this_continue_data_template, this_is_confirmation, this_variable_name, this_is_account_prompt, this_is_auth) returning "id" into this_id;
	
		RETURN this_id;
end;

$$;


ALTER FUNCTION public.add_prompt(this_description character varying, this_next_type character varying, this_next_id integer, this_is_leaf boolean, this_application_id integer, this_data_template character varying, this_variable_name character varying, this_continue_data_template character varying, this_is_confirmation boolean, this_is_account_prompt boolean, this_is_auth boolean) OWNER TO postgres;

--
-- Name: change_mobile_user_pin(character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION change_mobile_user_pin(_phone character varying, _oldpin character varying, _newpin character varying) RETURNS SETOF record
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$



declare 



	this_id int = null;

	this_message varchar;

	this_oldpin varchar;



begin

		--Query the DB



if not exists (select 1 from mobile_users where phone_number = _phone) then

this_message = 'MOBILE USER '||_phone||' NOT FOUND'; 

return query SELECT  404, this_message;

RETURN;

end if;



select pin into this_oldpin from mobile_users where phone_number = _phone;



if (this_oldpin<>_oldpin) then

this_message = 'INVALID OLD PIN SPECIFIED FOR MOBILE USER '||_phone; 

return query SELECT  403, this_message;

RETURN;

end if;





if (this_oldpin=_newpin) then

this_message = 'OLD PIN AND NEW PIN CAN NOT BE THE SAME'; 

return query SELECT  405, this_message;

RETURN;

end if;









-- CHANGE THE PIN

update mobile_users set pin = _newpin, pin_change_flag=false,incorrect_access_count=0  where phone_number = _phone;





-- All ok

this_message = 'PIN HAS BEEN CHANGED'; 

return query SELECT  0, this_message;





end;



$$;


ALTER FUNCTION public.change_mobile_user_pin(_phone character varying, _oldpin character varying, _newpin character varying) OWNER TO postgres;

--
-- Name: log_incorrect_mobile_user_pin(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION log_incorrect_mobile_user_pin(this_user_mobile character varying) RETURNS text
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$



declare





this_message varchar;

this_max_incorrect_count int;

this_current_user_count int = 0;



begin



if not exists (select 1 from settings where param_name = 'INCORRECT_MOBILE_USER_PIN_COUNT') then

raise EXCEPTION 'SETTING INCORRECT_MOBILE_USER_PIN_COUNT IS NOT SETUP'; 

end if;



select cast(param_value as int) into this_max_incorrect_count from settings where param_name = 'INCORRECT_MOBILE_USER_PIN_COUNT';



-- select current count from db

select incorrect_access_count into this_current_user_count from mobile_users where phone_number = this_user_mobile;



if (this_current_user_count>=(this_max_incorrect_count - 1)) then

update mobile_users set incorrect_access_count=incorrect_access_count+1, locked=true where phone_number = this_user_mobile;

else

-- just increment

update mobile_users set incorrect_access_count=incorrect_access_count+1 where phone_number = this_user_mobile;

end if;



this_message='OK';

return this_message;

end;



$$;


ALTER FUNCTION public.log_incorrect_mobile_user_pin(this_user_mobile character varying) OWNER TO postgres;

--
-- Name: outbox_message_generation(character varying, character varying, character varying[], boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION outbox_message_generation(this_message_template character varying, this_customer_number character varying, message_info character varying[], this_flash_message boolean) RETURNS text
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$



declare





this_message varchar;



array_position int;

temp_array _VARCHAR;

i int;



begin



this_message := this_message_template;





for i in 1 .. array_upper(message_info,1)

loop

temp_array = string_to_array(message_info[i], '~');

IF (temp_array[1] is not null) THEN

if(temp_array[1] = 'AMOUNT' )THEN

this_message := replace(this_message, '#'||temp_array[1]||'#' , to_char(cast(temp_array[2] as NUMERIC), 'FM999,999,999,999,999,999'));

else



this_message := replace(this_message, '#'||temp_array[1]||'#' , temp_array[2]);



end if;



END IF;

end loop;



this_message := replace(this_message, '#DATE#' , to_char(now(), 'dd/mm/yyyy HH24:mi'));





if (this_customer_number is not null) then

INSERT INTO message_outbox(recipient_number,message_text,flash_message) VALUES (this_customer_number,this_message,this_flash_message);

ELSE

raise EXCEPTION 'CUSTOMER NUMBER CANNOT BE NULL...';

end if;





return this_message;

end;



$$;


ALTER FUNCTION public.outbox_message_generation(this_message_template character varying, this_customer_number character varying, message_info character varying[], this_flash_message boolean) OWNER TO postgres;

--
-- Name: process_received_payment(character varying, character varying, character varying, character varying, character varying, double precision, character varying, character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION process_received_payment(_aggregator character varying, _aggregator_transaction_id character varying, _vehicle_registration_number character varying, _aggregator_payment_processed_date character varying, _aggregator_payment_reference character varying, _amount double precision, _aggregator_payment_memo character varying, _aggregator_payer_name character varying, _aggregator_payer_mobile character varying, _aggregator_payer_email character varying) RETURNS SETOF record
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$



declare 



	this_aggregator_id int;

	this_message_template varchar;

	this_message varchar;

	this_processed_reference int;

	this_payment_id int;

	





begin

		--Query the DB



if not exists (select 1 from payment_aggregators where access_code = _aggregator) then

this_message = 'PAYMENT AGGREGATOR '||_aggregator||' DOES NOT EXIST'; 

return query SELECT  403, this_message, this_processed_reference;

RETURN;

end if;





-- Fetch aggregator details

select id into this_aggregator_id from payment_aggregators where access_code = _aggregator;





-- Check if payment already processed for this aggregator

if exists ( select 1 from payments_received where aggregator=this_aggregator_id and aggregator_transaction_id=_aggregator_transaction_id) then

this_message = 'PAYMENT WITH TRANSACTION ID '||_aggregator_transaction_id||' WAS ALREADY RECEIVED FOR AGGREGATOR '||_aggregator; 

return query SELECT  8008, this_message, this_processed_reference;

RETURN;

end if;





-- Generate reference 

select nextval('payment_processed_reference_sequence') into this_processed_reference;





-- Confirm payment

INSERT INTO payments_received(

            aggregator, aggregator_transaction_id, vehicle_reference, 

            aggregator_payment_processed_date,  aggregator_payment_reference, 

            amount, aggregator_memo, payer_mobile, payer_email, payer_name)

    VALUES (this_aggregator_id, _aggregator_transaction_id, _vehicle_registration_number, 

            cast(_aggregator_payment_processed_date as timestamp), _aggregator_payment_reference, 

            _amount, _aggregator_payment_memo, _aggregator_payer_mobile, _aggregator_payer_email, _aggregator_payer_name) returning id into this_payment_id; 





-- Insertion of sticker is deffered now until confirmation is received from URA
-- INSERT INTO paid_issued_stickers( print_code,  payment_id, expiry_date, vehicle_paid_for)
--    VALUES (this_processed_reference, this_payment_id, now() + interval '+ 1 Year', _vehicle_registration_number);





-- Queue sms

-- select message_template into this_message_template from message_templates where id='PAYMENT_RECEIVED_TEMPLATE';

-- Don't generate message
-- perform outbox_message_generation(this_message_template, _aggregator_payer_mobile, ARRAY['AMOUNT~'||_amount, 'STICKER~'||this_processed_reference, 'REGNO~'||_vehicle_registration_number],false);







-- All ok

this_message = 'PAYMENT HAS BEEN RECEIVED'; 

return query SELECT  0, this_message, this_payment_id;







end;



$$;


ALTER FUNCTION public.process_received_payment(_aggregator character varying, _aggregator_transaction_id character varying, _vehicle_registration_number character varying, _aggregator_payment_processed_date character varying, _aggregator_payment_reference character varying, _amount double precision, _aggregator_payment_memo character varying, _aggregator_payer_name character varying, _aggregator_payer_mobile character varying, _aggregator_payer_email character varying) OWNER TO postgres;

--
-- Name: store_variable(character varying, character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION store_variable(this_phone_number character varying, this_session character varying, this_variable_name character varying, this_value character varying) RETURNS boolean
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$





declare

begin

		if exists (select 1 from ussd_variables where phone_number = this_phone_number and session_id = this_session and variable_name=this_variable_name) THEN

				update ussd_variables set variable_value = this_value where phone_number = this_phone_number and session_id = this_session and variable_name=this_variable_name;

		ELSE

				insert into ussd_variables(phone_number, session_id, variable_name,variable_value)

				values(this_phone_number, this_session, this_variable_name,this_value);

		end if;

		RETURN true;

end;

$$;


ALTER FUNCTION public.store_variable(this_phone_number character varying, this_session character varying, this_variable_name character varying, this_value character varying) OWNER TO postgres;

--
-- Name: user_console_login(character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION user_console_login(_username character varying, _password character varying) RETURNS SETOF record
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$



declare 

	this_username varchar;

	this_password varchar;

	this_fullname varchar;

	this_incorrect_access_count int;

	this_id int;

	this_email varchar;

	this_message varchar;

	this_mobile_number varchar;

	this_null varchar = null;

begin

		--Query the DB



if not exists (select 1 from users where username = _username) then

this_message = 'USER '||_username||' NOT FOUND'; 

return query SELECT  404, this_message, this_id, this_username, this_fullname, this_email, this_mobile_number;

RETURN;

end if;





select username, password, fullname, email_address,incorrect_access_count, id, mobile_number

	into this_username, this_password, this_fullname, this_email, this_incorrect_access_count, this_id, this_mobile_number from users

	where username = _username;



--Check for lockout

if (this_incorrect_access_count >= 3) then

this_message = 'USER account is LOCKED OUT'; 

return query SELECT  403, this_message, this_id, this_username, this_fullname, this_email, this_mobile_number;

RETURN;

end if;







--Check for password

if (this_password <> _password) then

update users set incorrect_access_count=incorrect_access_count+1 where id = this_id;

this_message = 'Invalid PASSWORD for user '||_username; 

return query SELECT  403, this_message, this_id, this_username, this_fullname, this_email, this_mobile_number;

RETURN;

end if;





--All ok

update users set incorrect_access_count=0 where id=this_id and incorrect_access_count<>0;

this_message = 'LOGIN SUCCESS'; 

return query SELECT  0, this_message, this_id, this_username, this_fullname, this_email, this_mobile_number;







end;



$$;


ALTER FUNCTION public.user_console_login(_username character varying, _password character varying) OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: applications; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE applications (
    id integer NOT NULL,
    type character varying,
    end_point character varying,
    name character varying,
    post_type integer DEFAULT 0
);


ALTER TABLE applications OWNER TO postgres;

--
-- Name: COLUMN applications.post_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN applications.post_type IS 'If 0 we end session after posting else it can continue';


--
-- Name: applications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE applications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE applications_id_seq OWNER TO postgres;

--
-- Name: applications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE applications_id_seq OWNED BY applications.id;


--
-- Name: auth_assignment; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_assignment (
    item_name character varying(64) NOT NULL,
    user_id character varying(64) NOT NULL,
    created_at integer,
    updated_at integer
);


ALTER TABLE auth_assignment OWNER TO postgres;

--
-- Name: auth_item; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_item (
    name character varying(64) NOT NULL,
    type integer NOT NULL,
    description text,
    rule_name character varying(64),
    data text,
    created_at integer,
    updated_at integer
);


ALTER TABLE auth_item OWNER TO postgres;

--
-- Name: auth_item_child; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_item_child (
    parent character varying(64) NOT NULL,
    child character varying(64) NOT NULL
);


ALTER TABLE auth_item_child OWNER TO postgres;

--
-- Name: auth_rule; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_rule (
    name character varying(64) NOT NULL,
    data text,
    created_at integer,
    updated_at integer
);


ALTER TABLE auth_rule OWNER TO postgres;

--
-- Name: bulk_upload_files_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bulk_upload_files_id_seq
    START WITH 13
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bulk_upload_files_id_seq OWNER TO postgres;

--
-- Name: bulk_upload_files; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bulk_upload_files (
    id integer DEFAULT nextval('bulk_upload_files_id_seq'::regclass) NOT NULL,
    description character varying,
    upload_date timestamp(6) without time zone DEFAULT now(),
    validation_date timestamp(6) without time zone,
    process_date timestamp(6) without time zone,
    is_validated boolean DEFAULT false NOT NULL,
    is_processed boolean DEFAULT false NOT NULL,
    validation_succeded boolean DEFAULT false NOT NULL,
    process_succeeded boolean DEFAULT false NOT NULL,
    validation_comment character varying,
    process_comment character varying,
    created_by bigint,
    insurance_company bigint,
    file_hash character varying
);


ALTER TABLE bulk_upload_files OWNER TO postgres;

--
-- Name: bulk_upload_records; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bulk_upload_records (
    id integer NOT NULL,
    file_id bigint NOT NULL,
    reg_no character varying NOT NULL,
    payer_phone character varying,
    payer_email character varying,
    policy_number character varying,
    policy_start_date date,
    policy_end_date date,
    assessment_amount bigint,
    processed boolean DEFAULT false,
    process_comment character varying
);


ALTER TABLE bulk_upload_records OWNER TO postgres;

--
-- Name: bulk_upload_records_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bulk_upload_records_id_seq
    START WITH 8
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bulk_upload_records_id_seq OWNER TO postgres;

--
-- Name: bulk_upload_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE bulk_upload_records_id_seq OWNED BY bulk_upload_records.id;


--
-- Name: console_user_groups; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE console_user_groups (
    id integer NOT NULL,
    group_name character varying,
    group_roles character varying,
    date_added timestamp(6) without time zone DEFAULT now()
);


ALTER TABLE console_user_groups OWNER TO postgres;

--
-- Name: COLUMN console_user_groups.group_roles; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN console_user_groups.group_roles IS 'pipe separed role ids';


--
-- Name: console_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE console_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE console_user_groups_id_seq OWNER TO postgres;

--
-- Name: console_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE console_user_groups_id_seq OWNED BY console_user_groups.id;


--
-- Name: console_users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE console_users (
    id integer NOT NULL,
    username character varying NOT NULL,
    fullname character varying NOT NULL,
    mobile_number character varying NOT NULL,
    email_address character varying NOT NULL,
    incorrect_access_count smallint DEFAULT 0,
    password character varying DEFAULT ('now'::text)::date NOT NULL,
    date_created timestamp(6) without time zone DEFAULT now(),
    locked boolean DEFAULT false,
    user_level character varying DEFAULT 'INSU_COMP_USER'::character varying,
    parent_insurance_company integer,
    user_permissions character varying,
    password_reset_token character varying(2044),
    auth_key character varying(2044),
    updated_at timestamp without time zone
);


ALTER TABLE console_users OWNER TO postgres;

--
-- Name: inbox; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE inbox (
    id integer NOT NULL,
    sender character varying,
    recipient character varying,
    date_received timestamp(6) without time zone DEFAULT now(),
    message_text character varying,
    read boolean DEFAULT false,
    recipient_type character varying
);


ALTER TABLE inbox OWNER TO postgres;

--
-- Name: inbox_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE inbox_id_seq
    START WITH 4
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE inbox_id_seq OWNER TO postgres;

--
-- Name: inbox_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE inbox_id_seq OWNED BY inbox.id;


--
-- Name: insurance_companies; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE insurance_companies (
    id integer NOT NULL,
    code character varying,
    description character varying,
    address character varying,
    email_address character varying
);


ALTER TABLE insurance_companies OWNER TO postgres;

--
-- Name: insurance_companies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE insurance_companies_id_seq
    START WITH 5
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE insurance_companies_id_seq OWNER TO postgres;

--
-- Name: insurance_companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE insurance_companies_id_seq OWNED BY insurance_companies.id;


--
-- Name: insurance_payments_initiations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE insurance_payments_initiations (
    id bigint NOT NULL,
    transaction_id character varying NOT NULL,
    vehicle_reference character varying NOT NULL,
    processed_date timestamp(6) without time zone NOT NULL,
    amount bigint NOT NULL,
    payer_mobile character varying,
    policy_number character varying,
    vehicle_description character varying,
    payer_email character varying,
    payer_name character varying,
    status character varying DEFAULT 'INITIATED'::character varying NOT NULL,
    insurance_company_profile bigint,
    initiated_by bigint,
    approved_by bigint,
    date_approved timestamp(6) without time zone,
    policy_start_date date,
    policy_end_date date
);


ALTER TABLE insurance_payments_initiations OWNER TO postgres;

--
-- Name: insurance_payments_initiations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE insurance_payments_initiations_id_seq
    START WITH 184
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE insurance_payments_initiations_id_seq OWNER TO postgres;

--
-- Name: insurance_payments_initiations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE insurance_payments_initiations_id_seq OWNED BY insurance_payments_initiations.id;


--
-- Name: manual_trans_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE manual_trans_id_seq
    START WITH 185
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE manual_trans_id_seq OWNER TO postgres;

--
-- Name: menu_items; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE menu_items (
    menu_item_id smallint NOT NULL,
    menu_item_description character varying NOT NULL,
    menu_id integer NOT NULL,
    next_type character varying DEFAULT 'PROMPT'::character varying,
    next_id integer DEFAULT 0,
    is_leaf boolean DEFAULT false NOT NULL,
    item_order integer DEFAULT 1,
    status character varying DEFAULT 'ACTIVE'::character varying NOT NULL,
    application_id integer,
    data_template character varying,
    continue_data_template character varying
);


ALTER TABLE menu_items OWNER TO postgres;

--
-- Name: menu_items_menu_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE menu_items_menu_item_id_seq
    START WITH 555
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE menu_items_menu_item_id_seq OWNER TO postgres;

--
-- Name: menu_items_menu_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE menu_items_menu_item_id_seq OWNED BY menu_items.menu_item_id;


--
-- Name: menu_mappings; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE menu_mappings (
    obo_menu_id character varying NOT NULL,
    local_menu_id character varying NOT NULL,
    local_menu_type character varying DEFAULT 'MENU'::character varying NOT NULL
);


ALTER TABLE menu_mappings OWNER TO postgres;

--
-- Name: menus; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE menus (
    menu_id integer NOT NULL,
    menu_description character varying NOT NULL,
    menu_header character varying
);


ALTER TABLE menus OWNER TO postgres;

--
-- Name: menus_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE menus_menu_id_seq
    START WITH 112
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE menus_menu_id_seq OWNER TO postgres;

--
-- Name: menus_menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE menus_menu_id_seq OWNED BY menus.menu_id;


--
-- Name: message_outbox; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE message_outbox (
    id integer NOT NULL,
    message_text text NOT NULL,
    time_generated timestamp(6) without time zone DEFAULT now() NOT NULL,
    time_sent timestamp(6) without time zone,
    recipient_number character varying NOT NULL,
    message_status character varying DEFAULT 'PENDING'::character varying NOT NULL,
    flash_message boolean DEFAULT false NOT NULL,
    email_message boolean DEFAULT false NOT NULL,
    email_subject character varying DEFAULT ''::character varying,
    email_attachment character varying DEFAULT ''::character varying
);


ALTER TABLE message_outbox OWNER TO postgres;

--
-- Name: message_outbox_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE message_outbox_id_seq
    START WITH 13955
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE message_outbox_id_seq OWNER TO postgres;

--
-- Name: message_outbox_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE message_outbox_id_seq OWNED BY message_outbox.id;


--
-- Name: message_templates; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE message_templates (
    id character varying NOT NULL,
    message_template text NOT NULL
);


ALTER TABLE message_templates OWNER TO postgres;

--
-- Name: mobile_users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE mobile_users (
    id integer NOT NULL,
    phone_number character varying,
    pin character varying,
    name character varying,
    date_created timestamp(6) without time zone DEFAULT now(),
    locked boolean,
    type character varying DEFAULT 'VIEWER'::character varying,
    incorrect_access_count smallint DEFAULT 0,
    pin_change_flag boolean DEFAULT true,
    parent_insurance_company bigint,
    auth_imsi character varying,
    auth_imei character varying,
    activation_code character varying
);


ALTER TABLE mobile_users OWNER TO postgres;

--
-- Name: mobile_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mobile_users_id_seq
    START WITH 5751
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mobile_users_id_seq OWNER TO postgres;

--
-- Name: mobile_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mobile_users_id_seq OWNED BY mobile_users.id;


--
-- Name: motor_entity_details; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE motor_entity_details (
    id integer NOT NULL,
    registration_number character varying NOT NULL,
    registration_name character varying,
    registration_date timestamp(6) without time zone,
    date_created timestamp(6) without time zone DEFAULT now(),
    engine_capacity character varying,
    memo character varying,
    model character varying,
    type character varying,
    gross_weight integer,
    seating_capacity smallint,
    purpose character varying,
    engine_number character varying,
    colour character varying,
    make character varying,
    tyre_size character varying,
    year_of_manufacture date,
    chassis_number character varying,
    tin character varying DEFAULT ''::character varying NOT NULL
);


ALTER TABLE motor_entity_details OWNER TO postgres;

--
-- Name: motor_entity_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE motor_entity_details_id_seq
    START WITH 3
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE motor_entity_details_id_seq OWNER TO postgres;

--
-- Name: motor_entity_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE motor_entity_details_id_seq OWNED BY motor_entity_details.id;


--
-- Name: paid_issued_stickers; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE paid_issued_stickers (
    id integer NOT NULL,
    print_code character varying,
    date_created timestamp(6) without time zone DEFAULT now(),
    payment_id bigint,
    expiry_date timestamp(6) without time zone,
    vehicle_paid_for character varying(16),
    printed boolean DEFAULT false,
    printed_by character varying,
    date_printed timestamp(6) without time zone,
    printer_insurance_company bigint,
    physical_sticker_serial character varying
);


ALTER TABLE paid_issued_stickers OWNER TO postgres;

--
-- Name: paid_issued_stickers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE paid_issued_stickers_id_seq
    START WITH 105
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE paid_issued_stickers_id_seq OWNER TO postgres;

--
-- Name: paid_issued_stickers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE paid_issued_stickers_id_seq OWNED BY paid_issued_stickers.id;


--
-- Name: payment_aggregators; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE payment_aggregators (
    id integer NOT NULL,
    name character varying NOT NULL,
    access_code character varying NOT NULL,
    access_password character varying NOT NULL,
    security_code text NOT NULL,
    active boolean DEFAULT true NOT NULL,
    date_created timestamp(6) without time zone DEFAULT now() NOT NULL,
    incorrect_access_count smallint DEFAULT 0 NOT NULL,
    locked boolean DEFAULT false NOT NULL,
    email_address character varying
);


ALTER TABLE payment_aggregators OWNER TO postgres;

--
-- Name: payment_aggregators_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE payment_aggregators_id_seq
    START WITH 13
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE payment_aggregators_id_seq OWNER TO postgres;

--
-- Name: payment_aggregators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE payment_aggregators_id_seq OWNED BY payment_aggregators.id;


--
-- Name: payment_processed_reference_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE payment_processed_reference_sequence
    START WITH 2120
    INCREMENT BY 1
    MINVALUE 2000
    NO MAXVALUE
    CACHE 1;


ALTER TABLE payment_processed_reference_sequence OWNER TO postgres;

--
-- Name: payments_received; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE payments_received (
    id bigint NOT NULL,
    aggregator smallint NOT NULL,
    aggregator_transaction_id character varying NOT NULL,
    vehicle_reference character varying NOT NULL,
    aggregator_payment_processed_date timestamp(6) without time zone NOT NULL,
    date_received timestamp(6) without time zone DEFAULT now() NOT NULL,
    aggregator_payment_reference character varying NOT NULL,
    amount bigint NOT NULL,
    aggregator_memo character varying,
    payer_mobile character varying,
    payer_email character varying,
    payer_name character varying,
    payment_recon_flag character varying DEFAULT 'NORMAL'::character varying NOT NULL,
    payment_status character varying DEFAULT 'RECEIVED'::character varying,
    sticker_generated boolean DEFAULT false
);


ALTER TABLE payments_received OWNER TO postgres;

--
-- Name: payments_received_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE payments_received_id_seq
    START WITH 118
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE payments_received_id_seq OWNER TO postgres;

--
-- Name: payments_received_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE payments_received_id_seq OWNED BY payments_received.id;


--
-- Name: policies; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE policies (
    id integer NOT NULL,
    date_created timestamp(6) without time zone DEFAULT now(),
    start_date date DEFAULT now(),
    end_date date,
    registration_number character varying,
    policy_holder_name character varying,
    policy_holder_phone character varying,
    policy_number character varying,
    insurance_company bigint,
    sticker_reference character varying
);


ALTER TABLE policies OWNER TO postgres;

--
-- Name: policies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE policies_id_seq
    START WITH 92
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE policies_id_seq OWNER TO postgres;

--
-- Name: policies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE policies_id_seq OWNED BY policies.id;


--
-- Name: policy_number_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE policy_number_seq
    START WITH 23
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE policy_number_seq OWNER TO postgres;

--
-- Name: prompts; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE prompts (
    id integer NOT NULL,
    description character varying NOT NULL,
    next_type character varying,
    next_id integer,
    is_leaf boolean DEFAULT false NOT NULL,
    application_id integer,
    data_template character varying,
    variable_name character varying,
    continue_data_template character varying,
    is_confirmation boolean DEFAULT false,
    is_account_prompt boolean DEFAULT false,
    is_auth boolean DEFAULT false
);


ALTER TABLE prompts OWNER TO postgres;

--
-- Name: prompts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE prompts_id_seq
    START WITH 1477
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE prompts_id_seq OWNER TO postgres;

--
-- Name: prompts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE prompts_id_seq OWNED BY prompts.id;


--
-- Name: settings; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE settings (
    param_name character varying NOT NULL,
    param_value character varying NOT NULL
);


ALTER TABLE settings OWNER TO postgres;

--
-- Name: test_payment_initiations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE test_payment_initiations (
    phone_number character varying NOT NULL,
    session_id character varying NOT NULL,
    amount character varying NOT NULL,
    date timestamp(6) without time zone DEFAULT now() NOT NULL,
    reg_no character varying NOT NULL
);


ALTER TABLE test_payment_initiations OWNER TO postgres;

--
-- Name: ura_first_time_registration_details; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ura_first_time_registration_details (
    id integer NOT NULL,
    registration_number character varying NOT NULL,
    registration_name character varying,
    registration_date timestamp(6) without time zone,
    date_created timestamp(6) without time zone DEFAULT now(),
    date_registered timestamp(6) without time zone,
    engine_capacity character varying,
    memo character varying,
    model character varying,
    type character varying,
    gross_weight integer,
    seating_capacity smallint,
    purpose character varying,
    engine_number character varying,
    colour character varying,
    make character varying,
    tyre_size character varying,
    year_of_manufacture date,
    chassis_number character varying,
    tin character varying DEFAULT ''::character varying NOT NULL,
    transacted boolean DEFAULT false,
    date_transacted timestamp(6) without time zone,
    payment_id bigint
);


ALTER TABLE ura_first_time_registration_details OWNER TO postgres;

--
-- Name: ura_first_time_registration_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ura_first_time_registration_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ura_first_time_registration_details_id_seq OWNER TO postgres;

--
-- Name: ura_first_time_registration_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ura_first_time_registration_details_id_seq OWNED BY ura_first_time_registration_details.id;


--
-- Name: ura_stampduty_prn_registration_details; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ura_stampduty_prn_registration_details (
    id integer NOT NULL,
    vrn character varying,
    tin character varying,
    registered_name character varying,
    amount character varying,
    prn character varying,
    date_registered timestamp(6) without time zone,
    payment_id bigint,
    status character varying DEFAULT 'PENDING'::character varying,
    date_pushed_to_bank timestamp(6) without time zone,
    date_confirmed timestamp(6) without time zone,
    bank_trans_ref character varying,
    ura_trans_ref character varying
);


ALTER TABLE ura_stampduty_prn_registration_details OWNER TO postgres;

--
-- Name: ura_stampduty_prn_registration_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ura_stampduty_prn_registration_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ura_stampduty_prn_registration_details_id_seq OWNER TO postgres;

--
-- Name: ura_stampduty_prn_registration_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ura_stampduty_prn_registration_details_id_seq OWNED BY ura_stampduty_prn_registration_details.id;


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 13
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY console_users.id;


--
-- Name: ussd_sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ussd_sessions_id_seq
    START WITH 268
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ussd_sessions_id_seq OWNER TO postgres;

--
-- Name: ussd_sessions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ussd_sessions (
    id integer DEFAULT nextval('ussd_sessions_id_seq'::regclass) NOT NULL,
    phone_number character varying(20) NOT NULL,
    session_id character varying(50) NOT NULL,
    "time" timestamp(6) without time zone DEFAULT now() NOT NULL,
    status character varying(15) DEFAULT 'ACTIVE'::character varying NOT NULL,
    status_type character varying,
    root_menu_id character varying(32),
    last_menu_id character varying(32),
    leaf_state integer DEFAULT 0
);


ALTER TABLE ussd_sessions OWNER TO postgres;

--
-- Name: COLUMN ussd_sessions.leaf_state; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN ussd_sessions.leaf_state IS '0 is we''ve not posted at all, 1 we have';


--
-- Name: ussd_variables; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ussd_variables (
    session_id character varying(50) NOT NULL,
    phone_number character varying(20) NOT NULL,
    variable_name character varying(50) NOT NULL,
    variable_value character varying(500),
    "time" timestamp(6) without time zone DEFAULT now()
);


ALTER TABLE ussd_variables OWNER TO postgres;

--
-- Name: web_log; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE web_log (
    id bigint NOT NULL,
    username character varying,
    date timestamp(6) without time zone DEFAULT now(),
    action character varying,
    result character varying,
    parameters character varying
);


ALTER TABLE web_log OWNER TO postgres;

--
-- Name: web_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE web_log_id_seq
    START WITH 91
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE web_log_id_seq OWNER TO postgres;

--
-- Name: web_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE web_log_id_seq OWNED BY web_log.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY applications ALTER COLUMN id SET DEFAULT nextval('applications_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bulk_upload_records ALTER COLUMN id SET DEFAULT nextval('bulk_upload_records_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY console_user_groups ALTER COLUMN id SET DEFAULT nextval('console_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY console_users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY inbox ALTER COLUMN id SET DEFAULT nextval('inbox_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY insurance_companies ALTER COLUMN id SET DEFAULT nextval('insurance_companies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY insurance_payments_initiations ALTER COLUMN id SET DEFAULT nextval('insurance_payments_initiations_id_seq'::regclass);


--
-- Name: menu_item_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY menu_items ALTER COLUMN menu_item_id SET DEFAULT nextval('menu_items_menu_item_id_seq'::regclass);


--
-- Name: menu_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY menus ALTER COLUMN menu_id SET DEFAULT nextval('menus_menu_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY message_outbox ALTER COLUMN id SET DEFAULT nextval('message_outbox_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mobile_users ALTER COLUMN id SET DEFAULT nextval('mobile_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY motor_entity_details ALTER COLUMN id SET DEFAULT nextval('motor_entity_details_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY paid_issued_stickers ALTER COLUMN id SET DEFAULT nextval('paid_issued_stickers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY payment_aggregators ALTER COLUMN id SET DEFAULT nextval('payment_aggregators_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY payments_received ALTER COLUMN id SET DEFAULT nextval('payments_received_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY policies ALTER COLUMN id SET DEFAULT nextval('policies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY prompts ALTER COLUMN id SET DEFAULT nextval('prompts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ura_first_time_registration_details ALTER COLUMN id SET DEFAULT nextval('ura_first_time_registration_details_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ura_stampduty_prn_registration_details ALTER COLUMN id SET DEFAULT nextval('ura_stampduty_prn_registration_details_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY web_log ALTER COLUMN id SET DEFAULT nextval('web_log_id_seq'::regclass);


--
-- Data for Name: applications; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO applications (id, type, end_point, name, post_type) VALUES (1, 'INTERNAL', 'http://localhost:7001/InsuranceInteractive/UssdListener', 'Insurance Ussd App', 0);
INSERT INTO applications (id, type, end_point, name, post_type) VALUES (2, 'HTTPPOST', 'http://localhost:7001/ThirdpartyPaymentsApp/XMLListener', 'Payment Simulation XML', 1);


--
-- Name: applications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('applications_id_seq', 1, false);


--
-- Data for Name: auth_assignment; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO auth_assignment (item_name, user_id, created_at, updated_at) VALUES ('ura_user', '17', NULL, 1438253290);
INSERT INTO auth_assignment (item_name, user_id, created_at, updated_at) VALUES ('admin', '5', 1438257209, 1438257209);
INSERT INTO auth_assignment (item_name, user_id, created_at, updated_at) VALUES ('insurance_user', '31', 1438242193, 1438261407);
INSERT INTO auth_assignment (item_name, user_id, created_at, updated_at) VALUES ('admin', '18', 1438456591, 1438456839);
INSERT INTO auth_assignment (item_name, user_id, created_at, updated_at) VALUES ('ura_user', '32', 1438254612, 1438458145);


--
-- Data for Name: auth_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO auth_item (name, type, description, rule_name, data, created_at, updated_at) VALUES ('ura_user', 1, 'URA User', NULL, NULL, NULL, NULL);
INSERT INTO auth_item (name, type, description, rule_name, data, created_at, updated_at) VALUES ('ira_user', 1, 'IRA User', NULL, NULL, NULL, NULL);
INSERT INTO auth_item (name, type, description, rule_name, data, created_at, updated_at) VALUES ('insurance_user', 1, 'Insurance User', NULL, NULL, NULL, NULL);
INSERT INTO auth_item (name, type, description, rule_name, data, created_at, updated_at) VALUES ('admin', 1, 'Admin', NULL, NULL, NULL, NULL);
INSERT INTO auth_item (name, type, description, rule_name, data, created_at, updated_at) VALUES ('create-aggregators', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO auth_item (name, type, description, rule_name, data, created_at, updated_at) VALUES ('create-insurance', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO auth_item (name, type, description, rule_name, data, created_at, updated_at) VALUES ('create-policies', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO auth_item (name, type, description, rule_name, data, created_at, updated_at) VALUES ('ura-reg', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO auth_item (name, type, description, rule_name, data, created_at, updated_at) VALUES ('view-aggregators', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO auth_item (name, type, description, rule_name, data, created_at, updated_at) VALUES ('view-payments', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO auth_item (name, type, description, rule_name, data, created_at, updated_at) VALUES ('view-policies', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO auth_item (name, type, description, rule_name, data, created_at, updated_at) VALUES ('stamp_duty', 2, '', NULL, NULL, 1438331075, 1438331075);


--
-- Data for Name: auth_item_child; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO auth_item_child (parent, child) VALUES ('admin', 'insurance_user');
INSERT INTO auth_item_child (parent, child) VALUES ('admin', 'ura_user');
INSERT INTO auth_item_child (parent, child) VALUES ('admin', 'ira_user');
INSERT INTO auth_item_child (parent, child) VALUES ('insurance_user', 'create-insurance');
INSERT INTO auth_item_child (parent, child) VALUES ('insurance_user', 'view-payments');


--
-- Data for Name: auth_rule; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: bulk_upload_files; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO bulk_upload_files (id, description, upload_date, validation_date, process_date, is_validated, is_processed, validation_succeded, process_succeeded, validation_comment, process_comment, created_by, insurance_company, file_hash) VALUES (5, 'bulk_policy_upload_template.xlsx', '2014-10-12 18:22:30.901', NULL, '2015-02-24 19:37:29.739', true, true, false, false, 'VALIDATED OK', 'ALL RECORDS PROCESSED', 9, 2, 'hash2');
INSERT INTO bulk_upload_files (id, description, upload_date, validation_date, process_date, is_validated, is_processed, validation_succeded, process_succeeded, validation_comment, process_comment, created_by, insurance_company, file_hash) VALUES (7, 'bulk_policy_upload_template.xlsx', '2015-01-15 20:57:44.51', NULL, '2015-02-24 19:37:09.677', true, true, false, false, 'VALIDATED OK', 'ALL RECORDS PROCESSED', 5, 1, 'hash 1');
INSERT INTO bulk_upload_files (id, description, upload_date, validation_date, process_date, is_validated, is_processed, validation_succeded, process_succeeded, validation_comment, process_comment, created_by, insurance_company, file_hash) VALUES (8, 'bulk_policy_upload_template.xlsx', '2015-02-24 20:13:42.266', NULL, '2015-02-24 20:14:09.778', true, true, false, false, 'VALIDATED OK', 'ALL RECORDS PROCESSED', 9, 2, 'hash3');
INSERT INTO bulk_upload_files (id, description, upload_date, validation_date, process_date, is_validated, is_processed, validation_succeded, process_succeeded, validation_comment, process_comment, created_by, insurance_company, file_hash) VALUES (13, 'bulk_policy_upload_template.xlsx', '2015-02-24 20:22:52.816', NULL, '2015-02-24 20:23:28.064', true, true, false, false, 'VALIDATED OK', 'ALL RECORDS PROCESSED', 9, 2, '965b92ac77f8d928a8f2fed817595ddf');


--
-- Name: bulk_upload_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bulk_upload_files_id_seq', 13, false);


--
-- Data for Name: bulk_upload_records; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO bulk_upload_records (id, file_id, reg_no, payer_phone, payer_email, policy_number, policy_start_date, policy_end_date, assessment_amount, processed, process_comment) VALUES (1, 5, 'UAP833G', '256776883242', 'test@gmail.com', 'Pi234i234u2342', '2014-10-01', '2015-10-01', 79500, true, NULL);
INSERT INTO bulk_upload_records (id, file_id, reg_no, payer_phone, payer_email, policy_number, policy_start_date, policy_end_date, assessment_amount, processed, process_comment) VALUES (2, 5, 'UAS340C', '256774525252', 'test2@gmail.com', 'Ps2342834239346', '2014-09-01', '2015-09-01', 75500, true, NULL);
INSERT INTO bulk_upload_records (id, file_id, reg_no, payer_phone, payer_email, policy_number, policy_start_date, policy_end_date, assessment_amount, processed, process_comment) VALUES (3, 7, 'UAP833G', '256776883242', 'test@gmail.com', 'Pi234i234u2342', '2014-10-01', '2015-10-01', 80000, true, NULL);
INSERT INTO bulk_upload_records (id, file_id, reg_no, payer_phone, payer_email, policy_number, policy_start_date, policy_end_date, assessment_amount, processed, process_comment) VALUES (4, 7, 'UAS340C', '256774525252', 'test2@gmail.com', 'Ps2342834239346', '2014-09-01', '2015-09-01', 84500, true, NULL);
INSERT INTO bulk_upload_records (id, file_id, reg_no, payer_phone, payer_email, policy_number, policy_start_date, policy_end_date, assessment_amount, processed, process_comment) VALUES (5, 8, 'UAP833G', '256776883242', 'test@gmail.com', 'Pi234i234u2342', '2014-10-01', '2015-10-01', 82000, true, NULL);
INSERT INTO bulk_upload_records (id, file_id, reg_no, payer_phone, payer_email, policy_number, policy_start_date, policy_end_date, assessment_amount, processed, process_comment) VALUES (6, 8, 'UAS340C', '256774525252', 'test2@gmail.com', 'Ps2342834239346', '2014-09-01', '2015-09-01', 88500, true, NULL);
INSERT INTO bulk_upload_records (id, file_id, reg_no, payer_phone, payer_email, policy_number, policy_start_date, policy_end_date, assessment_amount, processed, process_comment) VALUES (7, 13, 'UAP833G', '256776883242', 'test@gmail.com', 'Pi234i234u2342', '2014-10-01', '2015-10-01', 88500, true, NULL);
INSERT INTO bulk_upload_records (id, file_id, reg_no, payer_phone, payer_email, policy_number, policy_start_date, policy_end_date, assessment_amount, processed, process_comment) VALUES (8, 13, 'UAS340C', '256774525252', 'test2@gmail.com', 'Ps2342834239346', '2014-09-01', '2015-09-01', 75000, true, NULL);


--
-- Name: bulk_upload_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bulk_upload_records_id_seq', 8, false);


--
-- Data for Name: console_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: console_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('console_user_groups_id_seq', 1, false);


--
-- Data for Name: console_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO console_users (id, username, fullname, mobile_number, email_address, incorrect_access_count, password, date_created, locked, user_level, parent_insurance_company, user_permissions, password_reset_token, auth_key, updated_at) VALUES (7, 'test', 'Test User', '256704008821', 'mikhasi@gmail.com', 0, 'fsXVTkf3EsWvFutCFZkU6A==', '2014-01-30 15:45:50.275941', NULL, 'URA', NULL, NULL, NULL, NULL, NULL);
INSERT INTO console_users (id, username, fullname, mobile_number, email_address, incorrect_access_count, password, date_created, locked, user_level, parent_insurance_company, user_permissions, password_reset_token, auth_key, updated_at) VALUES (8, 'jndiho', 'Joseph Ndiho', '256712500031', 'j.ndiho@gmail.com', 0, 'fsXVTkf3EsWvFutCFZkU6A==', '2014-01-30 15:48:07.928237', false, 'NEON', NULL, NULL, NULL, NULL, NULL);
INSERT INTO console_users (id, username, fullname, mobile_number, email_address, incorrect_access_count, password, date_created, locked, user_level, parent_insurance_company, user_permissions, password_reset_token, auth_key, updated_at) VALUES (9, 'uap', 'Uap User', '256714108344', 'johnmark@servicecops.com', 0, 'fsXVTkf3EsWvFutCFZkU6A==', '2014-08-06 11:53:38.462267', NULL, 'INSU_COMP_USER', 2, NULL, NULL, NULL, NULL);
INSERT INTO console_users (id, username, fullname, mobile_number, email_address, incorrect_access_count, password, date_created, locked, user_level, parent_insurance_company, user_permissions, password_reset_token, auth_key, updated_at) VALUES (10, 'winniefred', 'John Luyima', '256704008821', 'mikhasi@gmail.com', 0, 'fsXVTkf3EsWvFutCFZkU6A==', '2014-08-11 19:26:35.01', false, 'INSU_COMP_USER', 4, NULL, NULL, NULL, NULL);
INSERT INTO console_users (id, username, fullname, mobile_number, email_address, incorrect_access_count, password, date_created, locked, user_level, parent_insurance_company, user_permissions, password_reset_token, auth_key, updated_at) VALUES (11, 'kenjie', 'Kenjura Luyima', '256776565656', 'kenjura@nic.ug', 0, 'BHliqvCDtO2CfESG/CUGbQ==', '2014-08-17 23:32:17.139', false, 'INSU_COMP_USER', 5, NULL, NULL, NULL, NULL);
INSERT INTO console_users (id, username, fullname, mobile_number, email_address, incorrect_access_count, password, date_created, locked, user_level, parent_insurance_company, user_permissions, password_reset_token, auth_key, updated_at) VALUES (12, 'jubilee', 'Jubilee System User', '256788888888', 'test@jubilee.com', 0, 'fsXVTkf3EsWvFutCFZkU6A==', '2014-09-05 00:06:50.264', false, 'INSU_COMP_USER', 1, NULL, NULL, NULL, NULL);
INSERT INTO console_users (id, username, fullname, mobile_number, email_address, incorrect_access_count, password, date_created, locked, user_level, parent_insurance_company, user_permissions, password_reset_token, auth_key, updated_at) VALUES (13, 'uap2', 'Uap Console User 2', '256777777777', 'mikhasi@gmail.com', 0, 'fsXVTkf3EsWvFutCFZkU6A==', '2014-10-02 09:35:37.984', false, 'INSU_COMP_USER', 2, NULL, NULL, NULL, NULL);
INSERT INTO console_users (id, username, fullname, mobile_number, email_address, incorrect_access_count, password, date_created, locked, user_level, parent_insurance_company, user_permissions, password_reset_token, auth_key, updated_at) VALUES (31, 'iraUser', 'User fromUra', '92399028932083', 'iraUser@ira.ug', 0, '$2y$13$HOxA2Sl4CmGBh24Gt5nDOehU3YM32DhaK2SvF41BykIgFsikHQVO6', '2015-07-30 09:58:49.512242', false, 'insurance_user', 2, NULL, NULL, NULL, '2015-07-30 16:03:27.576982');
INSERT INTO console_users (id, username, fullname, mobile_number, email_address, incorrect_access_count, password, date_created, locked, user_level, parent_insurance_company, user_permissions, password_reset_token, auth_key, updated_at) VALUES (17, 'ibrahimk', 'kitagenda ibrahim', '090892839', 'ibrahim@yahoo.com', 2, '$2y$13$32izGvnqVKjPk2GYM6uclOjYKtjVSFRNImuByjsLm5CsjJnwwUB2K', '2015-07-28 11:12:53.825595', false, 'ura_user', NULL, NULL, NULL, 'ULiKPVfljGLRldBrzy_k3u0JvN2PfbR9', '2015-07-31 09:40:29.906587');
INSERT INTO console_users (id, username, fullname, mobile_number, email_address, incorrect_access_count, password, date_created, locked, user_level, parent_insurance_company, user_permissions, password_reset_token, auth_key, updated_at) VALUES (5, 'johnmark2', 'John Mark Luyima', '256704008824', 'johnlu@grameenfoundation.org', 0, '$2y$13$EciBojYRe6ck8Zv8gSAKjegQO8KadZXOkhVvjdPJlT6SUFUd1At.O', '2013-11-12 18:32:52.38', false, 'admin', 1, NULL, NULL, NULL, '2015-07-30 14:53:29.29878');
INSERT INTO console_users (id, username, fullname, mobile_number, email_address, incorrect_access_count, password, date_created, locked, user_level, parent_insurance_company, user_permissions, password_reset_token, auth_key, updated_at) VALUES (32, 'uraUser', 'Ura User', '7382837823', 'email@ura.com', 4, '$2y$13$BxL9/TSn1g7ye.hrgprm4u/GaQi3uMzjT2fNK5y.c1vwdZRln/oKm', '2015-07-30 14:10:12.147511', false, 'ura_user', NULL, NULL, NULL, NULL, '2015-08-01 22:42:25.361226');
INSERT INTO console_users (id, username, fullname, mobile_number, email_address, incorrect_access_count, password, date_created, locked, user_level, parent_insurance_company, user_permissions, password_reset_token, auth_key, updated_at) VALUES (18, 'admin', 'Administrator', '8732923993', 'email@admin.com', 5, '$2y$13$PVjuYS6voTxmC75SyeVBqesdVjPdapwwx/vNAip7bqIUy5ZWVtSCS', '2015-07-29 13:41:24.973926', false, 'admin', NULL, NULL, NULL, NULL, '2015-08-02 12:48:55.976784');


--
-- Data for Name: inbox; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO inbox (id, sender, recipient, date_received, message_text, read, recipient_type) VALUES (2, '256704008821', 'NEON', '2014-08-29 19:46:10.338', 'I didnth teveivr
mtg commanding', false, 'NEON');
INSERT INTO inbox (id, sender, recipient, date_received, message_text, read, recipient_type) VALUES (3, '256704008821', '2', '2014-08-29 19:48:27.375', 'hello

please note ythay srvucrs arrived undysvke


please rctudgg

', false, 'INSURANCE_COMPANY');
INSERT INTO inbox (id, sender, recipient, date_received, message_text, read, recipient_type) VALUES (4, '256704008821', 'NEON', '2014-09-03 23:30:06.509', 'hfddd', false, 'NEON');
INSERT INTO inbox (id, sender, recipient, date_received, message_text, read, recipient_type) VALUES (1, '256704008821', '2', '2014-08-28 15:19:20.347', 'Pleaes check for me how much commission i have', true, 'INSURANCE_COMPANY');


--
-- Name: inbox_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('inbox_id_seq', 4, false);


--
-- Data for Name: insurance_companies; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO insurance_companies (id, code, description, address, email_address) VALUES (3, 'EXCEL', 'Excel Insurance', '', 'excel@insurance.com');
INSERT INTO insurance_companies (id, code, description, address, email_address) VALUES (5, 'NIC', 'National Insurance Company', '', 'national@gmail.com');
INSERT INTO insurance_companies (id, code, description, address, email_address) VALUES (1, 'JUBILEE', 'Jubilee Insurance Uganda', 'kimathi Avenue', 'info@jubilee.com');
INSERT INTO insurance_companies (id, code, description, address, email_address) VALUES (2, 'UAP', 'UAP INSURANCE', 'kimathi Avenue', 'info@uap.co.ug');
INSERT INTO insurance_companies (id, code, description, address, email_address) VALUES (4, 'NIKO', 'NIKO INSURANCE', 'some address', 'email@nico.ug');


--
-- Name: insurance_companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('insurance_companies_id_seq', 10, true);


--
-- Data for Name: insurance_payments_initiations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO insurance_payments_initiations (id, transaction_id, vehicle_reference, processed_date, amount, payer_mobile, policy_number, vehicle_description, payer_email, payer_name, status, insurance_company_profile, initiated_by, approved_by, date_approved, policy_start_date, policy_end_date) VALUES (12, '13', 'UAV719J', '2014-10-12 19:25:24', 77500, '256777777777', '', NULL, '', 'John Luyima', 'INITIATED', 2, 9, NULL, NULL, '2014-10-01', '2015-10-28');
INSERT INTO insurance_payments_initiations (id, transaction_id, vehicle_reference, processed_date, amount, payer_mobile, policy_number, vehicle_description, payer_email, payer_name, status, insurance_company_profile, initiated_by, approved_by, date_approved, policy_start_date, policy_end_date) VALUES (179, '180', 'UAP833G', '2015-02-24 19:37:08', 79500, '256776883242', 'Pi234i234u2342', NULL, 'test@gmail.com', '', 'APPROVED', 2, 0, 9, '2015-02-24 19:37:08', '2014-10-01', '2015-10-01');
INSERT INTO insurance_payments_initiations (id, transaction_id, vehicle_reference, processed_date, amount, payer_mobile, policy_number, vehicle_description, payer_email, payer_name, status, insurance_company_profile, initiated_by, approved_by, date_approved, policy_start_date, policy_end_date) VALUES (180, '181', 'UAS340C', '2015-02-24 19:37:09', 75500, '256774525252', 'Ps2342834239346', NULL, 'test2@gmail.com', '', 'APPROVED', 2, 0, 9, '2015-02-24 19:37:09', '2014-09-01', '2015-09-01');
INSERT INTO insurance_payments_initiations (id, transaction_id, vehicle_reference, processed_date, amount, payer_mobile, policy_number, vehicle_description, payer_email, payer_name, status, insurance_company_profile, initiated_by, approved_by, date_approved, policy_start_date, policy_end_date) VALUES (181, '182', 'UAP833G', '2015-02-24 20:13:49', 82000, '256776883242', 'Pi234i234u2342', NULL, 'test@gmail.com', '', 'APPROVED', 2, 0, 9, '2015-02-24 20:13:49', '2014-10-01', '2015-10-01');
INSERT INTO insurance_payments_initiations (id, transaction_id, vehicle_reference, processed_date, amount, payer_mobile, policy_number, vehicle_description, payer_email, payer_name, status, insurance_company_profile, initiated_by, approved_by, date_approved, policy_start_date, policy_end_date) VALUES (182, '183', 'UAS340C', '2015-02-24 20:13:49', 88500, '256774525252', 'Ps2342834239346', NULL, 'test2@gmail.com', '', 'APPROVED', 2, 0, 9, '2015-02-24 20:13:49', '2014-09-01', '2015-09-01');
INSERT INTO insurance_payments_initiations (id, transaction_id, vehicle_reference, processed_date, amount, payer_mobile, policy_number, vehicle_description, payer_email, payer_name, status, insurance_company_profile, initiated_by, approved_by, date_approved, policy_start_date, policy_end_date) VALUES (183, '184', 'UAP833G', '2015-02-24 20:23:07', 88500, '256776883242', 'Pi234i234u2342', NULL, 'test@gmail.com', '', 'APPROVED', 2, 0, 9, '2015-02-24 20:23:07', '2014-10-01', '2015-10-01');
INSERT INTO insurance_payments_initiations (id, transaction_id, vehicle_reference, processed_date, amount, payer_mobile, policy_number, vehicle_description, payer_email, payer_name, status, insurance_company_profile, initiated_by, approved_by, date_approved, policy_start_date, policy_end_date) VALUES (184, '185', 'UAS340C', '2015-02-24 20:23:07', 75000, '256774525252', 'Ps2342834239346', NULL, 'test2@gmail.com', '', 'APPROVED', 2, 0, 9, '2015-02-24 20:23:08', '2014-09-01', '2015-09-01');


--
-- Name: insurance_payments_initiations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('insurance_payments_initiations_id_seq', 184, false);


--
-- Name: manual_trans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('manual_trans_id_seq', 185, false);


--
-- Data for Name: menu_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO menu_items (menu_item_id, menu_item_description, menu_id, next_type, next_id, is_leaf, item_order, status, application_id, data_template, continue_data_template) VALUES (544, 'Query Sticker Details', 109, 'PROMPT', 1465, false, 1, 'ACTIVE', NULL, NULL, NULL);
INSERT INTO menu_items (menu_item_id, menu_item_description, menu_id, next_type, next_id, is_leaf, item_order, status, application_id, data_template, continue_data_template) VALUES (545, 'Change PIN', 109, 'PROMPT', 1468, false, 3, 'ACTIVE', NULL, NULL, NULL);
INSERT INTO menu_items (menu_item_id, menu_item_description, menu_id, next_type, next_id, is_leaf, item_order, status, application_id, data_template, continue_data_template) VALUES (546, 'Print Sticker', 109, 'PROMPT', 1473, false, 2, 'ACTIVE', NULL, NULL, NULL);
INSERT INTO menu_items (menu_item_id, menu_item_description, menu_id, next_type, next_id, is_leaf, item_order, status, application_id, data_template, continue_data_template) VALUES (547, 'Change PIN', 110, 'PROMPT', 1476, false, 1, 'ACTIVE', NULL, NULL, NULL);
INSERT INTO menu_items (menu_item_id, menu_item_description, menu_id, next_type, next_id, is_leaf, item_order, status, application_id, data_template, continue_data_template) VALUES (548, 'Send Money', 111, NULL, NULL, false, 1, 'ACTIVE', NULL, NULL, NULL);
INSERT INTO menu_items (menu_item_id, menu_item_description, menu_id, next_type, next_id, is_leaf, item_order, status, application_id, data_template, continue_data_template) VALUES (549, 'Withdraw Money', 111, NULL, NULL, false, 2, 'ACTIVE', NULL, NULL, NULL);
INSERT INTO menu_items (menu_item_id, menu_item_description, menu_id, next_type, next_id, is_leaf, item_order, status, application_id, data_template, continue_data_template) VALUES (550, 'Buy Airtime', 111, NULL, NULL, false, 3, 'ACTIVE', NULL, NULL, NULL);
INSERT INTO menu_items (menu_item_id, menu_item_description, menu_id, next_type, next_id, is_leaf, item_order, status, application_id, data_template, continue_data_template) VALUES (551, 'My Account', 111, NULL, NULL, false, 4, 'ACTIVE', NULL, NULL, NULL);
INSERT INTO menu_items (menu_item_id, menu_item_description, menu_id, next_type, next_id, is_leaf, item_order, status, application_id, data_template, continue_data_template) VALUES (552, 'Pay DSTV', 112, NULL, NULL, false, 1, 'ACTIVE', NULL, NULL, NULL);
INSERT INTO menu_items (menu_item_id, menu_item_description, menu_id, next_type, next_id, is_leaf, item_order, status, application_id, data_template, continue_data_template) VALUES (553, 'Pay NWSC', 112, NULL, NULL, false, 2, 'ACTIVE', NULL, NULL, NULL);
INSERT INTO menu_items (menu_item_id, menu_item_description, menu_id, next_type, next_id, is_leaf, item_order, status, application_id, data_template, continue_data_template) VALUES (554, 'Motor Third Party', 112, 'PROMPT', 1477, false, 3, 'ACTIVE', NULL, NULL, NULL);
INSERT INTO menu_items (menu_item_id, menu_item_description, menu_id, next_type, next_id, is_leaf, item_order, status, application_id, data_template, continue_data_template) VALUES (555, 'Payments', 111, 'MENU', 112, false, 5, 'ACTIVE', NULL, NULL, NULL);


--
-- Name: menu_items_menu_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('menu_items_menu_item_id_seq', 555, false);


--
-- Data for Name: menu_mappings; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO menu_mappings (obo_menu_id, local_menu_id, local_menu_type) VALUES ('MM', '111', 'MENU');
INSERT INTO menu_mappings (obo_menu_id, local_menu_id, local_menu_type) VALUES ('PINCHANGE', '110', 'MENU');
INSERT INTO menu_mappings (obo_menu_id, local_menu_id, local_menu_type) VALUES ('PRINTER', '109', 'MENU');


--
-- Data for Name: menus; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO menus (menu_id, menu_description, menu_header) VALUES (109, 'Insurance Printer Main Menu', 'Main Menu');
INSERT INTO menus (menu_id, menu_description, menu_header) VALUES (110, 'Pin change required Menu', 'You need to change your PIN');
INSERT INTO menus (menu_id, menu_description, menu_header) VALUES (111, 'M-Sente Simulation Menu', 'Main Menu');
INSERT INTO menus (menu_id, menu_description, menu_header) VALUES (112, 'M-Sente Sim Payments Menu', 'Payments');


--
-- Name: menus_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('menus_menu_id_seq', 112, false);


--
-- Data for Name: message_outbox; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO message_outbox (id, message_text, time_generated, time_sent, recipient_number, message_status, flash_message, email_message, email_subject, email_attachment) VALUES (13954, 'Thirdparty Sticker 2119 printed
Reg No: UAP833G
printed by:Uap User
insu. company:UAP INSURANCE
Policy Number:Pi234i234u2342
24/Feb/2015 20:23', '2015-02-24 20:23:07.927', NULL, '256776883242', 'PENDING', false, false, '', '');
INSERT INTO message_outbox (id, message_text, time_generated, time_sent, recipient_number, message_status, flash_message, email_message, email_subject, email_attachment) VALUES (13955, 'Thirdparty Sticker 2120 printed
Reg No: UAS340C
printed by:Uap User
insu. company:UAP INSURANCE
Policy Number:Ps2342834239346
24/Feb/2015 20:23', '2015-02-24 20:23:08.027', NULL, '256774525252', 'PENDING', false, false, '', '');


--
-- Name: message_outbox_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('message_outbox_id_seq', 13955, false);


--
-- Data for Name: message_templates; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO message_templates (id, message_template) VALUES ('AGGREGATOR_ADDED_EMAIL_TEMPLATE', 'Dear #AGGREGATOR_NAME#,
You have been created on the #APPLICATION_NAME# payment aggregation interface. 
You can proceed to process new payments through this interface.
Web service URL is  #SERVICE_URL# .
Your credential are as below
Access Code: #ACCESS_CODE#
Password: #PASSWORD#

');
INSERT INTO message_templates (id, message_template) VALUES ('CONSOLE_USER_ADDED_EMAIL_TEMPLATE', 'Dear #FULLNAME#,
You have been created on the #APPLICATION_NAME# web console.
To login go to #WEB_URL# .
Your credential are as below
Username: #USERNAME#
Password: #PASSWORD#

');
INSERT INTO message_templates (id, message_template) VALUES ('CONSOLE_USER_PASSWORD_RESET_TEMPLATE', 'Dear #NAME#,

Your web console password has been reset to #NEW_PASSWORD#,

To login, goto #WEB_URL#

');
INSERT INTO message_templates (id, message_template) VALUES ('CUSTOMER_STICKER_PRINTED_TEMPLATE', 'Thirdparty Sticker #STICKER# printed
Reg No: #REGNO#
printed by:#OPERATOR#
insu. company:#INSURANCE_COMPANY#
Policy Number:#POLICY_NUMBER#
#DATE#');
INSERT INTO message_templates (id, message_template) VALUES ('MOBILE_USER_ADDED_TEMPLATE', 'Dear #NAME#,
You''ve been created on the Motor Thirdparty App.
Your PIN is #PIN#.
To Access Dial #USSDCODE#');
INSERT INTO message_templates (id, message_template) VALUES ('OPERATOR_STICKER_PRINTED_TEMPLATE', 'You''ve printed Sticker with reference #STICKER#
for Reg No: #REGNO#
Policy number: #POLICY_NUMBER#
#DATE#
Thank you.');
INSERT INTO message_templates (id, message_template) VALUES ('PAYMENT_RECEIVED_TEMPLATE', 'Thirdparty Insurance Payment Received
UGX #AMOUNT#
Reg No: #REGNO#
Sticker Ref: #STICKER#
Received on #DATE#
Visit your nearest agent get a printout.');
INSERT INTO message_templates (id, message_template) VALUES ('PIN_RESET_TEMPLATE', 'You PIN has been reset to #NEWPIN#
To change the pin, dial #USSDCODE#');


--
-- Data for Name: mobile_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO mobile_users (id, phone_number, pin, name, date_created, locked, type, incorrect_access_count, pin_change_flag, parent_insurance_company, auth_imsi, auth_imei, activation_code) VALUES (5732, '256776000954', 'Zm0GbrUMdXZFNG1bpEigJQ==', 'John Mark Luyima', '2014-01-30 15:41:04.247377', false, 'MM', 0, true, NULL, NULL, NULL, NULL);
INSERT INTO mobile_users (id, phone_number, pin, name, date_created, locked, type, incorrect_access_count, pin_change_flag, parent_insurance_company, auth_imsi, auth_imei, activation_code) VALUES (5733, '256776500031', 'K+eEBmCZNsS1vf4WwcRv6A==', 'Ndiho Joseph', '2014-01-30 15:54:45.039083', false, 'PRINTER', 0, false, 1, '641110101088298', '356422050612338', '3414');
INSERT INTO mobile_users (id, phone_number, pin, name, date_created, locked, type, incorrect_access_count, pin_change_flag, parent_insurance_company, auth_imsi, auth_imei, activation_code) VALUES (5734, '256772689197', '4SvxLidpPpn9/cnH3HlQ7w==', 'Mathias K', '2014-01-30 15:55:28.777949', false, 'PRINTER', 0, true, 2, NULL, NULL, NULL);
INSERT INTO mobile_users (id, phone_number, pin, name, date_created, locked, type, incorrect_access_count, pin_change_flag, parent_insurance_company, auth_imsi, auth_imei, activation_code) VALUES (5736, '256782020165', '9pCrz28qoe4vJjtaii3oMQ==', 'Test User 2', '2014-01-30 15:59:00.332598', false, 'PRINTER', 0, true, 4, NULL, NULL, NULL);
INSERT INTO mobile_users (id, phone_number, pin, name, date_created, locked, type, incorrect_access_count, pin_change_flag, parent_insurance_company, auth_imsi, auth_imei, activation_code) VALUES (5737, '256772592799', 'LEvG6FrrCeZ3y2NTQ8UAiQ==', 'Test User 1', '2014-01-30 15:59:41.921584', NULL, 'MM', 0, true, NULL, NULL, NULL, NULL);
INSERT INTO mobile_users (id, phone_number, pin, name, date_created, locked, type, incorrect_access_count, pin_change_flag, parent_insurance_company, auth_imsi, auth_imei, activation_code) VALUES (5738, '256392613579', 'sIbp0OUVmgttcjs1I2wouQ==', 'Test User 3', '2014-02-03 10:28:09.052794', true, 'PRINTER', 0, true, 2, NULL, NULL, NULL);
INSERT INTO mobile_users (id, phone_number, pin, name, date_created, locked, type, incorrect_access_count, pin_change_flag, parent_insurance_company, auth_imsi, auth_imei, activation_code) VALUES (5739, '256783143670', '8v6n/c7hxuD4/8FdmjeV6Q==', 'Test User 4', '2014-02-03 10:28:36.63909', NULL, 'PRINTER', 0, true, 4, NULL, NULL, NULL);
INSERT INTO mobile_users (id, phone_number, pin, name, date_created, locked, type, incorrect_access_count, pin_change_flag, parent_insurance_company, auth_imsi, auth_imei, activation_code) VALUES (5740, '256772833261', 'nIBcCtyFYQ9q0HxsUS3YsA==', 'David Mushabe', '2014-02-08 15:39:23.212329', NULL, 'MM', 0, false, NULL, NULL, NULL, NULL);
INSERT INTO mobile_users (id, phone_number, pin, name, date_created, locked, type, incorrect_access_count, pin_change_flag, parent_insurance_company, auth_imsi, auth_imei, activation_code) VALUES (5741, '256704008821', '8DkVzjfy4Exp9oGHzVu9TQ==', 'John Mark Luyima', '2014-08-04 14:32:50.221217', false, 'PRINTER', 0, false, 2, '641110101088298', '356422050612338', NULL);
INSERT INTO mobile_users (id, phone_number, pin, name, date_created, locked, type, incorrect_access_count, pin_change_flag, parent_insurance_company, auth_imsi, auth_imei, activation_code) VALUES (5742, '256782957021', '7TJUJ6Ilf/dlBXdFGBILxQ==', 'Gary Gibson Kasekende B', '2014-08-06 09:19:54.67434', false, 'PRINTER', 0, true, 1, NULL, NULL, '2714');
INSERT INTO mobile_users (id, phone_number, pin, name, date_created, locked, type, incorrect_access_count, pin_change_flag, parent_insurance_company, auth_imsi, auth_imei, activation_code) VALUES (5743, '256773552233', 'arlA4VeT72ZI11Se4OuIWg==', 'Ernest', '2014-08-06 09:21:18.456931', false, 'PRINTER', 0, true, 2, NULL, NULL, NULL);
INSERT INTO mobile_users (id, phone_number, pin, name, date_created, locked, type, incorrect_access_count, pin_change_flag, parent_insurance_company, auth_imsi, auth_imei, activation_code) VALUES (5744, '256701613606', 'ebCo3gdkc7niitCqQvDhzA==', 'Ernest Airtel', '2014-08-06 09:27:40.72396', false, 'PRINTER', 0, false, 1, NULL, NULL, NULL);
INSERT INTO mobile_users (id, phone_number, pin, name, date_created, locked, type, incorrect_access_count, pin_change_flag, parent_insurance_company, auth_imsi, auth_imei, activation_code) VALUES (5745, '256782779275', 'F9X3lJuPUL4O5Ur3n7lK7Q==', 'Setty', '2014-08-06 09:32:24.433809', NULL, 'PRINTER', 0, false, 1, NULL, NULL, NULL);
INSERT INTO mobile_users (id, phone_number, pin, name, date_created, locked, type, incorrect_access_count, pin_change_flag, parent_insurance_company, auth_imsi, auth_imei, activation_code) VALUES (5748, '256704008822', 'UgGlBar7IrdyUy+Rb4HT/Q==', 'Sharrot Atuhaire', '2014-08-09 05:08:47.532', true, 'PRINTER', 3, true, 3, '641110101088298', '356422050612338', NULL);
INSERT INTO mobile_users (id, phone_number, pin, name, date_created, locked, type, incorrect_access_count, pin_change_flag, parent_insurance_company, auth_imsi, auth_imei, activation_code) VALUES (5749, '256704008825', 's/pcxNg3HP1BRE9T/LpaUA==', 'Test User', '2014-08-13 19:01:07.639', NULL, 'MM', 0, true, NULL, NULL, NULL, NULL);
INSERT INTO mobile_users (id, phone_number, pin, name, date_created, locked, type, incorrect_access_count, pin_change_flag, parent_insurance_company, auth_imsi, auth_imei, activation_code) VALUES (5750, '256704008832', 'qeGCe8t2q6v52tzY2EtadA==', 'Kenjie Love', '2014-08-16 23:40:25.641', NULL, 'PRINTER', 0, true, 2, NULL, NULL, NULL);
INSERT INTO mobile_users (id, phone_number, pin, name, date_created, locked, type, incorrect_access_count, pin_change_flag, parent_insurance_company, auth_imsi, auth_imei, activation_code) VALUES (5751, '256714108355', 'JlAlEwOLfAwzrCDKJjx8DA==', 'Kiyan Mulungi Luyima', '2014-08-31 20:33:16.424', false, 'PRINTER', 0, true, 2, NULL, NULL, NULL);


--
-- Name: mobile_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('mobile_users_id_seq', 5751, false);


--
-- Data for Name: motor_entity_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO motor_entity_details (id, registration_number, registration_name, registration_date, date_created, engine_capacity, memo, model, type, gross_weight, seating_capacity, purpose, engine_number, colour, make, tyre_size, year_of_manufacture, chassis_number, tin) VALUES (2, 'UAV719J', 'John Luyima', '2014-09-01 19:53:42', '2014-08-18 11:48:44.191', '2.2', 'John Lu', 'Toyota Harrier 19999', 'SUV', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '');
INSERT INTO motor_entity_details (id, registration_number, registration_name, registration_date, date_created, engine_capacity, memo, model, type, gross_weight, seating_capacity, purpose, engine_number, colour, make, tyre_size, year_of_manufacture, chassis_number, tin) VALUES (3, 'UAP833G', 'Edwin Kiconco', '2013-01-16 00:00:00', '2014-08-18 11:56:47.169', '1.8', 'Edwin Ki', 'Toyota RAV 4 1998', 'SUV', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '');


--
-- Name: motor_entity_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('motor_entity_details_id_seq', 3, false);


--
-- Data for Name: paid_issued_stickers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO paid_issued_stickers (id, print_code, date_created, payment_id, expiry_date, vehicle_paid_for, printed, printed_by, date_printed, printer_insurance_company, physical_sticker_serial) VALUES (27, '2036', '2014-01-30 16:20:44.233758', 34, '2015-01-30 16:20:44.233758', 'UAS340K', false, NULL, NULL, NULL, NULL);
INSERT INTO paid_issued_stickers (id, print_code, date_created, payment_id, expiry_date, vehicle_paid_for, printed, printed_by, date_printed, printer_insurance_company, physical_sticker_serial) VALUES (28, '2037', '2014-01-31 13:20:41.974051', 35, '2015-01-31 13:20:41.974051', 'UAQ206S', true, '256704008821', '2014-08-20 18:52:24.126', 4, NULL);
INSERT INTO paid_issued_stickers (id, print_code, date_created, payment_id, expiry_date, vehicle_paid_for, printed, printed_by, date_printed, printer_insurance_company, physical_sticker_serial) VALUES (29, '2038', '2014-02-08 15:42:26.331762', 36, '2015-02-08 15:42:26.331762', 'UAP955E', false, NULL, NULL, NULL, NULL);
INSERT INTO paid_issued_stickers (id, print_code, date_created, payment_id, expiry_date, vehicle_paid_for, printed, printed_by, date_printed, printer_insurance_company, physical_sticker_serial) VALUES (30, '2039', '2014-02-10 09:22:58.089409', 37, '2015-02-10 09:22:58.089409', 'UAF229H', false, '256704008821', '2014-09-30 19:41:05.784', 2, NULL);
INSERT INTO paid_issued_stickers (id, print_code, date_created, payment_id, expiry_date, vehicle_paid_for, printed, printed_by, date_printed, printer_insurance_company, physical_sticker_serial) VALUES (31, '2040', '2014-02-10 09:25:18.371575', 38, '2015-02-10 09:25:18.371575', 'UAA333B', true, '256704008821', '2014-08-24 20:11:29.299', 2, NULL);
INSERT INTO paid_issued_stickers (id, print_code, date_created, payment_id, expiry_date, vehicle_paid_for, printed, printed_by, date_printed, printer_insurance_company, physical_sticker_serial) VALUES (32, '2041', '2014-08-04 14:36:39.069555', 39, '2015-08-04 14:36:39.069555', 'UAP555H', true, '256704008821', '2014-08-23 13:10:12.876', 4, NULL);
INSERT INTO paid_issued_stickers (id, print_code, date_created, payment_id, expiry_date, vehicle_paid_for, printed, printed_by, date_printed, printer_insurance_company, physical_sticker_serial) VALUES (33, '2042', '2014-08-05 17:42:00.269277', 40, '2015-10-05 12:35:01.176', 'UAV520J', false, '256704008821', '2014-10-05 12:35:01.176', 2, '02168768748684');
INSERT INTO paid_issued_stickers (id, print_code, date_created, payment_id, expiry_date, vehicle_paid_for, printed, printed_by, date_printed, printer_insurance_company, physical_sticker_serial) VALUES (34, '2043', '2014-08-06 09:25:40.055118', 41, '2015-08-06 09:25:40.055118', 'USA987Q', true, '256704008822', '2014-08-23 13:53:10.722', 3, NULL);
INSERT INTO paid_issued_stickers (id, print_code, date_created, payment_id, expiry_date, vehicle_paid_for, printed, printed_by, date_printed, printer_insurance_company, physical_sticker_serial) VALUES (35, '2048', '2014-09-07 14:46:39.49', 46, '2015-09-07 00:00:00', 'UAV719J', true, NULL, '2014-09-07 20:03:06', 1, NULL);
INSERT INTO paid_issued_stickers (id, print_code, date_created, payment_id, expiry_date, vehicle_paid_for, printed, printed_by, date_printed, printer_insurance_company, physical_sticker_serial) VALUES (36, '2051', '2014-09-07 20:05:12.951', 49, '2015-08-01 00:00:00', 'UAP833G', true, NULL, '2014-09-07 20:03:06', 1, NULL);
INSERT INTO paid_issued_stickers (id, print_code, date_created, payment_id, expiry_date, vehicle_paid_for, printed, printed_by, date_printed, printer_insurance_company, physical_sticker_serial) VALUES (37, '2052', '2014-10-02 09:37:38.88', 50, '2015-10-15 00:00:00', 'UAV719J', true, NULL, '2014-10-02 09:34:15', 2, NULL);
INSERT INTO paid_issued_stickers (id, print_code, date_created, payment_id, expiry_date, vehicle_paid_for, printed, printed_by, date_printed, printer_insurance_company, physical_sticker_serial) VALUES (104, '2119', '2015-02-24 20:23:07.927', 117, '2015-10-01 00:00:00', 'UAP833G', true, NULL, '2015-02-24 20:23:07', 2, NULL);
INSERT INTO paid_issued_stickers (id, print_code, date_created, payment_id, expiry_date, vehicle_paid_for, printed, printed_by, date_printed, printer_insurance_company, physical_sticker_serial) VALUES (105, '2120', '2015-02-24 20:23:08.027', 118, '2015-09-01 00:00:00', 'UAS340C', true, NULL, '2015-02-24 20:23:07', 2, NULL);


--
-- Name: paid_issued_stickers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('paid_issued_stickers_id_seq', 105, false);


--
-- Data for Name: payment_aggregators; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO payment_aggregators (id, name, access_code, access_password, security_code, active, date_created, incorrect_access_count, locked, email_address) VALUES (5, 'Waridmoney Mobile Money', 'WARIDPESA', 'MRyKnrAG4wIXo39GD647MQ==', 'MIIC1TCCAj6gAwIBAgIKkehOL/XGkB5cjjANBgkqhkiG9w0BAQUFADBhMRMwEQYD
VQQDEwpUQ1BERiBERU1PMQ4wDAYDVQQKEwVUQ1BERjENMAsGA1UECxMEREVNTzEe
MBwGCSqGSIb3DQEJARYPeW91QGV4YW1wbGUuY29tMQswCQYDVQQGEwJJVDAeFw0w
OTA4MjExMjU0NDhaFw0xNDA4MjExMjU0NDhaMGExEzARBgNVBAMTClRDUERGIERF
TU8xDjAMBgNVBAoTBVRDUERGMQ0wCwYDVQQLEwRERU1PMR4wHAYJKoZIhvcNAQkB
Fg95b3VAZXhhbXBsZS5jb20xCzAJBgNVBAYTAklUMIGfMA0GCSqGSIb3DQEBAQUA
A4GNADCBiQKBgQDAqIL0uGKmTR98Lxx2vEEE1OGKkMXFo0JViitALe7Onhxxqx0H
XMUDKF5mvEVu1rcvh7/oAnAfrCuEpL/up3u1mQCgBE7WXBnFFE/AE3jCksh9OkS0
Z0Xj9woN5bzxRDsGoPiOu/4xzk5qSEXt8jf2Ep90QuNkqLIRT4swAzpDbwIDAQAB
o4GTMIGQMDcGA1UdEgQwMC6gEQYDVQQDDApUQ1BERiBERU1PoAwGA1UECgwFVENQ
REagCwYDVQQLDARERU1PMDcGA1UdEQQwMC6gEQYDVQQDDApUQ1BERiBERU1PoAwG
A1UECgwFVENQREagCwYDVQQLDARERU1PMA8GCSqGSIb3LwEBCgQCBQAwCwYDVR0P
BAQDAgSQMA0GCSqGSIb3DQEBBQUAA4GBAEhTQfqX3ZNdHmpTLDbIj22RHXii2roE
OavCbu9WsHoWpva0qSd+yIoD594VHvYAd29sfzDfiN+7W0aiZfDhq5jpaSQMVlN8
RGYMupbHY/+a9Gz1wqxnR84mlTtIkZVRYAhsfPwy6M1BEjdMqfdh9h40JIdkdjtb
8faTCfXPePWQ', true, '2013-11-10 20:34:42.241', 0, false, 'admin@waridtel.co.ug');
INSERT INTO payment_aggregators (id, name, access_code, access_password, security_code, active, date_created, incorrect_access_count, locked, email_address) VALUES (6, 'Uganda Telecom', 'utl', 'If1x+7o+iTrBHzYoSG20Yw==', 'sdjfsd', true, '2013-11-13 16:00:28.301', 0, false, 'utl@utl.co.ug');
INSERT INTO payment_aggregators (id, name, access_code, access_password, security_code, active, date_created, incorrect_access_count, locked, email_address) VALUES (7, 'Orange', 'orange', 'I7y0RM6n+6OOXMI0jTM35Q==', '', true, '2013-11-13 16:08:53.338', 0, true, 'admin@orange.ug');
INSERT INTO payment_aggregators (id, name, access_code, access_password, security_code, active, date_created, incorrect_access_count, locked, email_address) VALUES (8, 'John', 'john', 'HAvmu+n7TvyrwbqsEF6dSw==', 'secdata', true, '2013-11-13 16:14:15.12', 0, false, 'johnmark@servicecops.com');
INSERT INTO payment_aggregators (id, name, access_code, access_password, security_code, active, date_created, incorrect_access_count, locked, email_address) VALUES (9, 'Steve J', 'steve', 'I5YPXk2xP0ObSbJOmW0qTw==', '', true, '2013-11-13 16:16:17.891', 0, false, 'stevejobs@apple.co.uk');
INSERT INTO payment_aggregators (id, name, access_code, access_password, security_code, active, date_created, incorrect_access_count, locked, email_address) VALUES (10, 'Etisalat Mobile Money Service', 'ETISALAT', 'DXzLcxhescfbyvggzm1x1A==', 'sdfhsdfsdfb', true, '2013-11-13 19:17:02.359', 0, true, 'mikhasi@etisalat.com');
INSERT INTO payment_aggregators (id, name, access_code, access_password, security_code, active, date_created, incorrect_access_count, locked, email_address) VALUES (12, 'Uganda Telecom Mpesa', 'UTLMONEY', 'KFXolEV/9YrLSEB1wxXyjw==', 'MIICmDCCAYCgAwIBAgIEUpGi/TANBgkqhkiG9w0BAQUFADANMQswCQYDVQQDDAJq
bTAgFw0xMzExMjQwNjU2MTdaGA8yMjEzMTEyNDA2NTYxN1owDTELMAkGA1UEAwwC
am0wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCssVJIeuvOhOjWvhvH
M04SiZosmoVwg23a/eJFUOnPcjCDhCZBiYr56d32WQUPnuwOWNNQRivFBzKL7Wyd
Ug8x9jJaxwpGbG9NffP7X1Kuxdhr2bd9S3oMJ72IVR+C0GefwJfNR0+A4aRpPK02
mdUlq87Zy1TgNGfG3ExonjoueMRXTokFf/8wNytCxNosnw7v8fu2gF3hJs2Ba/Da
RaH94WvUU5WhNxbTjuUV5X2kxrIobdGoh1HMq7+3p8m/FCGmlglyNCVTuKgTX0TP
Tp0Z6zwTo2OR2FrdhVLEVrFUNdwomgiifj+0RiaHxx9y3Cw9vl89I9HQdie/2PLr
4wBBAgMBAAEwDQYJKoZIhvcNAQEFBQADggEBABsXG471d6lTyAcyq4gAFaSue1+z
TtS6ahcB8Ad7NmZP1skRhw8dss/lB3vI0empkPKUkTLOcK4SFk9o9lFU8a4UsMh7
z4IbHCsvhAyKyfF7iGqPaAdgVyvNENz7JFKah5BSkKYV4HAgKQ6jZR6OOfw81aEU
TVte/nEuQH8tTcxiSufS/AAwVhdkiosAN2omjG7GkLXpkWLsoK4T3bc9eDKjYhlm
nPjAML93x0E8mjBX14odgCxIGPlgrlfnnkevXyDSme9DGVX4yZ1f67++K7TAvqBc
ei+myPIw4PUlb15p3+Jqk58VpKRzOsjfdv06KvFEwZTyUCrDdBCin393GsQ=', true, '2013-11-22 23:28:54.193', 0, false, 'utl@utl.com');
INSERT INTO payment_aggregators (id, name, access_code, access_password, security_code, active, date_created, incorrect_access_count, locked, email_address) VALUES (13, 'New Name', 'NEW', '9lfv9KTy7Q5QwSF5MvwBcLGOe3O0P0YysiT82X0h0O3DapowMCLt83UpRjPxVsk1edT9tKkzrqL4xPy0T3YwcyO8tETOp/ujjlzCNI0zN+U=', '', true, '2014-08-15 17:22:00.404', 0, false, 'new@new.com');
INSERT INTO payment_aggregators (id, name, access_code, access_password, security_code, active, date_created, incorrect_access_count, locked, email_address) VALUES (4, 'Mtn Uganda Mobile Money', 'MTN', 'Gh7uWXnDh0cWJYWPhFRMpA==', 'MIICmDCCAYCgAwIBAgIEUpGi/TANBgkqhkiG9w0BAQUFADANMQswCQYDVQQDDAJq
bTAgFw0xMzExMjQwNjU2MTdaGA8yMjEzMTEyNDA2NTYxN1owDTELMAkGA1UEAwwC
am0wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCssVJIeuvOhOjWvhvH
M04SiZosmoVwg23a/eJFUOnPcjCDhCZBiYr56d32WQUPnuwOWNNQRivFBzKL7Wyd
Ug8x9jJaxwpGbG9NffP7X1Kuxdhr2bd9S3oMJ72IVR+C0GefwJfNR0+A4aRpPK02
mdUlq87Zy1TgNGfG3ExonjoueMRXTokFf/8wNytCxNosnw7v8fu2gF3hJs2Ba/Da
RaH94WvUU5WhNxbTjuUV5X2kxrIobdGoh1HMq7+3p8m/FCGmlglyNCVTuKgTX0TP
Tp0Z6zwTo2OR2FrdhVLEVrFUNdwomgiifj+0RiaHxx9y3Cw9vl89I9HQdie/2PLr
4wBBAgMBAAEwDQYJKoZIhvcNAQEFBQADggEBABsXG471d6lTyAcyq4gAFaSue1+z
TtS6ahcB8Ad7NmZP1skRhw8dss/lB3vI0empkPKUkTLOcK4SFk9o9lFU8a4UsMh7
z4IbHCsvhAyKyfF7iGqPaAdgVyvNENz7JFKah5BSkKYV4HAgKQ6jZR6OOfw81aEU
TVte/nEuQH8tTcxiSufS/AAwVhdkiosAN2omjG7GkLXpkWLsoK4T3bc9eDKjYhlm
nPjAML93x0E8mjBX14odgCxIGPlgrlfnnkevXyDSme9DGVX4yZ1f67++K7TAvqBc
ei+myPIw4PUlb15p3+Jqk58VpKRzOsjfdv06KvFEwZTyUCrDdBCin393GsQ=', true, '2013-11-10 20:31:37.715', 0, false, 'admin@mtn.co.ug');


--
-- Name: payment_aggregators_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('payment_aggregators_id_seq', 13, false);


--
-- Name: payment_processed_reference_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('payment_processed_reference_sequence', 2120, false);


--
-- Data for Name: payments_received; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO payments_received (id, aggregator, aggregator_transaction_id, vehicle_reference, aggregator_payment_processed_date, date_received, aggregator_payment_reference, amount, aggregator_memo, payer_mobile, payer_email, payer_name, payment_recon_flag, payment_status, sticker_generated) VALUES (34, 4, '0084399', 'UAS340K', '2014-01-30 16:20:43', '2014-01-30 16:20:44.233758', '0084399', 71735, 'Motor Thirdparty payment for UAS340K', '256776000954', '', 'Kikonyogo B John', 'NORMAL', 'RECEIVED', false);
INSERT INTO payments_received (id, aggregator, aggregator_transaction_id, vehicle_reference, aggregator_payment_processed_date, date_received, aggregator_payment_reference, amount, aggregator_memo, payer_mobile, payer_email, payer_name, payment_recon_flag, payment_status, sticker_generated) VALUES (35, 4, '9850727', 'UAQ206S', '2014-01-31 13:20:41', '2014-01-31 13:20:41.974051', '9850727', 51893, 'Motor Thirdparty payment for UAQ206S', '256772689197', '', 'Alfonse opiira', 'NORMAL', 'RECEIVED', false);
INSERT INTO payments_received (id, aggregator, aggregator_transaction_id, vehicle_reference, aggregator_payment_processed_date, date_received, aggregator_payment_reference, amount, aggregator_memo, payer_mobile, payer_email, payer_name, payment_recon_flag, payment_status, sticker_generated) VALUES (36, 4, '6634981', 'UAP955E', '2014-02-08 15:42:26', '2014-02-08 15:42:26.331762', '6634981', 91697, 'Motor Thirdparty payment for UAP955E', '256772833261', '', 'Mayonza Ambrose', 'NORMAL', 'RECEIVED', false);
INSERT INTO payments_received (id, aggregator, aggregator_transaction_id, vehicle_reference, aggregator_payment_processed_date, date_received, aggregator_payment_reference, amount, aggregator_memo, payer_mobile, payer_email, payer_name, payment_recon_flag, payment_status, sticker_generated) VALUES (37, 4, '7509497', 'UAF229H', '2014-02-10 09:22:58', '2014-02-10 09:22:58.089409', '7509497', 71068, 'Motor Thirdparty payment for UAF229H', '256772592799', '', 'Sekatawa James', 'NORMAL', 'RECEIVED', false);
INSERT INTO payments_received (id, aggregator, aggregator_transaction_id, vehicle_reference, aggregator_payment_processed_date, date_received, aggregator_payment_reference, amount, aggregator_memo, payer_mobile, payer_email, payer_name, payment_recon_flag, payment_status, sticker_generated) VALUES (38, 4, '8238280', 'UAA333B', '2014-02-10 09:25:18', '2014-02-10 09:25:18.371575', '8238280', 18846, 'Motor Thirdparty payment for UAA333B', '256772592799', '', 'Edwin Kiconco', 'NORMAL', 'RECEIVED', false);
INSERT INTO payments_received (id, aggregator, aggregator_transaction_id, vehicle_reference, aggregator_payment_processed_date, date_received, aggregator_payment_reference, amount, aggregator_memo, payer_mobile, payer_email, payer_name, payment_recon_flag, payment_status, sticker_generated) VALUES (39, 4, '0188677', 'UAP555H', '2014-08-04 14:36:37', '2014-08-04 14:36:39.069555', '0188677', 73321, 'Motor Thirdparty payment for UAP555H', '256776000954', '', 'Ndiiho Joseph', 'NORMAL', 'RECEIVED', false);
INSERT INTO payments_received (id, aggregator, aggregator_transaction_id, vehicle_reference, aggregator_payment_processed_date, date_received, aggregator_payment_reference, amount, aggregator_memo, payer_mobile, payer_email, payer_name, payment_recon_flag, payment_status, sticker_generated) VALUES (40, 4, '6828847', 'UAV520J', '2014-08-05 17:42:00', '2014-08-05 17:42:00.269277', '6828847', 18729, 'Motor Thirdparty payment for UAV520J', '256776000954', '', 'Aruho Alvin', 'NORMAL', 'RECEIVED', false);
INSERT INTO payments_received (id, aggregator, aggregator_transaction_id, vehicle_reference, aggregator_payment_processed_date, date_received, aggregator_payment_reference, amount, aggregator_memo, payer_mobile, payer_email, payer_name, payment_recon_flag, payment_status, sticker_generated) VALUES (41, 4, '5023961', 'USA987Q', '2014-08-06 09:25:39', '2014-08-06 09:25:40.055118', '5023961', 10210, 'Motor Thirdparty payment for USA987Q', '256782957021', '', 'Sula Matovu', 'NORMAL', 'RECEIVED', false);
INSERT INTO payments_received (id, aggregator, aggregator_transaction_id, vehicle_reference, aggregator_payment_processed_date, date_received, aggregator_payment_reference, amount, aggregator_memo, payer_mobile, payer_email, payer_name, payment_recon_flag, payment_status, sticker_generated) VALUES (46, 0, '10', 'UAV719J', '2014-09-07 14:17:27', '2014-09-07 14:46:39.49', '10', 85142, NULL, '256714108355', 'mikhasi@gmail.com', 'John Luyima', 'INSURANCE_COMPANY', 'RECEIVED', false);
INSERT INTO payments_received (id, aggregator, aggregator_transaction_id, vehicle_reference, aggregator_payment_processed_date, date_received, aggregator_payment_reference, amount, aggregator_memo, payer_mobile, payer_email, payer_name, payment_recon_flag, payment_status, sticker_generated) VALUES (49, 0, '11', 'UAP833G', '2014-09-07 20:03:06', '2014-09-07 20:05:12.951', '11', 88233, NULL, '256704008823', 'eddike@madmail.com', 'Edwin Kiconco', 'INSURANCE_COMPANY', 'RECEIVED', false);
INSERT INTO payments_received (id, aggregator, aggregator_transaction_id, vehicle_reference, aggregator_payment_processed_date, date_received, aggregator_payment_reference, amount, aggregator_memo, payer_mobile, payer_email, payer_name, payment_recon_flag, payment_status, sticker_generated) VALUES (50, 0, '12', 'UAV719J', '2014-10-02 09:34:15', '2014-10-02 09:37:38.88', '12', 52869, NULL, '256714108355', '', 'John Luyima', 'INSURANCE_COMPANY', 'RECEIVED', false);
INSERT INTO payments_received (id, aggregator, aggregator_transaction_id, vehicle_reference, aggregator_payment_processed_date, date_received, aggregator_payment_reference, amount, aggregator_memo, payer_mobile, payer_email, payer_name, payment_recon_flag, payment_status, sticker_generated) VALUES (117, 0, '184', 'UAP833G', '2015-02-24 20:23:07', '2015-02-24 20:23:07.927', '184', 88500, NULL, '256776883242', 'test@gmail.com', '', 'INSURANCE_COMPANY', 'RECEIVED', false);
INSERT INTO payments_received (id, aggregator, aggregator_transaction_id, vehicle_reference, aggregator_payment_processed_date, date_received, aggregator_payment_reference, amount, aggregator_memo, payer_mobile, payer_email, payer_name, payment_recon_flag, payment_status, sticker_generated) VALUES (118, 0, '185', 'UAS340C', '2015-02-24 20:23:07', '2015-02-24 20:23:08.027', '185', 75000, NULL, '256774525252', 'test2@gmail.com', '', 'INSURANCE_COMPANY', 'RECEIVED', false);


--
-- Name: payments_received_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('payments_received_id_seq', 118, false);


--
-- Data for Name: policies; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO policies (id, date_created, start_date, end_date, registration_number, policy_holder_name, policy_holder_phone, policy_number, insurance_company, sticker_reference) VALUES (12, '2014-08-24 20:11:29.299', '2014-02-10', '2015-02-10', 'UAA333B', '256772592799', '256772592799', 'UAP-00000013', 2, '2040');
INSERT INTO policies (id, date_created, start_date, end_date, registration_number, policy_holder_name, policy_holder_phone, policy_number, insurance_company, sticker_reference) VALUES (13, '2014-09-07 14:46:39.49', '2014-09-02', '2015-09-07', 'UAV719J', 'John Luyima', '256714108355', 'P90040001', 1, '2048');
INSERT INTO policies (id, date_created, start_date, end_date, registration_number, policy_holder_name, policy_holder_phone, policy_number, insurance_company, sticker_reference) VALUES (14, '2014-09-07 20:05:12.951', '2014-08-01', '2015-08-01', 'UAP833G', 'Edwin Kiconco', '256704008823', 'P74364384232', 1, '2051');
INSERT INTO policies (id, date_created, start_date, end_date, registration_number, policy_holder_name, policy_holder_phone, policy_number, insurance_company, sticker_reference) VALUES (15, '2014-09-30 19:41:05.784', '2014-02-10', '2015-02-10', 'UAF229H', '256772592799', '256772592799', 'UAP-00000014', 2, '2039');
INSERT INTO policies (id, date_created, start_date, end_date, registration_number, policy_holder_name, policy_holder_phone, policy_number, insurance_company, sticker_reference) VALUES (21, '2014-10-02 09:37:38.88', '2014-10-01', '2015-10-15', 'UAV719J', 'John Luyima', '256714108355', 'PL463473423523', 2, '2052');
INSERT INTO policies (id, date_created, start_date, end_date, registration_number, policy_holder_name, policy_holder_phone, policy_number, insurance_company, sticker_reference) VALUES (24, '2014-10-05 12:35:01.176', '2014-10-05', '2015-10-05', 'UAV520J', '256776000954', '256776000954', 'UAP-00000023', 2, '2042');
INSERT INTO policies (id, date_created, start_date, end_date, registration_number, policy_holder_name, policy_holder_phone, policy_number, insurance_company, sticker_reference) VALUES (91, '2015-02-24 20:23:07.927', '2014-10-01', '2015-10-01', 'UAP833G', '', '256776883242', 'Pi234i234u2342', 2, '2119');
INSERT INTO policies (id, date_created, start_date, end_date, registration_number, policy_holder_name, policy_holder_phone, policy_number, insurance_company, sticker_reference) VALUES (92, '2015-02-24 20:23:08.027', '2014-09-01', '2015-09-01', 'UAS340C', '', '256774525252', 'Ps2342834239346', 2, '2120');


--
-- Name: policies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('policies_id_seq', 168, true);


--
-- Name: policy_number_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('policy_number_seq', 23, false);


--
-- Data for Name: prompts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO prompts (id, description, next_type, next_id, is_leaf, application_id, data_template, variable_name, continue_data_template, is_confirmation, is_account_prompt, is_auth) VALUES (1463, 'Enter Your PIN', NULL, NULL, true, 1, 'GetStickerDetails;##MSISDN;##VRN;##STICKERNUMBER;##PIN', 'PIN', NULL, false, false, false);
INSERT INTO prompts (id, description, next_type, next_id, is_leaf, application_id, data_template, variable_name, continue_data_template, is_confirmation, is_account_prompt, is_auth) VALUES (1464, 'Enter Vehicle Reg No.', 'PROMPT', 1463, false, NULL, NULL, 'VRN', NULL, false, false, false);
INSERT INTO prompts (id, description, next_type, next_id, is_leaf, application_id, data_template, variable_name, continue_data_template, is_confirmation, is_account_prompt, is_auth) VALUES (1465, 'Enter Sticker Number', 'PROMPT', 1464, false, NULL, '', 'STICKERNUMBER', NULL, false, false, false);
INSERT INTO prompts (id, description, next_type, next_id, is_leaf, application_id, data_template, variable_name, continue_data_template, is_confirmation, is_account_prompt, is_auth) VALUES (1466, 'Re-enter New PIN', NULL, NULL, true, 1, 'CHANGEPIN;##MSISDN;##OLDPIN;##NEWPIN1;##NEWPIN2', 'NEWPIN2', '', false, false, false);
INSERT INTO prompts (id, description, next_type, next_id, is_leaf, application_id, data_template, variable_name, continue_data_template, is_confirmation, is_account_prompt, is_auth) VALUES (1467, 'Enter New PIN', 'PROMPT', 1466, false, NULL, NULL, 'NEWPIN1', NULL, false, false, false);
INSERT INTO prompts (id, description, next_type, next_id, is_leaf, application_id, data_template, variable_name, continue_data_template, is_confirmation, is_account_prompt, is_auth) VALUES (1468, 'Enter You Old PIN', 'PROMPT', 1467, false, NULL, NULL, 'OLDPIN', NULL, false, false, false);
INSERT INTO prompts (id, description, next_type, next_id, is_leaf, application_id, data_template, variable_name, continue_data_template, is_confirmation, is_account_prompt, is_auth) VALUES (1469, 'Enter Your PIN', NULL, NULL, true, 1, 'PrintStickerDetails;##MSISDN;##VRN;##STICKERNUMBER;##PIN;##SERIAL_NO;##VEHICLE_OWNER_PHONE', 'PIN', NULL, false, false, false);
INSERT INTO prompts (id, description, next_type, next_id, is_leaf, application_id, data_template, variable_name, continue_data_template, is_confirmation, is_account_prompt, is_auth) VALUES (1470, 'Enter Vehicle owners phone', 'PROMPT', 1469, false, NULL, NULL, 'VEHICLE_OWNER_PHONE', NULL, false, false, false);
INSERT INTO prompts (id, description, next_type, next_id, is_leaf, application_id, data_template, variable_name, continue_data_template, is_confirmation, is_account_prompt, is_auth) VALUES (1471, 'Enter physical sticker serial no.', 'PROMPT', 1470, false, NULL, NULL, 'SERIAL_NO', NULL, false, false, false);
INSERT INTO prompts (id, description, next_type, next_id, is_leaf, application_id, data_template, variable_name, continue_data_template, is_confirmation, is_account_prompt, is_auth) VALUES (1472, 'Enter Vehicle Reg No.', 'PROMPT', 1471, false, NULL, NULL, 'VRN', NULL, false, false, false);
INSERT INTO prompts (id, description, next_type, next_id, is_leaf, application_id, data_template, variable_name, continue_data_template, is_confirmation, is_account_prompt, is_auth) VALUES (1473, 'Enter Sticker Number', 'PROMPT', 1472, false, NULL, NULL, 'STICKERNUMBER', NULL, false, false, false);
INSERT INTO prompts (id, description, next_type, next_id, is_leaf, application_id, data_template, variable_name, continue_data_template, is_confirmation, is_account_prompt, is_auth) VALUES (1474, 'Re-enter New PIN', NULL, NULL, true, 1, 'CHANGEPIN;##MSISDN;##OLDPIN;##NEWPIN1;##NEWPIN2', 'NEWPIN2', '', false, false, false);
INSERT INTO prompts (id, description, next_type, next_id, is_leaf, application_id, data_template, variable_name, continue_data_template, is_confirmation, is_account_prompt, is_auth) VALUES (1475, 'Enter New PIN', 'PROMPT', 1474, false, NULL, NULL, 'NEWPIN1', NULL, false, false, false);
INSERT INTO prompts (id, description, next_type, next_id, is_leaf, application_id, data_template, variable_name, continue_data_template, is_confirmation, is_account_prompt, is_auth) VALUES (1476, 'Enter You Old PIN', 'PROMPT', 1475, false, NULL, NULL, 'OLDPIN', NULL, false, false, false);
INSERT INTO prompts (id, description, next_type, next_id, is_leaf, application_id, data_template, variable_name, continue_data_template, is_confirmation, is_account_prompt, is_auth) VALUES (1477, 'Enter Car Reg Number', NULL, NULL, true, 2, 'FIRST;##CARREG;##MSISDN;##SESSIONID', 'CARREG', 'CONTINUE;##USERDATA;##MSISDN;##SESSIONID', false, false, false);


--
-- Name: prompts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('prompts_id_seq', 1477, false);


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO settings (param_name, param_value) VALUES ('APPLICATION_NAME', 'NEONONE Thirdparty payments interface');
INSERT INTO settings (param_name, param_value) VALUES ('INCORRECT_AGGREGATOR_INVALID_PASSWORD_COUT', '20');
INSERT INTO settings (param_name, param_value) VALUES ('INCORRECT_MOBILE_USER_PIN_COUNT', '3');
INSERT INTO settings (param_name, param_value) VALUES ('SEND_EMAIL_ON_AGGREGATOR_CREATE', 'NO');
INSERT INTO settings (param_name, param_value) VALUES ('SEND_EMAIL_ON_CONSOLE_USER_CREATE', 'YES');
INSERT INTO settings (param_name, param_value) VALUES ('SEND_SMS_ON_MOBILE_USER_CREATE', 'YES');
INSERT INTO settings (param_name, param_value) VALUES ('SEND_SMS_TO_CUSTOMER_ON_PRINT', 'YES');
INSERT INTO settings (param_name, param_value) VALUES ('SEND_SMS_TO_CUSTOMER_ON_PRINT', 'YES');
INSERT INTO settings (param_name, param_value) VALUES ('SEND_SMS_TO_OPERATOR_ON_PRINT', 'YES');
INSERT INTO settings (param_name, param_value) VALUES ('SERVICE_URL', 'http://localhost:7002/ThirdpartyPaymentsApp/AggregatorWebServices');
INSERT INTO settings (param_name, param_value) VALUES ('USSDCODE', '*288*30#');
INSERT INTO settings (param_name, param_value) VALUES ('WEB_URL', 'http://localhost:7001/ThirdpartyPaymentsApp/webaccess');


--
-- Data for Name: test_payment_initiations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO test_payment_initiations (phone_number, session_id, amount, date, reg_no) VALUES ('256704028823', 'qes4epsv', '60535', '2013-11-25 14:39:44.236', 'UAT555K');
INSERT INTO test_payment_initiations (phone_number, session_id, amount, date, reg_no) VALUES ('256704028823', 'rbp0hau0', '62819', '2013-11-25 14:59:04.186', 'UAH876K');
INSERT INTO test_payment_initiations (phone_number, session_id, amount, date, reg_no) VALUES ('256772592799', '33694983', '71068', '2014-02-10 09:22:41.440667', 'UAF229H');
INSERT INTO test_payment_initiations (phone_number, session_id, amount, date, reg_no) VALUES ('256772592799', '50699690', '18846', '2014-02-10 09:25:05.826871', 'UAA333B');
INSERT INTO test_payment_initiations (phone_number, session_id, amount, date, reg_no) VALUES ('256772689197', '6499856', '51893', '2014-01-31 13:20:23.605941', 'UAQ206S');
INSERT INTO test_payment_initiations (phone_number, session_id, amount, date, reg_no) VALUES ('256772833261', '57695320', '91697', '2014-02-08 15:42:09.488743', 'UAP955E');
INSERT INTO test_payment_initiations (phone_number, session_id, amount, date, reg_no) VALUES ('256776000954', '31958757', '73321', '2014-08-04 14:36:31.460909', 'UAP555H');
INSERT INTO test_payment_initiations (phone_number, session_id, amount, date, reg_no) VALUES ('256776000954', '43853909', '18729', '2014-08-05 17:41:52.34619', 'UAV520J');
INSERT INTO test_payment_initiations (phone_number, session_id, amount, date, reg_no) VALUES ('256776000954', '45018283', '71735', '2014-01-30 16:20:37.099146', 'UAS340K');
INSERT INTO test_payment_initiations (phone_number, session_id, amount, date, reg_no) VALUES ('256782957021', '7526389', '10210', '2014-08-06 09:25:16.893081', 'USA987Q');


--
-- Data for Name: ura_first_time_registration_details; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: ura_first_time_registration_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ura_first_time_registration_details_id_seq', 1, false);


--
-- Data for Name: ura_stampduty_prn_registration_details; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: ura_stampduty_prn_registration_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ura_stampduty_prn_registration_details_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 32, true);


--
-- Data for Name: ussd_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (69, '256704028823', 'ijp8dhe5', '2013-11-25 12:07:58.578', '10', 'PROMPT', '3', '4', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (70, '256704028823', 'b2hlr5fo', '2013-11-25 12:11:54.432', '10', 'PROMPT', '3', '4', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (71, '256704028823', 'bibet3ks', '2013-11-25 12:14:11.848', '10', 'PROMPT', '3', '4', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (72, '256704028823', '1hlupvtl', '2013-11-25 12:17:09.695', '10', 'PROMPT', '3', '4', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (73, '256704028823', 'n5saqqgi', '2013-11-25 12:18:08.567', '10', 'PROMPT', '3', '4', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (74, '256704028823', 'he1h1aqf', '2013-11-25 12:25:00.596', '3', 'MENU', '3', '3', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (75, '256704028823', 'irbul5cs', '2013-11-25 12:26:03.524', '10', 'PROMPT', '3', '4', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (76, '256704028823', '72kq1i0c', '2013-11-25 12:26:53.889', '10', 'PROMPT', '3', '4', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (77, '256704028823', '2rfmna2o', '2013-11-25 12:28:32.079', '10', 'PROMPT', '3', '4', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (78, '256704028823', 'e8h0kngs', '2013-11-25 12:29:29.731', '10', 'PROMPT', '3', '4', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (79, '256704028823', '6aos4vu0', '2013-11-25 12:30:37.685', '10', 'PROMPT', '3', '4', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (80, '256704028823', '52j2j03l', '2013-11-25 12:31:02.3', '10', 'PROMPT', '3', '4', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (81, '256704028823', '7eidhriu', '2013-11-25 12:35:20.899', '10', 'PROMPT', '3', '4', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (82, '256704028823', 'j6cb2e2b', '2013-11-25 12:35:32.859', '10', 'PROMPT', '3', '4', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (83, '256704028823', 'alhvlivq', '2013-11-25 12:36:04.187', '10', 'PROMPT', '3', '4', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (84, '256704028823', '32tn4qpt', '2013-11-25 12:36:54.704', '10', 'PROMPT', '3', '4', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (85, '256704028823', 'lglbtds', '2013-11-25 14:37:43.293', '10', 'PROMPT', '3', '4', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (86, '256704028823', 'tbmqmrs4', '2013-11-25 14:38:44.334', '10', 'PROMPT', '3', '4', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (87, '256704028823', 'qes4epsv', '2013-11-25 14:39:37.821', '10', 'PROMPT', '3', '4', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (88, '256704028823', 'rbp0hau0', '2013-11-25 14:58:55.859', '10', 'PROMPT', '3', '4', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (89, '256776000954', '41583582', '2013-11-26 14:16:45.716721', '6', 'PROMPT', '2', '2', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (90, '256776000954', '45585584', '2013-11-26 14:17:49.426785', '1', 'MENU', '1', '1', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (91, '256776000954', '46603280', '2013-11-26 14:26:49.816842', '6', 'PROMPT', '2', '2', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (92, '256773356153', '56633365', '2013-11-26 14:42:00.180628', '6', 'PROMPT', '2', '2', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (93, '256773356153', '44635007', '2013-11-26 14:42:48.515888', '3', 'PROMPT', '1', '1', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (94, '256776000954', '26671435', '2013-11-26 15:00:29.856764', '10', 'PROMPT', '3', '4', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (95, '256773356153', '27675614', '2013-11-26 15:02:36.263889', '9', 'PROMPT', '1', '1', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (96, '256776000954', '17858509', '2013-11-26 16:34:21.68807', '10', 'PROMPT', '3', '4', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (97, '256776000954', '59863833', '2013-11-26 16:37:02.755737', '4', 'MENU', '3', '3', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (98, '256776000954', '14868352', '2013-11-26 16:39:18.081864', '3', 'MENU', '3', '3', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (99, '256772689197', '54871804', '2013-11-26 16:40:57.411558', '6', 'PROMPT', '2', '2', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (100, '256772689197', '52875714', '2013-11-26 16:42:55.197414', '3', 'PROMPT', '1', '1', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (101, '256776500031', '18876588', '2013-11-26 16:43:21.36049', '6', 'PROMPT', '2', '2', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (102, '256776500031', '48879638', '2013-11-26 16:44:51.678166', '6', 'PROMPT', '2', '2', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (103, '256776500031', '11882565', '2013-11-26 16:46:14.907367', '10', 'PROMPT', '3', '4', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (104, '256392613579', '4890543', '2013-11-26 16:50:07.217269', '6', 'PROMPT', '2', '2', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (105, '256392613579', '51896289', '2013-11-26 16:52:54.879197', '3', 'PROMPT', '1', '1', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (106, '256392613579', '21899337', '2013-11-26 16:54:25.145336', '3', 'PROMPT', '1', '1', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (107, '256392613579', '26903555', '2013-11-26 16:56:35.280979', '9', 'PROMPT', '1', '1', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (108, '256776000954', '49043533', '2013-11-26 18:22:52.636489', '9', 'PROMPT', '1', '1', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (109, '256392613579', '8044245', '2013-11-26 18:23:11.929919', '7', 'PROMPT', '1', '1', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (110, '256392613579', '5052926', '2013-11-26 18:27:07.909272', '8', 'PROMPT', '1', '1', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (111, '256392613579', '59054972', '2013-11-26 18:28:02.156618', '9', 'PROMPT', '1', '1', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (112, '256392613579', '13057800', '2013-11-26 18:29:15.906801', '9', 'PROMPT', '1', '1', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (113, '256776000954', '5000713', '2013-11-26 23:18:08.13552', '3', 'PROMPT', '1', '1', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (114, '256776000954', '10001657', '2013-11-26 23:19:12.715825', '6', 'PROMPT', '1', '1', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (115, '256776500031', '31392490', '2013-11-27 09:25:32.09563', '10', 'PROMPT', '3', '4', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (116, '256772676051', '5404545', '2013-11-27 09:32:05.046573', '6', 'PROMPT', '2', '2', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (117, '256772676051', '51411350', '2013-11-27 09:35:51.056362', '1', 'MENU', '1', '1', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (118, '256772676051', '9413684', '2013-11-27 09:37:09.083659', '10', 'PROMPT', '3', '4', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (119, '256392613579', '9431978', '2013-11-27 09:47:09.256664', '3', 'PROMPT', '1', '1', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (120, '256392613579', '6435792', '2013-11-27 09:49:06.296403', '9', 'PROMPT', '1', '1', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (121, '256392613579', '11439676', '2013-11-27 09:51:10.809538', '9', 'PROMPT', '1', '1', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (122, '256772676051', '57448796', '2013-11-27 09:55:57.199435', '10', 'PROMPT', '3', '4', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (123, '256392613579', '47454479', '2013-11-27 09:58:47.506103', '3', 'PROMPT', '1', '1', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (124, '256392613579', '45458269', '2013-11-27 10:00:45.346494', '9', 'PROMPT', '1', '1', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (125, '256392613579', '32466087', '2013-11-27 10:04:32.205242', '3', 'PROMPT', '1', '1', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (126, '256392613579', '43470110', '2013-11-27 10:06:43.80666', '3', 'PROMPT', '1', '1', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (127, '256772833261', '24536697', '2013-11-27 10:41:24.07934', '6', 'PROMPT', '2', '2', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (128, '256772833261', '7538060', '2013-11-27 10:42:07.142644', '10', 'PROMPT', '3', '4', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (129, '256392613579', '4541936', '2013-11-27 10:44:04.023731', '3', 'PROMPT', '1', '1', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (130, '256776000954', '15544216', '2013-11-27 10:45:14.442102', '3', 'PROMPT', '1', '1', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (131, '256776000954', '45545128', '2013-11-27 10:45:44.641332', '3', 'PROMPT', '1', '1', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (132, '256392613579', '47545184', '2013-11-27 10:45:46.604429', '9', 'PROMPT', '1', '1', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (133, '256772689197', '2577242', '2013-11-27 11:02:02.262363', '1', 'PROMPT', '1', '1', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (134, '256776500031', '10579510', '2013-11-27 11:03:10.373133', '3', 'MENU', '3', '3', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (135, '256776500031', '36584666', '2013-11-27 11:05:35.913192', '3', 'MENU', '3', '3', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (136, '256772689197', '13585849', '2013-11-27 11:06:12.633029', '4', 'PROMPT', '1', '1', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (137, '256772689197', '48588976', '2013-11-27 11:07:47.743552', '10', 'PROMPT', '3', '4', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (138, '256392613579', '48593009', '2013-11-27 11:09:47.978843', '3', 'PROMPT', '1', '1', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (139, '256392613579', '26596321', '2013-11-27 11:11:25.832241', '9', 'PROMPT', '1', '1', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (140, '256776000954', '3699325', '2013-11-27 12:02:03.12544', '3', 'PROMPT', '1', '1', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (141, '256776000954', '51702994', '2013-11-27 12:03:50.69371', '3', 'PROMPT', '1', '1', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (142, '256772592799', '10785445', '2013-11-27 12:43:09.75052', '2', 'MENU', '2', '2', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (143, '256776000954', '48982230', '2013-11-27 20:52:47.086293', '3', 'PROMPT', '1', '1', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (144, '256776000954', '46212928', '2013-11-28 08:25:42.059544', '1', 'MENU', '1', '1', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (145, '256772592799', '44214450', '2013-11-28 08:26:39.341985', '6', 'PROMPT', '2', '2', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (146, '256772592799', '22217134', '2013-11-28 08:28:17.016525', '3', 'MENU', '3', '3', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (147, '256772592799', '13223567', '2013-11-28 08:32:08.183214', '10', 'PROMPT', '3', '4', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (148, '256772592799', '32316068', '2013-11-28 09:25:26.880088', '3', 'MENU', '3', '3', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (149, '256772592799', '16319269', '2013-11-28 09:27:11.836161', '10', 'PROMPT', '3', '4', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (150, '256772592799', '33325238', '2013-11-28 09:30:28.504562', '10', 'PROMPT', '3', '4', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (151, '256772592799', '50333136', '2013-11-28 09:34:44.886369', '10', 'PROMPT', '3', '4', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (152, '256775490728', '1039905', '2013-11-28 10:59:56.469836', '6', 'PROMPT', '2', '2', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (153, '256775490728', '49043466', '2013-11-28 11:01:43.954736', '3', 'MENU', '3', '3', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (154, '256775490728', '7048149', '2013-11-28 11:04:02.2554', '1', 'MENU', '1', '1', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (155, '256775490728', '51051644', '2013-11-28 11:05:45.705192', '3', 'PROMPT', '1', '1', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (156, '256775490728', '53055795', '2013-11-28 11:07:48.140326', '9', 'PROMPT', '1', '1', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (157, '256775490728', '54061653', '2013-11-28 11:10:49.335364', '9', 'PROMPT', '1', '1', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (158, '256782020165', '23098044', '2013-11-28 11:29:17.323868', '2', 'MENU', '2', '2', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (159, '256782020165', '28108187', '2013-11-28 11:34:22.974016', '4', 'PROMPT', '2', '2', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (160, '256782020165', '14109774', '2013-11-28 11:35:09.440557', '2', 'MENU', '2', '2', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (161, '256772833261', '38117200', '2013-11-28 19:33:31.308919', '11', 'MENUITEM', '3', '4', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (162, '256782020165', '37309806', '2013-11-29 11:00:27.323199', '2', 'MENU', '2', '2', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (163, '256782020165', '25311306', '2013-11-29 11:01:15.433541', '6', 'PROMPT', '2', '2', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (164, '256782020165', '24313233', '2013-11-29 11:02:13.803064', '1', 'MENU', '1', '1', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (165, '256782020165', '54318009', '2013-11-29 11:04:44.494239', '3', 'MENU', '3', '3', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (166, '256782020165', '34319252', '2013-11-29 11:05:23.636549', '10', 'PROMPT', '3', '4', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (167, '256776000954', '44319558', '2013-11-29 11:05:33.532479', '1', 'MENU', '1', '1', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (168, '256776000954', '38325071', '2013-11-29 11:08:27.477883', '10', 'PROMPT', '3', '4', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (169, '256775490728', '42328970', '2013-11-29 11:10:31.442687', '3', 'PROMPT', '1', '1', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (170, '256775490728', '16331818', '2013-11-29 11:12:05.256374', '3', 'PROMPT', '1', '1', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (171, '256775490728', '22335741', '2013-11-29 11:14:11.463015', '9', 'PROMPT', '1', '1', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (172, '256775490728', '55340487', '2013-11-29 11:16:45.234947', '3', 'PROMPT', '1', '1', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (173, '256776000954', '43738607', '2013-12-03 08:04:11.739626', '10', 'PROMPT', '3', '4', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (174, '256776000954', '7117397', '2013-12-03 15:37:39.102377', '10', 'PROMPT', '3', '4', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (175, '256776000954', '19123903', '2013-12-03 15:40:50.141425', '8', 'PROMPT', '1', '1', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (176, '256776000954', '4127383', '2013-12-03 15:42:35.258033', '9', 'PROMPT', '1', '1', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (177, '256776000954', '33210751', '2013-12-06 19:47:48.00547', '6', 'PROMPT', '1', '1', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (178, '256776000954', '33782475', '2013-12-07 20:35:02.209137', '3', 'PROMPT', '1', '1', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (179, '256776000954', '57044965', '2013-12-10 12:14:58.910286', '1', 'MENU', '1', '1', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (180, '256776000954', '21854881', '2013-12-11 12:37:35.674967', '1', 'MENU', '1', '1', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (181, '256775546053', '55177898', '2013-12-17 14:08:25.372409', '6', 'PROMPT', '2', '2', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (182, '256775546053', '7180694', '2013-12-17 14:09:35.301309', '5', 'PROMPT', '2', '2', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (183, '256776000954', '14312401', '2013-12-17 15:05:43.530378', '1', 'MENU', '1', '1', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (184, '256772592799', '57379323', '2013-12-17 15:34:27.091849', '10', 'PROMPT', '3', '4', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (185, '256776000954', '48508439', '2013-12-17 16:30:18.294901', '3', 'PROMPT', '1', '1', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (186, '256782483008', '27545635', '2013-12-17 16:45:56.943534', '6', 'PROMPT', '2', '2', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (187, '256772592799', '12551996', '2013-12-17 16:48:41.885754', '10', 'PROMPT', '3', '4', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (188, '256772592799', '21554658', '2013-12-17 16:49:51.115449', '10', 'PROMPT', '3', '4', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (189, '256782483008', '47562348', '2013-12-17 16:53:16.849844', '3', 'PROMPT', '1', '1', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (190, '256782483008', '17577625', '2013-12-17 16:59:47.635214', '9', 'PROMPT', '1', '1', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (191, '256772833261', '26658888', '2014-01-04 16:35:12.381007', '10', 'PROMPT', '3', '4', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (192, '256772689197', '21664960', '2014-01-04 16:38:06.831645', '3', 'MENU', '3', '3', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (193, '256776000954', '4300699', '2014-01-06 12:56:36.977672', '3', 'PROMPT', '1', '1', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (194, '256776000954', '17307699', '2014-01-06 12:59:49.879695', '3', 'PROMPT', '1', '1', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (195, '256776000954', '25322994', '2014-01-06 13:07:02.214622', '3', 'PROMPT', '1', '1', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (196, '256776500031', '45571730', '2014-01-06 14:57:16.792089', '10', 'PROMPT', '3', '4', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (197, '256776500031', '50588257', '2014-01-06 15:04:24.4571', '7', 'PROMPT', '1', '1', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (198, '256776500031', '41597029', '2014-01-06 15:08:12.639619', '9', 'PROMPT', '1', '1', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (199, '256776500031', '26603310', '2014-01-06 15:10:57.835482', '9', 'PROMPT', '1', '1', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (200, '256776000954', '9604981', '2014-01-06 15:11:39.959016', '6', 'PROMPT', '2', '2', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (201, '256776500031', '25607870', '2014-01-06 15:12:56.677364', '9', 'PROMPT', '1', '1', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (202, '256776500031', '42613113', '2014-01-06 15:15:14.898723', '9', 'PROMPT', '1', '1', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (203, '256776500031', '45615451', '2014-01-06 15:16:16.835635', '9', 'PROMPT', '1', '1', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (204, '256776500031', '47531419', '2014-01-07 11:46:12.33571', '3', 'MENU', '3', '3', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (205, '256772505641', '23545677', '2014-01-07 11:52:48.4545', '6', 'PROMPT', '2', '2', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (206, '256782957021', '56546968', '2014-01-07 11:53:21.178287', '6', 'PROMPT', '2', '2', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (207, '256782957021', '51551053', '2014-01-07 11:55:16.034479', '3', 'MENU', '3', '3', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (208, '256772505641', '10551744', '2014-01-07 11:55:35.242132', '6', 'PROMPT', '2', '2', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (209, '256772505641', '27554484', '2014-01-07 11:56:52.337485', '3', 'MENU', '3', '3', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (210, '256782957021', '9556072', '2014-01-07 11:57:33.774907', '10', 'PROMPT', '3', '4', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (211, '256772505641', '42557273', '2014-01-07 11:58:06.730249', '10', 'PROMPT', '3', '4', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (212, '256776500031', '29585323', '2014-01-07 12:10:53.904128', '9', 'PROMPT', '1', '1', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (213, '256776000954', '31838762', '2014-01-07 20:32:53.328578', '3', 'PROMPT', '1', '1', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (214, '256772505641', '22001204', '2014-01-09 15:19:32.299325', '5', 'MENUITEM', '3', '3', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (215, '256776000954', '21117579', '2014-01-09 15:56:32.536927', '6', 'PROMPT', '1', '1', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (216, '256776000954', '32230399', '2014-01-26 10:19:37.648336', '3', 'PROMPT', '1', '1', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (217, '256776000954', '38965386', '2014-01-30 15:57:17.247784', '6', 'PROMPT', '2', '2', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (218, '256772689197', '29978919', '2014-01-30 16:03:02.63969', '6', 'PROMPT', '2', '2', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (219, '256776000954', '10016904', '2014-01-30 16:19:43.72427', '10', 'PROMPT', '3', '4', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (220, '256776000954', '45018283', '2014-01-30 16:20:18.99865', '10', 'PROMPT', '3', '4', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (221, '256776500031', '11493024', '2014-01-31 13:16:43.04555', '2', 'MENU', '2', '2', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (222, '256776500031', '14495414', '2014-01-31 13:17:42.949453', '6', 'PROMPT', '2', '2', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (223, '256776500031', '31498436', '2014-01-31 13:18:58.964468', '1', 'MENU', '1', '1', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (224, '256772689197', '6499856', '2014-01-31 13:19:34.117107', '10', 'PROMPT', '3', '4', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (225, '256776500031', '40505769', '2014-01-31 13:22:07.577256', '9', 'PROMPT', '1', '1', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (226, '256772833261', '39692444', '2014-02-08 15:40:06.7588', '6', 'PROMPT', '2', '2', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (227, '256772833261', '57695320', '2014-02-08 15:41:25.348679', '10', 'PROMPT', '3', '4', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (228, '256772689197', '5914068', '2014-02-08 17:25:32.890039', '7', 'PROMPT', '1', '1', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (229, '256772592799', '46688985', '2014-02-10 09:19:01.097667', '6', 'PROMPT', '2', '2', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (230, '256772592799', '37692967', '2014-02-10 09:20:52.013463', '6', 'PROMPT', '2', '2', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (231, '256772592799', '33694983', '2014-02-10 09:21:48.37825', '10', 'PROMPT', '3', '4', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (232, '256772592799', '50699690', '2014-02-10 09:24:04.456019', '10', 'PROMPT', '3', '4', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (233, '256776000954', '11869462', '2014-02-11 10:20:18.855756', '6', 'PROMPT', '2', '2', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (234, '256776000954', '28220154', '2014-02-18 19:23:42.01817', '3', 'MENU', '3', '3', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (235, '256776000954', '15336013', '2014-07-23 10:22:24.176716', '3', 'MENU', '3', '3', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (236, '256776000954', '28336513', '2014-07-23 10:22:33.676942', '3', 'MENU', '3', '3', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (237, '256776000954', '17349797', '2014-07-23 10:28:22.413212', '3', 'MENU', '3', '3', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (238, '256776000954', '59961216', '2014-07-23 14:49:06.140123', '3', 'MENU', '3', '3', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (239, '256776000954', '23243142', '2014-07-27 10:03:23.246075', '3', 'MENU', '3', '3', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (240, '256776000954', '55244761', '2014-07-27 10:03:31.639836', '3', 'MENU', '3', '3', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (241, '256776000954', '28283221', '2014-08-01 09:12:43.890749', '3', 'MENU', '3', '3', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (242, '256704008821', '34518', '2014-08-04 14:33:43.175872', '6', 'PROMPT', '2', '2', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (243, '256704008821', '34523', '2014-08-04 14:36:09.170886', '3', 'MENU', '3', '3', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (244, '256776000954', '31958757', '2014-08-04 14:36:11.670075', '10', 'PROMPT', '3', '4', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (245, '256704008821', '34534', '2014-08-04 14:36:43.552611', '3', 'MENU', '3', '3', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (246, '256704008821', '34550', '2014-08-04 14:37:06.01425', '9', 'PROMPT', '1', '1', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (247, '256776000954', '43853909', '2014-08-05 17:41:31.961412', '10', 'PROMPT', '3', '4', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (248, '256772689197', '50899988', '2014-08-05 17:57:42.222427', '7', 'PROMPT', '1', '1', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (249, '256772689197', '17909690', '2014-08-05 18:01:05.646674', '3', 'PROMPT', '1', '1', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (250, '256782957021', '27520796', '2014-08-06 09:21:21.274177', '6', 'PROMPT', '2', '2', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (251, '256782957021', '7526389', '2014-08-06 09:24:00.49169', '10', 'PROMPT', '3', '4', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (252, '256701613606', '39381', '2014-08-06 09:28:14.921179', '6', 'PROMPT', '2', '2', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (253, '256701613606', '39390', '2014-08-06 09:29:42.238579', '2', 'PROMPT', '1', '1', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (254, '256782779275', '51547171', '2014-08-06 09:33:44.668436', '6', 'PROMPT', '2', '2', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (255, '256782779275', '37548848', '2014-08-06 09:34:31.543883', '3', 'PROMPT', '1', '1', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (256, '256782779275', '25552745', '2014-08-06 09:36:21.787449', '9', 'PROMPT', '1', '1', 1);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (257, '256704008821', 's1r6197p', '2014-10-05 12:12:33.997', '1463', 'PROMPT', '109', '109', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (258, '256704008821', 'al3rgpfl', '2014-10-05 12:14:32.232', '1466', 'PROMPT', '109', '109', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (259, '256704008821', 'b67stil6', '2014-10-05 12:17:01.756', '1466', 'PROMPT', '109', '109', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (260, '256704008821', 'mgsk2ul1', '2014-10-05 12:17:14.764', '1463', 'PROMPT', '109', '109', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (261, '256704008821', '9vf6ehrr', '2014-10-05 12:17:35.451', '1469', 'PROMPT', '109', '109', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (262, '256704008821', 'vlic6ig', '2014-10-05 12:19:44.829', '1469', 'PROMPT', '109', '109', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (263, '256704008821', 'p04arbph', '2014-10-05 12:22:00.024', '1469', 'PROMPT', '109', '109', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (264, '256704008821', 'e8cu71l8', '2014-10-05 12:24:07.233', '1469', 'PROMPT', '109', '109', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (265, '256704008821', 'u7hac0pj', '2014-10-05 12:26:15.795', '1469', 'PROMPT', '109', '109', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (266, '256704008821', '7k30iejs', '2014-10-05 12:30:20.703', '1469', 'PROMPT', '109', '109', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (267, '256704008821', '923q5tc6', '2014-10-05 12:32:13.18', '1469', 'PROMPT', '109', '109', 0);
INSERT INTO ussd_sessions (id, phone_number, session_id, "time", status, status_type, root_menu_id, last_menu_id, leaf_state) VALUES (268, '256704008821', '53dkbssr', '2014-10-05 12:36:14.346', '1474', 'PROMPT', '110', '110', 0);


--
-- Name: ussd_sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ussd_sessions_id_seq', 268, false);


--
-- Data for Name: ussd_variables; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('10001657', '256776000954', 'NEWPIN1', '0000', '2013-11-26 23:19:35.425411');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('10001657', '256776000954', 'NEWPIN2', '0000', '2013-11-26 23:19:40.836888');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('10001657', '256776000954', 'OLDPIN', '1234', '2013-11-26 23:19:29.441766');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('1039905', '256775490728', 'NEWPIN1', '2288', '2013-11-28 11:00:51.342797');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('1039905', '256775490728', 'NEWPIN2', '2288', '2013-11-28 11:00:59.482985');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('1039905', '256775490728', 'OLDPIN', '4163', '2013-11-28 11:00:18.504497');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('10551744', '256772505641', 'NEWPIN1', '1111', '2014-01-07 11:56:07.592952');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('10551744', '256772505641', 'NEWPIN2', '1111', '2014-01-07 11:56:16.772038');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('10551744', '256772505641', 'OLDPIN', '7530', '2014-01-07 11:55:58.300812');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('11439676', '256392613579', 'PAYERNUMBER', '0772676051', '2013-11-27 09:51:48.813146');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('11439676', '256392613579', 'PIN', '0222', '2013-11-27 09:52:02.732177');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('11439676', '256392613579', 'STICKERNUMBER', '2030', '2013-11-27 09:51:29.572201');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('11869462', '256776000954', 'NEWPIN1', '1234', '2014-02-11 10:20:55.650635');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('11869462', '256776000954', 'NEWPIN2', '1234', '2014-02-11 10:21:01.430309');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('11869462', '256776000954', 'OLDPIN', '5863', '2014-02-11 10:20:51.175321');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('11882565', '256776500031', 'CARREG', '0000', '2013-11-26 16:47:22.567039');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('13057800', '256392613579', 'PAYERNUMBER', '0776500031', '2013-11-26 18:29:53.7537');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('13057800', '256392613579', 'PIN', '0222', '2013-11-26 18:30:04.143232');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('13057800', '256392613579', 'STICKERNUMBER', '2029', '2013-11-26 18:29:39.703389');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('13223567', '256772592799', 'CARREG', '7777', '2013-11-28 08:33:29.772925');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('14495414', '256776500031', 'NEWPIN1', '1234', '2014-01-31 13:18:21.042092');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('14495414', '256776500031', 'NEWPIN2', '1234', '2014-01-31 13:18:31.071264');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('14495414', '256776500031', 'OLDPIN', '4836', '2014-01-31 13:18:09.268057');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('15544216', '256776000954', 'PAYERNUMBER', '777777777', '2013-11-27 10:45:30.661051');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('15544216', '256776000954', 'PIN', '1234', '2013-11-27 10:45:36.080894');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('15544216', '256776000954', 'STICKERNUMBER', '2031', '2013-11-27 10:45:24.743242');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('16319269', '256772592799', 'CARREG', 'Uaf 229h', '2013-11-28 09:29:10.670784');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('16331818', '256775490728', 'PAYERNUMBER', '0782020165', '2013-11-29 11:12:52.133459');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('16331818', '256775490728', 'PIN', '2288', '2013-11-29 11:13:04.622585');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('16331818', '256775490728', 'STICKERNUMBER', '2037', '2013-11-29 11:12:23.904319');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('17307699', '256776000954', 'PAYERNUMBER', '0785666666', '2014-01-06 13:00:10.343184');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('17307699', '256776000954', 'PIN', '1234', '2014-01-06 13:00:15.104878');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('17307699', '256776000954', 'STICKERNUMBER', '8000', '2014-01-06 13:00:03.150819');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('17577625', '256782483008', 'PAYERNUMBER', '0772592799', '2013-12-17 17:00:13.861173');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('17577625', '256782483008', 'PIN', '7777', '2013-12-17 17:00:19.639372');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('17577625', '256782483008', 'STICKERNUMBER', '2040', '2013-12-17 17:00:01.746723');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('17909690', '256772689197', 'PAYERNUMBER', '0772689197', '2014-08-05 18:01:54.484036');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('17909690', '256772689197', 'STICKERNUMBER', 'uaq206s', '2014-08-05 18:01:39.286631');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('18876588', '256776500031', 'NEWPIN1', '0000', '2013-11-26 16:44:05.512798');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('18876588', '256776500031', 'NEWPIN2', '0000', '2013-11-26 16:44:15.139724');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('18876588', '256776500031', 'OLDPIN', '6333', '2013-11-26 16:43:54.076315');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('19123903', '256776000954', 'STICKERNUMBER', '2039', '2013-12-03 15:41:29.828829');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('1hlupvtl', '256704028823', 'CARREG', '3444', '2013-11-25 12:17:14.519');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('21117579', '256776000954', 'NEWPIN1', '0000', '2014-01-09 15:56:49.472383');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('21117579', '256776000954', 'NEWPIN2', '0000', '2014-01-09 15:56:54.412945');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('21117579', '256776000954', 'OLDPIN', '1234', '2014-01-09 15:56:43.822682');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('21554658', '256772592799', 'CARREG', '7777', '2013-12-17 16:50:52.536107');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('21899337', '256392613579', 'PAYERNUMBER', '0776500031', '2013-11-26 16:55:08.002776');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('21899337', '256392613579', 'PIN', '0222', '2013-11-26 16:55:16.942695');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('21899337', '256392613579', 'STICKERNUMBER', '2029', '2013-11-26 16:54:56.021271');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('22335741', '256775490728', 'PAYERNUMBER', '0782020165', '2013-11-29 11:14:45.331144');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('22335741', '256775490728', 'PIN', '2288', '2013-11-29 11:14:51.691279');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('22335741', '256775490728', 'STICKERNUMBER', '2037', '2013-11-29 11:14:30.7792');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('23545677', '256772505641', 'NEWPIN1', '1111', '2014-01-07 11:54:51.834239');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('23545677', '256772505641', 'NEWPIN2', '1111', '2014-01-07 11:55:01.790923');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('23545677', '256772505641', 'OLDPIN', '1111', '2014-01-07 11:54:41.022817');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('24536697', '256772833261', 'NEWPIN1', '1234', '2013-11-27 10:41:52.609582');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('24536697', '256772833261', 'NEWPIN2', '1234', '2013-11-27 10:41:58.19253');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('24536697', '256772833261', 'OLDPIN', '9485', '2013-11-27 10:41:44.777944');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('25311306', '256782020165', 'NEWPIN1', '8888', '2013-11-29 11:01:47.941765');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('25311306', '256782020165', 'NEWPIN2', '8888', '2013-11-29 11:01:54.391244');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('25311306', '256782020165', 'OLDPIN', '8839', '2013-11-29 11:01:39.590406');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('25322994', '256776000954', 'PAYERNUMBER', '0788888888', '2014-01-06 13:07:18.82104');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('25322994', '256776000954', 'PIN', '1234', '2014-01-06 13:07:23.550445');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('25322994', '256776000954', 'STICKERNUMBER', '9006', '2014-01-06 13:07:12.081927');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('25552745', '256782779275', 'PAYERNUMBER', '0782957021', '2014-08-06 09:37:15.986389');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('25552745', '256782779275', 'PIN', '4877', '2014-08-06 09:37:24.358662');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('25552745', '256782779275', 'STICKERNUMBER', '2043', '2014-08-06 09:36:48.61567');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('25607870', '256776500031', 'PAYERNUMBER', '0776500031', '2014-01-06 15:13:31.574411');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('25607870', '256776500031', 'PIN', '1939', '2014-01-06 15:13:44.534118');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('25607870', '256776500031', 'STICKERNUMBER', '2042', '2014-01-06 15:13:18.023728');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('26596321', '256392613579', 'PAYERNUMBER', '0772689197', '2013-11-27 11:12:03.841458');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('26596321', '256392613579', 'PIN', '0222', '2013-11-27 11:12:12.771537');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('26596321', '256392613579', 'STICKERNUMBER', '2033', '2013-11-27 11:11:52.200277');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('26603310', '256776500031', 'PAYERNUMBER', '0776500031', '2014-01-06 15:11:33.282789');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('26603310', '256776500031', 'PIN', '1939', '2014-01-06 15:11:45.450247');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('26603310', '256776500031', 'STICKERNUMBER', '2042', '2014-01-06 15:11:21.345951');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('26658888', '256772833261', 'CARREG', '1234', '2014-01-04 16:36:03.852513');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('26671435', '256776000954', 'CARREG', '2222', '2013-11-26 15:00:57.999728');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('26903555', '256392613579', 'PAYERNUMBER', '0776500031', '2013-11-26 16:57:19.711694');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('26903555', '256392613579', 'PIN', '0222', '2013-11-26 16:57:31.30651');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('26903555', '256392613579', 'STICKERNUMBER', '2029', '2013-11-26 16:57:06.470454');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('27520796', '256782957021', 'NEWPIN1', '1234', '2014-08-06 09:22:10.908134');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('27520796', '256782957021', 'NEWPIN2', '1234', '2014-08-06 09:22:22.46547');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('27520796', '256782957021', 'OLDPIN', '2532', '2014-08-06 09:21:56.727112');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('27545635', '256782483008', 'NEWPIN1', '7777', '2013-12-17 16:46:34.715542');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('27545635', '256782483008', 'NEWPIN2', '7777', '2013-12-17 16:46:40.772318');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('27545635', '256782483008', 'OLDPIN', '5707', '2013-12-17 16:46:23.807609');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('27675614', '256773356153', 'PAYERNUMBER', '777777777', '2013-11-26 15:02:59.480077');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('27675614', '256773356153', 'PIN', '1234', '2013-11-26 15:03:06.222646');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('27675614', '256773356153', 'STICKERNUMBER', '2028', '2013-11-26 15:02:51.381228');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('29585323', '256776500031', 'PAYERNUMBER', '0772505641', '2014-01-07 12:11:51.594395');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('29585323', '256776500031', 'PIN', '0000', '2014-01-07 12:12:02.002546');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('29585323', '256776500031', 'STICKERNUMBER', '2043', '2014-01-07 12:11:30.432512');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('29978919', '256772689197', 'NEWPIN1', '7070', '2014-01-30 16:03:37.830368');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('29978919', '256772689197', 'NEWPIN2', '7070', '2014-01-30 16:03:47.94048');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('29978919', '256772689197', 'OLDPIN', '5059', '2014-01-30 16:03:24.280032');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('2rfmna2o', '256704028823', 'CARREG', '1234', '2013-11-25 12:28:38.871');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('31392490', '256776500031', 'CARREG', '77777', '2013-11-27 09:27:30.422644');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('31838762', '256776000954', 'PAYERNUMBER', '0786666666', '2014-01-07 20:33:20.630592');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('31838762', '256776000954', 'PIN', '1234', '2014-01-07 20:33:29.599889');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('31838762', '256776000954', 'STICKERNUMBER', '2034', '2014-01-07 20:33:12.440129');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('31958757', '256776000954', 'CARREG', '1234', '2014-08-04 14:36:31.373842');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('32230399', '256776000954', 'PAYERNUMBER', 'g', '2014-01-26 10:19:56.940646');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('32230399', '256776000954', 'PIN', '0000', '2014-01-26 10:20:02.143722');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('32230399', '256776000954', 'STICKERNUMBER', 'ff', '2014-01-26 10:19:52.603785');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('32466087', '256392613579', 'PAYERNUMBER', '0772676051', '2013-11-27 10:05:06.613103');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('32466087', '256392613579', 'PIN', '0222', '2013-11-27 10:05:15.069303');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('32466087', '256392613579', 'STICKERNUMBER', '2031', '2013-11-27 10:04:52.778651');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('32tn4qpt', '256704028823', 'CARREG', '1234', '2013-11-25 12:37:00.647');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('33210751', '256776000954', 'NEWPIN1', '1234', '2013-12-06 19:48:15.011499');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('33210751', '256776000954', 'NEWPIN2', '1234', '2013-12-06 19:48:20.830593');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('33210751', '256776000954', 'OLDPIN', '0000', '2013-12-06 19:48:08.988784');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('33325238', '256772592799', 'CARREG', '7777', '2013-11-28 09:31:41.40561');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('33694983', '256772592799', 'CARREG', '1234', '2014-02-10 09:22:41.425619');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('33782475', '256776000954', 'PAYERNUMBER', '777777777', '2013-12-07 20:35:32.432005');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('33782475', '256776000954', 'PIN', '1234', '2013-12-07 20:35:39.094193');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('33782475', '256776000954', 'STICKERNUMBER', '2012', '2013-12-07 20:35:22.373546');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('34319252', '256782020165', 'CARREG', '8888', '2013-11-29 11:06:24.733188');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('34518', '256704008821', 'NEWPIN1', '1234', '2014-08-04 14:34:08.04204');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('34518', '256704008821', 'NEWPIN2', '1234', '2014-08-04 14:34:14.049775');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('34518', '256704008821', 'OLDPIN', '7813', '2014-08-04 14:34:00.500026');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('34550', '256704008821', 'PAYERNUMBER', '0776000954', '2014-08-04 14:38:04.276911');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('34550', '256704008821', 'PIN', '1234', '2014-08-04 14:38:10.351836');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('34550', '256704008821', 'STICKERNUMBER', '2041', '2014-08-04 14:37:49.526594');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('3699325', '256776000954', 'PAYERNUMBER', '777777777', '2013-11-27 12:02:23.390168');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('3699325', '256776000954', 'PIN', '0000', '2013-11-27 12:02:27.988946');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('3699325', '256776000954', 'STICKERNUMBER', '2031', '2013-11-27 12:02:18.089851');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('37548848', '256782779275', 'PAYERNUMBER', '0782957021', '2014-08-06 09:35:19.242621');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('37548848', '256782779275', 'PIN', '4877', '2014-08-06 09:35:29.506525');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('37548848', '256782779275', 'STICKERNUMBER', '2043', '2014-08-06 09:35:00.320075');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('37692967', '256772592799', 'NEWPIN1', '1234', '2014-02-10 09:21:22.192496');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('37692967', '256772592799', 'NEWPIN2', '1234', '2014-02-10 09:21:31.52362');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('37692967', '256772592799', 'OLDPIN', '2828', '2014-02-10 09:21:11.943276');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('38325071', '256776000954', 'CARREG', '0000', '2013-11-29 11:09:09.679209');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('38965386', '256776000954', 'NEWPIN1', '1234', '2014-01-30 15:58:07.524843');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('38965386', '256776000954', 'NEWPIN2', '1234', '2014-01-30 15:58:12.594205');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('38965386', '256776000954', 'OLDPIN', '2766', '2014-01-30 15:57:56.117112');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('39381', '256701613606', 'NEWPIN1', '1234', '2014-08-06 09:28:35.685436');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('39381', '256701613606', 'NEWPIN2', '1234', '2014-08-06 09:28:41.95423');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('39381', '256701613606', 'OLDPIN', '1897', '2014-08-06 09:28:27.940382');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('39390', '256701613606', 'STICKERNUMBER', '2043', '2014-08-06 09:30:51.085093');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('39692444', '256772833261', 'NEWPIN1', '1545', '2014-02-08 15:40:59.374131');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('39692444', '256772833261', 'NEWPIN2', '1545', '2014-02-08 15:41:06.593058');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('39692444', '256772833261', 'OLDPIN', '4834', '2014-02-08 15:40:43.425299');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('40505769', '256776500031', 'PAYERNUMBER', '0772689197', '2014-01-31 13:22:45.255691');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('40505769', '256776500031', 'PIN', '1234', '2014-01-31 13:22:55.985006');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('40505769', '256776500031', 'STICKERNUMBER', '2037', '2014-01-31 13:22:28.801628');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('4127383', '256776000954', 'PAYERNUMBER', '776000954', '2013-12-03 15:42:56.61911');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('4127383', '256776000954', 'PIN', '0000', '2013-12-03 15:43:02.116815');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('4127383', '256776000954', 'STICKERNUMBER', '2039', '2013-12-03 15:42:48.253391');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('41583582', '256776000954', 'NEWPIN1', '1234', '2013-11-26 14:17:05.732108');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('41583582', '256776000954', 'NEWPIN2', '1234', '2013-11-26 14:17:11.214774');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('41583582', '256776000954', 'OLDPIN', '4576', '2013-11-26 14:16:59.522938');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('41597029', '256776500031', 'PAYERNUMBER', '0776500031', '2014-01-06 15:08:50.880947');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('41597029', '256776500031', 'PIN', '1234', '2014-01-06 15:09:03.113024');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('41597029', '256776500031', 'STICKERNUMBER', '2042', '2014-01-06 15:08:38.595054');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('42328970', '256775490728', 'PAYERNUMBER', '2288', '2013-11-29 11:11:38.46408');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('42328970', '256775490728', 'PIN', '2288', '2013-11-29 11:11:48.862291');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('42328970', '256775490728', 'STICKERNUMBER', '2037', '2013-11-29 11:11:21.971501');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('42557273', '256772505641', 'CARREG', '1111', '2014-01-07 11:59:28.813286');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('42613113', '256776500031', 'PAYERNUMBER', '0776500031', '2014-01-06 15:15:50.603077');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('42613113', '256776500031', 'PIN', '1234', '2014-01-06 15:16:00.142859');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('42613113', '256776500031', 'STICKERNUMBER', '2042', '2014-01-06 15:15:35.445513');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('4300699', '256776000954', 'PAYERNUMBER', '0786888888', '2014-01-06 12:57:04.795389');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('4300699', '256776000954', 'PIN', '1234', '2014-01-06 12:57:09.43232');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('4300699', '256776000954', 'STICKERNUMBER', '8000', '2014-01-06 12:56:57.57314');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('43470110', '256392613579', 'PAYERNUMBER', '0772676051', '2013-11-27 10:07:18.689235');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('43470110', '256392613579', 'PIN', '0222', '2013-11-27 10:07:26.902324');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('43470110', '256392613579', 'STICKERNUMBER', '2031', '2013-11-27 10:07:03.559873');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('43738607', '256776000954', 'CARREG', '0000', '2013-12-03 08:04:49.553899');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('43853909', '256776000954', 'CARREG', '1234', '2014-08-05 17:41:52.306929');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('44214450', '256772592799', 'NEWPIN1', '7777', '2013-11-28 08:27:18.86794');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('44214450', '256772592799', 'NEWPIN2', '7777', '2013-11-28 08:27:32.848178');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('44214450', '256772592799', 'OLDPIN', '7385', '2013-11-28 08:27:06.806543');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('44635007', '256773356153', 'PAYERNUMBER', '777777777', '2013-11-26 14:43:53.590414');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('44635007', '256773356153', 'PIN', '1234', '2013-11-26 14:43:59.334396');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('44635007', '256773356153', 'STICKERNUMBER', '2012', '2013-11-26 14:43:45.459923');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('45018283', '256776000954', 'CARREG', '1234', '2014-01-30 16:20:37.083431');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('4541936', '256392613579', 'PAYERNUMBER', '0772833261', '2013-11-27 10:44:45.223132');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('4541936', '256392613579', 'PIN', '0222', '2013-11-27 10:44:54.599495');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('4541936', '256392613579', 'STICKERNUMBER', '2032', '2013-11-27 10:44:32.200247');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('45458269', '256392613579', 'PAYERNUMBER', '0772676051', '2013-11-27 10:01:24.063254');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('45458269', '256392613579', 'PIN', '0222', '2013-11-27 10:01:32.991099');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('45458269', '256392613579', 'STICKERNUMBER', '2031', '2013-11-27 10:01:05.829614');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('45545128', '256776000954', 'PAYERNUMBER', '777777777', '2013-11-27 10:46:01.194392');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('45545128', '256776000954', 'PIN', '0000', '2013-11-27 10:46:05.432461');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('45545128', '256776000954', 'STICKERNUMBER', '2031', '2013-11-27 10:45:55.021736');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('45571730', '256776500031', 'CARREG', '1234', '2014-01-06 14:58:18.692854');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('45615451', '256776500031', 'PAYERNUMBER', '0776500031', '2014-01-06 15:16:51.373045');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('45615451', '256776500031', 'PIN', '0000', '2014-01-06 15:17:07.126817');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('45615451', '256776500031', 'STICKERNUMBER', '2042', '2014-01-06 15:16:39.752652');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('46603280', '256776000954', 'NEWPIN1', '1234', '2013-11-26 14:27:13.804305');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('46603280', '256776000954', 'NEWPIN2', '1234', '2013-11-26 14:27:19.034682');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('46603280', '256776000954', 'OLDPIN', '4263', '2013-11-26 14:27:08.836485');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('46688985', '256772592799', 'NEWPIN1', '123', '2014-02-10 09:19:52.792053');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('46688985', '256772592799', 'NEWPIN2', '123', '2014-02-10 09:20:02.240142');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('46688985', '256772592799', 'OLDPIN', '288', '2014-02-10 09:19:37.404172');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('47454479', '256392613579', 'PAYERNUMBER', '0772676051', '2013-11-27 09:59:51.971187');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('47454479', '256392613579', 'PIN', '0222', '2013-11-27 10:00:07.429076');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('47454479', '256392613579', 'STICKERNUMBER', '2031', '2013-11-27 09:59:29.111479');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('47545184', '256392613579', 'PAYERNUMBER', '0772833261', '2013-11-27 10:46:22.192267');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('47545184', '256392613579', 'PIN', '0222', '2013-11-27 10:46:31.102024');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('47545184', '256392613579', 'STICKERNUMBER', '2032', '2013-11-27 10:46:09.99433');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('47562348', '256782483008', 'PAYERNUMBER', '0772592799', '2013-12-17 16:54:02.314699');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('47562348', '256782483008', 'PIN', '7777', '2013-12-17 16:54:12.553118');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('47562348', '256782483008', 'STICKERNUMBER', '2040', '2013-12-17 16:53:47.355137');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('48508439', '256776000954', 'PAYERNUMBER', '704008821', '2013-12-17 16:30:38.71831');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('48508439', '256776000954', 'PIN', '0000', '2013-12-17 16:30:43.586639');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('48508439', '256776000954', 'STICKERNUMBER', '6001', '2013-12-17 16:30:32.693332');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('48588976', '256772689197', 'CARREG', '1234', '2013-11-27 11:08:26.013009');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('48593009', '256392613579', 'PAYERNUMBER', '0772689197', '2013-11-27 11:10:20.323897');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('48593009', '256392613579', 'PIN', '0222', '2013-11-27 11:10:30.430058');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('48593009', '256392613579', 'STICKERNUMBER', '2033', '2013-11-27 11:10:07.98169');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('48879638', '256776500031', 'NEWPIN1', '0000', '2013-11-26 16:45:31.563941');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('48879638', '256776500031', 'NEWPIN2', '0000', '2013-11-26 16:45:43.720608');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('48879638', '256776500031', 'OLDPIN', '6331', '2013-11-26 16:45:20.195241');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('4890543', '256392613579', 'NEWPIN1', '0222', '2013-11-26 16:50:47.80205');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('4890543', '256392613579', 'NEWPIN2', '0222', '2013-11-26 16:51:05.003286');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('4890543', '256392613579', 'OLDPIN', '0122', '2013-11-26 16:50:33.335142');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('48982230', '256776000954', 'PAYERNUMBER', '0789664488', '2013-11-27 20:53:22.184007');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('48982230', '256776000954', 'PIN', '0000', '2013-11-27 20:53:28.40316');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('48982230', '256776000954', 'STICKERNUMBER', '2028', '2013-11-27 20:53:12.693519');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('49043533', '256776000954', 'PAYERNUMBER', '777777777', '2013-11-26 18:23:10.921319');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('49043533', '256776000954', 'PIN', '1234', '2013-11-26 18:23:16.411005');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('49043533', '256776000954', 'STICKERNUMBER', '2029', '2013-11-26 18:23:04.005549');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('5000713', '256776000954', 'PAYERNUMBER', '777777777', '2013-11-26 23:18:38.829793');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('5000713', '256776000954', 'PIN', '1234', '2013-11-26 23:18:45.044729');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('5000713', '256776000954', 'STICKERNUMBER', '2030', '2013-11-26 23:18:31.962268');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('50333136', '256772592799', 'CARREG', '7777', '2013-11-28 09:36:13.072984');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('5052926', '256392613579', 'STICKERNUMBER', '2020', '2013-11-26 18:27:39.851166');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('50699690', '256772592799', 'CARREG', '1234', '2014-02-10 09:25:05.793881');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('51051644', '256775490728', 'PAYERNUMBER', '0772592799', '2013-11-28 11:06:21.492252');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('51051644', '256775490728', 'PIN', '2288', '2013-11-28 11:06:29.150202');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('51051644', '256775490728', 'STICKERNUMBER', '2035', '2013-11-28 11:06:05.327239');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('51547171', '256782779275', 'NEWPIN1', '4877', '2014-08-06 09:34:15.099163');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('51547171', '256782779275', 'NEWPIN2', '4877', '2014-08-06 09:34:23.135542');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('51547171', '256782779275', 'OLDPIN', '3816', '2014-08-06 09:34:05.455985');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('51702994', '256776000954', 'PAYERNUMBER', '772676051', '2013-11-27 12:04:10.581732');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('51702994', '256776000954', 'PIN', '0000', '2013-11-27 12:04:15.303056');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('51702994', '256776000954', 'STICKERNUMBER', '2031', '2013-11-27 12:03:59.671482');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('51896289', '256392613579', 'PAYERNUMBER', '0776500031', '2013-11-26 16:53:40.592075');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('51896289', '256392613579', 'PIN', '0222', '2013-11-26 16:53:51.886394');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('51896289', '256392613579', 'STICKERNUMBER', '8888', '2013-11-26 16:53:25.291044');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('52875714', '256772689197', 'PAYERNUMBER', '0772689197', '2013-11-26 16:43:56.152242');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('52875714', '256772689197', 'PIN', '1234', '2013-11-26 16:44:08.715038');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('52875714', '256772689197', 'STICKERNUMBER', 'uaq', '2013-11-26 16:43:38.48277');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('52j2j03l', '256704028823', 'CARREG', '1234', '2013-11-25 12:31:15.068');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('53055795', '256775490728', 'PAYERNUMBER', '0772592799', '2013-11-28 11:08:46.594065');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('53055795', '256775490728', 'PIN', '2288', '2013-11-28 11:08:51.829809');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('53055795', '256775490728', 'STICKERNUMBER', '2035', '2013-11-28 11:08:32.768098');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('53dkbssr', '256704008821', 'NEWPIN1', '1111', '2014-10-05 12:36:20.914');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('53dkbssr', '256704008821', 'NEWPIN2', '1111', '2014-10-05 12:36:22.158');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('53dkbssr', '256704008821', 'OLDPIN', '1234', '2014-10-05 12:36:19.414');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('5404545', '256772676051', 'NEWPIN1', '3333', '2013-11-27 09:33:07.960127');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('5404545', '256772676051', 'NEWPIN2', '3333', '2013-11-27 09:33:19.062593');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('5404545', '256772676051', 'OLDPIN', '3923', '2013-11-27 09:32:45.024361');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('54061653', '256775490728', 'PAYERNUMBER', '0772592799', '2013-11-28 11:11:13.776905');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('54061653', '256775490728', 'PIN', '2288', '2013-11-28 11:11:18.646395');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('54061653', '256775490728', 'STICKERNUMBER', '2035', '2013-11-28 11:11:03.813272');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('54871804', '256772689197', 'NEWPIN1', '1234', '2013-11-26 16:41:52.550976');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('54871804', '256772689197', 'NEWPIN2', '1234', '2013-11-26 16:42:12.575836');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('54871804', '256772689197', 'OLDPIN', '0848', '2013-11-26 16:41:31.823974');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('55177898', '256775546053', 'NEWPIN1', '1986', '2013-12-17 14:09:05.363797');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('55177898', '256775546053', 'NEWPIN2', '1986', '2013-12-17 14:09:14.451648');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('55177898', '256775546053', 'OLDPIN', '1986', '2013-12-17 14:08:57.539505');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('55340487', '256775490728', 'PAYERNUMBER', '0782020165', '2013-11-29 11:17:20.692998');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('55340487', '256775490728', 'PIN', '2288', '2013-11-29 11:17:26.619635');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('55340487', '256775490728', 'STICKERNUMBER', '2037', '2013-11-29 11:17:06.073603');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('56546968', '256782957021', 'NEWPIN1', '1234', '2014-01-07 11:54:48.884748');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('56546968', '256782957021', 'NEWPIN2', '1234', '2014-01-07 11:55:00.264928');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('56546968', '256782957021', 'OLDPIN', '5684', '2014-01-07 11:54:29.103835');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('56633365', '256773356153', 'NEWPIN1', '1234', '2013-11-26 14:42:29.743992');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('56633365', '256773356153', 'NEWPIN2', '1234', '2013-11-26 14:42:35.730291');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('56633365', '256773356153', 'OLDPIN', '3675', '2013-11-26 14:42:22.509665');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('57448796', '256772676051', 'CARREG', '3333', '2013-11-27 09:56:39.012143');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('57695320', '256772833261', 'CARREG', '1545', '2014-02-08 15:42:09.474007');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('59054972', '256392613579', 'PAYERNUMBER', '0776500031', '2013-11-26 18:28:39.803979');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('59054972', '256392613579', 'PIN', '0122', '2013-11-26 18:28:58.140469');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('59054972', '256392613579', 'STICKERNUMBER', '2029', '2013-11-26 18:28:22.096502');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('6435792', '256392613579', 'PAYERNUMBER', '0772676051', '2013-11-27 09:49:46.643018');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('6435792', '256392613579', 'PIN', '0222', '2013-11-27 09:49:55.407827');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('6435792', '256392613579', 'STICKERNUMBER', '2030', '2013-11-27 09:49:28.284259');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('6499856', '256772689197', 'CARREG', '7070', '2014-01-31 13:20:23.584941');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('6aos4vu0', '256704028823', 'CARREG', '1234', '2013-11-25 12:30:44.941');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('7180694', '256775546053', 'OLDPIN', '1234', '2013-12-17 14:09:59.862844');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('72kq1i0c', '256704028823', 'CARREG', 'yes', '2013-11-25 12:26:59.384');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('7526389', '256782957021', 'CARREG', '1234', '2014-08-06 09:25:16.866631');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('7538060', '256772833261', 'CARREG', '1234', '2013-11-27 10:42:43.464357');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('7eidhriu', '256704028823', 'CARREG', 'uas6''8', '2013-11-25 12:35:28.268');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('7k30iejs', '256704008821', 'PIN', '1234', '2014-10-05 12:30:52.192');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('7k30iejs', '256704008821', 'SERIAL_NO', '0012234234', '2014-10-05 12:30:45.962');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('7k30iejs', '256704008821', 'STICKERNUMBER', '2042', '2014-10-05 12:30:35.53');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('7k30iejs', '256704008821', 'VEHICLE_OWNER_PHONE', '0774556644', '2014-10-05 12:30:50.342');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('7k30iejs', '256704008821', 'VRN', 'uav 520 j', '2014-10-05 12:30:39.709');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('923q5tc6', '256704008821', 'PIN', '1234', '2014-10-05 12:32:30.906');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('923q5tc6', '256704008821', 'SERIAL_NO', '01354234234234', '2014-10-05 12:32:24.182');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('923q5tc6', '256704008821', 'STICKERNUMBER', '2042', '2014-10-05 12:32:17.595');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('923q5tc6', '256704008821', 'VEHICLE_OWNER_PHONE', '0774889000', '2014-10-05 12:32:29.073');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('923q5tc6', '256704008821', 'VRN', 'uav 520 j', '2014-10-05 12:32:20.805');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('9413684', '256772676051', 'CARREG', '3333', '2013-11-27 09:38:06.409889');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('9431978', '256392613579', 'PAYERNUMBER', '0772676051', '2013-11-27 09:48:01.834384');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('9431978', '256392613579', 'PIN', '0222', '2013-11-27 09:48:16.211018');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('9431978', '256392613579', 'STICKERNUMBER', '2030', '2013-11-27 09:47:41.282575');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('9556072', '256782957021', 'CARREG', '1234', '2014-01-07 11:58:45.221846');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('9604981', '256776000954', 'NEWPIN1', '1234', '2014-01-06 15:12:07.045398');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('9604981', '256776000954', 'NEWPIN2', '1234', '2014-01-06 15:12:11.093836');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('9604981', '256776000954', 'OLDPIN', '5029', '2014-01-06 15:12:01.884985');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('9vf6ehrr', '256704008821', 'PIN', '1234', '2014-10-05 12:17:58.64');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('9vf6ehrr', '256704008821', 'SERIAL_NO', '0645283523274554446', '2014-10-05 12:17:51.136');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('9vf6ehrr', '256704008821', 'STICKERNUMBER', '2042', '2014-10-05 12:17:40.219');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('9vf6ehrr', '256704008821', 'VEHICLE_OWNER_PHONE', '0776998877', '2014-10-05 12:17:56.607');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('9vf6ehrr', '256704008821', 'VRN', 'uav 520 j', '2014-10-05 12:17:45.754');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('al3rgpfl', '256704008821', 'NEWPIN1', '1234', '2014-10-05 12:14:36.689');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('al3rgpfl', '256704008821', 'NEWPIN2', '1234', '2014-10-05 12:14:38.241');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('al3rgpfl', '256704008821', 'OLDPIN', '1111', '2014-10-05 12:14:35.372');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('alhvlivq', '256704028823', 'CARREG', 'uas444k', '2013-11-25 12:36:09.467');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('b2hlr5fo', '256704028823', 'CARREG', '32', '2013-11-25 12:12:00.074');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('b67stil6', '256704008821', 'NEWPIN1', '1234', '2014-10-05 12:17:07.222');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('b67stil6', '256704008821', 'NEWPIN2', '1234', '2014-10-05 12:17:08.892');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('b67stil6', '256704008821', 'OLDPIN', '1111', '2014-10-05 12:17:05.729');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('bibet3ks', '256704028823', 'CARREG', '34', '2013-11-25 12:14:15.997');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('e8cu71l8', '256704008821', 'PIN', '1234', '2014-10-05 12:24:24.439');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('e8cu71l8', '256704008821', 'SERIAL_NO', '0017354732', '2014-10-05 12:24:17.864');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('e8cu71l8', '256704008821', 'STICKERNUMBER', '2042', '2014-10-05 12:24:10.986');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('e8cu71l8', '256704008821', 'VEHICLE_OWNER_PHONE', '0775555534', '2014-10-05 12:24:22.515');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('e8cu71l8', '256704008821', 'VRN', 'uav 520 j', '2014-10-05 12:24:15.219');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('e8h0kngs', '256704028823', 'CARREG', '45', '2013-11-25 12:29:43.242');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('ijp8dhe5', '256704028823', 'CARREG', 'uas340c', '2013-11-25 12:08:06.485');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('irbul5cs', '256704028823', 'CARREG', '4', '2013-11-25 12:26:21.488');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('j6cb2e2b', '256704028823', 'CARREG', 'uas340c', '2013-11-25 12:35:38.659');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('lglbtds', '256704028823', 'CARREG', 'uap245j', '2013-11-25 14:37:50.995');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('mgsk2ul1', '256704008821', 'PIN', '1234', '2014-10-05 12:17:27.818');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('mgsk2ul1', '256704008821', 'STICKERNUMBER', '2042', '2014-10-05 12:17:19.509');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('mgsk2ul1', '256704008821', 'VRN', 'uav 520 j', '2014-10-05 12:17:24.318');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('n5saqqgi', '256704028823', 'CARREG', '1234', '2013-11-25 12:18:14.419');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('p04arbph', '256704008821', 'PIN', '1234', '2014-10-05 12:22:22.035');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('p04arbph', '256704008821', 'SERIAL_NO', '00173438463', '2014-10-05 12:22:15.228');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('p04arbph', '256704008821', 'STICKERNUMBER', '2042', '2014-10-05 12:22:06.187');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('p04arbph', '256704008821', 'VEHICLE_OWNER_PHONE', '0774555555', '2014-10-05 12:22:20.237');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('p04arbph', '256704008821', 'VRN', 'uav 520 j', '2014-10-05 12:22:10.158');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('qes4epsv', '256704028823', 'CARREG', '1234', '2013-11-25 14:39:44.229');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('rbp0hau0', '256704028823', 'CARREG', '1234', '2013-11-25 14:59:03.868');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('s1r6197p', '256704008821', 'PIN', '1111', '2014-10-05 12:12:48.438');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('s1r6197p', '256704008821', 'STICKERNUMBER', '2042', '2014-10-05 12:12:41.363');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('s1r6197p', '256704008821', 'VRN', 'uav520j', '2014-10-05 12:12:46.344');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('tbmqmrs4', '256704028823', 'CARREG', 'uap777j', '2013-11-25 14:38:52.049');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('u7hac0pj', '256704008821', 'PIN', '1234', '2014-10-05 12:26:34.798');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('u7hac0pj', '256704008821', 'SERIAL_NO', '0234673534', '2014-10-05 12:26:29.429');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('u7hac0pj', '256704008821', 'STICKERNUMBER', '2042', '2014-10-05 12:26:22.609');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('u7hac0pj', '256704008821', 'VEHICLE_OWNER_PHONE', '0776454567', '2014-10-05 12:26:33.059');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('u7hac0pj', '256704008821', 'VRN', 'uav 520 j', '2014-10-05 12:26:25.875');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('vlic6ig', '256704008821', 'PIN', '1234', '2014-10-05 12:20:04.014');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('vlic6ig', '256704008821', 'SERIAL_NO', '0532735412343543', '2014-10-05 12:19:58.179');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('vlic6ig', '256704008821', 'STICKERNUMBER', '2042', '2014-10-05 12:19:51.663');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('vlic6ig', '256704008821', 'VEHICLE_OWNER_PHONE', '0776887788', '2014-10-05 12:20:02.254');
INSERT INTO ussd_variables (session_id, phone_number, variable_name, variable_value, "time") VALUES ('vlic6ig', '256704008821', 'VRN', 'uav 520 j', '2014-10-05 12:19:54.578');


--
-- Data for Name: web_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (1, 'test ', '2014-09-17 10:26:01.62', 'LOGIN', 'USER NOT FOUND', '{"action":"login","login_password":"test123","login_username":"test "}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (2, 'johnmark', '2014-09-17 10:28:47.895', 'LOGIN', 'AUTHENTICATION SUCCESFUL', '{"action":"login","login_password":"coffee","login_username":"johnmark"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (3, 'johnmark', '2014-09-17 10:28:47.895', 'LOGIN', 'AUTHENTICATION SUCCESFUL', '{"action":"login","login_password":"coffee","login_username":"johnmark"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (4, 'johnmark', '2014-09-17 10:29:05.595', 'CHANGE_PASSWORD', 'PASSWORD HAS BEEN CHANGED SUCCESFULLY', '{"action":"change_password","current_password":"coffee","new_password1":"abc123","new_password2":"abc123"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (5, 'johnmark', '2014-09-17 10:29:16.365', 'CHANGE_PASSWORD', 'PASSWORD HAS BEEN CHANGED SUCCESFULLY', '{"action":"change_password","current_password":"abc123","new_password1":"coffee","new_password2":"coffee"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (6, 'johnmark', '2014-09-17 10:29:36.106', 'SAVE_AGENT', 'User details have been saved succesfully', '{"action":"save_agent","agentId":"5742","agentInsuranceCompany":"1","agentName":"Gary Gibson Kasekende b","agentPhone":"256782957021","agentType":"PRINTER"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (7, 'johnmark', '2014-09-17 10:29:45.189', 'SAVE_AGENT', 'User details have been saved succesfully', '{"action":"save_agent","agentId":"5744","agentInsuranceCompany":"1","agentName":"Ernest Airtel","agentPhone":"256701613606","agentType":"PRINTER"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (8, 'jndiho', '2014-09-17 12:02:38.9', 'LOGIN', 'AUTHENTICATION SUCCESFUL', '{"action":"login","login_password":"coffee","login_username":"jndiho"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (9, 'jndiho', '2014-09-17 12:02:38.911', 'LOGIN', 'AUTHENTICATION SUCCESFUL', '{"action":"login","login_password":"coffee","login_username":"jndiho"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (10, 'jndiho', '2014-09-17 12:03:21.2', 'SAVE_AGGREGATOR', 'Aggregator details have been saved succesfully', '{"action":"save_aggregator","aggregatorAccessCode":"john","aggregatorActiveStatus":"true","aggregatorEmailAddress":"johnmark@servicecops.com","aggregatorId":"8","aggregatorName":"John","aggregatorSecurityCode":"secdata"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (11, 'jndiho', '2014-09-17 12:03:28.926', 'SAVE_AGGREGATOR', 'Aggregator details have been saved succesfully', '{"action":"save_aggregator","aggregatorAccessCode":"steve","aggregatorActiveStatus":"true","aggregatorEmailAddress":"stevejobs@apple.co.uk","aggregatorId":"9","aggregatorName":"Steve j","aggregatorSecurityCode":""}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (12, 'jndiho', '2014-09-17 12:12:36.831', 'LOGIN', 'AUTHENTICATION SUCCESFUL', '{"action":"login","login_password":"coffee","login_username":"jndiho"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (13, 'jndiho', '2014-09-17 12:12:36.831', 'LOGIN', 'AUTHENTICATION SUCCESFUL', '{"action":"login","login_password":"coffee","login_username":"jndiho"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (14, 'jndiho', '2014-09-17 12:14:23.322', 'LOGIN', 'AUTHENTICATION SUCCESFUL', '{"action":"login","login_password":"coffee","login_username":"jndiho"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (15, 'jndiho', '2014-09-17 12:14:23.322', 'LOGIN', 'AUTHENTICATION SUCCESFUL', '{"action":"login","login_password":"coffee","login_username":"jndiho"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (16, 'jndiho', '2014-09-18 14:31:05.906', 'SAVE_SETTING', 'Parameter saved succesfully', '{"action":"save_setting","param_name":"INCORRECT_MOBILE_USER_PIN_COUNT","param_value":"5"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (17, 'jndiho', '2014-09-18 14:32:15.812', 'SAVE_SETTING', 'Parameter saved succesfully', '{"action":"save_setting","param_name":"INCORRECT_MOBILE_USER_PIN_COUNT","param_value":"3"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (18, 'jndiho', '2014-09-18 14:32:25.106', 'SAVE_SETTING', 'Parameter saved succesfully', '{"action":"save_setting","param_name":"SEND_EMAIL_ON_AGGREGATOR_CREATE","param_value":"NO"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (19, 'jndiho', '2014-09-18 14:32:35.663', 'SAVE_SETTING', 'Parameter saved succesfully', '{"action":"save_setting","param_name":"APPLICATION_NAME","param_value":"NEONONE Thirdparty payments interface"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (20, 'jndiho', '2014-09-18 14:33:02.091', 'SAVE_SETTING', 'Parameter saved succesfully', '{"action":"save_setting","param_name":"SERVICE_URL","param_value":"http://localhost:7001/ThirdpartyPaymentsApp/AggregatorWebServices"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (21, 'jndiho', '2014-09-18 14:33:18.887', 'SAVE_SETTING', 'Parameter saved succesfully', '{"action":"save_setting","param_name":"SERVICE_URL","param_value":"http://localhost:7002/ThirdpartyPaymentsApp/AggregatorWebServices"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (22, 'jndiho', '2014-09-18 14:33:51.644', 'SAVE_SETTING', 'Parameter saved succesfully', '{"action":"save_setting","param_name":"WEB_URL","param_value":"http://localhost:7001/ThirdpartyPaymentsApp/webaccess"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (23, 'johnmark', '2014-09-22 12:16:04.07', 'LOGIN', 'AUTHENTICATION SUCCESFUL', '{"action":"login","login_password":"coffee","login_username":"johnmark"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (24, 'johnmark', '2014-09-22 12:16:04.07', 'LOGIN', 'AUTHENTICATION SUCCESFUL', '{"action":"login","login_password":"coffee","login_username":"johnmark"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (25, 'jndiho', '2014-09-22 12:16:35.902', 'LOGIN', 'AUTHENTICATION SUCCESFUL', '{"action":"login","login_password":"coffee","login_username":"jndiho"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (26, 'jndiho', '2014-09-22 12:16:35.903', 'LOGIN', 'AUTHENTICATION SUCCESFUL', '{"action":"login","login_password":"coffee","login_username":"jndiho"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (27, 'jndiho', '2014-09-22 12:25:47.493', 'LOGIN', 'AUTHENTICATION SUCCESFUL', '{"action":"login","login_password":"coffee","login_username":"jndiho"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (28, 'jndiho', '2014-09-22 18:10:54.525', 'LOGIN', 'AUTHENTICATION SUCCESFUL', '{"action":"login","login_password":"coffee","login_username":"jndiho"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (29, 'jndiho', '2014-09-22 18:10:54.525', 'LOGIN', 'AUTHENTICATION SUCCESFUL', '{"action":"login","login_password":"coffee","login_username":"jndiho"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (30, 'uap', '2014-09-22 18:11:53.504', 'LOGIN', 'AUTHENTICATION SUCCESFUL', '{"action":"login","login_password":"coffee","login_username":"uap"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (31, 'uap', '2014-09-22 18:11:53.514', 'LOGIN', 'AUTHENTICATION SUCCESFUL', '{"action":"login","login_password":"coffee","login_username":"uap"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (32, 'uap', '2014-09-22 18:12:13.549', 'RAISE_ASSESSMENT', 'Assessment succesful', '{"action":"raise_assessment","initiatePaymentVRN":"uav719j"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (33, 'uap', '2014-10-02 09:26:13.603', 'LOGIN', 'AUTHENTICATION SUCCESFUL', '{"action":"login","login_password":"coffee","login_username":"uap"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (34, 'uap', '2014-10-02 09:26:13.603', 'LOGIN', 'AUTHENTICATION SUCCESFUL', '{"action":"login","login_password":"coffee","login_username":"uap"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (35, 'uap', '2014-10-02 09:26:31.605', 'RAISE_ASSESSMENT', 'Assessment succesful', '{"action":"raise_assessment","initiatePaymentVRN":"uav 719 j"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (36, 'uap', '2014-10-02 09:34:15.596', 'CAPTURE_PAYMENT', 'POLICY CAPTURED SUCCESFULLY. PENDING APPROVAL FROM CHECKER USER', '{"action":"capture_payment","paymentAmount":"52869","paymentCustomerEmail":"","paymentCustomerName":"John Luyima","paymentId":"","paymentInitiator":"Uap User","paymentPhone":"0714108355","paymentPolicyEndDate":"2015-10-15","paymentPolicyNumber":"PL463473423523","paymentPolicyStartDate":"2014-10-01","paymentVRN":"UAV719J","paymentVehicleDetails":"John Lu"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (37, 'johnmark', '2014-10-02 09:34:29.004', 'LOGIN', 'AUTHENTICATION SUCCESFUL', '{"action":"login","login_password":"coffee","login_username":"johnmark"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (38, 'johnmark', '2014-10-02 09:34:29.021', 'LOGIN', 'AUTHENTICATION SUCCESFUL', '{"action":"login","login_password":"coffee","login_username":"johnmark"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (39, 'jndiho', '2014-10-02 09:34:40.562', 'LOGIN', 'AUTHENTICATION SUCCESFUL', '{"action":"login","login_password":"coffee","login_username":"jndiho"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (40, 'jndiho', '2014-10-02 09:34:40.567', 'LOGIN', 'AUTHENTICATION SUCCESFUL', '{"action":"login","login_password":"coffee","login_username":"jndiho"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (41, 'uap2', '2014-10-02 09:35:38.41', 'NEW_CONSOLEUSER', 'USER HAS BEEN ADDED', '{"ConsoleUserEmailAddress":"mikhasi@gmail.com","ConsoleUserFullName":"Uap console user 2","ConsoleUserId":"","ConsoleUserInsuranceCompany":"2","ConsoleUserName":"uap2","ConsoleUserPhone":"0777777777","ConsoleUserType":"INSU_COMP_USER","action":"new_ConsoleUser"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (42, 'jndiho', '2014-10-02 09:35:54.749', 'RESET_CONSOLE_USER_PASSWORD', 'PASSWORD has been reset', '{"action":"reset_console_user_password","consoleUser_id":"13"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (43, 'uap2', '2014-10-02 09:37:09.537', 'LOGIN', 'AUTHENTICATION SUCCESFUL', '{"action":"login","login_password":"39842130","login_username":"uap2"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (44, 'uap2', '2014-10-02 09:37:18.04', 'CHANGE_PASSWORD', 'PASSWORD HAS BEEN CHANGED SUCCESFULLY', '{"action":"change_password","current_password":"39842130","new_password1":"coffee","new_password2":"coffee"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (45, 'uap2', '2014-10-02 09:37:39.027', 'APPROVE_PAYMENT', 'PAYMENT HAS BEEN APPROVED SUCCESSFULLY', '{"action":"approve_payment","paymentAmount":"52869","paymentCustomerEmail":"","paymentCustomerName":"John Luyima","paymentId":"11","paymentInitiator":"Uap User","paymentPhone":"256714108355","paymentPolicyEndDate":"2015-10-15","paymentPolicyNumber":"PL463473423523","paymentPolicyStartDate":"2014-10-01","paymentVRN":"UAV719J","paymentVehicleDetails":""}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (46, 'uap2', '2014-10-02 09:44:12.775', 'RAISE_ASSESSMENT', 'Assessment succesful', '{"action":"raise_assessment","initiatePaymentVRN":"uap833g"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (47, 'uap', '2014-10-02 11:26:46.288', 'LOGIN', 'AUTHENTICATION SUCCESFUL', '{"action":"login","login_password":"coffee","login_username":"uap"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (48, 'uap', '2014-10-02 11:26:46.288', 'LOGIN', 'AUTHENTICATION SUCCESFUL', '{"action":"login","login_password":"coffee","login_username":"uap"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (49, 'uap', '2014-10-06 17:53:08.256', 'LOGIN', 'INVALID PASSWORD SUPPLIED', '{"action":"login","login_password":"uap123","login_username":"uap"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (50, 'uap', '2014-10-06 17:53:08.256', 'LOGIN', 'INVALID PASSWORD SUPPLIED', '{"action":"login","login_password":"uap123","login_username":"uap"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (51, 'uap', '2014-10-06 17:53:12.26', 'LOGIN', 'AUTHENTICATION SUCCESFUL', '{"action":"login","login_password":"coffee","login_username":"uap"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (52, 'uap', '2014-10-06 17:53:12.26', 'LOGIN', 'AUTHENTICATION SUCCESFUL', '{"action":"login","login_password":"coffee","login_username":"uap"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (53, 'uap', '2014-10-06 17:57:44.64', 'LOGIN', 'AUTHENTICATION SUCCESFUL', '{"action":"login","login_password":"coffee","login_username":"uap"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (54, 'uap', '2014-10-06 17:57:44.64', 'LOGIN', 'AUTHENTICATION SUCCESFUL', '{"action":"login","login_password":"coffee","login_username":"uap"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (55, 'uap', '2014-10-07 17:47:22.075', 'LOGIN', 'AUTHENTICATION SUCCESFUL', '{"action":"login","login_password":"coffee","login_username":"uap"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (56, 'uap', '2014-10-07 17:47:22.075', 'LOGIN', 'AUTHENTICATION SUCCESFUL', '{"action":"login","login_password":"coffee","login_username":"uap"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (57, 'uap', '2014-10-07 18:16:08.16', 'LOGIN', 'AUTHENTICATION SUCCESFUL', '{"action":"login","login_password":"coffee","login_username":"uap"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (58, 'uap', '2014-10-07 18:16:08.16', 'LOGIN', 'AUTHENTICATION SUCCESFUL', '{"action":"login","login_password":"coffee","login_username":"uap"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (59, 'uap', '2014-10-07 20:10:27.269', 'SAVE_AGENT', 'User details have been saved succesfully', '{"action":"save_agent","agentId":"5741","agentInsuranceCompany":"2","agentName":"John Mark Luyima","agentPhone":"256704008821","agentType":"PRINTER"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (60, 'jndiho', '2014-10-07 20:12:15.781', 'LOGIN', 'AUTHENTICATION SUCCESFUL', '{"action":"login","login_password":"coffee","login_username":"jndiho"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (61, 'jndiho', '2014-10-07 20:12:15.781', 'LOGIN', 'AUTHENTICATION SUCCESFUL', '{"action":"login","login_password":"coffee","login_username":"jndiho"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (62, 'uap', '2014-10-11 18:28:59.028', 'LOGIN', 'AUTHENTICATION SUCCESFUL', '{"action":"login","login_password":"coffee","login_username":"uap"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (63, 'uap', '2014-10-11 18:28:59.028', 'LOGIN', 'AUTHENTICATION SUCCESFUL', '{"action":"login","login_password":"coffee","login_username":"uap"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (64, 'uap', '2014-10-12 19:24:53.347', 'RAISE_ASSESSMENT', 'Assessment succesful', '{"action":"raise_assessment","initiatePaymentVRN":"uav 719 j"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (65, 'uap', '2014-10-12 19:25:24.829', 'CAPTURE_PAYMENT', 'POLICY CAPTURED SUCCESFULLY. PENDING APPROVAL FROM CHECKER USER', '{"action":"capture_payment","paymentAmount":"77500","paymentCustomerEmail":"","paymentCustomerName":"John Luyima","paymentId":"","paymentInitiator":"Uap User","paymentPhone":"777777777","paymentPolicyEndDate":"2015-10-28","paymentPolicyNumber":"","paymentPolicyStartDate":"2014-10-01","paymentVRN":"UAV719J","paymentVehicleDetails":"John Lu"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (66, 'uap', '2014-10-12 19:26:09.182', 'SAVE_AGENT', 'User details have been saved succesfully', '{"action":"save_agent","agentId":"5743","agentInsuranceCompany":"2","agentName":"Ernest","agentPhone":"256773552233","agentType":"PRINTER"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (67, 'uap', '2014-10-12 19:26:21.278', 'SAVE_AGENT', 'User details have been saved succesfully', '{"action":"save_agent","agentId":"5751","agentInsuranceCompany":"2","agentName":"Kiyan Mulungi Luyima","agentPhone":"256714108355","agentType":"PRINTER"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (68, 'jndiho', '2014-10-18 14:17:18.521', 'LOGIN', 'AUTHENTICATION SUCCESFUL', '{"action":"login","login_password":"coffee","login_username":"jndiho"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (69, 'jndiho', '2014-10-18 14:17:18.521', 'LOGIN', 'AUTHENTICATION SUCCESFUL', '{"action":"login","login_password":"coffee","login_username":"jndiho"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (70, 'jndiho', '2014-10-18 14:17:30.001', 'SAVE_SETTING', 'Parameter saved succesfully', '{"action":"save_setting","param_name":"APPLICATION_NAME","param_value":"NEONONE Thirdparty payments interface"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (71, 'jndiho', '2014-10-18 14:17:30.221', 'SAVE_SETTING', 'Parameter saved succesfully', '{"action":"save_setting","param_name":"INCORRECT_AGGREGATOR_INVALID_PASSWORD_COUT","param_value":"10"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (72, 'jndiho', '2014-10-18 14:17:38.373', 'SAVE_SETTING', 'Parameter saved succesfully', '{"action":"save_setting","param_name":"INCORRECT_AGGREGATOR_INVALID_PASSWORD_COUT","param_value":"10"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (73, 'jndiho', '2014-10-18 14:17:45.905', 'SAVE_SETTING', 'Parameter saved succesfully', '{"action":"save_setting","param_name":"INCORRECT_AGGREGATOR_INVALID_PASSWORD_COUT","param_value":"20"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (74, 'jndiho', '2014-10-18 14:18:03.942', 'SAVE_SETTING', 'Parameter saved succesfully', '{"action":"save_setting","param_name":"SERVICE_URL","param_value":"http://localhost:7002/ThirdpartyPaymentsApp/AggregatorWebServices"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (75, 'jndiho', '2014-10-18 14:18:12.171', 'SAVE_SETTING', 'Parameter saved succesfully', '{"action":"save_setting","param_name":"USSDCODE","param_value":"*288*30#"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (76, 'jndiho', '2014-10-18 14:18:16.884', 'SAVE_SETTING', 'Parameter saved succesfully', '{"action":"save_setting","param_name":"USSDCODE","param_value":"*288*30#"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (77, 'jndiho', '2014-10-18 14:18:17.112', 'SAVE_SETTING', 'Parameter saved succesfully', '{"action":"save_setting","param_name":"SERVICE_URL","param_value":"http://localhost:7002/ThirdpartyPaymentsApp/AggregatorWebServices"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (78, 'jndiho', '2014-10-18 14:21:10.024', 'LOGIN', 'AUTHENTICATION SUCCESFUL', '{"action":"login","login_password":"coffee","login_username":"jndiho"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (79, 'jndiho', '2014-10-18 14:21:10.024', 'LOGIN', 'AUTHENTICATION SUCCESFUL', '{"action":"login","login_password":"coffee","login_username":"jndiho"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (80, 'jndiho', '2014-10-18 14:21:29.323', 'SAVE_SETTING', 'Parameter saved succesfully', '{"action":"save_setting","param_name":"SEND_EMAIL_ON_CONSOLE_USER_CREATE","param_value":"YES"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (81, 'jndiho', '2014-10-18 14:21:29.545', 'SAVE_SETTING', 'Parameter saved succesfully', '{"action":"save_setting","param_name":"SEND_SMS_ON_MOBILE_USER_CREATE","param_value":"YES"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (82, 'johnmark', '2015-01-15 20:53:43.74', 'LOGIN', 'INVALID PASSWORD SUPPLIED', '{"action":"login","login_password":"abc123","login_username":"johnmark"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (83, 'johnmark', '2015-01-15 20:53:50.034', 'LOGIN', 'AUTHENTICATION SUCCESFUL', '{"action":"login","login_password":"coffee","login_username":"johnmark"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (84, 'johnmark', '2015-01-15 20:55:24.484', 'LOGIN', 'AUTHENTICATION SUCCESFUL', '{"action":"login","login_password":"coffee","login_username":"johnmark"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (85, 'johnmark', '2015-01-15 20:55:24.484', 'LOGIN', 'AUTHENTICATION SUCCESFUL', '{"action":"login","login_password":"coffee","login_username":"johnmark"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (86, 'jndiho', '2015-02-16 12:34:56.127', 'LOGIN', 'INVALID PASSWORD SUPPLIED', '{"action":"login","login_password":"abc123","login_username":"jndiho"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (87, 'jndiho', '2015-02-16 12:35:01.673', 'LOGIN', 'AUTHENTICATION SUCCESFUL', '{"action":"login","login_password":"coffee","login_username":"jndiho"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (88, 'uap', '2015-02-16 12:49:27.171', 'LOGIN', 'INVALID PASSWORD SUPPLIED', '{"action":"login","login_password":"uap123","login_username":"uap"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (89, 'uap', '2015-02-16 12:49:33.336', 'LOGIN', 'INVALID PASSWORD SUPPLIED', '{"action":"login","login_password":"abc123","login_username":"uap"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (90, 'excel', '2015-02-16 12:49:39.914', 'LOGIN', 'USER NOT FOUND', '{"action":"login","login_password":"abc123","login_username":"excel"}');
INSERT INTO web_log (id, username, date, action, result, parameters) VALUES (91, 'uap', '2015-02-16 12:49:45.027', 'LOGIN', 'AUTHENTICATION SUCCESFUL', '{"action":"login","login_password":"coffee","login_username":"uap"}');


--
-- Name: web_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('web_log_id_seq', 91, false);


--
-- Name: applications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY applications
    ADD CONSTRAINT applications_pkey PRIMARY KEY (id);


--
-- Name: auth_assignment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_assignment
    ADD CONSTRAINT auth_assignment_pkey PRIMARY KEY (item_name, user_id);


--
-- Name: auth_item_child_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_item_child
    ADD CONSTRAINT auth_item_child_pkey PRIMARY KEY (parent, child);


--
-- Name: auth_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_item
    ADD CONSTRAINT auth_item_pkey PRIMARY KEY (name);


--
-- Name: auth_rule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_rule
    ADD CONSTRAINT auth_rule_pkey PRIMARY KEY (name);


--
-- Name: bulk_upload_files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bulk_upload_files
    ADD CONSTRAINT bulk_upload_files_pkey PRIMARY KEY (id);


--
-- Name: bulk_upload_records_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bulk_upload_records
    ADD CONSTRAINT bulk_upload_records_pkey PRIMARY KEY (id);


--
-- Name: console_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY console_user_groups
    ADD CONSTRAINT console_user_groups_pkey PRIMARY KEY (id);


--
-- Name: console_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY console_users
    ADD CONSTRAINT console_users_pkey PRIMARY KEY (id);


--
-- Name: inbox_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY inbox
    ADD CONSTRAINT inbox_id_key UNIQUE (id);


--
-- Name: inbox_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY inbox
    ADD CONSTRAINT inbox_pkey PRIMARY KEY (id);


--
-- Name: insurance_companies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY insurance_companies
    ADD CONSTRAINT insurance_companies_pkey PRIMARY KEY (id);


--
-- Name: insurance_payments_initiations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY insurance_payments_initiations
    ADD CONSTRAINT insurance_payments_initiations_pkey PRIMARY KEY (id);


--
-- Name: menu_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY menu_items
    ADD CONSTRAINT menu_items_pkey PRIMARY KEY (menu_item_id);


--
-- Name: menu_mappings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY menu_mappings
    ADD CONSTRAINT menu_mappings_pkey PRIMARY KEY (obo_menu_id, local_menu_id);


--
-- Name: menus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY menus
    ADD CONSTRAINT menus_pkey PRIMARY KEY (menu_id);


--
-- Name: message_outbox_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY message_outbox
    ADD CONSTRAINT message_outbox_pkey PRIMARY KEY (id);


--
-- Name: message_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY message_templates
    ADD CONSTRAINT message_templates_pkey PRIMARY KEY (id);


--
-- Name: mobile_users_phone_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY mobile_users
    ADD CONSTRAINT mobile_users_phone_number_key UNIQUE (phone_number);


--
-- Name: mobile_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY mobile_users
    ADD CONSTRAINT mobile_users_pkey PRIMARY KEY (id);


--
-- Name: motor_entity_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY motor_entity_details
    ADD CONSTRAINT motor_entity_details_pkey PRIMARY KEY (id);


--
-- Name: motor_entity_details_registration_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY motor_entity_details
    ADD CONSTRAINT motor_entity_details_registration_number_key UNIQUE (registration_number);


--
-- Name: paid_issued_stickers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY paid_issued_stickers
    ADD CONSTRAINT paid_issued_stickers_pkey PRIMARY KEY (id);


--
-- Name: payment_aggregators_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY payment_aggregators
    ADD CONSTRAINT payment_aggregators_pkey PRIMARY KEY (id);


--
-- Name: payments_received_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY payments_received
    ADD CONSTRAINT payments_received_pkey PRIMARY KEY (id);


--
-- Name: policies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY policies
    ADD CONSTRAINT policies_pkey PRIMARY KEY (id);


--
-- Name: policies_sticker_reference_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY policies
    ADD CONSTRAINT policies_sticker_reference_key UNIQUE (sticker_reference);


--
-- Name: prompts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY prompts
    ADD CONSTRAINT prompts_pkey PRIMARY KEY (id);


--
-- Name: ura_first_time_registration_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ura_first_time_registration_details
    ADD CONSTRAINT ura_first_time_registration_details_pkey PRIMARY KEY (id);


--
-- Name: ura_first_time_registration_details_registration_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ura_first_time_registration_details
    ADD CONSTRAINT ura_first_time_registration_details_registration_number_key UNIQUE (registration_number);


--
-- Name: ura_stampduty_prn_registration_details_payment_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ura_stampduty_prn_registration_details
    ADD CONSTRAINT ura_stampduty_prn_registration_details_payment_id_key UNIQUE (payment_id);


--
-- Name: ura_stampduty_prn_registration_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ura_stampduty_prn_registration_details
    ADD CONSTRAINT ura_stampduty_prn_registration_details_pkey PRIMARY KEY (id);


--
-- Name: ussd_sessions_phone_number_session_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ussd_sessions
    ADD CONSTRAINT ussd_sessions_phone_number_session_id_key UNIQUE (phone_number, session_id);


--
-- Name: ussd_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ussd_sessions
    ADD CONSTRAINT ussd_sessions_pkey PRIMARY KEY (id);


--
-- Name: web_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY web_log
    ADD CONSTRAINT web_log_pkey PRIMARY KEY (id);


--
-- Name: auth_item_type_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_item_type_idx ON auth_item USING btree (type);


--
-- Name: inbox_id_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX inbox_id_idx ON inbox USING btree (id);


--
-- Name: print_code; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX print_code ON paid_issued_stickers USING btree (print_code);


--
-- Name: session_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX session_index ON ussd_variables USING btree (session_id, phone_number);


--
-- Name: uniq_uname; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX uniq_uname ON console_users USING btree (username);


--
-- Name: auth_assignment_item_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_assignment
    ADD CONSTRAINT auth_assignment_item_name_fkey FOREIGN KEY (item_name) REFERENCES auth_item(name) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: auth_item_child_child_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_item_child
    ADD CONSTRAINT auth_item_child_child_fkey FOREIGN KEY (child) REFERENCES auth_item(name) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: auth_item_child_parent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_item_child
    ADD CONSTRAINT auth_item_child_parent_fkey FOREIGN KEY (parent) REFERENCES auth_item(name) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: auth_item_rule_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_item
    ADD CONSTRAINT auth_item_rule_name_fkey FOREIGN KEY (rule_name) REFERENCES auth_rule(name) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: menu_items_menu_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY menu_items
    ADD CONSTRAINT menu_items_menu_id_fkey FOREIGN KEY (menu_id) REFERENCES menus(menu_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: policies_insurance_company_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY policies
    ADD CONSTRAINT policies_insurance_company_fkey FOREIGN KEY (insurance_company) REFERENCES insurance_companies(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: policies_sticker_reference_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY policies
    ADD CONSTRAINT policies_sticker_reference_fkey FOREIGN KEY (sticker_reference) REFERENCES paid_issued_stickers(print_code) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--


PGDMP                      |            HelloDoc    16.1    16.1    o           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            p           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            q           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            r           1262    16737    HelloDoc    DATABASE     }   CREATE DATABASE "HelloDoc" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';
    DROP DATABASE "HelloDoc";
                postgres    false            �            1259    16852    Admin    TABLE     �  CREATE TABLE public."Admin" (
    "AdminId" integer NOT NULL,
    "AspNetUserId" character varying(128) NOT NULL,
    "FirstName" character varying(100) NOT NULL,
    "LastName" character varying(100),
    "Email" character varying(50) NOT NULL,
    "Mobile" character varying(20),
    "Address1" character varying(500),
    "Address2" character varying(500),
    "City" character varying(100),
    "RegionId" integer,
    "Zip" character varying(10),
    "AltPhone" character varying(20),
    "CreatedBy" character varying(128) NOT NULL,
    "CreatedDate" timestamp without time zone NOT NULL,
    "ModifiedBy" character varying(128),
    "ModifiedDate" timestamp without time zone,
    "Status" smallint,
    "IsDeleted" boolean,
    "RoleId" integer
);
    DROP TABLE public."Admin";
       public         heap    postgres    false            �            1259    16883    AdminRegion    TABLE     �   CREATE TABLE public."AdminRegion" (
    "AdminRegionId" integer NOT NULL,
    "AdminId" integer NOT NULL,
    "RegionId" integer NOT NULL
);
 !   DROP TABLE public."AdminRegion";
       public         heap    postgres    false            �            1259    16882    AdminRegion_AdminRegionId_seq    SEQUENCE     �   CREATE SEQUENCE public."AdminRegion_AdminRegionId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public."AdminRegion_AdminRegionId_seq";
       public          postgres    false    221            s           0    0    AdminRegion_AdminRegionId_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public."AdminRegion_AdminRegionId_seq" OWNED BY public."AdminRegion"."AdminRegionId";
          public          postgres    false    220            �            1259    16851    Admin_AdminId_seq    SEQUENCE     �   CREATE SEQUENCE public."Admin_AdminId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."Admin_AdminId_seq";
       public          postgres    false    217            t           0    0    Admin_AdminId_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public."Admin_AdminId_seq" OWNED BY public."Admin"."AdminId";
          public          postgres    false    216            �            1259    16899    AspNetRoles    TABLE     �   CREATE TABLE public."AspNetRoles" (
    "AspNetRoleId" character varying(128) NOT NULL,
    "Name" character varying(256) NOT NULL
);
 !   DROP TABLE public."AspNetRoles";
       public         heap    postgres    false            �            1259    16904    AspNetUserRoles    TABLE     }   CREATE TABLE public."AspNetUserRoles" (
    "UserId" character varying(128) NOT NULL,
    "RoleId" character varying(128)
);
 %   DROP TABLE public."AspNetUserRoles";
       public         heap    postgres    false            �            1259    16844    AspNetUsers    TABLE     �  CREATE TABLE public."AspNetUsers" (
    "AspNetUserId" character varying(128) NOT NULL,
    "UserName" character varying(256) NOT NULL,
    "PasswordHash" character varying,
    "Email" character varying(256),
    "PhoneNumber" character varying,
    "IP" character varying(20),
    "CreatedDate" timestamp without time zone NOT NULL,
    "ModifiedDate" timestamp without time zone
);
 !   DROP TABLE public."AspNetUsers";
       public         heap    postgres    false            �            1259    16921    BlockRequests    TABLE     �  CREATE TABLE public."BlockRequests" (
    "BlockRequestId" integer NOT NULL,
    "PhoneNumber" character varying(50),
    "Email" character varying(50),
    "IsActive" bit(1),
    "Reason" character varying,
    "RequestId" character varying(50) NOT NULL,
    "IP" character varying(20),
    "CreatedDate" timestamp without time zone,
    "ModifiedDate" timestamp without time zone
);
 #   DROP TABLE public."BlockRequests";
       public         heap    postgres    false            �            1259    16920     BlockRequests_BlockRequestId_seq    SEQUENCE     �   CREATE SEQUENCE public."BlockRequests_BlockRequestId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public."BlockRequests_BlockRequestId_seq";
       public          postgres    false    225            u           0    0     BlockRequests_BlockRequestId_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public."BlockRequests_BlockRequestId_seq" OWNED BY public."BlockRequests"."BlockRequestId";
          public          postgres    false    224            �            1259    16930    Business    TABLE     �  CREATE TABLE public."Business" (
    "BusinessId" integer NOT NULL,
    "Name" character varying(100) NOT NULL,
    "Address1" character varying(500),
    "Address2" character varying(500),
    "City" character varying(50),
    "RegionId" integer,
    "ZipCode" character varying(10),
    "PhoneNumber" character varying(20),
    "FaxNumber" character varying(20),
    "IsRegistered" bit(1),
    "CreatedBy" character varying(128),
    "CreatedDate" timestamp without time zone NOT NULL,
    "ModifiedBy" character varying(128),
    "ModifiedDate" timestamp without time zone,
    "Status" smallint,
    "IsDeleted" bit(1),
    "IP" character varying(20)
);
    DROP TABLE public."Business";
       public         heap    postgres    false            �            1259    16929    Business_BusinessId_seq    SEQUENCE     �   CREATE SEQUENCE public."Business_BusinessId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public."Business_BusinessId_seq";
       public          postgres    false    227            v           0    0    Business_BusinessId_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public."Business_BusinessId_seq" OWNED BY public."Business"."BusinessId";
          public          postgres    false    226            �            1259    16954    CaseTag    TABLE     o   CREATE TABLE public."CaseTag" (
    "CaseTagId" integer NOT NULL,
    "Name" character varying(50) NOT NULL
);
    DROP TABLE public."CaseTag";
       public         heap    postgres    false            �            1259    16953    CaseTag_CaseTagId_seq    SEQUENCE     �   CREATE SEQUENCE public."CaseTag_CaseTagId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public."CaseTag_CaseTagId_seq";
       public          postgres    false    229            w           0    0    CaseTag_CaseTagId_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."CaseTag_CaseTagId_seq" OWNED BY public."CaseTag"."CaseTagId";
          public          postgres    false    228            �            1259    16961 	   Concierge    TABLE     �  CREATE TABLE public."Concierge" (
    "ConciergeId" integer NOT NULL,
    "ConciergeName" character varying(100) NOT NULL,
    "Address" character varying(150),
    "Street" character varying(50) NOT NULL,
    "City" character varying(50) NOT NULL,
    "State" character varying(50) NOT NULL,
    "ZipCode" character varying(50) NOT NULL,
    "CreatedDate" timestamp without time zone NOT NULL,
    "RegionId" integer NOT NULL,
    "RoleId" character varying(20)
);
    DROP TABLE public."Concierge";
       public         heap    postgres    false            �            1259    16960    Concierge_ConciergeId_seq    SEQUENCE     �   CREATE SEQUENCE public."Concierge_ConciergeId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public."Concierge_ConciergeId_seq";
       public          postgres    false    231            x           0    0    Concierge_ConciergeId_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public."Concierge_ConciergeId_seq" OWNED BY public."Concierge"."ConciergeId";
          public          postgres    false    230            �            1259    16972    EmailLog    TABLE     8  CREATE TABLE public."EmailLog" (
    "EmailLogID" integer NOT NULL,
    "EmailTemplate" character varying NOT NULL,
    "SubjectName" character varying(200) NOT NULL,
    "EmailID" character varying(200) NOT NULL,
    "ConfirmationNumber" character varying(200),
    "FilePath" character varying,
    "RoleId" integer,
    "RequestId" integer,
    "AdminId" integer,
    "PhysicianId" integer,
    "CreateDate" timestamp without time zone NOT NULL,
    "SentDate" timestamp without time zone,
    "IsEmailSent" bit(1),
    "SentTries" integer,
    "Action" integer
);
    DROP TABLE public."EmailLog";
       public         heap    postgres    false                       1259    41321    EmailLog_EmailLogID_seq    SEQUENCE     �   ALTER TABLE public."EmailLog" ALTER COLUMN "EmailLogID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."EmailLog_EmailLogID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    232                       1259    33129    EncounterForm    TABLE     �  CREATE TABLE public."EncounterForm" (
    "EncounterFormId" integer NOT NULL,
    "RequestId" integer,
    "HistoryOfPresentIllnessOrInjury" text,
    "MedicalHistory" text,
    "Medications" text,
    "Allergies" text,
    "Temp" text,
    "HR" text,
    "RR" text,
    "BloodPressureSystolic" text,
    "BloodPressureDiastolic" text,
    "O2" text,
    "Pain" text,
    "Heent" text,
    "CV" text,
    "Chest" text,
    "ABD" text,
    "Extremeties" text,
    "Skin" text,
    "Neuro" text,
    "Other" text,
    "Diagnosis" text,
    "TreatmentPlan" text,
    "MedicationsDispensed" text,
    "Procedures" text,
    "FollowUp" text,
    "AdminId" integer,
    "PhysicianId" integer,
    "IsFinalize" boolean DEFAULT false NOT NULL
);
 #   DROP TABLE public."EncounterForm";
       public         heap    postgres    false                       1259    33128 !   EncounterForm_EncounterFormId_seq    SEQUENCE     �   CREATE SEQUENCE public."EncounterForm_EncounterFormId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public."EncounterForm_EncounterFormId_seq";
       public          postgres    false    281            y           0    0 !   EncounterForm_EncounterFormId_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public."EncounterForm_EncounterFormId_seq" OWNED BY public."EncounterForm"."EncounterFormId";
          public          postgres    false    280            �            1259    16980    HealthProfessionalType    TABLE     �   CREATE TABLE public."HealthProfessionalType" (
    "HealthProfessionalId" integer NOT NULL,
    "ProfessionName" character varying(50) NOT NULL,
    "CreatedDate" timestamp without time zone NOT NULL,
    "IsActive" bit(1),
    "IsDeleted" bit(1)
);
 ,   DROP TABLE public."HealthProfessionalType";
       public         heap    postgres    false            �            1259    16979 /   HealthProfessionalType_HealthProfessionalId_seq    SEQUENCE     �   CREATE SEQUENCE public."HealthProfessionalType_HealthProfessionalId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 H   DROP SEQUENCE public."HealthProfessionalType_HealthProfessionalId_seq";
       public          postgres    false    234            z           0    0 /   HealthProfessionalType_HealthProfessionalId_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."HealthProfessionalType_HealthProfessionalId_seq" OWNED BY public."HealthProfessionalType"."HealthProfessionalId";
          public          postgres    false    233            �            1259    16996    HealthProfessionals    TABLE     �  CREATE TABLE public."HealthProfessionals" (
    "VendorId" integer NOT NULL,
    "VendorName" character varying(100) NOT NULL,
    "Profession" integer,
    "FaxNumber" character varying(50) NOT NULL,
    "Address" character varying(150),
    "City" character varying(100),
    "State" character varying(50),
    "Zip" character varying(50),
    "RegionId" integer,
    "CreatedDate" timestamp without time zone NOT NULL,
    "ModifiedDate" timestamp without time zone,
    "PhoneNumber" character varying(100),
    "IsDeleted" bit(1),
    "IP" character varying(20),
    "Email" character varying(50),
    "BusinessContact" character varying(100)
);
 )   DROP TABLE public."HealthProfessionals";
       public         heap    postgres    false            �            1259    16995     HealthProfessionals_VendorId_seq    SEQUENCE     �   CREATE SEQUENCE public."HealthProfessionals_VendorId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public."HealthProfessionals_VendorId_seq";
       public          postgres    false    236            {           0    0     HealthProfessionals_VendorId_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public."HealthProfessionals_VendorId_seq" OWNED BY public."HealthProfessionals"."VendorId";
          public          postgres    false    235            �            1259    17010    Menu    TABLE     �   CREATE TABLE public."Menu" (
    "MenuId" integer NOT NULL,
    "Name" character varying(50) NOT NULL,
    "AccountType" smallint NOT NULL,
    "SortOrder" integer,
    CONSTRAINT "Menu_AccountType_check" CHECK (("AccountType" = ANY (ARRAY[1, 2])))
);
    DROP TABLE public."Menu";
       public         heap    postgres    false            �            1259    17009    Menu_MenuId_seq    SEQUENCE     �   CREATE SEQUENCE public."Menu_MenuId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Menu_MenuId_seq";
       public          postgres    false    238            |           0    0    Menu_MenuId_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public."Menu_MenuId_seq" OWNED BY public."Menu"."MenuId";
          public          postgres    false    237            �            1259    17018    OrderDetails    TABLE     u  CREATE TABLE public."OrderDetails" (
    "Id" integer NOT NULL,
    "VendorId" integer,
    "RequestId" integer,
    "FaxNumber" character varying(50),
    "Email" character varying(50),
    "BusinessContact" character varying(100),
    "Prescription" text,
    "NoOfRefill" integer,
    "CreatedDate" timestamp without time zone,
    "CreatedBy" character varying(100)
);
 "   DROP TABLE public."OrderDetails";
       public         heap    postgres    false            �            1259    17017    OrderDetails_Id_seq    SEQUENCE     �   CREATE SEQUENCE public."OrderDetails_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."OrderDetails_Id_seq";
       public          postgres    false    240            }           0    0    OrderDetails_Id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."OrderDetails_Id_seq" OWNED BY public."OrderDetails"."Id";
          public          postgres    false    239            �            1259    17027 	   Physician    TABLE       CREATE TABLE public."Physician" (
    "PhysicianId" integer NOT NULL,
    "AspNetUserId" character varying(128),
    "FirstName" character varying(100) NOT NULL,
    "LastName" character varying(100),
    "Email" character varying(50) NOT NULL,
    "Mobile" character varying(20),
    "MedicalLicense" character varying(500),
    "Photo" character varying(100),
    "AdminNotes" character varying(500),
    "IsAgreementDoc" bit(1),
    "IsBackgroundDoc" bit(1),
    "IsTrainingDoc" bit(1),
    "IsNonDisclosureDoc" bit(1),
    "Address1" character varying(500),
    "Address2" character varying(500),
    "City" character varying(100),
    "RegionId" integer,
    "Zip" character varying(10),
    "AltPhone" character varying(20),
    "CreatedBy" character varying(128),
    "CreatedDate" timestamp without time zone NOT NULL,
    "ModifiedBy" character varying(128),
    "ModifiedDate" timestamp without time zone,
    "Status" smallint,
    "BusinessName" character varying(100) NOT NULL,
    "BusinessWebsite" character varying(200) NOT NULL,
    "IsDeleted" bit(1),
    "RoleId" integer,
    "NPINumber" character varying(500),
    "IsLicenseDoc" bit(1),
    "Signature" character varying(100),
    "IsCredentialDoc" bit(1),
    "IsTokenGenerate" bit(1),
    "SyncEmailAddress" character varying(50)
);
    DROP TABLE public."Physician";
       public         heap    postgres    false            �            1259    17066    PhysicianLocation    TABLE     .  CREATE TABLE public."PhysicianLocation" (
    "LocationId" integer NOT NULL,
    "PhysicianId" integer NOT NULL,
    "Latitude" numeric(9,6),
    "Longitude" numeric(9,6),
    "CreatedDate" timestamp without time zone,
    "PhysicianName" character varying(50),
    "Address" character varying(500)
);
 '   DROP TABLE public."PhysicianLocation";
       public         heap    postgres    false            �            1259    17065     PhysicianLocation_LocationId_seq    SEQUENCE     �   CREATE SEQUENCE public."PhysicianLocation_LocationId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public."PhysicianLocation_LocationId_seq";
       public          postgres    false    244            ~           0    0     PhysicianLocation_LocationId_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public."PhysicianLocation_LocationId_seq" OWNED BY public."PhysicianLocation"."LocationId";
          public          postgres    false    243            �            1259    17080    PhysicianNotification    TABLE     �   CREATE TABLE public."PhysicianNotification" (
    id integer NOT NULL,
    "PhysicianId" integer NOT NULL,
    "IsNotificationStopped" bit(1) NOT NULL
);
 +   DROP TABLE public."PhysicianNotification";
       public         heap    postgres    false            �            1259    17079    PhysicianNotification_id_seq    SEQUENCE     �   CREATE SEQUENCE public."PhysicianNotification_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public."PhysicianNotification_id_seq";
       public          postgres    false    246                       0    0    PhysicianNotification_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public."PhysicianNotification_id_seq" OWNED BY public."PhysicianNotification".id;
          public          postgres    false    245            �            1259    17092    PhysicianRegion    TABLE     �   CREATE TABLE public."PhysicianRegion" (
    "PhysicianRegionId" integer NOT NULL,
    "PhysicianId" integer NOT NULL,
    "RegionId" integer NOT NULL
);
 %   DROP TABLE public."PhysicianRegion";
       public         heap    postgres    false            �            1259    17091 %   PhysicianRegion_PhysicianRegionId_seq    SEQUENCE     �   CREATE SEQUENCE public."PhysicianRegion_PhysicianRegionId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public."PhysicianRegion_PhysicianRegionId_seq";
       public          postgres    false    248            �           0    0 %   PhysicianRegion_PhysicianRegionId_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public."PhysicianRegion_PhysicianRegionId_seq" OWNED BY public."PhysicianRegion"."PhysicianRegionId";
          public          postgres    false    247            �            1259    17026    Physician_PhysicianId_seq    SEQUENCE     �   CREATE SEQUENCE public."Physician_PhysicianId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public."Physician_PhysicianId_seq";
       public          postgres    false    242            �           0    0    Physician_PhysicianId_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public."Physician_PhysicianId_seq" OWNED BY public."Physician"."PhysicianId";
          public          postgres    false    241            �            1259    16876    Region    TABLE     �   CREATE TABLE public."Region" (
    "RegionId" integer NOT NULL,
    "Name" character varying(50) NOT NULL,
    "Abbreviation" character varying(50)
);
    DROP TABLE public."Region";
       public         heap    postgres    false            �            1259    16875    Region_RegionId_seq    SEQUENCE     �   CREATE SEQUENCE public."Region_RegionId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."Region_RegionId_seq";
       public          postgres    false    219            �           0    0    Region_RegionId_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."Region_RegionId_seq" OWNED BY public."Region"."RegionId";
          public          postgres    false    218            �            1259    17132    Request    TABLE     6  CREATE TABLE public."Request" (
    "RequestId" integer NOT NULL,
    "RequestTypeId" integer NOT NULL,
    "UserId" integer,
    "FirstName" character varying(100),
    "LastName" character varying(100),
    "PhoneNumber" character varying(23),
    "Email" character varying(50),
    "Status" smallint DEFAULT 1 NOT NULL,
    "PhysicianId" integer,
    "ConfirmationNumber" character varying(20),
    "CreatedDate" timestamp without time zone NOT NULL,
    "IsDeleted" bit(1),
    "ModifiedDate" timestamp without time zone,
    "DeclinedBy" character varying(250),
    "IsUrgentEmailSent" bit(1),
    "LastWellnessDate" timestamp without time zone,
    "IsMobile" bit(1),
    "CallType" smallint,
    "CompletedByPhysician" bit(1),
    "LastReservationDate" timestamp without time zone,
    "AcceptedDate" timestamp without time zone,
    "RelationName" character varying(100),
    "CaseNumber" character varying(50),
    "IP" character varying(20),
    "CaseTag" character varying(50),
    "CaseTagPhysician" character varying(50),
    "PatientAccountId" character varying(128),
    "CreatedUserId" integer,
    CONSTRAINT "Request_RequestTypeId_check" CHECK (("RequestTypeId" = ANY (ARRAY[1, 2, 3, 4]))),
    CONSTRAINT "Request_Status_check" CHECK (("Status" = ANY (ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15])))
);
    DROP TABLE public."Request";
       public         heap    postgres    false            �            1259    17153    RequestBusiness    TABLE     �   CREATE TABLE public."RequestBusiness" (
    "RequestBusinessId" integer NOT NULL,
    "RequestId" integer NOT NULL,
    "BusinessId" integer NOT NULL,
    "IP" character varying(20)
);
 %   DROP TABLE public."RequestBusiness";
       public         heap    postgres    false            �            1259    17152 %   RequestBusiness_RequestBusinessId_seq    SEQUENCE     �   CREATE SEQUENCE public."RequestBusiness_RequestBusinessId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public."RequestBusiness_RequestBusinessId_seq";
       public          postgres    false    253            �           0    0 %   RequestBusiness_RequestBusinessId_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public."RequestBusiness_RequestBusinessId_seq" OWNED BY public."RequestBusiness"."RequestBusinessId";
          public          postgres    false    252            �            1259    17170    RequestClient    TABLE     �  CREATE TABLE public."RequestClient" (
    "RequestClientId" integer NOT NULL,
    "RequestId" integer NOT NULL,
    "FirstName" character varying(100) NOT NULL,
    "LastName" character varying(100),
    "PhoneNumber" character varying(23),
    "Location" character varying(100),
    "Address" character varying(500),
    "RegionId" integer,
    "NotiMobile" character varying(20),
    "NotiEmail" character varying(50),
    "Notes" character varying(500),
    "Email" character varying(50),
    "strMonth" character varying(20),
    "intYear" integer,
    "intDate" integer,
    "IsMobile" bit(1),
    "Street" character varying(100),
    "City" character varying(100),
    "State" character varying(100),
    "ZipCode" character varying(10),
    "CommunicationType" smallint,
    "RemindReservationCount" smallint,
    "RemindHouseCallCount" smallint,
    "IsSetFollowupSent" smallint,
    "IP" character varying(20),
    "IsReservationReminderSent" smallint,
    "Latitude" numeric(9,6),
    "Longitude" numeric(9,6)
);
 #   DROP TABLE public."RequestClient";
       public         heap    postgres    false            �            1259    17169 !   RequestClient_RequestClientId_seq    SEQUENCE     �   CREATE SEQUENCE public."RequestClient_RequestClientId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public."RequestClient_RequestClientId_seq";
       public          postgres    false    255            �           0    0 !   RequestClient_RequestClientId_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public."RequestClient_RequestClientId_seq" OWNED BY public."RequestClient"."RequestClientId";
          public          postgres    false    254                       1259    17218    RequestClosed    TABLE       CREATE TABLE public."RequestClosed" (
    "RequestClosedId" integer NOT NULL,
    "RequestId" integer NOT NULL,
    "RequestStatusLogId" integer NOT NULL,
    "PhyNotes" character varying(500),
    "ClientNotes" character varying(500),
    "IP" character varying(20)
);
 #   DROP TABLE public."RequestClosed";
       public         heap    postgres    false                       1259    17217 !   RequestClosed_RequestClosedId_seq    SEQUENCE     �   CREATE SEQUENCE public."RequestClosed_RequestClosedId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public."RequestClosed_RequestClosedId_seq";
       public          postgres    false    259            �           0    0 !   RequestClosed_RequestClosedId_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public."RequestClosed_RequestClosedId_seq" OWNED BY public."RequestClosed"."RequestClosedId";
          public          postgres    false    258                       1259    17237    RequestConcierge    TABLE     �   CREATE TABLE public."RequestConcierge" (
    "Id" integer NOT NULL,
    "RequestId" integer NOT NULL,
    "ConciergeId" integer NOT NULL,
    "IP" character varying(20)
);
 &   DROP TABLE public."RequestConcierge";
       public         heap    postgres    false                       1259    17236    RequestConcierge_Id_seq    SEQUENCE     �   CREATE SEQUENCE public."RequestConcierge_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public."RequestConcierge_Id_seq";
       public          postgres    false    261            �           0    0    RequestConcierge_Id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public."RequestConcierge_Id_seq" OWNED BY public."RequestConcierge"."Id";
          public          postgres    false    260                       1259    17254    RequestNotes    TABLE     .  CREATE TABLE public."RequestNotes" (
    "RequestNotesId" integer NOT NULL,
    "RequestId" integer NOT NULL,
    "strMonth" character varying(20),
    "intYear" integer,
    "intDate" integer,
    "PhysicianNotes" character varying(500),
    "AdminNotes" character varying(500),
    "CreatedBy" character varying(128) NOT NULL,
    "CreatedDate" timestamp without time zone NOT NULL,
    "ModifiedBy" character varying(128),
    "ModifiedDate" timestamp without time zone,
    "IP" character varying(20),
    "AdministrativeNotes" character varying(500)
);
 "   DROP TABLE public."RequestNotes";
       public         heap    postgres    false                       1259    17253    RequestNotes_RequestNotesId_seq    SEQUENCE     �   CREATE SEQUENCE public."RequestNotes_RequestNotesId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public."RequestNotes_RequestNotesId_seq";
       public          postgres    false    263            �           0    0    RequestNotes_RequestNotesId_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public."RequestNotes_RequestNotesId_seq" OWNED BY public."RequestNotes"."RequestNotesId";
          public          postgres    false    262                       1259    17189    RequestStatusLog    TABLE     �  CREATE TABLE public."RequestStatusLog" (
    "RequestStatusLogId" integer NOT NULL,
    "RequestId" integer NOT NULL,
    "Status" smallint NOT NULL,
    "PhysicianId" integer,
    "AdminId" integer,
    "TransToPhysicianId" integer,
    "Notes" character varying(500),
    "CreatedDate" timestamp without time zone NOT NULL,
    "IP" character varying(20),
    "TransToAdmin" bit(1)
);
 &   DROP TABLE public."RequestStatusLog";
       public         heap    postgres    false                        1259    17188 '   RequestStatusLog_RequestStatusLogId_seq    SEQUENCE     �   CREATE SEQUENCE public."RequestStatusLog_RequestStatusLogId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public."RequestStatusLog_RequestStatusLogId_seq";
       public          postgres    false    257            �           0    0 '   RequestStatusLog_RequestStatusLogId_seq    SEQUENCE OWNED BY     y   ALTER SEQUENCE public."RequestStatusLog_RequestStatusLogId_seq" OWNED BY public."RequestStatusLog"."RequestStatusLogId";
          public          postgres    false    256            	           1259    17268    RequestType    TABLE     w   CREATE TABLE public."RequestType" (
    "RequestTypeId" integer NOT NULL,
    "Name" character varying(50) NOT NULL
);
 !   DROP TABLE public."RequestType";
       public         heap    postgres    false                       1259    17267    RequestType_RequestTypeId_seq    SEQUENCE     �   CREATE SEQUENCE public."RequestType_RequestTypeId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public."RequestType_RequestTypeId_seq";
       public          postgres    false    265            �           0    0    RequestType_RequestTypeId_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public."RequestType_RequestTypeId_seq" OWNED BY public."RequestType"."RequestTypeId";
          public          postgres    false    264                       1259    17276    RequestWiseFile    TABLE     �  CREATE TABLE public."RequestWiseFile" (
    "RequestWiseFileID" integer NOT NULL,
    "RequestId" integer NOT NULL,
    "FileName" character varying(500) NOT NULL,
    "CreatedDate" timestamp without time zone NOT NULL,
    "PhysicianId" integer,
    "AdminId" integer,
    "DocType" smallint,
    "IsFrontSide" bit(1),
    "IsCompensation" bit(1),
    "IP" character varying(20),
    "IsFinalize" bit(1),
    "IsDeleted" bit(1),
    "IsPatientRecords" bit(1)
);
 %   DROP TABLE public."RequestWiseFile";
       public         heap    postgres    false            
           1259    17275 %   RequestWiseFile_RequestWiseFileID_seq    SEQUENCE     �   CREATE SEQUENCE public."RequestWiseFile_RequestWiseFileID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public."RequestWiseFile_RequestWiseFileID_seq";
       public          postgres    false    267            �           0    0 %   RequestWiseFile_RequestWiseFileID_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public."RequestWiseFile_RequestWiseFileID_seq" OWNED BY public."RequestWiseFile"."RequestWiseFileID";
          public          postgres    false    266            �            1259    17131    Request_RequestId_seq    SEQUENCE     �   CREATE SEQUENCE public."Request_RequestId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public."Request_RequestId_seq";
       public          postgres    false    251            �           0    0    Request_RequestId_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."Request_RequestId_seq" OWNED BY public."Request"."RequestId";
          public          postgres    false    250                       1259    17300    Role    TABLE     �  CREATE TABLE public."Role" (
    "RoleId" integer NOT NULL,
    "Name" character varying(50) NOT NULL,
    "AccountType" smallint NOT NULL,
    "CreatedBy" character varying(128) NOT NULL,
    "CreatedDate" timestamp without time zone NOT NULL,
    "ModifiedBy" character varying(128),
    "ModifiedDate" timestamp without time zone,
    "IsDeleted" bit(1) NOT NULL,
    "IP" character varying(20),
    CONSTRAINT "Role_AccountType_check" CHECK (("AccountType" = ANY (ARRAY[1, 2])))
);
    DROP TABLE public."Role";
       public         heap    postgres    false                       1259    17308    RoleMenu    TABLE     �   CREATE TABLE public."RoleMenu" (
    "RoleMenuId" integer NOT NULL,
    "RoleId" integer NOT NULL,
    "MenuId" integer NOT NULL
);
    DROP TABLE public."RoleMenu";
       public         heap    postgres    false                       1259    17307    RoleMenu_RoleMenuId_seq    SEQUENCE     �   CREATE SEQUENCE public."RoleMenu_RoleMenuId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public."RoleMenu_RoleMenuId_seq";
       public          postgres    false    271            �           0    0    RoleMenu_RoleMenuId_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public."RoleMenu_RoleMenuId_seq" OWNED BY public."RoleMenu"."RoleMenuId";
          public          postgres    false    270                       1259    17299    Role_RoleId_seq    SEQUENCE     �   CREATE SEQUENCE public."Role_RoleId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Role_RoleId_seq";
       public          postgres    false    269            �           0    0    Role_RoleId_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public."Role_RoleId_seq" OWNED BY public."Role"."RoleId";
          public          postgres    false    268                       1259    17375    SMSLog    TABLE     �  CREATE TABLE public."SMSLog" (
    "SMSLogID" numeric(9,0) NOT NULL,
    "SMSTemplate" character varying NOT NULL,
    "MobileNumber" character varying(50) NOT NULL,
    "ConfirmationNumber" character varying(200),
    "RoleId" integer,
    "AdminId" integer,
    "RequestId" integer,
    "PhysicianId" integer,
    "CreateDate" timestamp without time zone NOT NULL,
    "SentDate" timestamp without time zone,
    "IsSMSSent" bit(1),
    "SentTries" integer NOT NULL,
    "Action" integer
);
    DROP TABLE public."SMSLog";
       public         heap    postgres    false                       1259    17325    Shift    TABLE     c  CREATE TABLE public."Shift" (
    "ShiftId" integer NOT NULL,
    "PhysicianId" integer NOT NULL,
    "StartDate" date NOT NULL,
    "IsRepeat" bit(1) NOT NULL,
    "WeekDays" character(7),
    "RepeatUpto" integer,
    "CreatedBy" character varying(128) NOT NULL,
    "CreatedDate" timestamp without time zone NOT NULL,
    "IP" character varying(20)
);
    DROP TABLE public."Shift";
       public         heap    postgres    false                       1259    17342    ShiftDetail    TABLE     "  CREATE TABLE public."ShiftDetail" (
    "ShiftDetailId" integer NOT NULL,
    "ShiftId" integer NOT NULL,
    "ShiftDate" timestamp without time zone NOT NULL,
    "RegionId" integer,
    "StartTime" time without time zone NOT NULL,
    "EndTime" time without time zone NOT NULL,
    "Status" smallint NOT NULL,
    "IsDeleted" bit(1) NOT NULL,
    "ModifiedBy" character varying(128),
    "ModifiedDate" timestamp without time zone,
    "LastRunningDate" timestamp without time zone,
    "EventId" character varying(100),
    "IsSync" bit(1)
);
 !   DROP TABLE public."ShiftDetail";
       public         heap    postgres    false                       1259    17359    ShiftDetailRegion    TABLE     �   CREATE TABLE public."ShiftDetailRegion" (
    "ShiftDetailRegionId" integer NOT NULL,
    "ShiftDetailId" integer NOT NULL,
    "RegionId" integer NOT NULL,
    "IsDeleted" bit(1)
);
 '   DROP TABLE public."ShiftDetailRegion";
       public         heap    postgres    false                       1259    17358 )   ShiftDetailRegion_ShiftDetailRegionId_seq    SEQUENCE     �   CREATE SEQUENCE public."ShiftDetailRegion_ShiftDetailRegionId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public."ShiftDetailRegion_ShiftDetailRegionId_seq";
       public          postgres    false    277            �           0    0 )   ShiftDetailRegion_ShiftDetailRegionId_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE public."ShiftDetailRegion_ShiftDetailRegionId_seq" OWNED BY public."ShiftDetailRegion"."ShiftDetailRegionId";
          public          postgres    false    276                       1259    17341    ShiftDetail_ShiftDetailId_seq    SEQUENCE     �   CREATE SEQUENCE public."ShiftDetail_ShiftDetailId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public."ShiftDetail_ShiftDetailId_seq";
       public          postgres    false    275            �           0    0    ShiftDetail_ShiftDetailId_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public."ShiftDetail_ShiftDetailId_seq" OWNED BY public."ShiftDetail"."ShiftDetailId";
          public          postgres    false    274                       1259    17324    Shift_ShiftId_seq    SEQUENCE     �   CREATE SEQUENCE public."Shift_ShiftId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."Shift_ShiftId_seq";
       public          postgres    false    273            �           0    0    Shift_ShiftId_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public."Shift_ShiftId_seq" OWNED BY public."Shift"."ShiftId";
          public          postgres    false    272            �            1259    17119    User    TABLE     W  CREATE TABLE public."User" (
    "UserId" integer NOT NULL,
    "AspNetUserId" character varying(128),
    "FirstName" character varying(100) NOT NULL,
    "LastName" character varying(100),
    "Email" character varying(50) NOT NULL,
    "Mobile" character varying(20),
    "IsMobile" bit(1),
    "Street" character varying(100),
    "City" character varying(100),
    "State" character varying(100),
    "RegionId" integer,
    "ZipCode" character varying(10),
    "strMonth" character varying(20),
    "intYear" integer,
    "intDate" integer,
    "CreatedBy" character varying(128) NOT NULL,
    "CreatedDate" timestamp without time zone NOT NULL,
    "ModifiedBy" character varying(128),
    "ModifiedDate" timestamp without time zone,
    "Status" smallint,
    "IsDeleted" bit(1),
    "IP" character varying(20),
    "IsRequestWithEmail" bit(1)
);
    DROP TABLE public."User";
       public         heap    postgres    false                       1259    25070    User_UserId_seq    SEQUENCE     �   ALTER TABLE public."User" ALTER COLUMN "UserId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."User_UserId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    249            �           2604    16855    Admin AdminId    DEFAULT     t   ALTER TABLE ONLY public."Admin" ALTER COLUMN "AdminId" SET DEFAULT nextval('public."Admin_AdminId_seq"'::regclass);
 @   ALTER TABLE public."Admin" ALTER COLUMN "AdminId" DROP DEFAULT;
       public          postgres    false    217    216    217            �           2604    16886    AdminRegion AdminRegionId    DEFAULT     �   ALTER TABLE ONLY public."AdminRegion" ALTER COLUMN "AdminRegionId" SET DEFAULT nextval('public."AdminRegion_AdminRegionId_seq"'::regclass);
 L   ALTER TABLE public."AdminRegion" ALTER COLUMN "AdminRegionId" DROP DEFAULT;
       public          postgres    false    220    221    221            �           2604    16924    BlockRequests BlockRequestId    DEFAULT     �   ALTER TABLE ONLY public."BlockRequests" ALTER COLUMN "BlockRequestId" SET DEFAULT nextval('public."BlockRequests_BlockRequestId_seq"'::regclass);
 O   ALTER TABLE public."BlockRequests" ALTER COLUMN "BlockRequestId" DROP DEFAULT;
       public          postgres    false    225    224    225                        2604    16933    Business BusinessId    DEFAULT     �   ALTER TABLE ONLY public."Business" ALTER COLUMN "BusinessId" SET DEFAULT nextval('public."Business_BusinessId_seq"'::regclass);
 F   ALTER TABLE public."Business" ALTER COLUMN "BusinessId" DROP DEFAULT;
       public          postgres    false    227    226    227                       2604    16957    CaseTag CaseTagId    DEFAULT     |   ALTER TABLE ONLY public."CaseTag" ALTER COLUMN "CaseTagId" SET DEFAULT nextval('public."CaseTag_CaseTagId_seq"'::regclass);
 D   ALTER TABLE public."CaseTag" ALTER COLUMN "CaseTagId" DROP DEFAULT;
       public          postgres    false    229    228    229                       2604    16964    Concierge ConciergeId    DEFAULT     �   ALTER TABLE ONLY public."Concierge" ALTER COLUMN "ConciergeId" SET DEFAULT nextval('public."Concierge_ConciergeId_seq"'::regclass);
 H   ALTER TABLE public."Concierge" ALTER COLUMN "ConciergeId" DROP DEFAULT;
       public          postgres    false    231    230    231                       2604    33132    EncounterForm EncounterFormId    DEFAULT     �   ALTER TABLE ONLY public."EncounterForm" ALTER COLUMN "EncounterFormId" SET DEFAULT nextval('public."EncounterForm_EncounterFormId_seq"'::regclass);
 P   ALTER TABLE public."EncounterForm" ALTER COLUMN "EncounterFormId" DROP DEFAULT;
       public          postgres    false    280    281    281                       2604    16983 +   HealthProfessionalType HealthProfessionalId    DEFAULT     �   ALTER TABLE ONLY public."HealthProfessionalType" ALTER COLUMN "HealthProfessionalId" SET DEFAULT nextval('public."HealthProfessionalType_HealthProfessionalId_seq"'::regclass);
 ^   ALTER TABLE public."HealthProfessionalType" ALTER COLUMN "HealthProfessionalId" DROP DEFAULT;
       public          postgres    false    234    233    234                       2604    16999    HealthProfessionals VendorId    DEFAULT     �   ALTER TABLE ONLY public."HealthProfessionals" ALTER COLUMN "VendorId" SET DEFAULT nextval('public."HealthProfessionals_VendorId_seq"'::regclass);
 O   ALTER TABLE public."HealthProfessionals" ALTER COLUMN "VendorId" DROP DEFAULT;
       public          postgres    false    236    235    236                       2604    17013    Menu MenuId    DEFAULT     p   ALTER TABLE ONLY public."Menu" ALTER COLUMN "MenuId" SET DEFAULT nextval('public."Menu_MenuId_seq"'::regclass);
 >   ALTER TABLE public."Menu" ALTER COLUMN "MenuId" DROP DEFAULT;
       public          postgres    false    238    237    238                       2604    17021    OrderDetails Id    DEFAULT     x   ALTER TABLE ONLY public."OrderDetails" ALTER COLUMN "Id" SET DEFAULT nextval('public."OrderDetails_Id_seq"'::regclass);
 B   ALTER TABLE public."OrderDetails" ALTER COLUMN "Id" DROP DEFAULT;
       public          postgres    false    240    239    240                       2604    17030    Physician PhysicianId    DEFAULT     �   ALTER TABLE ONLY public."Physician" ALTER COLUMN "PhysicianId" SET DEFAULT nextval('public."Physician_PhysicianId_seq"'::regclass);
 H   ALTER TABLE public."Physician" ALTER COLUMN "PhysicianId" DROP DEFAULT;
       public          postgres    false    242    241    242                       2604    17069    PhysicianLocation LocationId    DEFAULT     �   ALTER TABLE ONLY public."PhysicianLocation" ALTER COLUMN "LocationId" SET DEFAULT nextval('public."PhysicianLocation_LocationId_seq"'::regclass);
 O   ALTER TABLE public."PhysicianLocation" ALTER COLUMN "LocationId" DROP DEFAULT;
       public          postgres    false    244    243    244            	           2604    17083    PhysicianNotification id    DEFAULT     �   ALTER TABLE ONLY public."PhysicianNotification" ALTER COLUMN id SET DEFAULT nextval('public."PhysicianNotification_id_seq"'::regclass);
 I   ALTER TABLE public."PhysicianNotification" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    246    245    246            
           2604    17095 !   PhysicianRegion PhysicianRegionId    DEFAULT     �   ALTER TABLE ONLY public."PhysicianRegion" ALTER COLUMN "PhysicianRegionId" SET DEFAULT nextval('public."PhysicianRegion_PhysicianRegionId_seq"'::regclass);
 T   ALTER TABLE public."PhysicianRegion" ALTER COLUMN "PhysicianRegionId" DROP DEFAULT;
       public          postgres    false    248    247    248            �           2604    16879    Region RegionId    DEFAULT     x   ALTER TABLE ONLY public."Region" ALTER COLUMN "RegionId" SET DEFAULT nextval('public."Region_RegionId_seq"'::regclass);
 B   ALTER TABLE public."Region" ALTER COLUMN "RegionId" DROP DEFAULT;
       public          postgres    false    218    219    219                       2604    17135    Request RequestId    DEFAULT     |   ALTER TABLE ONLY public."Request" ALTER COLUMN "RequestId" SET DEFAULT nextval('public."Request_RequestId_seq"'::regclass);
 D   ALTER TABLE public."Request" ALTER COLUMN "RequestId" DROP DEFAULT;
       public          postgres    false    251    250    251                       2604    17156 !   RequestBusiness RequestBusinessId    DEFAULT     �   ALTER TABLE ONLY public."RequestBusiness" ALTER COLUMN "RequestBusinessId" SET DEFAULT nextval('public."RequestBusiness_RequestBusinessId_seq"'::regclass);
 T   ALTER TABLE public."RequestBusiness" ALTER COLUMN "RequestBusinessId" DROP DEFAULT;
       public          postgres    false    253    252    253                       2604    17173    RequestClient RequestClientId    DEFAULT     �   ALTER TABLE ONLY public."RequestClient" ALTER COLUMN "RequestClientId" SET DEFAULT nextval('public."RequestClient_RequestClientId_seq"'::regclass);
 P   ALTER TABLE public."RequestClient" ALTER COLUMN "RequestClientId" DROP DEFAULT;
       public          postgres    false    255    254    255                       2604    17221    RequestClosed RequestClosedId    DEFAULT     �   ALTER TABLE ONLY public."RequestClosed" ALTER COLUMN "RequestClosedId" SET DEFAULT nextval('public."RequestClosed_RequestClosedId_seq"'::regclass);
 P   ALTER TABLE public."RequestClosed" ALTER COLUMN "RequestClosedId" DROP DEFAULT;
       public          postgres    false    259    258    259                       2604    17240    RequestConcierge Id    DEFAULT     �   ALTER TABLE ONLY public."RequestConcierge" ALTER COLUMN "Id" SET DEFAULT nextval('public."RequestConcierge_Id_seq"'::regclass);
 F   ALTER TABLE public."RequestConcierge" ALTER COLUMN "Id" DROP DEFAULT;
       public          postgres    false    260    261    261                       2604    17257    RequestNotes RequestNotesId    DEFAULT     �   ALTER TABLE ONLY public."RequestNotes" ALTER COLUMN "RequestNotesId" SET DEFAULT nextval('public."RequestNotes_RequestNotesId_seq"'::regclass);
 N   ALTER TABLE public."RequestNotes" ALTER COLUMN "RequestNotesId" DROP DEFAULT;
       public          postgres    false    263    262    263                       2604    17192 #   RequestStatusLog RequestStatusLogId    DEFAULT     �   ALTER TABLE ONLY public."RequestStatusLog" ALTER COLUMN "RequestStatusLogId" SET DEFAULT nextval('public."RequestStatusLog_RequestStatusLogId_seq"'::regclass);
 V   ALTER TABLE public."RequestStatusLog" ALTER COLUMN "RequestStatusLogId" DROP DEFAULT;
       public          postgres    false    257    256    257                       2604    17271    RequestType RequestTypeId    DEFAULT     �   ALTER TABLE ONLY public."RequestType" ALTER COLUMN "RequestTypeId" SET DEFAULT nextval('public."RequestType_RequestTypeId_seq"'::regclass);
 L   ALTER TABLE public."RequestType" ALTER COLUMN "RequestTypeId" DROP DEFAULT;
       public          postgres    false    265    264    265                       2604    17279 !   RequestWiseFile RequestWiseFileID    DEFAULT     �   ALTER TABLE ONLY public."RequestWiseFile" ALTER COLUMN "RequestWiseFileID" SET DEFAULT nextval('public."RequestWiseFile_RequestWiseFileID_seq"'::regclass);
 T   ALTER TABLE public."RequestWiseFile" ALTER COLUMN "RequestWiseFileID" DROP DEFAULT;
       public          postgres    false    266    267    267                       2604    17303    Role RoleId    DEFAULT     p   ALTER TABLE ONLY public."Role" ALTER COLUMN "RoleId" SET DEFAULT nextval('public."Role_RoleId_seq"'::regclass);
 >   ALTER TABLE public."Role" ALTER COLUMN "RoleId" DROP DEFAULT;
       public          postgres    false    269    268    269                       2604    17311    RoleMenu RoleMenuId    DEFAULT     �   ALTER TABLE ONLY public."RoleMenu" ALTER COLUMN "RoleMenuId" SET DEFAULT nextval('public."RoleMenu_RoleMenuId_seq"'::regclass);
 F   ALTER TABLE public."RoleMenu" ALTER COLUMN "RoleMenuId" DROP DEFAULT;
       public          postgres    false    271    270    271                       2604    17328    Shift ShiftId    DEFAULT     t   ALTER TABLE ONLY public."Shift" ALTER COLUMN "ShiftId" SET DEFAULT nextval('public."Shift_ShiftId_seq"'::regclass);
 @   ALTER TABLE public."Shift" ALTER COLUMN "ShiftId" DROP DEFAULT;
       public          postgres    false    272    273    273                       2604    17345    ShiftDetail ShiftDetailId    DEFAULT     �   ALTER TABLE ONLY public."ShiftDetail" ALTER COLUMN "ShiftDetailId" SET DEFAULT nextval('public."ShiftDetail_ShiftDetailId_seq"'::regclass);
 L   ALTER TABLE public."ShiftDetail" ALTER COLUMN "ShiftDetailId" DROP DEFAULT;
       public          postgres    false    274    275    275                       2604    17362 %   ShiftDetailRegion ShiftDetailRegionId    DEFAULT     �   ALTER TABLE ONLY public."ShiftDetailRegion" ALTER COLUMN "ShiftDetailRegionId" SET DEFAULT nextval('public."ShiftDetailRegion_ShiftDetailRegionId_seq"'::regclass);
 X   ALTER TABLE public."ShiftDetailRegion" ALTER COLUMN "ShiftDetailRegionId" DROP DEFAULT;
       public          postgres    false    277    276    277            +          0    16852    Admin 
   TABLE DATA             COPY public."Admin" ("AdminId", "AspNetUserId", "FirstName", "LastName", "Email", "Mobile", "Address1", "Address2", "City", "RegionId", "Zip", "AltPhone", "CreatedBy", "CreatedDate", "ModifiedBy", "ModifiedDate", "Status", "IsDeleted", "RoleId") FROM stdin;
    public          postgres    false    217   ��      /          0    16883    AdminRegion 
   TABLE DATA           O   COPY public."AdminRegion" ("AdminRegionId", "AdminId", "RegionId") FROM stdin;
    public          postgres    false    221   ��      0          0    16899    AspNetRoles 
   TABLE DATA           ?   COPY public."AspNetRoles" ("AspNetRoleId", "Name") FROM stdin;
    public          postgres    false    222   ��      1          0    16904    AspNetUserRoles 
   TABLE DATA           ?   COPY public."AspNetUserRoles" ("UserId", "RoleId") FROM stdin;
    public          postgres    false    223   ��      )          0    16844    AspNetUsers 
   TABLE DATA           �   COPY public."AspNetUsers" ("AspNetUserId", "UserName", "PasswordHash", "Email", "PhoneNumber", "IP", "CreatedDate", "ModifiedDate") FROM stdin;
    public          postgres    false    215   ¤      3          0    16921    BlockRequests 
   TABLE DATA           �   COPY public."BlockRequests" ("BlockRequestId", "PhoneNumber", "Email", "IsActive", "Reason", "RequestId", "IP", "CreatedDate", "ModifiedDate") FROM stdin;
    public          postgres    false    225   �      5          0    16930    Business 
   TABLE DATA           �   COPY public."Business" ("BusinessId", "Name", "Address1", "Address2", "City", "RegionId", "ZipCode", "PhoneNumber", "FaxNumber", "IsRegistered", "CreatedBy", "CreatedDate", "ModifiedBy", "ModifiedDate", "Status", "IsDeleted", "IP") FROM stdin;
    public          postgres    false    227   q�      7          0    16954    CaseTag 
   TABLE DATA           8   COPY public."CaseTag" ("CaseTagId", "Name") FROM stdin;
    public          postgres    false    229   ͫ      9          0    16961 	   Concierge 
   TABLE DATA           �   COPY public."Concierge" ("ConciergeId", "ConciergeName", "Address", "Street", "City", "State", "ZipCode", "CreatedDate", "RegionId", "RoleId") FROM stdin;
    public          postgres    false    231   e�      :          0    16972    EmailLog 
   TABLE DATA           �   COPY public."EmailLog" ("EmailLogID", "EmailTemplate", "SubjectName", "EmailID", "ConfirmationNumber", "FilePath", "RoleId", "RequestId", "AdminId", "PhysicianId", "CreateDate", "SentDate", "IsEmailSent", "SentTries", "Action") FROM stdin;
    public          postgres    false    232   ۬      k          0    33129    EncounterForm 
   TABLE DATA           �  COPY public."EncounterForm" ("EncounterFormId", "RequestId", "HistoryOfPresentIllnessOrInjury", "MedicalHistory", "Medications", "Allergies", "Temp", "HR", "RR", "BloodPressureSystolic", "BloodPressureDiastolic", "O2", "Pain", "Heent", "CV", "Chest", "ABD", "Extremeties", "Skin", "Neuro", "Other", "Diagnosis", "TreatmentPlan", "MedicationsDispensed", "Procedures", "FollowUp", "AdminId", "PhysicianId", "IsFinalize") FROM stdin;
    public          postgres    false    281   \�      <          0    16980    HealthProfessionalType 
   TABLE DATA           �   COPY public."HealthProfessionalType" ("HealthProfessionalId", "ProfessionName", "CreatedDate", "IsActive", "IsDeleted") FROM stdin;
    public          postgres    false    234   �      >          0    16996    HealthProfessionals 
   TABLE DATA           �   COPY public."HealthProfessionals" ("VendorId", "VendorName", "Profession", "FaxNumber", "Address", "City", "State", "Zip", "RegionId", "CreatedDate", "ModifiedDate", "PhoneNumber", "IsDeleted", "IP", "Email", "BusinessContact") FROM stdin;
    public          postgres    false    236   V�      @          0    17010    Menu 
   TABLE DATA           N   COPY public."Menu" ("MenuId", "Name", "AccountType", "SortOrder") FROM stdin;
    public          postgres    false    238   #�      B          0    17018    OrderDetails 
   TABLE DATA           �   COPY public."OrderDetails" ("Id", "VendorId", "RequestId", "FaxNumber", "Email", "BusinessContact", "Prescription", "NoOfRefill", "CreatedDate", "CreatedBy") FROM stdin;
    public          postgres    false    240   �      D          0    17027 	   Physician 
   TABLE DATA             COPY public."Physician" ("PhysicianId", "AspNetUserId", "FirstName", "LastName", "Email", "Mobile", "MedicalLicense", "Photo", "AdminNotes", "IsAgreementDoc", "IsBackgroundDoc", "IsTrainingDoc", "IsNonDisclosureDoc", "Address1", "Address2", "City", "RegionId", "Zip", "AltPhone", "CreatedBy", "CreatedDate", "ModifiedBy", "ModifiedDate", "Status", "BusinessName", "BusinessWebsite", "IsDeleted", "RoleId", "NPINumber", "IsLicenseDoc", "Signature", "IsCredentialDoc", "IsTokenGenerate", "SyncEmailAddress") FROM stdin;
    public          postgres    false    242   ��      F          0    17066    PhysicianLocation 
   TABLE DATA           �   COPY public."PhysicianLocation" ("LocationId", "PhysicianId", "Latitude", "Longitude", "CreatedDate", "PhysicianName", "Address") FROM stdin;
    public          postgres    false    244   ��      H          0    17080    PhysicianNotification 
   TABLE DATA           ]   COPY public."PhysicianNotification" (id, "PhysicianId", "IsNotificationStopped") FROM stdin;
    public          postgres    false    246   9�      J          0    17092    PhysicianRegion 
   TABLE DATA           [   COPY public."PhysicianRegion" ("PhysicianRegionId", "PhysicianId", "RegionId") FROM stdin;
    public          postgres    false    248   n�      -          0    16876    Region 
   TABLE DATA           F   COPY public."Region" ("RegionId", "Name", "Abbreviation") FROM stdin;
    public          postgres    false    219   ��      M          0    17132    Request 
   TABLE DATA           �  COPY public."Request" ("RequestId", "RequestTypeId", "UserId", "FirstName", "LastName", "PhoneNumber", "Email", "Status", "PhysicianId", "ConfirmationNumber", "CreatedDate", "IsDeleted", "ModifiedDate", "DeclinedBy", "IsUrgentEmailSent", "LastWellnessDate", "IsMobile", "CallType", "CompletedByPhysician", "LastReservationDate", "AcceptedDate", "RelationName", "CaseNumber", "IP", "CaseTag", "CaseTagPhysician", "PatientAccountId", "CreatedUserId") FROM stdin;
    public          postgres    false    251   �      O          0    17153    RequestBusiness 
   TABLE DATA           a   COPY public."RequestBusiness" ("RequestBusinessId", "RequestId", "BusinessId", "IP") FROM stdin;
    public          postgres    false    253   ��      Q          0    17170    RequestClient 
   TABLE DATA           �  COPY public."RequestClient" ("RequestClientId", "RequestId", "FirstName", "LastName", "PhoneNumber", "Location", "Address", "RegionId", "NotiMobile", "NotiEmail", "Notes", "Email", "strMonth", "intYear", "intDate", "IsMobile", "Street", "City", "State", "ZipCode", "CommunicationType", "RemindReservationCount", "RemindHouseCallCount", "IsSetFollowupSent", "IP", "IsReservationReminderSent", "Latitude", "Longitude") FROM stdin;
    public          postgres    false    255   �      U          0    17218    RequestClosed 
   TABLE DATA           �   COPY public."RequestClosed" ("RequestClosedId", "RequestId", "RequestStatusLogId", "PhyNotes", "ClientNotes", "IP") FROM stdin;
    public          postgres    false    259   v�      W          0    17237    RequestConcierge 
   TABLE DATA           T   COPY public."RequestConcierge" ("Id", "RequestId", "ConciergeId", "IP") FROM stdin;
    public          postgres    false    261   ��      Y          0    17254    RequestNotes 
   TABLE DATA           �   COPY public."RequestNotes" ("RequestNotesId", "RequestId", "strMonth", "intYear", "intDate", "PhysicianNotes", "AdminNotes", "CreatedBy", "CreatedDate", "ModifiedBy", "ModifiedDate", "IP", "AdministrativeNotes") FROM stdin;
    public          postgres    false    263   ��      S          0    17189    RequestStatusLog 
   TABLE DATA           �   COPY public."RequestStatusLog" ("RequestStatusLogId", "RequestId", "Status", "PhysicianId", "AdminId", "TransToPhysicianId", "Notes", "CreatedDate", "IP", "TransToAdmin") FROM stdin;
    public          postgres    false    257   I�      [          0    17268    RequestType 
   TABLE DATA           @   COPY public."RequestType" ("RequestTypeId", "Name") FROM stdin;
    public          postgres    false    265   c�      ]          0    17276    RequestWiseFile 
   TABLE DATA           �   COPY public."RequestWiseFile" ("RequestWiseFileID", "RequestId", "FileName", "CreatedDate", "PhysicianId", "AdminId", "DocType", "IsFrontSide", "IsCompensation", "IP", "IsFinalize", "IsDeleted", "IsPatientRecords") FROM stdin;
    public          postgres    false    267   ��      _          0    17300    Role 
   TABLE DATA           �   COPY public."Role" ("RoleId", "Name", "AccountType", "CreatedBy", "CreatedDate", "ModifiedBy", "ModifiedDate", "IsDeleted", "IP") FROM stdin;
    public          postgres    false    269    �      a          0    17308    RoleMenu 
   TABLE DATA           F   COPY public."RoleMenu" ("RoleMenuId", "RoleId", "MenuId") FROM stdin;
    public          postgres    false    271   ��      h          0    17375    SMSLog 
   TABLE DATA           �   COPY public."SMSLog" ("SMSLogID", "SMSTemplate", "MobileNumber", "ConfirmationNumber", "RoleId", "AdminId", "RequestId", "PhysicianId", "CreateDate", "SentDate", "IsSMSSent", "SentTries", "Action") FROM stdin;
    public          postgres    false    278   �      c          0    17325    Shift 
   TABLE DATA           �   COPY public."Shift" ("ShiftId", "PhysicianId", "StartDate", "IsRepeat", "WeekDays", "RepeatUpto", "CreatedBy", "CreatedDate", "IP") FROM stdin;
    public          postgres    false    273    �      e          0    17342    ShiftDetail 
   TABLE DATA           �   COPY public."ShiftDetail" ("ShiftDetailId", "ShiftId", "ShiftDate", "RegionId", "StartTime", "EndTime", "Status", "IsDeleted", "ModifiedBy", "ModifiedDate", "LastRunningDate", "EventId", "IsSync") FROM stdin;
    public          postgres    false    275   �      g          0    17359    ShiftDetailRegion 
   TABLE DATA           n   COPY public."ShiftDetailRegion" ("ShiftDetailRegionId", "ShiftDetailId", "RegionId", "IsDeleted") FROM stdin;
    public          postgres    false    277   R�      K          0    17119    User 
   TABLE DATA           3  COPY public."User" ("UserId", "AspNetUserId", "FirstName", "LastName", "Email", "Mobile", "IsMobile", "Street", "City", "State", "RegionId", "ZipCode", "strMonth", "intYear", "intDate", "CreatedBy", "CreatedDate", "ModifiedBy", "ModifiedDate", "Status", "IsDeleted", "IP", "IsRequestWithEmail") FROM stdin;
    public          postgres    false    249   ��      �           0    0    AdminRegion_AdminRegionId_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public."AdminRegion_AdminRegionId_seq"', 16, true);
          public          postgres    false    220            �           0    0    Admin_AdminId_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."Admin_AdminId_seq"', 1, false);
          public          postgres    false    216            �           0    0     BlockRequests_BlockRequestId_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public."BlockRequests_BlockRequestId_seq"', 2, true);
          public          postgres    false    224            �           0    0    Business_BusinessId_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."Business_BusinessId_seq"', 3, true);
          public          postgres    false    226            �           0    0    CaseTag_CaseTagId_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."CaseTag_CaseTagId_seq"', 2, true);
          public          postgres    false    228            �           0    0    Concierge_ConciergeId_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."Concierge_ConciergeId_seq"', 6, true);
          public          postgres    false    230            �           0    0    EmailLog_EmailLogID_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."EmailLog_EmailLogID_seq"', 2, true);
          public          postgres    false    282            �           0    0 !   EncounterForm_EncounterFormId_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public."EncounterForm_EncounterFormId_seq"', 6, true);
          public          postgres    false    280            �           0    0 /   HealthProfessionalType_HealthProfessionalId_seq    SEQUENCE SET     `   SELECT pg_catalog.setval('public."HealthProfessionalType_HealthProfessionalId_seq"', 1, false);
          public          postgres    false    233            �           0    0     HealthProfessionals_VendorId_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public."HealthProfessionals_VendorId_seq"', 9, true);
          public          postgres    false    235            �           0    0    Menu_MenuId_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Menu_MenuId_seq"', 1, false);
          public          postgres    false    237            �           0    0    OrderDetails_Id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."OrderDetails_Id_seq"', 7, true);
          public          postgres    false    239            �           0    0     PhysicianLocation_LocationId_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public."PhysicianLocation_LocationId_seq"', 1, false);
          public          postgres    false    243            �           0    0    PhysicianNotification_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public."PhysicianNotification_id_seq"', 6, true);
          public          postgres    false    245            �           0    0 %   PhysicianRegion_PhysicianRegionId_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public."PhysicianRegion_PhysicianRegionId_seq"', 22, true);
          public          postgres    false    247            �           0    0    Physician_PhysicianId_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public."Physician_PhysicianId_seq"', 13, true);
          public          postgres    false    241            �           0    0    Region_RegionId_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."Region_RegionId_seq"', 1, true);
          public          postgres    false    218            �           0    0 %   RequestBusiness_RequestBusinessId_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public."RequestBusiness_RequestBusinessId_seq"', 3, true);
          public          postgres    false    252            �           0    0 !   RequestClient_RequestClientId_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public."RequestClient_RequestClientId_seq"', 50, true);
          public          postgres    false    254            �           0    0 !   RequestClosed_RequestClosedId_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public."RequestClosed_RequestClosedId_seq"', 1, false);
          public          postgres    false    258            �           0    0    RequestConcierge_Id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public."RequestConcierge_Id_seq"', 1, false);
          public          postgres    false    260            �           0    0    RequestNotes_RequestNotesId_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public."RequestNotes_RequestNotesId_seq"', 2, true);
          public          postgres    false    262            �           0    0 '   RequestStatusLog_RequestStatusLogId_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public."RequestStatusLog_RequestStatusLogId_seq"', 48, true);
          public          postgres    false    256            �           0    0    RequestType_RequestTypeId_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public."RequestType_RequestTypeId_seq"', 1, false);
          public          postgres    false    264            �           0    0 %   RequestWiseFile_RequestWiseFileID_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public."RequestWiseFile_RequestWiseFileID_seq"', 48, true);
          public          postgres    false    266            �           0    0    Request_RequestId_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."Request_RequestId_seq"', 56, true);
          public          postgres    false    250            �           0    0    RoleMenu_RoleMenuId_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public."RoleMenu_RoleMenuId_seq"', 12, true);
          public          postgres    false    270            �           0    0    Role_RoleId_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."Role_RoleId_seq"', 4, true);
          public          postgres    false    268            �           0    0 )   ShiftDetailRegion_ShiftDetailRegionId_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public."ShiftDetailRegion_ShiftDetailRegionId_seq"', 8, true);
          public          postgres    false    276            �           0    0    ShiftDetail_ShiftDetailId_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public."ShiftDetail_ShiftDetailId_seq"', 22, true);
          public          postgres    false    274            �           0    0    Shift_ShiftId_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Shift_ShiftId_seq"', 9, true);
          public          postgres    false    272            �           0    0    User_UserId_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."User_UserId_seq"', 49, true);
          public          postgres    false    279            '           2606    16888    AdminRegion AdminRegion_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public."AdminRegion"
    ADD CONSTRAINT "AdminRegion_pkey" PRIMARY KEY ("AdminRegionId");
 J   ALTER TABLE ONLY public."AdminRegion" DROP CONSTRAINT "AdminRegion_pkey";
       public            postgres    false    221            #           2606    16859    Admin Admin_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public."Admin"
    ADD CONSTRAINT "Admin_pkey" PRIMARY KEY ("AdminId");
 >   ALTER TABLE ONLY public."Admin" DROP CONSTRAINT "Admin_pkey";
       public            postgres    false    217            )           2606    16903    AspNetRoles AspNetRoles_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public."AspNetRoles"
    ADD CONSTRAINT "AspNetRoles_pkey" PRIMARY KEY ("AspNetRoleId");
 J   ALTER TABLE ONLY public."AspNetRoles" DROP CONSTRAINT "AspNetRoles_pkey";
       public            postgres    false    222            +           2606    33122 $   AspNetUserRoles AspNetUserRoles_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public."AspNetUserRoles"
    ADD CONSTRAINT "AspNetUserRoles_pkey" PRIMARY KEY ("UserId");
 R   ALTER TABLE ONLY public."AspNetUserRoles" DROP CONSTRAINT "AspNetUserRoles_pkey";
       public            postgres    false    223            !           2606    16850    AspNetUsers AspNetUsers_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public."AspNetUsers"
    ADD CONSTRAINT "AspNetUsers_pkey" PRIMARY KEY ("AspNetUserId");
 J   ALTER TABLE ONLY public."AspNetUsers" DROP CONSTRAINT "AspNetUsers_pkey";
       public            postgres    false    215            -           2606    16928     BlockRequests BlockRequests_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public."BlockRequests"
    ADD CONSTRAINT "BlockRequests_pkey" PRIMARY KEY ("BlockRequestId");
 N   ALTER TABLE ONLY public."BlockRequests" DROP CONSTRAINT "BlockRequests_pkey";
       public            postgres    false    225            /           2606    16937    Business Business_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."Business"
    ADD CONSTRAINT "Business_pkey" PRIMARY KEY ("BusinessId");
 D   ALTER TABLE ONLY public."Business" DROP CONSTRAINT "Business_pkey";
       public            postgres    false    227            1           2606    16959    CaseTag CaseTag_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."CaseTag"
    ADD CONSTRAINT "CaseTag_pkey" PRIMARY KEY ("CaseTagId");
 B   ALTER TABLE ONLY public."CaseTag" DROP CONSTRAINT "CaseTag_pkey";
       public            postgres    false    229            3           2606    16966    Concierge Concierge_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public."Concierge"
    ADD CONSTRAINT "Concierge_pkey" PRIMARY KEY ("ConciergeId");
 F   ALTER TABLE ONLY public."Concierge" DROP CONSTRAINT "Concierge_pkey";
       public            postgres    false    231            5           2606    41314    EmailLog EmailLog_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."EmailLog"
    ADD CONSTRAINT "EmailLog_pkey" PRIMARY KEY ("EmailLogID");
 D   ALTER TABLE ONLY public."EmailLog" DROP CONSTRAINT "EmailLog_pkey";
       public            postgres    false    232            g           2606    33137     EncounterForm EncounterForm_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public."EncounterForm"
    ADD CONSTRAINT "EncounterForm_pkey" PRIMARY KEY ("EncounterFormId");
 N   ALTER TABLE ONLY public."EncounterForm" DROP CONSTRAINT "EncounterForm_pkey";
       public            postgres    false    281            7           2606    16985 2   HealthProfessionalType HealthProfessionalType_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."HealthProfessionalType"
    ADD CONSTRAINT "HealthProfessionalType_pkey" PRIMARY KEY ("HealthProfessionalId");
 `   ALTER TABLE ONLY public."HealthProfessionalType" DROP CONSTRAINT "HealthProfessionalType_pkey";
       public            postgres    false    234            9           2606    17003 ,   HealthProfessionals HealthProfessionals_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public."HealthProfessionals"
    ADD CONSTRAINT "HealthProfessionals_pkey" PRIMARY KEY ("VendorId");
 Z   ALTER TABLE ONLY public."HealthProfessionals" DROP CONSTRAINT "HealthProfessionals_pkey";
       public            postgres    false    236            ;           2606    17016    Menu Menu_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Menu"
    ADD CONSTRAINT "Menu_pkey" PRIMARY KEY ("MenuId");
 <   ALTER TABLE ONLY public."Menu" DROP CONSTRAINT "Menu_pkey";
       public            postgres    false    238            =           2606    17025    OrderDetails OrderDetails_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."OrderDetails"
    ADD CONSTRAINT "OrderDetails_pkey" PRIMARY KEY ("Id");
 L   ALTER TABLE ONLY public."OrderDetails" DROP CONSTRAINT "OrderDetails_pkey";
       public            postgres    false    240            A           2606    17073 (   PhysicianLocation PhysicianLocation_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public."PhysicianLocation"
    ADD CONSTRAINT "PhysicianLocation_pkey" PRIMARY KEY ("LocationId");
 V   ALTER TABLE ONLY public."PhysicianLocation" DROP CONSTRAINT "PhysicianLocation_pkey";
       public            postgres    false    244            C           2606    17085 0   PhysicianNotification PhysicianNotification_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public."PhysicianNotification"
    ADD CONSTRAINT "PhysicianNotification_pkey" PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public."PhysicianNotification" DROP CONSTRAINT "PhysicianNotification_pkey";
       public            postgres    false    246            E           2606    17097 $   PhysicianRegion PhysicianRegion_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public."PhysicianRegion"
    ADD CONSTRAINT "PhysicianRegion_pkey" PRIMARY KEY ("PhysicianRegionId");
 R   ALTER TABLE ONLY public."PhysicianRegion" DROP CONSTRAINT "PhysicianRegion_pkey";
       public            postgres    false    248            ?           2606    17034    Physician Physician_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public."Physician"
    ADD CONSTRAINT "Physician_pkey" PRIMARY KEY ("PhysicianId");
 F   ALTER TABLE ONLY public."Physician" DROP CONSTRAINT "Physician_pkey";
       public            postgres    false    242            %           2606    16881    Region Region_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Region"
    ADD CONSTRAINT "Region_pkey" PRIMARY KEY ("RegionId");
 @   ALTER TABLE ONLY public."Region" DROP CONSTRAINT "Region_pkey";
       public            postgres    false    219            K           2606    17158 $   RequestBusiness RequestBusiness_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public."RequestBusiness"
    ADD CONSTRAINT "RequestBusiness_pkey" PRIMARY KEY ("RequestBusinessId");
 R   ALTER TABLE ONLY public."RequestBusiness" DROP CONSTRAINT "RequestBusiness_pkey";
       public            postgres    false    253            M           2606    17177     RequestClient RequestClient_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public."RequestClient"
    ADD CONSTRAINT "RequestClient_pkey" PRIMARY KEY ("RequestClientId");
 N   ALTER TABLE ONLY public."RequestClient" DROP CONSTRAINT "RequestClient_pkey";
       public            postgres    false    255            Q           2606    17225     RequestClosed RequestClosed_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public."RequestClosed"
    ADD CONSTRAINT "RequestClosed_pkey" PRIMARY KEY ("RequestClosedId");
 N   ALTER TABLE ONLY public."RequestClosed" DROP CONSTRAINT "RequestClosed_pkey";
       public            postgres    false    259            S           2606    17242 &   RequestConcierge RequestConcierge_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public."RequestConcierge"
    ADD CONSTRAINT "RequestConcierge_pkey" PRIMARY KEY ("Id");
 T   ALTER TABLE ONLY public."RequestConcierge" DROP CONSTRAINT "RequestConcierge_pkey";
       public            postgres    false    261            U           2606    17261    RequestNotes RequestNotes_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public."RequestNotes"
    ADD CONSTRAINT "RequestNotes_pkey" PRIMARY KEY ("RequestNotesId");
 L   ALTER TABLE ONLY public."RequestNotes" DROP CONSTRAINT "RequestNotes_pkey";
       public            postgres    false    263            O           2606    17196 &   RequestStatusLog RequestStatusLog_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public."RequestStatusLog"
    ADD CONSTRAINT "RequestStatusLog_pkey" PRIMARY KEY ("RequestStatusLogId");
 T   ALTER TABLE ONLY public."RequestStatusLog" DROP CONSTRAINT "RequestStatusLog_pkey";
       public            postgres    false    257            W           2606    17273    RequestType RequestType_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public."RequestType"
    ADD CONSTRAINT "RequestType_pkey" PRIMARY KEY ("RequestTypeId");
 J   ALTER TABLE ONLY public."RequestType" DROP CONSTRAINT "RequestType_pkey";
       public            postgres    false    265            Y           2606    17283 $   RequestWiseFile RequestWiseFile_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public."RequestWiseFile"
    ADD CONSTRAINT "RequestWiseFile_pkey" PRIMARY KEY ("RequestWiseFileID");
 R   ALTER TABLE ONLY public."RequestWiseFile" DROP CONSTRAINT "RequestWiseFile_pkey";
       public            postgres    false    267            I           2606    17141    Request Request_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."Request"
    ADD CONSTRAINT "Request_pkey" PRIMARY KEY ("RequestId");
 B   ALTER TABLE ONLY public."Request" DROP CONSTRAINT "Request_pkey";
       public            postgres    false    251            ]           2606    17313    RoleMenu RoleMenu_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."RoleMenu"
    ADD CONSTRAINT "RoleMenu_pkey" PRIMARY KEY ("RoleMenuId");
 D   ALTER TABLE ONLY public."RoleMenu" DROP CONSTRAINT "RoleMenu_pkey";
       public            postgres    false    271            [           2606    17306    Role Role_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Role"
    ADD CONSTRAINT "Role_pkey" PRIMARY KEY ("RoleId");
 <   ALTER TABLE ONLY public."Role" DROP CONSTRAINT "Role_pkey";
       public            postgres    false    269            e           2606    17381    SMSLog SMSLog_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."SMSLog"
    ADD CONSTRAINT "SMSLog_pkey" PRIMARY KEY ("SMSLogID");
 @   ALTER TABLE ONLY public."SMSLog" DROP CONSTRAINT "SMSLog_pkey";
       public            postgres    false    278            c           2606    17364 (   ShiftDetailRegion ShiftDetailRegion_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY public."ShiftDetailRegion"
    ADD CONSTRAINT "ShiftDetailRegion_pkey" PRIMARY KEY ("ShiftDetailRegionId");
 V   ALTER TABLE ONLY public."ShiftDetailRegion" DROP CONSTRAINT "ShiftDetailRegion_pkey";
       public            postgres    false    277            a           2606    17347    ShiftDetail ShiftDetail_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public."ShiftDetail"
    ADD CONSTRAINT "ShiftDetail_pkey" PRIMARY KEY ("ShiftDetailId");
 J   ALTER TABLE ONLY public."ShiftDetail" DROP CONSTRAINT "ShiftDetail_pkey";
       public            postgres    false    275            _           2606    17330    Shift Shift_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public."Shift"
    ADD CONSTRAINT "Shift_pkey" PRIMARY KEY ("ShiftId");
 >   ALTER TABLE ONLY public."Shift" DROP CONSTRAINT "Shift_pkey";
       public            postgres    false    273            G           2606    17125    User User_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY ("UserId");
 <   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_pkey";
       public            postgres    false    249            h           2606    16860    Admin Admin_AspNetUserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Admin"
    ADD CONSTRAINT "Admin_AspNetUserId_fkey" FOREIGN KEY ("AspNetUserId") REFERENCES public."AspNetUsers"("AspNetUserId");
 K   ALTER TABLE ONLY public."Admin" DROP CONSTRAINT "Admin_AspNetUserId_fkey";
       public          postgres    false    217    4897    215            i           2606    16865    Admin Admin_CreatedBy_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Admin"
    ADD CONSTRAINT "Admin_CreatedBy_fkey" FOREIGN KEY ("CreatedBy") REFERENCES public."AspNetUsers"("AspNetUserId");
 H   ALTER TABLE ONLY public."Admin" DROP CONSTRAINT "Admin_CreatedBy_fkey";
       public          postgres    false    215    217    4897            j           2606    16870    Admin Admin_ModifiedBy_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Admin"
    ADD CONSTRAINT "Admin_ModifiedBy_fkey" FOREIGN KEY ("ModifiedBy") REFERENCES public."AspNetUsers"("AspNetUserId");
 I   ALTER TABLE ONLY public."Admin" DROP CONSTRAINT "Admin_ModifiedBy_fkey";
       public          postgres    false    217    215    4897            m           2606    33123 +   AspNetUserRoles AspNetUserRoles_RoleId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."AspNetUserRoles"
    ADD CONSTRAINT "AspNetUserRoles_RoleId_fkey" FOREIGN KEY ("RoleId") REFERENCES public."AspNetRoles"("AspNetRoleId") NOT VALID;
 Y   ALTER TABLE ONLY public."AspNetUserRoles" DROP CONSTRAINT "AspNetUserRoles_RoleId_fkey";
       public          postgres    false    223    4905    222            n           2606    16909 +   AspNetUserRoles AspNetUserRoles_UserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."AspNetUserRoles"
    ADD CONSTRAINT "AspNetUserRoles_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES public."AspNetUsers"("AspNetUserId");
 Y   ALTER TABLE ONLY public."AspNetUserRoles" DROP CONSTRAINT "AspNetUserRoles_UserId_fkey";
       public          postgres    false    215    4897    223            o           2606    16943     Business Business_CreatedBy_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Business"
    ADD CONSTRAINT "Business_CreatedBy_fkey" FOREIGN KEY ("CreatedBy") REFERENCES public."AspNetUsers"("AspNetUserId");
 N   ALTER TABLE ONLY public."Business" DROP CONSTRAINT "Business_CreatedBy_fkey";
       public          postgres    false    215    4897    227            p           2606    16948 !   Business Business_ModifiedBy_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Business"
    ADD CONSTRAINT "Business_ModifiedBy_fkey" FOREIGN KEY ("ModifiedBy") REFERENCES public."AspNetUsers"("AspNetUserId");
 O   ALTER TABLE ONLY public."Business" DROP CONSTRAINT "Business_ModifiedBy_fkey";
       public          postgres    false    227    4897    215            q           2606    16938    Business Business_RegionId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Business"
    ADD CONSTRAINT "Business_RegionId_fkey" FOREIGN KEY ("RegionId") REFERENCES public."Region"("RegionId");
 M   ALTER TABLE ONLY public."Business" DROP CONSTRAINT "Business_RegionId_fkey";
       public          postgres    false    219    227    4901            r           2606    16967 !   Concierge Concierge_RegionId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Concierge"
    ADD CONSTRAINT "Concierge_RegionId_fkey" FOREIGN KEY ("RegionId") REFERENCES public."Region"("RegionId");
 O   ALTER TABLE ONLY public."Concierge" DROP CONSTRAINT "Concierge_RegionId_fkey";
       public          postgres    false    4901    231    219            �           2606    33143 (   EncounterForm EncounterForm_AdminId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."EncounterForm"
    ADD CONSTRAINT "EncounterForm_AdminId_fkey" FOREIGN KEY ("AdminId") REFERENCES public."Admin"("AdminId");
 V   ALTER TABLE ONLY public."EncounterForm" DROP CONSTRAINT "EncounterForm_AdminId_fkey";
       public          postgres    false    281    4899    217            �           2606    33148 ,   EncounterForm EncounterForm_PhysicianId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."EncounterForm"
    ADD CONSTRAINT "EncounterForm_PhysicianId_fkey" FOREIGN KEY ("PhysicianId") REFERENCES public."Physician"("PhysicianId");
 Z   ALTER TABLE ONLY public."EncounterForm" DROP CONSTRAINT "EncounterForm_PhysicianId_fkey";
       public          postgres    false    281    242    4927            �           2606    33138 *   EncounterForm EncounterForm_RequestId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."EncounterForm"
    ADD CONSTRAINT "EncounterForm_RequestId_fkey" FOREIGN KEY ("RequestId") REFERENCES public."Request"("RequestId");
 X   ALTER TABLE ONLY public."EncounterForm" DROP CONSTRAINT "EncounterForm_RequestId_fkey";
       public          postgres    false    281    4937    251            k           2606    16889 "   AdminRegion FK_AdminRegion_AdminId    FK CONSTRAINT     �   ALTER TABLE ONLY public."AdminRegion"
    ADD CONSTRAINT "FK_AdminRegion_AdminId" FOREIGN KEY ("AdminId") REFERENCES public."Admin"("AdminId");
 P   ALTER TABLE ONLY public."AdminRegion" DROP CONSTRAINT "FK_AdminRegion_AdminId";
       public          postgres    false    4899    217    221            l           2606    16894 #   AdminRegion FK_AdminRegion_RegionId    FK CONSTRAINT     �   ALTER TABLE ONLY public."AdminRegion"
    ADD CONSTRAINT "FK_AdminRegion_RegionId" FOREIGN KEY ("RegionId") REFERENCES public."Region"("RegionId");
 Q   ALTER TABLE ONLY public."AdminRegion" DROP CONSTRAINT "FK_AdminRegion_RegionId";
       public          postgres    false    4901    219    221            s           2606    17004 7   HealthProfessionals HealthProfessionals_Profession_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."HealthProfessionals"
    ADD CONSTRAINT "HealthProfessionals_Profession_fkey" FOREIGN KEY ("Profession") REFERENCES public."HealthProfessionalType"("HealthProfessionalId");
 e   ALTER TABLE ONLY public."HealthProfessionals" DROP CONSTRAINT "HealthProfessionals_Profession_fkey";
       public          postgres    false    4919    236    234            x           2606    17074 4   PhysicianLocation PhysicianLocation_PhysicianId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."PhysicianLocation"
    ADD CONSTRAINT "PhysicianLocation_PhysicianId_fkey" FOREIGN KEY ("PhysicianId") REFERENCES public."Physician"("PhysicianId");
 b   ALTER TABLE ONLY public."PhysicianLocation" DROP CONSTRAINT "PhysicianLocation_PhysicianId_fkey";
       public          postgres    false    242    244    4927            y           2606    17086 <   PhysicianNotification PhysicianNotification_PhysicianId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."PhysicianNotification"
    ADD CONSTRAINT "PhysicianNotification_PhysicianId_fkey" FOREIGN KEY ("PhysicianId") REFERENCES public."Physician"("PhysicianId");
 j   ALTER TABLE ONLY public."PhysicianNotification" DROP CONSTRAINT "PhysicianNotification_PhysicianId_fkey";
       public          postgres    false    242    246    4927            z           2606    17098 0   PhysicianRegion PhysicianRegion_PhysicianId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."PhysicianRegion"
    ADD CONSTRAINT "PhysicianRegion_PhysicianId_fkey" FOREIGN KEY ("PhysicianId") REFERENCES public."Physician"("PhysicianId");
 ^   ALTER TABLE ONLY public."PhysicianRegion" DROP CONSTRAINT "PhysicianRegion_PhysicianId_fkey";
       public          postgres    false    242    248    4927            {           2606    17103 -   PhysicianRegion PhysicianRegion_RegionId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."PhysicianRegion"
    ADD CONSTRAINT "PhysicianRegion_RegionId_fkey" FOREIGN KEY ("RegionId") REFERENCES public."Region"("RegionId");
 [   ALTER TABLE ONLY public."PhysicianRegion" DROP CONSTRAINT "PhysicianRegion_RegionId_fkey";
       public          postgres    false    219    4901    248            t           2606    17035 %   Physician Physician_AspNetUserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Physician"
    ADD CONSTRAINT "Physician_AspNetUserId_fkey" FOREIGN KEY ("AspNetUserId") REFERENCES public."AspNetUsers"("AspNetUserId");
 S   ALTER TABLE ONLY public."Physician" DROP CONSTRAINT "Physician_AspNetUserId_fkey";
       public          postgres    false    4897    242    215            u           2606    17040 "   Physician Physician_CreatedBy_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Physician"
    ADD CONSTRAINT "Physician_CreatedBy_fkey" FOREIGN KEY ("CreatedBy") REFERENCES public."AspNetUsers"("AspNetUserId");
 P   ALTER TABLE ONLY public."Physician" DROP CONSTRAINT "Physician_CreatedBy_fkey";
       public          postgres    false    215    242    4897            v           2606    17045 #   Physician Physician_ModifiedBy_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Physician"
    ADD CONSTRAINT "Physician_ModifiedBy_fkey" FOREIGN KEY ("ModifiedBy") REFERENCES public."AspNetUsers"("AspNetUserId");
 Q   ALTER TABLE ONLY public."Physician" DROP CONSTRAINT "Physician_ModifiedBy_fkey";
       public          postgres    false    242    215    4897            w           2606    33164    Physician Physician_RoleId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Physician"
    ADD CONSTRAINT "Physician_RoleId_fkey" FOREIGN KEY ("RoleId") REFERENCES public."Role"("RoleId") NOT VALID;
 M   ALTER TABLE ONLY public."Physician" DROP CONSTRAINT "Physician_RoleId_fkey";
       public          postgres    false    4955    242    269                       2606    17164 /   RequestBusiness RequestBusiness_BusinessId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RequestBusiness"
    ADD CONSTRAINT "RequestBusiness_BusinessId_fkey" FOREIGN KEY ("BusinessId") REFERENCES public."Business"("BusinessId");
 ]   ALTER TABLE ONLY public."RequestBusiness" DROP CONSTRAINT "RequestBusiness_BusinessId_fkey";
       public          postgres    false    4911    227    253            �           2606    17159 .   RequestBusiness RequestBusiness_RequestId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RequestBusiness"
    ADD CONSTRAINT "RequestBusiness_RequestId_fkey" FOREIGN KEY ("RequestId") REFERENCES public."Request"("RequestId");
 \   ALTER TABLE ONLY public."RequestBusiness" DROP CONSTRAINT "RequestBusiness_RequestId_fkey";
       public          postgres    false    4937    251    253            �           2606    17183 )   RequestClient RequestClient_RegionId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RequestClient"
    ADD CONSTRAINT "RequestClient_RegionId_fkey" FOREIGN KEY ("RegionId") REFERENCES public."Region"("RegionId");
 W   ALTER TABLE ONLY public."RequestClient" DROP CONSTRAINT "RequestClient_RegionId_fkey";
       public          postgres    false    219    255    4901            �           2606    17178 *   RequestClient RequestClient_RequestId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RequestClient"
    ADD CONSTRAINT "RequestClient_RequestId_fkey" FOREIGN KEY ("RequestId") REFERENCES public."Request"("RequestId");
 X   ALTER TABLE ONLY public."RequestClient" DROP CONSTRAINT "RequestClient_RequestId_fkey";
       public          postgres    false    255    251    4937            �           2606    17226 *   RequestClosed RequestClosed_RequestId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RequestClosed"
    ADD CONSTRAINT "RequestClosed_RequestId_fkey" FOREIGN KEY ("RequestId") REFERENCES public."Request"("RequestId");
 X   ALTER TABLE ONLY public."RequestClosed" DROP CONSTRAINT "RequestClosed_RequestId_fkey";
       public          postgres    false    259    251    4937            �           2606    17231 3   RequestClosed RequestClosed_RequestStatusLogId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RequestClosed"
    ADD CONSTRAINT "RequestClosed_RequestStatusLogId_fkey" FOREIGN KEY ("RequestStatusLogId") REFERENCES public."RequestStatusLog"("RequestStatusLogId");
 a   ALTER TABLE ONLY public."RequestClosed" DROP CONSTRAINT "RequestClosed_RequestStatusLogId_fkey";
       public          postgres    false    4943    257    259            �           2606    17248 2   RequestConcierge RequestConcierge_ConciergeId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RequestConcierge"
    ADD CONSTRAINT "RequestConcierge_ConciergeId_fkey" FOREIGN KEY ("ConciergeId") REFERENCES public."Concierge"("ConciergeId");
 `   ALTER TABLE ONLY public."RequestConcierge" DROP CONSTRAINT "RequestConcierge_ConciergeId_fkey";
       public          postgres    false    231    4915    261            �           2606    17243 0   RequestConcierge RequestConcierge_RequestId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RequestConcierge"
    ADD CONSTRAINT "RequestConcierge_RequestId_fkey" FOREIGN KEY ("RequestId") REFERENCES public."Request"("RequestId");
 ^   ALTER TABLE ONLY public."RequestConcierge" DROP CONSTRAINT "RequestConcierge_RequestId_fkey";
       public          postgres    false    261    251    4937            �           2606    17262 (   RequestNotes RequestNotes_RequestId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RequestNotes"
    ADD CONSTRAINT "RequestNotes_RequestId_fkey" FOREIGN KEY ("RequestId") REFERENCES public."Request"("RequestId");
 V   ALTER TABLE ONLY public."RequestNotes" DROP CONSTRAINT "RequestNotes_RequestId_fkey";
       public          postgres    false    4937    251    263            �           2606    17207 .   RequestStatusLog RequestStatusLog_AdminId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RequestStatusLog"
    ADD CONSTRAINT "RequestStatusLog_AdminId_fkey" FOREIGN KEY ("AdminId") REFERENCES public."Admin"("AdminId");
 \   ALTER TABLE ONLY public."RequestStatusLog" DROP CONSTRAINT "RequestStatusLog_AdminId_fkey";
       public          postgres    false    257    217    4899            �           2606    17202 2   RequestStatusLog RequestStatusLog_PhysicianId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RequestStatusLog"
    ADD CONSTRAINT "RequestStatusLog_PhysicianId_fkey" FOREIGN KEY ("PhysicianId") REFERENCES public."Physician"("PhysicianId");
 `   ALTER TABLE ONLY public."RequestStatusLog" DROP CONSTRAINT "RequestStatusLog_PhysicianId_fkey";
       public          postgres    false    4927    242    257            �           2606    17197 0   RequestStatusLog RequestStatusLog_RequestId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RequestStatusLog"
    ADD CONSTRAINT "RequestStatusLog_RequestId_fkey" FOREIGN KEY ("RequestId") REFERENCES public."Request"("RequestId");
 ^   ALTER TABLE ONLY public."RequestStatusLog" DROP CONSTRAINT "RequestStatusLog_RequestId_fkey";
       public          postgres    false    251    257    4937            �           2606    17212 9   RequestStatusLog RequestStatusLog_TransToPhysicianId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RequestStatusLog"
    ADD CONSTRAINT "RequestStatusLog_TransToPhysicianId_fkey" FOREIGN KEY ("TransToPhysicianId") REFERENCES public."Physician"("PhysicianId");
 g   ALTER TABLE ONLY public."RequestStatusLog" DROP CONSTRAINT "RequestStatusLog_TransToPhysicianId_fkey";
       public          postgres    false    257    242    4927            �           2606    17294 ,   RequestWiseFile RequestWiseFile_AdminId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RequestWiseFile"
    ADD CONSTRAINT "RequestWiseFile_AdminId_fkey" FOREIGN KEY ("AdminId") REFERENCES public."Admin"("AdminId");
 Z   ALTER TABLE ONLY public."RequestWiseFile" DROP CONSTRAINT "RequestWiseFile_AdminId_fkey";
       public          postgres    false    4899    217    267            �           2606    17289 0   RequestWiseFile RequestWiseFile_PhysicianId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RequestWiseFile"
    ADD CONSTRAINT "RequestWiseFile_PhysicianId_fkey" FOREIGN KEY ("PhysicianId") REFERENCES public."Physician"("PhysicianId");
 ^   ALTER TABLE ONLY public."RequestWiseFile" DROP CONSTRAINT "RequestWiseFile_PhysicianId_fkey";
       public          postgres    false    4927    242    267            �           2606    17284 .   RequestWiseFile RequestWiseFile_RequestId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RequestWiseFile"
    ADD CONSTRAINT "RequestWiseFile_RequestId_fkey" FOREIGN KEY ("RequestId") REFERENCES public."Request"("RequestId");
 \   ALTER TABLE ONLY public."RequestWiseFile" DROP CONSTRAINT "RequestWiseFile_RequestId_fkey";
       public          postgres    false    4937    251    267            }           2606    17147     Request Request_PhysicianId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Request"
    ADD CONSTRAINT "Request_PhysicianId_fkey" FOREIGN KEY ("PhysicianId") REFERENCES public."Physician"("PhysicianId");
 N   ALTER TABLE ONLY public."Request" DROP CONSTRAINT "Request_PhysicianId_fkey";
       public          postgres    false    251    4927    242            ~           2606    17142    Request Request_UserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Request"
    ADD CONSTRAINT "Request_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES public."User"("UserId");
 I   ALTER TABLE ONLY public."Request" DROP CONSTRAINT "Request_UserId_fkey";
       public          postgres    false    249    4935    251            �           2606    17319    RoleMenu RoleMenu_MenuId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RoleMenu"
    ADD CONSTRAINT "RoleMenu_MenuId_fkey" FOREIGN KEY ("MenuId") REFERENCES public."Menu"("MenuId");
 K   ALTER TABLE ONLY public."RoleMenu" DROP CONSTRAINT "RoleMenu_MenuId_fkey";
       public          postgres    false    238    271    4923            �           2606    17314    RoleMenu RoleMenu_RoleId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RoleMenu"
    ADD CONSTRAINT "RoleMenu_RoleId_fkey" FOREIGN KEY ("RoleId") REFERENCES public."Role"("RoleId");
 K   ALTER TABLE ONLY public."RoleMenu" DROP CONSTRAINT "RoleMenu_RoleId_fkey";
       public          postgres    false    4955    271    269            �           2606    17370 1   ShiftDetailRegion ShiftDetailRegion_RegionId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."ShiftDetailRegion"
    ADD CONSTRAINT "ShiftDetailRegion_RegionId_fkey" FOREIGN KEY ("RegionId") REFERENCES public."Region"("RegionId");
 _   ALTER TABLE ONLY public."ShiftDetailRegion" DROP CONSTRAINT "ShiftDetailRegion_RegionId_fkey";
       public          postgres    false    219    277    4901            �           2606    17365 6   ShiftDetailRegion ShiftDetailRegion_ShiftDetailId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."ShiftDetailRegion"
    ADD CONSTRAINT "ShiftDetailRegion_ShiftDetailId_fkey" FOREIGN KEY ("ShiftDetailId") REFERENCES public."ShiftDetail"("ShiftDetailId");
 d   ALTER TABLE ONLY public."ShiftDetailRegion" DROP CONSTRAINT "ShiftDetailRegion_ShiftDetailId_fkey";
       public          postgres    false    277    275    4961            �           2606    17353 '   ShiftDetail ShiftDetail_ModifiedBy_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."ShiftDetail"
    ADD CONSTRAINT "ShiftDetail_ModifiedBy_fkey" FOREIGN KEY ("ModifiedBy") REFERENCES public."AspNetUsers"("AspNetUserId");
 U   ALTER TABLE ONLY public."ShiftDetail" DROP CONSTRAINT "ShiftDetail_ModifiedBy_fkey";
       public          postgres    false    275    215    4897            �           2606    17348 $   ShiftDetail ShiftDetail_ShiftId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."ShiftDetail"
    ADD CONSTRAINT "ShiftDetail_ShiftId_fkey" FOREIGN KEY ("ShiftId") REFERENCES public."Shift"("ShiftId");
 R   ALTER TABLE ONLY public."ShiftDetail" DROP CONSTRAINT "ShiftDetail_ShiftId_fkey";
       public          postgres    false    4959    273    275            �           2606    17336    Shift Shift_CreatedBy_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Shift"
    ADD CONSTRAINT "Shift_CreatedBy_fkey" FOREIGN KEY ("CreatedBy") REFERENCES public."AspNetUsers"("AspNetUserId");
 H   ALTER TABLE ONLY public."Shift" DROP CONSTRAINT "Shift_CreatedBy_fkey";
       public          postgres    false    273    215    4897            �           2606    17331    Shift Shift_PhysicianId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Shift"
    ADD CONSTRAINT "Shift_PhysicianId_fkey" FOREIGN KEY ("PhysicianId") REFERENCES public."Physician"("PhysicianId");
 J   ALTER TABLE ONLY public."Shift" DROP CONSTRAINT "Shift_PhysicianId_fkey";
       public          postgres    false    242    4927    273            |           2606    17126    User User_AspNetUserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_AspNetUserId_fkey" FOREIGN KEY ("AspNetUserId") REFERENCES public."AspNetUsers"("AspNetUserId");
 I   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_AspNetUserId_fkey";
       public          postgres    false    4897    215    249            +   �   x���M
�0FדSx���L�f\y��$���PF%��v�Zx���c%��v(�Ðs	�\��ľ�\�2��d�u�#{�]/~X�wz.�������k^n�0De���_ƓdB/;������n�;���,�      /      x�34�4�4�24R�\1z\\\ *s      0   -   x�3�tL��̋��2�H,�L�+�2�Ȩ,�L�L���qqq ��r      1   �   x����m0��^8��z���	!��hg"=�U��V���k��T���X�/&�#�>>p���<0ь(sߨ�$�|9Ⱦ7���ٴ�fKo/��Y�k�]`8{.�J�s�a��C�d��O.8�X�
����Qq��� �\��d�U3?<�㭷�0q�Hi�m�ka��T���1~�Lp      )   E  x��V�n�|V�"�m��-���)y��ݱ��CɍA2�$H��*����MC����b��TV�D�Za�(��W�������I��_zW���� CL� �GDğ<)AD�_P(!D!D�c�P+�)�*�d��(�����5Ca�wPX��P���H�QB� 7�ӱhf)p�an�p�EAǹ��u��~w0x�����Ch�E�s ����$F:0��PI��?/ҹ��Ro�q�!�n�I�Ӌ�oX����	L ��c�������D~y���Z)c�3��E�����N��o8\1O��;8T�!�)�)t�a�/�s�H��:ÑWJ���n��	ݦ���0�IL̀"�"r
,��P'4PH� c	���:щ}��R��B���:ӏ3��'3�p��B��L?�90�@Y�� �t^����Dqd�G����f�8�q�Tm�:��"���p>�����å��<����۰�|M�%��ٸ����i�.3�~~�?_�௿���~�V�<e�d��SB��9�Ҡh׋��rd��փ�?���b�@����� �=(O�Q��lP����'�:�i��*v�7#�J���U���h�^���v��cqk����u�����I�NS���Y�yD<�,����i��N#l�O.��y�*$�5!��K�����~�ݕ3{U1��v�N��a�O��3�Y{޽�:`�V�����+��
�uB������z]o�Y�FJ8ʹ6�BŽ��F�/�a@B�ӊ�UD[,�����_�����s�S�����$*�u�b�,����ժ-���š>ڛݬ_f�ΰ�.zң�Z|_k&
��|�P�E��M��w��!q`���S#C鐍|���Y��mQ�Kr�2��Y�Y%�|?n�.�f�b��#<�;�ڽT��f����?�����������<��W�X��q�l9��*� �''�x��� �G��`����E���j�O�nͬ&Q<\����:����[{�K�x��Z��lBK��j��]�1Z,�)����}� (H䈔�!h%F��~���I��w��HDAy>��ci������V<�Z6���k/<�� �f�B��js_��Y�4�T�Z|ym�a�%��V���G�{:�7���~��O��(���v����T�o*����Z!7��"�ޚ��y�ܾ��Ol4�+�����+����/������'s�$�ӽRO���J��ۺ�<�I�Le��:�+��4) ��ҧ�4ל*N!1%�Z���֛� �4Y��[��t�4������N�t��if���ڹ�9�a�ѷ�Io~w�2��L����5��:���4O���qϚ�z�@7=h�EM��c�'8B>��& ��ԓ�>�}˓�)�ԶO�O�3�/��(|�8ZuZ;gCv��埄��|�w������]/�Zj�l�?���q���k�۩�w>a�EB���~�:�Q�;��uߨ�a� ��t7�nݾ1���r~ɶ��e}��M��ESOʭӦ��/էy�?�J�M{Y}Ǜ�� ��`�
�Z#�0L����s� �2��      3   J   x�3ⴴ0536aΠ��DC#cNC�����"NS�?N##] �P04�2��21�30401�r��qqq I�0      5   L   x�3�,O-�,///NL�L,� Q1~X�������������������������:.c�46�32�4�4E72F��� i(�      7   �   x�-��
1 ��W�D�y����֫���R�MIR�����a�مIpf�R]p��Q�?������f�d؇A�q4k�0kJe�?9�[s��w�w���Lp�}G�U�j"g��n?�a�Ȫ����SI�z������/�/6q      9   f   x�3�L/Ks�,///NL���f '�����yi�y�%����1~\&pM S� >�SN���ļ���L�4�q���h��X��Wj�	�i����� m3FG      :   q   x�3�,I�-�I,I�-��OLIMQp�O.�M�+)�,p042��"cN4202�5 "KCC+cK+C#=CsKC3#�R�朆@��eD��&�V�z��f渥L`��qqq ,L5k      k   �   x���A
�0DדSx�"5���
�O�櫩�j,1Yx��]Yx����?gD7K�)�T+$V;]R<���	��m��r!!8�e�%b	�H����f�c5R�[y��d!"����=Ak�ZEp:�ė�/�������[�A����2J�c�b�R�      <   >   x�3��H,�ML��4202�54�54R00�#NC�?.#N�Ң�̼t�#]KL%1z\\\ �ur      >   �   x���M
�0���^���_2]y���v�V,b��mK*�Ņ��x���n��6B���r�[W��~Z�����	�[ �����*J�T�y�j��kJ�&"G�%@�!�B��\�p�<�����rh��9��S��)iVY�h�r��O)1�ĳd%�_?O�B�)��}`��C7�q�fY4��e��ι'���      @   �   x�]�Oo�0��H������`��N�x�i��XKR$��BP���������l=h�E	��H�F�6�
޴쮍M`
�RroC��������%��#��%��E+r�^Ϩ͎�,%���d�M��gmM���A�}1:��*~�ӓ�U�$����=qf3X�ߤ����Xb�������Z>��z=X�Y�rp�P9Œ��:sp�0��wrS�|�<E���t      B   �   x����J1�s��S��&9�=�^Į�ŕX||�."��
9���I0i:�&$NwǗ~:��8�i5���c���<�M�!쥪���5S�9O���E�R���-m�3C4��X�iF�##�L3wk�:Xo_ϧ�s?���'�	���\G>�o���зZ���06�kj?���mّ��������HK_v$����Ɇt(9�w#�k�      D   u  x����N�0���)xG3��+'�N��.�^&��d��*M�x�u	,+DE������Ƅ@�8:F�j6���*�d�1�V\k;������������^�6�u�(�w��&���<VvX�AI(�<�H?A?���`��+G��<5+4J�+2��}��Ѿ|@0�Op<O�l���L�����|�r��n^6��VD �����c�F� F�"�r2&��y+�[�q\�|��Y�Gُ��&�g���k�@ƚ�Ox��{�s�9���w�m&���s�IU�&�!S��i�Y`x*�/�mK�>��Y�"Wk��Wړ�3���{%=�4�	�:��Aq�e%�N��[ρ8�M����$K}�.���f}�����wP�j�Z���      F   �   x�Uλ
�@�z�+��]���R�4�6��`L�G�߻*��0�(����Q#"T%	KI���c�A�~v֍w��r�~4'@�B�J�\ׁ���>�\l��atD M@���P)���1���y6h���l��?%�T��m��X<�V]�ц�6��l��s/��3�      H   %   x�3�44�4�2�44R���F@
�4�4������ I�8      J   8   x��� 0�7�9�I�u�V���nQ�Z]���<��n2���7H~NZ	f      -   <   x�3�,�,J���L2��9�R�+󋲁4�	gbNbqv"��2��M,��I�K2�b���� �]      M   �  x����r9���S���Z�߫�$v���RP���h�'cpR~�� 6	;�k�����ӧ��Vh�^���q�#�o5��/��j��2���d��
��2o�9�.YH <�#�/���!�I��(�g�D�໬��$�?+�h8��H�K����EG/�'�Z��}�S\�Kk�h�-W��4�A��3A8�6�J6HzS�=� k��A-�;-�] �(W�+F�;�gZ%��R����>�+��"�Ĉ6bOD+��N����<��\�������|�q�8L���%���X�f�N����(>5��܊�}�M����TXHT�s�k�FuԂ-	��� Oh�	lb->7��T�KK��hc�A��z�����zği��'m$*zvm#ŀ�eb� M0�o�P1���$d��9�,l�����8s�2�ƻ`M�S��>!&�7��ؓ�'�"����)(�]{m���� �4 %!J���*y RFcl�=[�P���2�-�����M��q�ͱv�3��!v�T�2�>%�quO�Ȑ仆b+c$0^-��������PU�|��5d0Y�
�&���H�اkW�rkIe�C�O��8<��ђ��w/�!��Rڱ8���	-ǡ������Ј���[��)��̞*@�n�L<��9�1��J#�K���(A��! �G��C�'���l����)ci�Z�N�����[<ޔ<G
͂wF��3i*�*�_�Ӌ���Y/��tʚ�X*@������%�'�:�q^��n�"׭
���������^��w��X�����@�}K��������D�8�)W�2�Ot�8,UH�$Qku	WA+n�7�9λ����y�R\\^\�[*=�@��W�ܬ�;�9��ƫχ�J4�g�؀tڐ,��J3�2и�~u3]Mo6�<�����'�#      O      x�3�46�4���2�46�4�b���� 3��      Q   �  x����n�@���O�'�̞wmU��%R�J����!`pl���,'/ؐJ�,k�A�?s��L\a���:��|_�L*x���k�Sl0���6p��1ؒ	�������nW��չ�8���e�S�RR*�� ��gm�
�.���7��W�A�x�����Dr�jTm\����$J�~�)�V�4����ߒ��D.��pݚ�) b�f_��)�.m�*mF��"�¼�+�?�p@�$�K.�7�+�Q�G�Gs�����eL����Ղ'�d�����<�D�%��j<��>��>��o�\�py}���d�4 �?�,!�0����$�n�;M�.��p�҇��k�V��J����:��������~M�Hp�ɀ��<G8��6����u\��7�A�؝�V	%�y�L��O�Z�6̥y.�_đ!��m����q�=��W �֔�OSGo�=��,~�H���G���U-Qd���~����4	��q�G'm�s>v��/C�N�q>g�ql���>b1�Y�^��8�]/#U�q�V��LH1��Az.���3,�~��!�h�n ��:.1�ɉ�v�̤�	ȫM^�&�>W��/�$��-���!�z?��uDK�K8�i ʙJy�_,/�+=      U      x������ � �      W      x������ � �      Y   �   x�]�A
�0D�?��H���Z��A\g��6�4
�ފ��ìf�04X�Y�9�)�)-.pM/wq-N��ZR/Y���Ԩ�N�i �w�
zڃ{-�bż�᭖}�~z����h���'��}?lL�|DZ���l'�xX}/�      S   
  x����r�F���S�45��vs����r�,�-�t@��ۧ��NH�T�z���n��b���������7�n,��I8a46:���� 7�������d�!ad_8i�Γ��ۉ�0%��{�r�"���(qH�FP�w�����x�1R{��v�k*&A��Zbl�}�	
��L.B��Oԟ���o���~����p�1`��9Yo��ї�AC3I�\(��؂KE�b�j��a����nR4SVuI,�Zѿ^(���B������q��feTU��������i�`|
�)T�7���Hj�;U�a��ն���t������|l�����ӫ�&�X�%��
�#|�>���<��1z� 0��Ary�f!�⪈���@=B��65�F�I�?�c�w���a� c:�d�t�����,k���������5�$r�X�£�a��u8~�o��=�}�����Q����ۻn�o��C��Li���A�q��+�B��jmw��|�QT$g�9T��8�נ��!�1
nl��k�NQCh��
�֘�Y�kLH�u����2�v�_�\6��(^긎�~ϱOH�(3�2u�\�S��kN-c�`-3�t9�)ՓMp<u��a�f6��㐬�\�qv��A�-�N���u���~*������@u4�zRt �Wo�N�>/�r)��?�\g>�z1���T]�Kq�z�/��%�|�T�Xo�E]'\��&tW�Q�|es�_aoP���QMV��*�2Dj�`�sޚ�f�/�X�      [      x������ � �      ]   �  x��W�n�6<��b����Ňn� �`q�H�L�8�a'��ű������@�"�Y���n�v�OwS�������~-��V����r3��r�C�l,�=�H2�(�>~X[W�;�۟o�� �<���R^�?����ƛ�i����{��t��臗����4���':�a7zh���1g^o�+2V�`��� 퀴�OxL��X\'8���`o��t�!a\`����#.8�&���������wq�4X�z0 vd��8G�·�����+��=����Ղ!���oN��}�(b��v�����hqpB=5¦���v�ɥ�fG�xYtE�i�*���2jT����u�'��.����P�n��b�{j���5X�vRMt��y���lV�)��G����y�I���{_�_�9.*F��~�#o��I��z/���l蚩l��9�Hv���� w�|��>rD�=�V�T=r��	)����dv��<9�#N�������v��]�VEՖX�{3��+ ;�q�?���Jt�0�
q�6#�g�Y�T���0p2\j5I�r��J�#xo������nXkm�8�h�J�'�R�1N&Y�LI��B�C܄q�+*��3U���6Q�>���+�`$05Y���y��8�YF�y�A�+_j% X�K
&�I�IL�Z�%&�U�4c��C��P�z}��hm
C�<902�hZ��P@�q���������n
E�Q�g
�\[& vs1��W�L����E�?LU�FjVi0�O"k�����C�H��d����=���1g�^�Co(�d戃�8b�A&f#E��gRզVc�>R��+���V��k�s���{Z�@�je5M��S@S'�(�FW˥U�h�#F�]!�ٙZ�̶�E�jg���b�(���g��i������� �;��H���o���ڰ�;� �ڰ�*Zޱ�XNhj"�����U �˙���#,���u��p�H�19h�U�82��~��JV��K�ÏwOO铭t�6-�]� �b�[�e+(���l �F�51�d@���`-�><>|�2=���R�?�p�tj�:��Y˖���y��Qm*{V禬�&�p�tH�?�M�ᥜ�Lb�n��:�L���>WWW� К�      _   �   x�u�M
�0�דS�3�i�����&�@�T�u��J��3���GЏ�%�r����<e���V�U��L��zL��#A*���H�!Jk��j�ɟ����iu�"�b�a���@`�
��?�GnlhIpW\Z��c^�y9?      a   4   x����  �w������0�ݥ�<5�:y��ԍ��|�{�n�|��u�      h      x������ � �      c   �   x����q!�3[�6 ��?E�_�f���a������I#@�$&�L�$!ݾ'�aY������8c�4?�1�6�a][W)A�u!'�S�m�v��m�sK\}O��]��B�;%��W�+�Y�6�?�h�2^�ۺZ'+�ĵ-ٟex�%/������u8��1'	�����/�C�ծ^ZSw]t� �����緛�����m۾!D��      e   7  x���[n� E��*f��^DW0�_G�$nI*4�q��/�$���	�Dy 8�C^U�'ľ	əڤ��W�5bjǐ#���10� ��R����/��Cn�V]��Fn�me������ZxC����^���G`.pӋ9���8�jd��@�V��Ã�(�z�S(��ƃ�<ɯ���V3b�� $!�Rr�R�� 5^��_!bp�~�K9���
���߃�Ҟ~ER�Ә����iC��ꙶ��$��go��h��c��gا?Q���x?�;9��4�^�k]��1�	�      g   9   x�%��  C������C/d�A���m�����?�z jb㞸��SL	#      K   c  x�}��n�8���S�(p��!��n�k�b,�@/�H��$v�	��;��
�hJ�0���?3�^���&uJ!hB�:Ĝ4� r��Xշ��5�Է�T���? ���C���^^^�c���$e���V��@����η�ue��1�m�����8�iLQ#��j�U���݂�:a��`�v�V������������:�:��*�p��i�Ų��e�r&_l��K)O����q)V����9���t�ưADF�9f��:xϚF;�!�A#s���MU�N����)��~����5����K��tzM�������;ߒ�L�z++t��5@�쬰��F���gu�)�a0e V�Ǭ�v�pH�y��脞�
n�|!-�k*�=�΂$�-,T�p��b<�n��F6*�xl�W���~q�].�Ͳ��������t'%�b�\�aoL���̰U�dU�R��Ig� *>�iԈ�X0�C(*�A{c����d*;v3_~�u��>=�%AZ��	΀ar{�N�\��GB���D�N[7�V�@C����5Y�%��h�.Sp+4;��?�Ym����#t�1�E�'�f�Yǌҟal��X|�J�� ��V�	�ߪ�`mL39}�.X�`�5�� �$s ���U1�`���x�̠C�~�6ЀP:5��w�n~��{�Yr�ws��k��	;cȆMͼ*	0{y B��	|��a$ņR�#�-X{t�Xz|c�ӣ5����O��&RP��Qd�'�Z�9��An�C̍6e����\�/�����Mol8�� �{����]cQ�Ɂ}�ȍ�,Hy��:�j�0���������+�a�Wv�p�w(/��N�J������-�d{-��Ȓ�f������?�P�     
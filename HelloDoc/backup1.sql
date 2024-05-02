PGDMP  *                    |            HelloDoc    16.1    16.1 M   �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16737    HelloDoc    DATABASE     }   CREATE DATABASE "HelloDoc" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';
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
       public          postgres    false    221            �           0    0    AdminRegion_AdminRegionId_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public."AdminRegion_AdminRegionId_seq" OWNED BY public."AdminRegion"."AdminRegionId";
          public          postgres    false    220            �            1259    16851    Admin_AdminId_seq    SEQUENCE     �   CREATE SEQUENCE public."Admin_AdminId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."Admin_AdminId_seq";
       public          postgres    false    217            �           0    0    Admin_AdminId_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public."Admin_AdminId_seq" OWNED BY public."Admin"."AdminId";
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
       public          postgres    false    225            �           0    0     BlockRequests_BlockRequestId_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public."BlockRequests_BlockRequestId_seq" OWNED BY public."BlockRequests"."BlockRequestId";
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
       public          postgres    false    227            �           0    0    Business_BusinessId_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public."Business_BusinessId_seq" OWNED BY public."Business"."BusinessId";
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
       public          postgres    false    229            �           0    0    CaseTag_CaseTagId_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."CaseTag_CaseTagId_seq" OWNED BY public."CaseTag"."CaseTagId";
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
       public          postgres    false    231            �           0    0    Concierge_ConciergeId_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public."Concierge_ConciergeId_seq" OWNED BY public."Concierge"."ConciergeId";
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
       public          postgres    false    281            �           0    0 !   EncounterForm_EncounterFormId_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public."EncounterForm_EncounterFormId_seq" OWNED BY public."EncounterForm"."EncounterFormId";
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
       public          postgres    false    234            �           0    0 /   HealthProfessionalType_HealthProfessionalId_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."HealthProfessionalType_HealthProfessionalId_seq" OWNED BY public."HealthProfessionalType"."HealthProfessionalId";
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
       public          postgres    false    236            �           0    0     HealthProfessionals_VendorId_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public."HealthProfessionals_VendorId_seq" OWNED BY public."HealthProfessionals"."VendorId";
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
       public          postgres    false    238            �           0    0    Menu_MenuId_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public."Menu_MenuId_seq" OWNED BY public."Menu"."MenuId";
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
       public          postgres    false    240            �           0    0    OrderDetails_Id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."OrderDetails_Id_seq" OWNED BY public."OrderDetails"."Id";
          public          postgres    false    239                       1259    49626    PayrateByProvider    TABLE     �  CREATE TABLE public."PayrateByProvider" (
    "PayrateId" integer NOT NULL,
    "PayrateCategoryId" integer NOT NULL,
    "PhysicianId" integer NOT NULL,
    "Payrate" numeric(8,3) NOT NULL,
    "CreatedBy" character varying(128) NOT NULL,
    "CreatedDate" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    "ModifiedBy" character varying(128),
    "ModifiedDate" timestamp without time zone
);
 '   DROP TABLE public."PayrateByProvider";
       public         heap    postgres    false                       1259    49625    PayrateByProvider_PayrateId_seq    SEQUENCE     �   CREATE SEQUENCE public."PayrateByProvider_PayrateId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public."PayrateByProvider_PayrateId_seq";
       public          postgres    false    286            �           0    0    PayrateByProvider_PayrateId_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public."PayrateByProvider_PayrateId_seq" OWNED BY public."PayrateByProvider"."PayrateId";
          public          postgres    false    285                       1259    49526    PayrateCategory    TABLE     �   CREATE TABLE public."PayrateCategory" (
    "PayrateCategoryId" integer NOT NULL,
    "CategoryName" character varying(256) NOT NULL
);
 %   DROP TABLE public."PayrateCategory";
       public         heap    postgres    false                       1259    49525 %   PayrateCategory_PayrateCategoryId_seq    SEQUENCE     �   CREATE SEQUENCE public."PayrateCategory_PayrateCategoryId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public."PayrateCategory_PayrateCategoryId_seq";
       public          postgres    false    284            �           0    0 %   PayrateCategory_PayrateCategoryId_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public."PayrateCategory_PayrateCategoryId_seq" OWNED BY public."PayrateCategory"."PayrateCategoryId";
          public          postgres    false    283            �            1259    17027 	   Physician    TABLE       CREATE TABLE public."Physician" (
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
       public          postgres    false    244            �           0    0     PhysicianLocation_LocationId_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public."PhysicianLocation_LocationId_seq" OWNED BY public."PhysicianLocation"."LocationId";
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
       public          postgres    false    246            �           0    0    PhysicianNotification_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public."PhysicianNotification_id_seq" OWNED BY public."PhysicianNotification".id;
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
          public          postgres    false    272                        1259    49654 	   Timesheet    TABLE     �  CREATE TABLE public."Timesheet" (
    "TimesheetId" integer NOT NULL,
    "PhysicianId" integer NOT NULL,
    "StartDate" date NOT NULL,
    "EndDate" date NOT NULL,
    "IsFinalize" boolean,
    "IsApproved" boolean,
    "BonusAmount" character varying(128),
    "AdminNotes" text,
    "CreatedBy" character varying(128) NOT NULL,
    "CreatedDate" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    "ModifiedBy" character varying(128),
    "ModifiedDate" timestamp without time zone
);
    DROP TABLE public."Timesheet";
       public         heap    postgres    false            "           1259    49679    TimesheetDetail    TABLE     i  CREATE TABLE public."TimesheetDetail" (
    "TimesheetDetailId" integer NOT NULL,
    "TimesheetId" integer NOT NULL,
    "TimesheetDate" date NOT NULL,
    "TotalHours" numeric,
    "IsWeekend" boolean,
    "NumberOfHouseCall" integer,
    "NumberOfPhoneCall" integer,
    "ModifiedBy" character varying(128),
    "ModifiedDate" timestamp without time zone
);
 %   DROP TABLE public."TimesheetDetail";
       public         heap    postgres    false            $           1259    49698    TimesheetDetailReimbursement    TABLE     �  CREATE TABLE public."TimesheetDetailReimbursement" (
    "TimesheetDetailReimbursementId" integer NOT NULL,
    "TimesheetDetailId" integer NOT NULL,
    "ItemName" character varying(500) NOT NULL,
    "Amount" integer NOT NULL,
    "Bill" character varying(500) NOT NULL,
    "IsDeleted" boolean,
    "CreatedBy" character varying(128) NOT NULL,
    "CreatedDate" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    "ModifiedBy" character varying(128),
    "ModifiedDate" timestamp without time zone
);
 2   DROP TABLE public."TimesheetDetailReimbursement";
       public         heap    postgres    false            #           1259    49697 ?   TimesheetDetailReimbursement_TimesheetDetailReimbursementId_seq    SEQUENCE     �   CREATE SEQUENCE public."TimesheetDetailReimbursement_TimesheetDetailReimbursementId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 X   DROP SEQUENCE public."TimesheetDetailReimbursement_TimesheetDetailReimbursementId_seq";
       public          postgres    false    292            �           0    0 ?   TimesheetDetailReimbursement_TimesheetDetailReimbursementId_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."TimesheetDetailReimbursement_TimesheetDetailReimbursementId_seq" OWNED BY public."TimesheetDetailReimbursement"."TimesheetDetailReimbursementId";
          public          postgres    false    291            !           1259    49678 %   TimesheetDetail_TimesheetDetailId_seq    SEQUENCE     �   CREATE SEQUENCE public."TimesheetDetail_TimesheetDetailId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public."TimesheetDetail_TimesheetDetailId_seq";
       public          postgres    false    290            �           0    0 %   TimesheetDetail_TimesheetDetailId_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public."TimesheetDetail_TimesheetDetailId_seq" OWNED BY public."TimesheetDetail"."TimesheetDetailId";
          public          postgres    false    289                       1259    49653    Timesheet_TimesheetId_seq    SEQUENCE     �   CREATE SEQUENCE public."Timesheet_TimesheetId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public."Timesheet_TimesheetId_seq";
       public          postgres    false    288            �           0    0    Timesheet_TimesheetId_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public."Timesheet_TimesheetId_seq" OWNED BY public."Timesheet"."TimesheetId";
          public          postgres    false    287            �            1259    17119    User    TABLE     W  CREATE TABLE public."User" (
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
            public          postgres    false    249                       2604    16855    Admin AdminId    DEFAULT     t   ALTER TABLE ONLY public."Admin" ALTER COLUMN "AdminId" SET DEFAULT nextval('public."Admin_AdminId_seq"'::regclass);
 @   ALTER TABLE public."Admin" ALTER COLUMN "AdminId" DROP DEFAULT;
       public          postgres    false    217    216    217                       2604    16886    AdminRegion AdminRegionId    DEFAULT     �   ALTER TABLE ONLY public."AdminRegion" ALTER COLUMN "AdminRegionId" SET DEFAULT nextval('public."AdminRegion_AdminRegionId_seq"'::regclass);
 L   ALTER TABLE public."AdminRegion" ALTER COLUMN "AdminRegionId" DROP DEFAULT;
       public          postgres    false    221    220    221                       2604    16924    BlockRequests BlockRequestId    DEFAULT     �   ALTER TABLE ONLY public."BlockRequests" ALTER COLUMN "BlockRequestId" SET DEFAULT nextval('public."BlockRequests_BlockRequestId_seq"'::regclass);
 O   ALTER TABLE public."BlockRequests" ALTER COLUMN "BlockRequestId" DROP DEFAULT;
       public          postgres    false    225    224    225                       2604    16933    Business BusinessId    DEFAULT     �   ALTER TABLE ONLY public."Business" ALTER COLUMN "BusinessId" SET DEFAULT nextval('public."Business_BusinessId_seq"'::regclass);
 F   ALTER TABLE public."Business" ALTER COLUMN "BusinessId" DROP DEFAULT;
       public          postgres    false    227    226    227                       2604    16957    CaseTag CaseTagId    DEFAULT     |   ALTER TABLE ONLY public."CaseTag" ALTER COLUMN "CaseTagId" SET DEFAULT nextval('public."CaseTag_CaseTagId_seq"'::regclass);
 D   ALTER TABLE public."CaseTag" ALTER COLUMN "CaseTagId" DROP DEFAULT;
       public          postgres    false    229    228    229                       2604    16964    Concierge ConciergeId    DEFAULT     �   ALTER TABLE ONLY public."Concierge" ALTER COLUMN "ConciergeId" SET DEFAULT nextval('public."Concierge_ConciergeId_seq"'::regclass);
 H   ALTER TABLE public."Concierge" ALTER COLUMN "ConciergeId" DROP DEFAULT;
       public          postgres    false    231    230    231            3           2604    33132    EncounterForm EncounterFormId    DEFAULT     �   ALTER TABLE ONLY public."EncounterForm" ALTER COLUMN "EncounterFormId" SET DEFAULT nextval('public."EncounterForm_EncounterFormId_seq"'::regclass);
 P   ALTER TABLE public."EncounterForm" ALTER COLUMN "EncounterFormId" DROP DEFAULT;
       public          postgres    false    281    280    281                       2604    16983 +   HealthProfessionalType HealthProfessionalId    DEFAULT     �   ALTER TABLE ONLY public."HealthProfessionalType" ALTER COLUMN "HealthProfessionalId" SET DEFAULT nextval('public."HealthProfessionalType_HealthProfessionalId_seq"'::regclass);
 ^   ALTER TABLE public."HealthProfessionalType" ALTER COLUMN "HealthProfessionalId" DROP DEFAULT;
       public          postgres    false    234    233    234                       2604    16999    HealthProfessionals VendorId    DEFAULT     �   ALTER TABLE ONLY public."HealthProfessionals" ALTER COLUMN "VendorId" SET DEFAULT nextval('public."HealthProfessionals_VendorId_seq"'::regclass);
 O   ALTER TABLE public."HealthProfessionals" ALTER COLUMN "VendorId" DROP DEFAULT;
       public          postgres    false    236    235    236                       2604    17013    Menu MenuId    DEFAULT     p   ALTER TABLE ONLY public."Menu" ALTER COLUMN "MenuId" SET DEFAULT nextval('public."Menu_MenuId_seq"'::regclass);
 >   ALTER TABLE public."Menu" ALTER COLUMN "MenuId" DROP DEFAULT;
       public          postgres    false    238    237    238                       2604    17021    OrderDetails Id    DEFAULT     x   ALTER TABLE ONLY public."OrderDetails" ALTER COLUMN "Id" SET DEFAULT nextval('public."OrderDetails_Id_seq"'::regclass);
 B   ALTER TABLE public."OrderDetails" ALTER COLUMN "Id" DROP DEFAULT;
       public          postgres    false    239    240    240            6           2604    49629    PayrateByProvider PayrateId    DEFAULT     �   ALTER TABLE ONLY public."PayrateByProvider" ALTER COLUMN "PayrateId" SET DEFAULT nextval('public."PayrateByProvider_PayrateId_seq"'::regclass);
 N   ALTER TABLE public."PayrateByProvider" ALTER COLUMN "PayrateId" DROP DEFAULT;
       public          postgres    false    285    286    286            5           2604    49529 !   PayrateCategory PayrateCategoryId    DEFAULT     �   ALTER TABLE ONLY public."PayrateCategory" ALTER COLUMN "PayrateCategoryId" SET DEFAULT nextval('public."PayrateCategory_PayrateCategoryId_seq"'::regclass);
 T   ALTER TABLE public."PayrateCategory" ALTER COLUMN "PayrateCategoryId" DROP DEFAULT;
       public          postgres    false    284    283    284                        2604    17030    Physician PhysicianId    DEFAULT     �   ALTER TABLE ONLY public."Physician" ALTER COLUMN "PhysicianId" SET DEFAULT nextval('public."Physician_PhysicianId_seq"'::regclass);
 H   ALTER TABLE public."Physician" ALTER COLUMN "PhysicianId" DROP DEFAULT;
       public          postgres    false    242    241    242            !           2604    17069    PhysicianLocation LocationId    DEFAULT     �   ALTER TABLE ONLY public."PhysicianLocation" ALTER COLUMN "LocationId" SET DEFAULT nextval('public."PhysicianLocation_LocationId_seq"'::regclass);
 O   ALTER TABLE public."PhysicianLocation" ALTER COLUMN "LocationId" DROP DEFAULT;
       public          postgres    false    244    243    244            "           2604    17083    PhysicianNotification id    DEFAULT     �   ALTER TABLE ONLY public."PhysicianNotification" ALTER COLUMN id SET DEFAULT nextval('public."PhysicianNotification_id_seq"'::regclass);
 I   ALTER TABLE public."PhysicianNotification" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    246    245    246            #           2604    17095 !   PhysicianRegion PhysicianRegionId    DEFAULT     �   ALTER TABLE ONLY public."PhysicianRegion" ALTER COLUMN "PhysicianRegionId" SET DEFAULT nextval('public."PhysicianRegion_PhysicianRegionId_seq"'::regclass);
 T   ALTER TABLE public."PhysicianRegion" ALTER COLUMN "PhysicianRegionId" DROP DEFAULT;
       public          postgres    false    247    248    248                       2604    16879    Region RegionId    DEFAULT     x   ALTER TABLE ONLY public."Region" ALTER COLUMN "RegionId" SET DEFAULT nextval('public."Region_RegionId_seq"'::regclass);
 B   ALTER TABLE public."Region" ALTER COLUMN "RegionId" DROP DEFAULT;
       public          postgres    false    218    219    219            $           2604    17135    Request RequestId    DEFAULT     |   ALTER TABLE ONLY public."Request" ALTER COLUMN "RequestId" SET DEFAULT nextval('public."Request_RequestId_seq"'::regclass);
 D   ALTER TABLE public."Request" ALTER COLUMN "RequestId" DROP DEFAULT;
       public          postgres    false    250    251    251            &           2604    17156 !   RequestBusiness RequestBusinessId    DEFAULT     �   ALTER TABLE ONLY public."RequestBusiness" ALTER COLUMN "RequestBusinessId" SET DEFAULT nextval('public."RequestBusiness_RequestBusinessId_seq"'::regclass);
 T   ALTER TABLE public."RequestBusiness" ALTER COLUMN "RequestBusinessId" DROP DEFAULT;
       public          postgres    false    252    253    253            '           2604    17173    RequestClient RequestClientId    DEFAULT     �   ALTER TABLE ONLY public."RequestClient" ALTER COLUMN "RequestClientId" SET DEFAULT nextval('public."RequestClient_RequestClientId_seq"'::regclass);
 P   ALTER TABLE public."RequestClient" ALTER COLUMN "RequestClientId" DROP DEFAULT;
       public          postgres    false    255    254    255            )           2604    17221    RequestClosed RequestClosedId    DEFAULT     �   ALTER TABLE ONLY public."RequestClosed" ALTER COLUMN "RequestClosedId" SET DEFAULT nextval('public."RequestClosed_RequestClosedId_seq"'::regclass);
 P   ALTER TABLE public."RequestClosed" ALTER COLUMN "RequestClosedId" DROP DEFAULT;
       public          postgres    false    258    259    259            *           2604    17240    RequestConcierge Id    DEFAULT     �   ALTER TABLE ONLY public."RequestConcierge" ALTER COLUMN "Id" SET DEFAULT nextval('public."RequestConcierge_Id_seq"'::regclass);
 F   ALTER TABLE public."RequestConcierge" ALTER COLUMN "Id" DROP DEFAULT;
       public          postgres    false    261    260    261            +           2604    17257    RequestNotes RequestNotesId    DEFAULT     �   ALTER TABLE ONLY public."RequestNotes" ALTER COLUMN "RequestNotesId" SET DEFAULT nextval('public."RequestNotes_RequestNotesId_seq"'::regclass);
 N   ALTER TABLE public."RequestNotes" ALTER COLUMN "RequestNotesId" DROP DEFAULT;
       public          postgres    false    262    263    263            (           2604    17192 #   RequestStatusLog RequestStatusLogId    DEFAULT     �   ALTER TABLE ONLY public."RequestStatusLog" ALTER COLUMN "RequestStatusLogId" SET DEFAULT nextval('public."RequestStatusLog_RequestStatusLogId_seq"'::regclass);
 V   ALTER TABLE public."RequestStatusLog" ALTER COLUMN "RequestStatusLogId" DROP DEFAULT;
       public          postgres    false    256    257    257            ,           2604    17271    RequestType RequestTypeId    DEFAULT     �   ALTER TABLE ONLY public."RequestType" ALTER COLUMN "RequestTypeId" SET DEFAULT nextval('public."RequestType_RequestTypeId_seq"'::regclass);
 L   ALTER TABLE public."RequestType" ALTER COLUMN "RequestTypeId" DROP DEFAULT;
       public          postgres    false    264    265    265            -           2604    17279 !   RequestWiseFile RequestWiseFileID    DEFAULT     �   ALTER TABLE ONLY public."RequestWiseFile" ALTER COLUMN "RequestWiseFileID" SET DEFAULT nextval('public."RequestWiseFile_RequestWiseFileID_seq"'::regclass);
 T   ALTER TABLE public."RequestWiseFile" ALTER COLUMN "RequestWiseFileID" DROP DEFAULT;
       public          postgres    false    267    266    267            .           2604    17303    Role RoleId    DEFAULT     p   ALTER TABLE ONLY public."Role" ALTER COLUMN "RoleId" SET DEFAULT nextval('public."Role_RoleId_seq"'::regclass);
 >   ALTER TABLE public."Role" ALTER COLUMN "RoleId" DROP DEFAULT;
       public          postgres    false    269    268    269            /           2604    17311    RoleMenu RoleMenuId    DEFAULT     �   ALTER TABLE ONLY public."RoleMenu" ALTER COLUMN "RoleMenuId" SET DEFAULT nextval('public."RoleMenu_RoleMenuId_seq"'::regclass);
 F   ALTER TABLE public."RoleMenu" ALTER COLUMN "RoleMenuId" DROP DEFAULT;
       public          postgres    false    271    270    271            0           2604    17328    Shift ShiftId    DEFAULT     t   ALTER TABLE ONLY public."Shift" ALTER COLUMN "ShiftId" SET DEFAULT nextval('public."Shift_ShiftId_seq"'::regclass);
 @   ALTER TABLE public."Shift" ALTER COLUMN "ShiftId" DROP DEFAULT;
       public          postgres    false    272    273    273            1           2604    17345    ShiftDetail ShiftDetailId    DEFAULT     �   ALTER TABLE ONLY public."ShiftDetail" ALTER COLUMN "ShiftDetailId" SET DEFAULT nextval('public."ShiftDetail_ShiftDetailId_seq"'::regclass);
 L   ALTER TABLE public."ShiftDetail" ALTER COLUMN "ShiftDetailId" DROP DEFAULT;
       public          postgres    false    274    275    275            2           2604    17362 %   ShiftDetailRegion ShiftDetailRegionId    DEFAULT     �   ALTER TABLE ONLY public."ShiftDetailRegion" ALTER COLUMN "ShiftDetailRegionId" SET DEFAULT nextval('public."ShiftDetailRegion_ShiftDetailRegionId_seq"'::regclass);
 X   ALTER TABLE public."ShiftDetailRegion" ALTER COLUMN "ShiftDetailRegionId" DROP DEFAULT;
       public          postgres    false    277    276    277            8           2604    49657    Timesheet TimesheetId    DEFAULT     �   ALTER TABLE ONLY public."Timesheet" ALTER COLUMN "TimesheetId" SET DEFAULT nextval('public."Timesheet_TimesheetId_seq"'::regclass);
 H   ALTER TABLE public."Timesheet" ALTER COLUMN "TimesheetId" DROP DEFAULT;
       public          postgres    false    287    288    288            :           2604    49682 !   TimesheetDetail TimesheetDetailId    DEFAULT     �   ALTER TABLE ONLY public."TimesheetDetail" ALTER COLUMN "TimesheetDetailId" SET DEFAULT nextval('public."TimesheetDetail_TimesheetDetailId_seq"'::regclass);
 T   ALTER TABLE public."TimesheetDetail" ALTER COLUMN "TimesheetDetailId" DROP DEFAULT;
       public          postgres    false    289    290    290            ;           2604    49701 ;   TimesheetDetailReimbursement TimesheetDetailReimbursementId    DEFAULT     �   ALTER TABLE ONLY public."TimesheetDetailReimbursement" ALTER COLUMN "TimesheetDetailReimbursementId" SET DEFAULT nextval('public."TimesheetDetailReimbursement_TimesheetDetailReimbursementId_seq"'::regclass);
 n   ALTER TABLE public."TimesheetDetailReimbursement" ALTER COLUMN "TimesheetDetailReimbursementId" DROP DEFAULT;
       public          postgres    false    292    291    292            b          0    16852    Admin 
   TABLE DATA             COPY public."Admin" ("AdminId", "AspNetUserId", "FirstName", "LastName", "Email", "Mobile", "Address1", "Address2", "City", "RegionId", "Zip", "AltPhone", "CreatedBy", "CreatedDate", "ModifiedBy", "ModifiedDate", "Status", "IsDeleted", "RoleId") FROM stdin;
    public          postgres    false    217   "�      f          0    16883    AdminRegion 
   TABLE DATA           O   COPY public."AdminRegion" ("AdminRegionId", "AdminId", "RegionId") FROM stdin;
    public          postgres    false    221   �      g          0    16899    AspNetRoles 
   TABLE DATA           ?   COPY public."AspNetRoles" ("AspNetRoleId", "Name") FROM stdin;
    public          postgres    false    222   <�      h          0    16904    AspNetUserRoles 
   TABLE DATA           ?   COPY public."AspNetUserRoles" ("UserId", "RoleId") FROM stdin;
    public          postgres    false    223   y�      `          0    16844    AspNetUsers 
   TABLE DATA           �   COPY public."AspNetUsers" ("AspNetUserId", "UserName", "PasswordHash", "Email", "PhoneNumber", "IP", "CreatedDate", "ModifiedDate") FROM stdin;
    public          postgres    false    215   �      j          0    16921    BlockRequests 
   TABLE DATA           �   COPY public."BlockRequests" ("BlockRequestId", "PhoneNumber", "Email", "IsActive", "Reason", "RequestId", "IP", "CreatedDate", "ModifiedDate") FROM stdin;
    public          postgres    false    225   g�      l          0    16930    Business 
   TABLE DATA           �   COPY public."Business" ("BusinessId", "Name", "Address1", "Address2", "City", "RegionId", "ZipCode", "PhoneNumber", "FaxNumber", "IsRegistered", "CreatedBy", "CreatedDate", "ModifiedBy", "ModifiedDate", "Status", "IsDeleted", "IP") FROM stdin;
    public          postgres    false    227   ��      n          0    16954    CaseTag 
   TABLE DATA           8   COPY public."CaseTag" ("CaseTagId", "Name") FROM stdin;
    public          postgres    false    229   �      p          0    16961 	   Concierge 
   TABLE DATA           �   COPY public."Concierge" ("ConciergeId", "ConciergeName", "Address", "Street", "City", "State", "ZipCode", "CreatedDate", "RegionId", "RoleId") FROM stdin;
    public          postgres    false    231   ��      q          0    16972    EmailLog 
   TABLE DATA           �   COPY public."EmailLog" ("EmailLogID", "EmailTemplate", "SubjectName", "EmailID", "ConfirmationNumber", "FilePath", "RoleId", "RequestId", "AdminId", "PhysicianId", "CreateDate", "SentDate", "IsEmailSent", "SentTries", "Action") FROM stdin;
    public          postgres    false    232   -�      �          0    33129    EncounterForm 
   TABLE DATA           �  COPY public."EncounterForm" ("EncounterFormId", "RequestId", "HistoryOfPresentIllnessOrInjury", "MedicalHistory", "Medications", "Allergies", "Temp", "HR", "RR", "BloodPressureSystolic", "BloodPressureDiastolic", "O2", "Pain", "Heent", "CV", "Chest", "ABD", "Extremeties", "Skin", "Neuro", "Other", "Diagnosis", "TreatmentPlan", "MedicationsDispensed", "Procedures", "FollowUp", "AdminId", "PhysicianId", "IsFinalize") FROM stdin;
    public          postgres    false    281   ��      s          0    16980    HealthProfessionalType 
   TABLE DATA           �   COPY public."HealthProfessionalType" ("HealthProfessionalId", "ProfessionName", "CreatedDate", "IsActive", "IsDeleted") FROM stdin;
    public          postgres    false    234   Z�      u          0    16996    HealthProfessionals 
   TABLE DATA           �   COPY public."HealthProfessionals" ("VendorId", "VendorName", "Profession", "FaxNumber", "Address", "City", "State", "Zip", "RegionId", "CreatedDate", "ModifiedDate", "PhoneNumber", "IsDeleted", "IP", "Email", "BusinessContact") FROM stdin;
    public          postgres    false    236   ��      w          0    17010    Menu 
   TABLE DATA           N   COPY public."Menu" ("MenuId", "Name", "AccountType", "SortOrder") FROM stdin;
    public          postgres    false    238   ��      y          0    17018    OrderDetails 
   TABLE DATA           �   COPY public."OrderDetails" ("Id", "VendorId", "RequestId", "FaxNumber", "Email", "BusinessContact", "Prescription", "NoOfRefill", "CreatedDate", "CreatedBy") FROM stdin;
    public          postgres    false    240   ��      �          0    49626    PayrateByProvider 
   TABLE DATA           �   COPY public."PayrateByProvider" ("PayrateId", "PayrateCategoryId", "PhysicianId", "Payrate", "CreatedBy", "CreatedDate", "ModifiedBy", "ModifiedDate") FROM stdin;
    public          postgres    false    286   p�      �          0    49526    PayrateCategory 
   TABLE DATA           P   COPY public."PayrateCategory" ("PayrateCategoryId", "CategoryName") FROM stdin;
    public          postgres    false    284   ��      {          0    17027 	   Physician 
   TABLE DATA             COPY public."Physician" ("PhysicianId", "AspNetUserId", "FirstName", "LastName", "Email", "Mobile", "MedicalLicense", "Photo", "AdminNotes", "IsAgreementDoc", "IsBackgroundDoc", "IsTrainingDoc", "IsNonDisclosureDoc", "Address1", "Address2", "City", "RegionId", "Zip", "AltPhone", "CreatedBy", "CreatedDate", "ModifiedBy", "ModifiedDate", "Status", "BusinessName", "BusinessWebsite", "IsDeleted", "RoleId", "NPINumber", "IsLicenseDoc", "Signature", "IsCredentialDoc", "IsTokenGenerate", "SyncEmailAddress") FROM stdin;
    public          postgres    false    242   ��      }          0    17066    PhysicianLocation 
   TABLE DATA           �   COPY public."PhysicianLocation" ("LocationId", "PhysicianId", "Latitude", "Longitude", "CreatedDate", "PhysicianName", "Address") FROM stdin;
    public          postgres    false    244   v�                0    17080    PhysicianNotification 
   TABLE DATA           ]   COPY public."PhysicianNotification" (id, "PhysicianId", "IsNotificationStopped") FROM stdin;
    public          postgres    false    246   ,�      �          0    17092    PhysicianRegion 
   TABLE DATA           [   COPY public."PhysicianRegion" ("PhysicianRegionId", "PhysicianId", "RegionId") FROM stdin;
    public          postgres    false    248   d�      d          0    16876    Region 
   TABLE DATA           F   COPY public."Region" ("RegionId", "Name", "Abbreviation") FROM stdin;
    public          postgres    false    219   ��      �          0    17132    Request 
   TABLE DATA           �  COPY public."Request" ("RequestId", "RequestTypeId", "UserId", "FirstName", "LastName", "PhoneNumber", "Email", "Status", "PhysicianId", "ConfirmationNumber", "CreatedDate", "IsDeleted", "ModifiedDate", "DeclinedBy", "IsUrgentEmailSent", "LastWellnessDate", "IsMobile", "CallType", "CompletedByPhysician", "LastReservationDate", "AcceptedDate", "RelationName", "CaseNumber", "IP", "CaseTag", "CaseTagPhysician", "PatientAccountId", "CreatedUserId") FROM stdin;
    public          postgres    false    251    �      �          0    17153    RequestBusiness 
   TABLE DATA           a   COPY public."RequestBusiness" ("RequestBusinessId", "RequestId", "BusinessId", "IP") FROM stdin;
    public          postgres    false    253   h      �          0    17170    RequestClient 
   TABLE DATA           �  COPY public."RequestClient" ("RequestClientId", "RequestId", "FirstName", "LastName", "PhoneNumber", "Location", "Address", "RegionId", "NotiMobile", "NotiEmail", "Notes", "Email", "strMonth", "intYear", "intDate", "IsMobile", "Street", "City", "State", "ZipCode", "CommunicationType", "RemindReservationCount", "RemindHouseCallCount", "IsSetFollowupSent", "IP", "IsReservationReminderSent", "Latitude", "Longitude") FROM stdin;
    public          postgres    false    255   �      �          0    17218    RequestClosed 
   TABLE DATA           �   COPY public."RequestClosed" ("RequestClosedId", "RequestId", "RequestStatusLogId", "PhyNotes", "ClientNotes", "IP") FROM stdin;
    public          postgres    false    259   o      �          0    17237    RequestConcierge 
   TABLE DATA           T   COPY public."RequestConcierge" ("Id", "RequestId", "ConciergeId", "IP") FROM stdin;
    public          postgres    false    261   �      �          0    17254    RequestNotes 
   TABLE DATA           �   COPY public."RequestNotes" ("RequestNotesId", "RequestId", "strMonth", "intYear", "intDate", "PhysicianNotes", "AdminNotes", "CreatedBy", "CreatedDate", "ModifiedBy", "ModifiedDate", "IP", "AdministrativeNotes") FROM stdin;
    public          postgres    false    263   �      �          0    17189    RequestStatusLog 
   TABLE DATA           �   COPY public."RequestStatusLog" ("RequestStatusLogId", "RequestId", "Status", "PhysicianId", "AdminId", "TransToPhysicianId", "Notes", "CreatedDate", "IP", "TransToAdmin") FROM stdin;
    public          postgres    false    257   �	      �          0    17268    RequestType 
   TABLE DATA           @   COPY public."RequestType" ("RequestTypeId", "Name") FROM stdin;
    public          postgres    false    265         �          0    17276    RequestWiseFile 
   TABLE DATA           �   COPY public."RequestWiseFile" ("RequestWiseFileID", "RequestId", "FileName", "CreatedDate", "PhysicianId", "AdminId", "DocType", "IsFrontSide", "IsCompensation", "IP", "IsFinalize", "IsDeleted", "IsPatientRecords") FROM stdin;
    public          postgres    false    267         �          0    17300    Role 
   TABLE DATA           �   COPY public."Role" ("RoleId", "Name", "AccountType", "CreatedBy", "CreatedDate", "ModifiedBy", "ModifiedDate", "IsDeleted", "IP") FROM stdin;
    public          postgres    false    269   �      �          0    17308    RoleMenu 
   TABLE DATA           F   COPY public."RoleMenu" ("RoleMenuId", "RoleId", "MenuId") FROM stdin;
    public          postgres    false    271   U      �          0    17375    SMSLog 
   TABLE DATA           �   COPY public."SMSLog" ("SMSLogID", "SMSTemplate", "MobileNumber", "ConfirmationNumber", "RoleId", "AdminId", "RequestId", "PhysicianId", "CreateDate", "SentDate", "IsSMSSent", "SentTries", "Action") FROM stdin;
    public          postgres    false    278   �      �          0    17325    Shift 
   TABLE DATA           �   COPY public."Shift" ("ShiftId", "PhysicianId", "StartDate", "IsRepeat", "WeekDays", "RepeatUpto", "CreatedBy", "CreatedDate", "IP") FROM stdin;
    public          postgres    false    273   �      �          0    17342    ShiftDetail 
   TABLE DATA           �   COPY public."ShiftDetail" ("ShiftDetailId", "ShiftId", "ShiftDate", "RegionId", "StartTime", "EndTime", "Status", "IsDeleted", "ModifiedBy", "ModifiedDate", "LastRunningDate", "EventId", "IsSync") FROM stdin;
    public          postgres    false    275   �      �          0    17359    ShiftDetailRegion 
   TABLE DATA           n   COPY public."ShiftDetailRegion" ("ShiftDetailRegionId", "ShiftDetailId", "RegionId", "IsDeleted") FROM stdin;
    public          postgres    false    277   -      �          0    49654 	   Timesheet 
   TABLE DATA           �   COPY public."Timesheet" ("TimesheetId", "PhysicianId", "StartDate", "EndDate", "IsFinalize", "IsApproved", "BonusAmount", "AdminNotes", "CreatedBy", "CreatedDate", "ModifiedBy", "ModifiedDate") FROM stdin;
    public          postgres    false    288   �      �          0    49679    TimesheetDetail 
   TABLE DATA           �   COPY public."TimesheetDetail" ("TimesheetDetailId", "TimesheetId", "TimesheetDate", "TotalHours", "IsWeekend", "NumberOfHouseCall", "NumberOfPhoneCall", "ModifiedBy", "ModifiedDate") FROM stdin;
    public          postgres    false    290   �      �          0    49698    TimesheetDetailReimbursement 
   TABLE DATA           �   COPY public."TimesheetDetailReimbursement" ("TimesheetDetailReimbursementId", "TimesheetDetailId", "ItemName", "Amount", "Bill", "IsDeleted", "CreatedBy", "CreatedDate", "ModifiedBy", "ModifiedDate") FROM stdin;
    public          postgres    false    292   �      �          0    17119    User 
   TABLE DATA           3  COPY public."User" ("UserId", "AspNetUserId", "FirstName", "LastName", "Email", "Mobile", "IsMobile", "Street", "City", "State", "RegionId", "ZipCode", "strMonth", "intYear", "intDate", "CreatedBy", "CreatedDate", "ModifiedBy", "ModifiedDate", "Status", "IsDeleted", "IP", "IsRequestWithEmail") FROM stdin;
    public          postgres    false    249         �           0    0    AdminRegion_AdminRegionId_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public."AdminRegion_AdminRegionId_seq"', 29, true);
          public          postgres    false    220            �           0    0    Admin_AdminId_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Admin_AdminId_seq"', 3, true);
          public          postgres    false    216            �           0    0     BlockRequests_BlockRequestId_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public."BlockRequests_BlockRequestId_seq"', 4, true);
          public          postgres    false    224            �           0    0    Business_BusinessId_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."Business_BusinessId_seq"', 4, true);
          public          postgres    false    226            �           0    0    CaseTag_CaseTagId_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."CaseTag_CaseTagId_seq"', 2, true);
          public          postgres    false    228            �           0    0    Concierge_ConciergeId_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."Concierge_ConciergeId_seq"', 7, true);
          public          postgres    false    230            �           0    0    EmailLog_EmailLogID_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."EmailLog_EmailLogID_seq"', 2, true);
          public          postgres    false    282            �           0    0 !   EncounterForm_EncounterFormId_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public."EncounterForm_EncounterFormId_seq"', 6, true);
          public          postgres    false    280            �           0    0 /   HealthProfessionalType_HealthProfessionalId_seq    SEQUENCE SET     `   SELECT pg_catalog.setval('public."HealthProfessionalType_HealthProfessionalId_seq"', 1, false);
          public          postgres    false    233            �           0    0     HealthProfessionals_VendorId_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public."HealthProfessionals_VendorId_seq"', 10, true);
          public          postgres    false    235            �           0    0    Menu_MenuId_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Menu_MenuId_seq"', 1, false);
          public          postgres    false    237            �           0    0    OrderDetails_Id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."OrderDetails_Id_seq"', 7, true);
          public          postgres    false    239            �           0    0    PayrateByProvider_PayrateId_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public."PayrateByProvider_PayrateId_seq"', 1, false);
          public          postgres    false    285            �           0    0 %   PayrateCategory_PayrateCategoryId_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public."PayrateCategory_PayrateCategoryId_seq"', 1, false);
          public          postgres    false    283            �           0    0     PhysicianLocation_LocationId_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public."PhysicianLocation_LocationId_seq"', 1, false);
          public          postgres    false    243            �           0    0    PhysicianNotification_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public."PhysicianNotification_id_seq"', 7, true);
          public          postgres    false    245            �           0    0 %   PhysicianRegion_PhysicianRegionId_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public."PhysicianRegion_PhysicianRegionId_seq"', 26, true);
          public          postgres    false    247            �           0    0    Physician_PhysicianId_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public."Physician_PhysicianId_seq"', 14, true);
          public          postgres    false    241            �           0    0    Region_RegionId_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."Region_RegionId_seq"', 1, true);
          public          postgres    false    218            �           0    0 %   RequestBusiness_RequestBusinessId_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public."RequestBusiness_RequestBusinessId_seq"', 4, true);
          public          postgres    false    252            �           0    0 !   RequestClient_RequestClientId_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public."RequestClient_RequestClientId_seq"', 62, true);
          public          postgres    false    254            �           0    0 !   RequestClosed_RequestClosedId_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public."RequestClosed_RequestClosedId_seq"', 1, false);
          public          postgres    false    258            �           0    0    RequestConcierge_Id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public."RequestConcierge_Id_seq"', 1, false);
          public          postgres    false    260            �           0    0    RequestNotes_RequestNotesId_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public."RequestNotes_RequestNotesId_seq"', 6, true);
          public          postgres    false    262            �           0    0 '   RequestStatusLog_RequestStatusLogId_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public."RequestStatusLog_RequestStatusLogId_seq"', 53, true);
          public          postgres    false    256            �           0    0    RequestType_RequestTypeId_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public."RequestType_RequestTypeId_seq"', 1, false);
          public          postgres    false    264            �           0    0 %   RequestWiseFile_RequestWiseFileID_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public."RequestWiseFile_RequestWiseFileID_seq"', 57, true);
          public          postgres    false    266            �           0    0    Request_RequestId_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."Request_RequestId_seq"', 69, true);
          public          postgres    false    250            �           0    0    RoleMenu_RoleMenuId_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public."RoleMenu_RoleMenuId_seq"', 25, true);
          public          postgres    false    270            �           0    0    Role_RoleId_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."Role_RoleId_seq"', 4, true);
          public          postgres    false    268            �           0    0 )   ShiftDetailRegion_ShiftDetailRegionId_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public."ShiftDetailRegion_ShiftDetailRegionId_seq"', 24, true);
          public          postgres    false    276            �           0    0    ShiftDetail_ShiftDetailId_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public."ShiftDetail_ShiftDetailId_seq"', 80, true);
          public          postgres    false    274            �           0    0    Shift_ShiftId_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."Shift_ShiftId_seq"', 27, true);
          public          postgres    false    272            �           0    0 ?   TimesheetDetailReimbursement_TimesheetDetailReimbursementId_seq    SEQUENCE SET     p   SELECT pg_catalog.setval('public."TimesheetDetailReimbursement_TimesheetDetailReimbursementId_seq"', 1, false);
          public          postgres    false    291            �           0    0 %   TimesheetDetail_TimesheetDetailId_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public."TimesheetDetail_TimesheetDetailId_seq"', 1, false);
          public          postgres    false    289            �           0    0    Timesheet_TimesheetId_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public."Timesheet_TimesheetId_seq"', 1, false);
          public          postgres    false    287            �           0    0    User_UserId_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."User_UserId_seq"', 52, true);
          public          postgres    false    279            H           2606    16888    AdminRegion AdminRegion_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public."AdminRegion"
    ADD CONSTRAINT "AdminRegion_pkey" PRIMARY KEY ("AdminRegionId");
 J   ALTER TABLE ONLY public."AdminRegion" DROP CONSTRAINT "AdminRegion_pkey";
       public            postgres    false    221            D           2606    16859    Admin Admin_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public."Admin"
    ADD CONSTRAINT "Admin_pkey" PRIMARY KEY ("AdminId");
 >   ALTER TABLE ONLY public."Admin" DROP CONSTRAINT "Admin_pkey";
       public            postgres    false    217            J           2606    16903    AspNetRoles AspNetRoles_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public."AspNetRoles"
    ADD CONSTRAINT "AspNetRoles_pkey" PRIMARY KEY ("AspNetRoleId");
 J   ALTER TABLE ONLY public."AspNetRoles" DROP CONSTRAINT "AspNetRoles_pkey";
       public            postgres    false    222            L           2606    33122 $   AspNetUserRoles AspNetUserRoles_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public."AspNetUserRoles"
    ADD CONSTRAINT "AspNetUserRoles_pkey" PRIMARY KEY ("UserId");
 R   ALTER TABLE ONLY public."AspNetUserRoles" DROP CONSTRAINT "AspNetUserRoles_pkey";
       public            postgres    false    223            B           2606    16850    AspNetUsers AspNetUsers_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public."AspNetUsers"
    ADD CONSTRAINT "AspNetUsers_pkey" PRIMARY KEY ("AspNetUserId");
 J   ALTER TABLE ONLY public."AspNetUsers" DROP CONSTRAINT "AspNetUsers_pkey";
       public            postgres    false    215            N           2606    16928     BlockRequests BlockRequests_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public."BlockRequests"
    ADD CONSTRAINT "BlockRequests_pkey" PRIMARY KEY ("BlockRequestId");
 N   ALTER TABLE ONLY public."BlockRequests" DROP CONSTRAINT "BlockRequests_pkey";
       public            postgres    false    225            P           2606    16937    Business Business_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."Business"
    ADD CONSTRAINT "Business_pkey" PRIMARY KEY ("BusinessId");
 D   ALTER TABLE ONLY public."Business" DROP CONSTRAINT "Business_pkey";
       public            postgres    false    227            R           2606    16959    CaseTag CaseTag_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."CaseTag"
    ADD CONSTRAINT "CaseTag_pkey" PRIMARY KEY ("CaseTagId");
 B   ALTER TABLE ONLY public."CaseTag" DROP CONSTRAINT "CaseTag_pkey";
       public            postgres    false    229            T           2606    16966    Concierge Concierge_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public."Concierge"
    ADD CONSTRAINT "Concierge_pkey" PRIMARY KEY ("ConciergeId");
 F   ALTER TABLE ONLY public."Concierge" DROP CONSTRAINT "Concierge_pkey";
       public            postgres    false    231            V           2606    41314    EmailLog EmailLog_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."EmailLog"
    ADD CONSTRAINT "EmailLog_pkey" PRIMARY KEY ("EmailLogID");
 D   ALTER TABLE ONLY public."EmailLog" DROP CONSTRAINT "EmailLog_pkey";
       public            postgres    false    232            �           2606    33137     EncounterForm EncounterForm_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public."EncounterForm"
    ADD CONSTRAINT "EncounterForm_pkey" PRIMARY KEY ("EncounterFormId");
 N   ALTER TABLE ONLY public."EncounterForm" DROP CONSTRAINT "EncounterForm_pkey";
       public            postgres    false    281            X           2606    16985 2   HealthProfessionalType HealthProfessionalType_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."HealthProfessionalType"
    ADD CONSTRAINT "HealthProfessionalType_pkey" PRIMARY KEY ("HealthProfessionalId");
 `   ALTER TABLE ONLY public."HealthProfessionalType" DROP CONSTRAINT "HealthProfessionalType_pkey";
       public            postgres    false    234            Z           2606    17003 ,   HealthProfessionals HealthProfessionals_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public."HealthProfessionals"
    ADD CONSTRAINT "HealthProfessionals_pkey" PRIMARY KEY ("VendorId");
 Z   ALTER TABLE ONLY public."HealthProfessionals" DROP CONSTRAINT "HealthProfessionals_pkey";
       public            postgres    false    236            \           2606    17016    Menu Menu_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Menu"
    ADD CONSTRAINT "Menu_pkey" PRIMARY KEY ("MenuId");
 <   ALTER TABLE ONLY public."Menu" DROP CONSTRAINT "Menu_pkey";
       public            postgres    false    238            ^           2606    17025    OrderDetails OrderDetails_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."OrderDetails"
    ADD CONSTRAINT "OrderDetails_pkey" PRIMARY KEY ("Id");
 L   ALTER TABLE ONLY public."OrderDetails" DROP CONSTRAINT "OrderDetails_pkey";
       public            postgres    false    240            �           2606    49632 (   PayrateByProvider PayrateByProvider_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public."PayrateByProvider"
    ADD CONSTRAINT "PayrateByProvider_pkey" PRIMARY KEY ("PayrateId");
 V   ALTER TABLE ONLY public."PayrateByProvider" DROP CONSTRAINT "PayrateByProvider_pkey";
       public            postgres    false    286            �           2606    49531 $   PayrateCategory PayrateCategory_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public."PayrateCategory"
    ADD CONSTRAINT "PayrateCategory_pkey" PRIMARY KEY ("PayrateCategoryId");
 R   ALTER TABLE ONLY public."PayrateCategory" DROP CONSTRAINT "PayrateCategory_pkey";
       public            postgres    false    284            b           2606    17073 (   PhysicianLocation PhysicianLocation_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public."PhysicianLocation"
    ADD CONSTRAINT "PhysicianLocation_pkey" PRIMARY KEY ("LocationId");
 V   ALTER TABLE ONLY public."PhysicianLocation" DROP CONSTRAINT "PhysicianLocation_pkey";
       public            postgres    false    244            d           2606    17085 0   PhysicianNotification PhysicianNotification_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public."PhysicianNotification"
    ADD CONSTRAINT "PhysicianNotification_pkey" PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public."PhysicianNotification" DROP CONSTRAINT "PhysicianNotification_pkey";
       public            postgres    false    246            f           2606    17097 $   PhysicianRegion PhysicianRegion_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public."PhysicianRegion"
    ADD CONSTRAINT "PhysicianRegion_pkey" PRIMARY KEY ("PhysicianRegionId");
 R   ALTER TABLE ONLY public."PhysicianRegion" DROP CONSTRAINT "PhysicianRegion_pkey";
       public            postgres    false    248            `           2606    17034    Physician Physician_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public."Physician"
    ADD CONSTRAINT "Physician_pkey" PRIMARY KEY ("PhysicianId");
 F   ALTER TABLE ONLY public."Physician" DROP CONSTRAINT "Physician_pkey";
       public            postgres    false    242            F           2606    16881    Region Region_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Region"
    ADD CONSTRAINT "Region_pkey" PRIMARY KEY ("RegionId");
 @   ALTER TABLE ONLY public."Region" DROP CONSTRAINT "Region_pkey";
       public            postgres    false    219            l           2606    17158 $   RequestBusiness RequestBusiness_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public."RequestBusiness"
    ADD CONSTRAINT "RequestBusiness_pkey" PRIMARY KEY ("RequestBusinessId");
 R   ALTER TABLE ONLY public."RequestBusiness" DROP CONSTRAINT "RequestBusiness_pkey";
       public            postgres    false    253            n           2606    17177     RequestClient RequestClient_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public."RequestClient"
    ADD CONSTRAINT "RequestClient_pkey" PRIMARY KEY ("RequestClientId");
 N   ALTER TABLE ONLY public."RequestClient" DROP CONSTRAINT "RequestClient_pkey";
       public            postgres    false    255            r           2606    17225     RequestClosed RequestClosed_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public."RequestClosed"
    ADD CONSTRAINT "RequestClosed_pkey" PRIMARY KEY ("RequestClosedId");
 N   ALTER TABLE ONLY public."RequestClosed" DROP CONSTRAINT "RequestClosed_pkey";
       public            postgres    false    259            t           2606    17242 &   RequestConcierge RequestConcierge_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public."RequestConcierge"
    ADD CONSTRAINT "RequestConcierge_pkey" PRIMARY KEY ("Id");
 T   ALTER TABLE ONLY public."RequestConcierge" DROP CONSTRAINT "RequestConcierge_pkey";
       public            postgres    false    261            v           2606    17261    RequestNotes RequestNotes_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public."RequestNotes"
    ADD CONSTRAINT "RequestNotes_pkey" PRIMARY KEY ("RequestNotesId");
 L   ALTER TABLE ONLY public."RequestNotes" DROP CONSTRAINT "RequestNotes_pkey";
       public            postgres    false    263            p           2606    17196 &   RequestStatusLog RequestStatusLog_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public."RequestStatusLog"
    ADD CONSTRAINT "RequestStatusLog_pkey" PRIMARY KEY ("RequestStatusLogId");
 T   ALTER TABLE ONLY public."RequestStatusLog" DROP CONSTRAINT "RequestStatusLog_pkey";
       public            postgres    false    257            x           2606    17273    RequestType RequestType_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public."RequestType"
    ADD CONSTRAINT "RequestType_pkey" PRIMARY KEY ("RequestTypeId");
 J   ALTER TABLE ONLY public."RequestType" DROP CONSTRAINT "RequestType_pkey";
       public            postgres    false    265            z           2606    17283 $   RequestWiseFile RequestWiseFile_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public."RequestWiseFile"
    ADD CONSTRAINT "RequestWiseFile_pkey" PRIMARY KEY ("RequestWiseFileID");
 R   ALTER TABLE ONLY public."RequestWiseFile" DROP CONSTRAINT "RequestWiseFile_pkey";
       public            postgres    false    267            j           2606    17141    Request Request_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."Request"
    ADD CONSTRAINT "Request_pkey" PRIMARY KEY ("RequestId");
 B   ALTER TABLE ONLY public."Request" DROP CONSTRAINT "Request_pkey";
       public            postgres    false    251            ~           2606    17313    RoleMenu RoleMenu_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."RoleMenu"
    ADD CONSTRAINT "RoleMenu_pkey" PRIMARY KEY ("RoleMenuId");
 D   ALTER TABLE ONLY public."RoleMenu" DROP CONSTRAINT "RoleMenu_pkey";
       public            postgres    false    271            |           2606    17306    Role Role_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Role"
    ADD CONSTRAINT "Role_pkey" PRIMARY KEY ("RoleId");
 <   ALTER TABLE ONLY public."Role" DROP CONSTRAINT "Role_pkey";
       public            postgres    false    269            �           2606    17381    SMSLog SMSLog_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."SMSLog"
    ADD CONSTRAINT "SMSLog_pkey" PRIMARY KEY ("SMSLogID");
 @   ALTER TABLE ONLY public."SMSLog" DROP CONSTRAINT "SMSLog_pkey";
       public            postgres    false    278            �           2606    17364 (   ShiftDetailRegion ShiftDetailRegion_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY public."ShiftDetailRegion"
    ADD CONSTRAINT "ShiftDetailRegion_pkey" PRIMARY KEY ("ShiftDetailRegionId");
 V   ALTER TABLE ONLY public."ShiftDetailRegion" DROP CONSTRAINT "ShiftDetailRegion_pkey";
       public            postgres    false    277            �           2606    17347    ShiftDetail ShiftDetail_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public."ShiftDetail"
    ADD CONSTRAINT "ShiftDetail_pkey" PRIMARY KEY ("ShiftDetailId");
 J   ALTER TABLE ONLY public."ShiftDetail" DROP CONSTRAINT "ShiftDetail_pkey";
       public            postgres    false    275            �           2606    17330    Shift Shift_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public."Shift"
    ADD CONSTRAINT "Shift_pkey" PRIMARY KEY ("ShiftId");
 >   ALTER TABLE ONLY public."Shift" DROP CONSTRAINT "Shift_pkey";
       public            postgres    false    273            �           2606    49706 >   TimesheetDetailReimbursement TimesheetDetailReimbursement_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."TimesheetDetailReimbursement"
    ADD CONSTRAINT "TimesheetDetailReimbursement_pkey" PRIMARY KEY ("TimesheetDetailReimbursementId");
 l   ALTER TABLE ONLY public."TimesheetDetailReimbursement" DROP CONSTRAINT "TimesheetDetailReimbursement_pkey";
       public            postgres    false    292            �           2606    49686 $   TimesheetDetail TimesheetDetail_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public."TimesheetDetail"
    ADD CONSTRAINT "TimesheetDetail_pkey" PRIMARY KEY ("TimesheetDetailId");
 R   ALTER TABLE ONLY public."TimesheetDetail" DROP CONSTRAINT "TimesheetDetail_pkey";
       public            postgres    false    290            �           2606    49662    Timesheet Timesheet_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public."Timesheet"
    ADD CONSTRAINT "Timesheet_pkey" PRIMARY KEY ("TimesheetId");
 F   ALTER TABLE ONLY public."Timesheet" DROP CONSTRAINT "Timesheet_pkey";
       public            postgres    false    288            h           2606    17125    User User_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY ("UserId");
 <   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_pkey";
       public            postgres    false    249            �           2606    16860    Admin Admin_AspNetUserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Admin"
    ADD CONSTRAINT "Admin_AspNetUserId_fkey" FOREIGN KEY ("AspNetUserId") REFERENCES public."AspNetUsers"("AspNetUserId");
 K   ALTER TABLE ONLY public."Admin" DROP CONSTRAINT "Admin_AspNetUserId_fkey";
       public          postgres    false    4930    215    217            �           2606    16865    Admin Admin_CreatedBy_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Admin"
    ADD CONSTRAINT "Admin_CreatedBy_fkey" FOREIGN KEY ("CreatedBy") REFERENCES public."AspNetUsers"("AspNetUserId");
 H   ALTER TABLE ONLY public."Admin" DROP CONSTRAINT "Admin_CreatedBy_fkey";
       public          postgres    false    217    4930    215            �           2606    16870    Admin Admin_ModifiedBy_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Admin"
    ADD CONSTRAINT "Admin_ModifiedBy_fkey" FOREIGN KEY ("ModifiedBy") REFERENCES public."AspNetUsers"("AspNetUserId");
 I   ALTER TABLE ONLY public."Admin" DROP CONSTRAINT "Admin_ModifiedBy_fkey";
       public          postgres    false    215    4930    217            �           2606    33123 +   AspNetUserRoles AspNetUserRoles_RoleId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."AspNetUserRoles"
    ADD CONSTRAINT "AspNetUserRoles_RoleId_fkey" FOREIGN KEY ("RoleId") REFERENCES public."AspNetRoles"("AspNetRoleId") NOT VALID;
 Y   ALTER TABLE ONLY public."AspNetUserRoles" DROP CONSTRAINT "AspNetUserRoles_RoleId_fkey";
       public          postgres    false    223    222    4938            �           2606    16909 +   AspNetUserRoles AspNetUserRoles_UserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."AspNetUserRoles"
    ADD CONSTRAINT "AspNetUserRoles_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES public."AspNetUsers"("AspNetUserId");
 Y   ALTER TABLE ONLY public."AspNetUserRoles" DROP CONSTRAINT "AspNetUserRoles_UserId_fkey";
       public          postgres    false    215    223    4930            �           2606    16943     Business Business_CreatedBy_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Business"
    ADD CONSTRAINT "Business_CreatedBy_fkey" FOREIGN KEY ("CreatedBy") REFERENCES public."AspNetUsers"("AspNetUserId");
 N   ALTER TABLE ONLY public."Business" DROP CONSTRAINT "Business_CreatedBy_fkey";
       public          postgres    false    4930    227    215            �           2606    16948 !   Business Business_ModifiedBy_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Business"
    ADD CONSTRAINT "Business_ModifiedBy_fkey" FOREIGN KEY ("ModifiedBy") REFERENCES public."AspNetUsers"("AspNetUserId");
 O   ALTER TABLE ONLY public."Business" DROP CONSTRAINT "Business_ModifiedBy_fkey";
       public          postgres    false    4930    227    215            �           2606    16938    Business Business_RegionId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Business"
    ADD CONSTRAINT "Business_RegionId_fkey" FOREIGN KEY ("RegionId") REFERENCES public."Region"("RegionId");
 M   ALTER TABLE ONLY public."Business" DROP CONSTRAINT "Business_RegionId_fkey";
       public          postgres    false    227    4934    219            �           2606    16967 !   Concierge Concierge_RegionId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Concierge"
    ADD CONSTRAINT "Concierge_RegionId_fkey" FOREIGN KEY ("RegionId") REFERENCES public."Region"("RegionId");
 O   ALTER TABLE ONLY public."Concierge" DROP CONSTRAINT "Concierge_RegionId_fkey";
       public          postgres    false    4934    231    219            �           2606    33143 (   EncounterForm EncounterForm_AdminId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."EncounterForm"
    ADD CONSTRAINT "EncounterForm_AdminId_fkey" FOREIGN KEY ("AdminId") REFERENCES public."Admin"("AdminId");
 V   ALTER TABLE ONLY public."EncounterForm" DROP CONSTRAINT "EncounterForm_AdminId_fkey";
       public          postgres    false    217    4932    281            �           2606    33148 ,   EncounterForm EncounterForm_PhysicianId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."EncounterForm"
    ADD CONSTRAINT "EncounterForm_PhysicianId_fkey" FOREIGN KEY ("PhysicianId") REFERENCES public."Physician"("PhysicianId");
 Z   ALTER TABLE ONLY public."EncounterForm" DROP CONSTRAINT "EncounterForm_PhysicianId_fkey";
       public          postgres    false    281    4960    242            �           2606    33138 *   EncounterForm EncounterForm_RequestId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."EncounterForm"
    ADD CONSTRAINT "EncounterForm_RequestId_fkey" FOREIGN KEY ("RequestId") REFERENCES public."Request"("RequestId");
 X   ALTER TABLE ONLY public."EncounterForm" DROP CONSTRAINT "EncounterForm_RequestId_fkey";
       public          postgres    false    281    251    4970            �           2606    16889 "   AdminRegion FK_AdminRegion_AdminId    FK CONSTRAINT     �   ALTER TABLE ONLY public."AdminRegion"
    ADD CONSTRAINT "FK_AdminRegion_AdminId" FOREIGN KEY ("AdminId") REFERENCES public."Admin"("AdminId");
 P   ALTER TABLE ONLY public."AdminRegion" DROP CONSTRAINT "FK_AdminRegion_AdminId";
       public          postgres    false    4932    217    221            �           2606    16894 #   AdminRegion FK_AdminRegion_RegionId    FK CONSTRAINT     �   ALTER TABLE ONLY public."AdminRegion"
    ADD CONSTRAINT "FK_AdminRegion_RegionId" FOREIGN KEY ("RegionId") REFERENCES public."Region"("RegionId");
 Q   ALTER TABLE ONLY public."AdminRegion" DROP CONSTRAINT "FK_AdminRegion_RegionId";
       public          postgres    false    221    219    4934            �           2606    17004 7   HealthProfessionals HealthProfessionals_Profession_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."HealthProfessionals"
    ADD CONSTRAINT "HealthProfessionals_Profession_fkey" FOREIGN KEY ("Profession") REFERENCES public."HealthProfessionalType"("HealthProfessionalId");
 e   ALTER TABLE ONLY public."HealthProfessionals" DROP CONSTRAINT "HealthProfessionals_Profession_fkey";
       public          postgres    false    4952    236    234            �           2606    17074 4   PhysicianLocation PhysicianLocation_PhysicianId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."PhysicianLocation"
    ADD CONSTRAINT "PhysicianLocation_PhysicianId_fkey" FOREIGN KEY ("PhysicianId") REFERENCES public."Physician"("PhysicianId");
 b   ALTER TABLE ONLY public."PhysicianLocation" DROP CONSTRAINT "PhysicianLocation_PhysicianId_fkey";
       public          postgres    false    242    244    4960            �           2606    17086 <   PhysicianNotification PhysicianNotification_PhysicianId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."PhysicianNotification"
    ADD CONSTRAINT "PhysicianNotification_PhysicianId_fkey" FOREIGN KEY ("PhysicianId") REFERENCES public."Physician"("PhysicianId");
 j   ALTER TABLE ONLY public."PhysicianNotification" DROP CONSTRAINT "PhysicianNotification_PhysicianId_fkey";
       public          postgres    false    242    246    4960            �           2606    17098 0   PhysicianRegion PhysicianRegion_PhysicianId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."PhysicianRegion"
    ADD CONSTRAINT "PhysicianRegion_PhysicianId_fkey" FOREIGN KEY ("PhysicianId") REFERENCES public."Physician"("PhysicianId");
 ^   ALTER TABLE ONLY public."PhysicianRegion" DROP CONSTRAINT "PhysicianRegion_PhysicianId_fkey";
       public          postgres    false    4960    248    242            �           2606    17103 -   PhysicianRegion PhysicianRegion_RegionId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."PhysicianRegion"
    ADD CONSTRAINT "PhysicianRegion_RegionId_fkey" FOREIGN KEY ("RegionId") REFERENCES public."Region"("RegionId");
 [   ALTER TABLE ONLY public."PhysicianRegion" DROP CONSTRAINT "PhysicianRegion_RegionId_fkey";
       public          postgres    false    4934    219    248            �           2606    17035 %   Physician Physician_AspNetUserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Physician"
    ADD CONSTRAINT "Physician_AspNetUserId_fkey" FOREIGN KEY ("AspNetUserId") REFERENCES public."AspNetUsers"("AspNetUserId");
 S   ALTER TABLE ONLY public."Physician" DROP CONSTRAINT "Physician_AspNetUserId_fkey";
       public          postgres    false    215    242    4930            �           2606    17040 "   Physician Physician_CreatedBy_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Physician"
    ADD CONSTRAINT "Physician_CreatedBy_fkey" FOREIGN KEY ("CreatedBy") REFERENCES public."AspNetUsers"("AspNetUserId");
 P   ALTER TABLE ONLY public."Physician" DROP CONSTRAINT "Physician_CreatedBy_fkey";
       public          postgres    false    4930    242    215            �           2606    17045 #   Physician Physician_ModifiedBy_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Physician"
    ADD CONSTRAINT "Physician_ModifiedBy_fkey" FOREIGN KEY ("ModifiedBy") REFERENCES public."AspNetUsers"("AspNetUserId");
 Q   ALTER TABLE ONLY public."Physician" DROP CONSTRAINT "Physician_ModifiedBy_fkey";
       public          postgres    false    215    242    4930            �           2606    33164    Physician Physician_RoleId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Physician"
    ADD CONSTRAINT "Physician_RoleId_fkey" FOREIGN KEY ("RoleId") REFERENCES public."Role"("RoleId") NOT VALID;
 M   ALTER TABLE ONLY public."Physician" DROP CONSTRAINT "Physician_RoleId_fkey";
       public          postgres    false    4988    269    242            �           2606    17164 /   RequestBusiness RequestBusiness_BusinessId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RequestBusiness"
    ADD CONSTRAINT "RequestBusiness_BusinessId_fkey" FOREIGN KEY ("BusinessId") REFERENCES public."Business"("BusinessId");
 ]   ALTER TABLE ONLY public."RequestBusiness" DROP CONSTRAINT "RequestBusiness_BusinessId_fkey";
       public          postgres    false    4944    253    227            �           2606    17159 .   RequestBusiness RequestBusiness_RequestId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RequestBusiness"
    ADD CONSTRAINT "RequestBusiness_RequestId_fkey" FOREIGN KEY ("RequestId") REFERENCES public."Request"("RequestId");
 \   ALTER TABLE ONLY public."RequestBusiness" DROP CONSTRAINT "RequestBusiness_RequestId_fkey";
       public          postgres    false    4970    253    251            �           2606    17183 )   RequestClient RequestClient_RegionId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RequestClient"
    ADD CONSTRAINT "RequestClient_RegionId_fkey" FOREIGN KEY ("RegionId") REFERENCES public."Region"("RegionId");
 W   ALTER TABLE ONLY public."RequestClient" DROP CONSTRAINT "RequestClient_RegionId_fkey";
       public          postgres    false    255    4934    219            �           2606    17178 *   RequestClient RequestClient_RequestId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RequestClient"
    ADD CONSTRAINT "RequestClient_RequestId_fkey" FOREIGN KEY ("RequestId") REFERENCES public."Request"("RequestId");
 X   ALTER TABLE ONLY public."RequestClient" DROP CONSTRAINT "RequestClient_RequestId_fkey";
       public          postgres    false    251    255    4970            �           2606    17226 *   RequestClosed RequestClosed_RequestId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RequestClosed"
    ADD CONSTRAINT "RequestClosed_RequestId_fkey" FOREIGN KEY ("RequestId") REFERENCES public."Request"("RequestId");
 X   ALTER TABLE ONLY public."RequestClosed" DROP CONSTRAINT "RequestClosed_RequestId_fkey";
       public          postgres    false    4970    251    259            �           2606    17231 3   RequestClosed RequestClosed_RequestStatusLogId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RequestClosed"
    ADD CONSTRAINT "RequestClosed_RequestStatusLogId_fkey" FOREIGN KEY ("RequestStatusLogId") REFERENCES public."RequestStatusLog"("RequestStatusLogId");
 a   ALTER TABLE ONLY public."RequestClosed" DROP CONSTRAINT "RequestClosed_RequestStatusLogId_fkey";
       public          postgres    false    4976    259    257            �           2606    17248 2   RequestConcierge RequestConcierge_ConciergeId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RequestConcierge"
    ADD CONSTRAINT "RequestConcierge_ConciergeId_fkey" FOREIGN KEY ("ConciergeId") REFERENCES public."Concierge"("ConciergeId");
 `   ALTER TABLE ONLY public."RequestConcierge" DROP CONSTRAINT "RequestConcierge_ConciergeId_fkey";
       public          postgres    false    231    261    4948            �           2606    17243 0   RequestConcierge RequestConcierge_RequestId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RequestConcierge"
    ADD CONSTRAINT "RequestConcierge_RequestId_fkey" FOREIGN KEY ("RequestId") REFERENCES public."Request"("RequestId");
 ^   ALTER TABLE ONLY public."RequestConcierge" DROP CONSTRAINT "RequestConcierge_RequestId_fkey";
       public          postgres    false    251    4970    261            �           2606    17262 (   RequestNotes RequestNotes_RequestId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RequestNotes"
    ADD CONSTRAINT "RequestNotes_RequestId_fkey" FOREIGN KEY ("RequestId") REFERENCES public."Request"("RequestId");
 V   ALTER TABLE ONLY public."RequestNotes" DROP CONSTRAINT "RequestNotes_RequestId_fkey";
       public          postgres    false    4970    251    263            �           2606    17207 .   RequestStatusLog RequestStatusLog_AdminId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RequestStatusLog"
    ADD CONSTRAINT "RequestStatusLog_AdminId_fkey" FOREIGN KEY ("AdminId") REFERENCES public."Admin"("AdminId");
 \   ALTER TABLE ONLY public."RequestStatusLog" DROP CONSTRAINT "RequestStatusLog_AdminId_fkey";
       public          postgres    false    4932    257    217            �           2606    17202 2   RequestStatusLog RequestStatusLog_PhysicianId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RequestStatusLog"
    ADD CONSTRAINT "RequestStatusLog_PhysicianId_fkey" FOREIGN KEY ("PhysicianId") REFERENCES public."Physician"("PhysicianId");
 `   ALTER TABLE ONLY public."RequestStatusLog" DROP CONSTRAINT "RequestStatusLog_PhysicianId_fkey";
       public          postgres    false    4960    257    242            �           2606    17197 0   RequestStatusLog RequestStatusLog_RequestId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RequestStatusLog"
    ADD CONSTRAINT "RequestStatusLog_RequestId_fkey" FOREIGN KEY ("RequestId") REFERENCES public."Request"("RequestId");
 ^   ALTER TABLE ONLY public."RequestStatusLog" DROP CONSTRAINT "RequestStatusLog_RequestId_fkey";
       public          postgres    false    4970    257    251            �           2606    17212 9   RequestStatusLog RequestStatusLog_TransToPhysicianId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RequestStatusLog"
    ADD CONSTRAINT "RequestStatusLog_TransToPhysicianId_fkey" FOREIGN KEY ("TransToPhysicianId") REFERENCES public."Physician"("PhysicianId");
 g   ALTER TABLE ONLY public."RequestStatusLog" DROP CONSTRAINT "RequestStatusLog_TransToPhysicianId_fkey";
       public          postgres    false    242    257    4960            �           2606    17294 ,   RequestWiseFile RequestWiseFile_AdminId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RequestWiseFile"
    ADD CONSTRAINT "RequestWiseFile_AdminId_fkey" FOREIGN KEY ("AdminId") REFERENCES public."Admin"("AdminId");
 Z   ALTER TABLE ONLY public."RequestWiseFile" DROP CONSTRAINT "RequestWiseFile_AdminId_fkey";
       public          postgres    false    217    267    4932            �           2606    17289 0   RequestWiseFile RequestWiseFile_PhysicianId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RequestWiseFile"
    ADD CONSTRAINT "RequestWiseFile_PhysicianId_fkey" FOREIGN KEY ("PhysicianId") REFERENCES public."Physician"("PhysicianId");
 ^   ALTER TABLE ONLY public."RequestWiseFile" DROP CONSTRAINT "RequestWiseFile_PhysicianId_fkey";
       public          postgres    false    4960    242    267            �           2606    17284 .   RequestWiseFile RequestWiseFile_RequestId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RequestWiseFile"
    ADD CONSTRAINT "RequestWiseFile_RequestId_fkey" FOREIGN KEY ("RequestId") REFERENCES public."Request"("RequestId");
 \   ALTER TABLE ONLY public."RequestWiseFile" DROP CONSTRAINT "RequestWiseFile_RequestId_fkey";
       public          postgres    false    267    251    4970            �           2606    17147     Request Request_PhysicianId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Request"
    ADD CONSTRAINT "Request_PhysicianId_fkey" FOREIGN KEY ("PhysicianId") REFERENCES public."Physician"("PhysicianId");
 N   ALTER TABLE ONLY public."Request" DROP CONSTRAINT "Request_PhysicianId_fkey";
       public          postgres    false    242    251    4960            �           2606    17142    Request Request_UserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Request"
    ADD CONSTRAINT "Request_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES public."User"("UserId");
 I   ALTER TABLE ONLY public."Request" DROP CONSTRAINT "Request_UserId_fkey";
       public          postgres    false    4968    251    249            �           2606    17319    RoleMenu RoleMenu_MenuId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RoleMenu"
    ADD CONSTRAINT "RoleMenu_MenuId_fkey" FOREIGN KEY ("MenuId") REFERENCES public."Menu"("MenuId");
 K   ALTER TABLE ONLY public."RoleMenu" DROP CONSTRAINT "RoleMenu_MenuId_fkey";
       public          postgres    false    4956    271    238            �           2606    17314    RoleMenu RoleMenu_RoleId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RoleMenu"
    ADD CONSTRAINT "RoleMenu_RoleId_fkey" FOREIGN KEY ("RoleId") REFERENCES public."Role"("RoleId");
 K   ALTER TABLE ONLY public."RoleMenu" DROP CONSTRAINT "RoleMenu_RoleId_fkey";
       public          postgres    false    4988    269    271            �           2606    17370 1   ShiftDetailRegion ShiftDetailRegion_RegionId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."ShiftDetailRegion"
    ADD CONSTRAINT "ShiftDetailRegion_RegionId_fkey" FOREIGN KEY ("RegionId") REFERENCES public."Region"("RegionId");
 _   ALTER TABLE ONLY public."ShiftDetailRegion" DROP CONSTRAINT "ShiftDetailRegion_RegionId_fkey";
       public          postgres    false    277    4934    219            �           2606    17365 6   ShiftDetailRegion ShiftDetailRegion_ShiftDetailId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."ShiftDetailRegion"
    ADD CONSTRAINT "ShiftDetailRegion_ShiftDetailId_fkey" FOREIGN KEY ("ShiftDetailId") REFERENCES public."ShiftDetail"("ShiftDetailId");
 d   ALTER TABLE ONLY public."ShiftDetailRegion" DROP CONSTRAINT "ShiftDetailRegion_ShiftDetailId_fkey";
       public          postgres    false    275    4994    277            �           2606    17353 '   ShiftDetail ShiftDetail_ModifiedBy_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."ShiftDetail"
    ADD CONSTRAINT "ShiftDetail_ModifiedBy_fkey" FOREIGN KEY ("ModifiedBy") REFERENCES public."AspNetUsers"("AspNetUserId");
 U   ALTER TABLE ONLY public."ShiftDetail" DROP CONSTRAINT "ShiftDetail_ModifiedBy_fkey";
       public          postgres    false    4930    275    215            �           2606    17348 $   ShiftDetail ShiftDetail_ShiftId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."ShiftDetail"
    ADD CONSTRAINT "ShiftDetail_ShiftId_fkey" FOREIGN KEY ("ShiftId") REFERENCES public."Shift"("ShiftId");
 R   ALTER TABLE ONLY public."ShiftDetail" DROP CONSTRAINT "ShiftDetail_ShiftId_fkey";
       public          postgres    false    4992    275    273            �           2606    17336    Shift Shift_CreatedBy_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Shift"
    ADD CONSTRAINT "Shift_CreatedBy_fkey" FOREIGN KEY ("CreatedBy") REFERENCES public."AspNetUsers"("AspNetUserId");
 H   ALTER TABLE ONLY public."Shift" DROP CONSTRAINT "Shift_CreatedBy_fkey";
       public          postgres    false    215    4930    273            �           2606    17331    Shift Shift_PhysicianId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Shift"
    ADD CONSTRAINT "Shift_PhysicianId_fkey" FOREIGN KEY ("PhysicianId") REFERENCES public."Physician"("PhysicianId");
 J   ALTER TABLE ONLY public."Shift" DROP CONSTRAINT "Shift_PhysicianId_fkey";
       public          postgres    false    242    4960    273            �           2606    17126    User User_AspNetUserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_AspNetUserId_fkey" FOREIGN KEY ("AspNetUserId") REFERENCES public."AspNetUsers"("AspNetUserId");
 I   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_AspNetUserId_fkey";
       public          postgres    false    249    4930    215            �           2606    49643    PayrateByProvider fk_createdby    FK CONSTRAINT     �   ALTER TABLE ONLY public."PayrateByProvider"
    ADD CONSTRAINT fk_createdby FOREIGN KEY ("CreatedBy") REFERENCES public."AspNetUsers"("AspNetUserId");
 J   ALTER TABLE ONLY public."PayrateByProvider" DROP CONSTRAINT fk_createdby;
       public          postgres    false    4930    286    215            �           2606    49668    Timesheet fk_createdby    FK CONSTRAINT     �   ALTER TABLE ONLY public."Timesheet"
    ADD CONSTRAINT fk_createdby FOREIGN KEY ("CreatedBy") REFERENCES public."AspNetUsers"("AspNetUserId");
 B   ALTER TABLE ONLY public."Timesheet" DROP CONSTRAINT fk_createdby;
       public          postgres    false    288    4930    215            �           2606    49712 )   TimesheetDetailReimbursement fk_createdby    FK CONSTRAINT     �   ALTER TABLE ONLY public."TimesheetDetailReimbursement"
    ADD CONSTRAINT fk_createdby FOREIGN KEY ("CreatedBy") REFERENCES public."AspNetUsers"("AspNetUserId");
 U   ALTER TABLE ONLY public."TimesheetDetailReimbursement" DROP CONSTRAINT fk_createdby;
       public          postgres    false    215    292    4930            �           2606    49648    PayrateByProvider fk_modifiedby    FK CONSTRAINT     �   ALTER TABLE ONLY public."PayrateByProvider"
    ADD CONSTRAINT fk_modifiedby FOREIGN KEY ("ModifiedBy") REFERENCES public."AspNetUsers"("AspNetUserId");
 K   ALTER TABLE ONLY public."PayrateByProvider" DROP CONSTRAINT fk_modifiedby;
       public          postgres    false    286    4930    215            �           2606    49673    Timesheet fk_modifiedby    FK CONSTRAINT     �   ALTER TABLE ONLY public."Timesheet"
    ADD CONSTRAINT fk_modifiedby FOREIGN KEY ("ModifiedBy") REFERENCES public."AspNetUsers"("AspNetUserId");
 C   ALTER TABLE ONLY public."Timesheet" DROP CONSTRAINT fk_modifiedby;
       public          postgres    false    4930    288    215            �           2606    49692    TimesheetDetail fk_modifiedby    FK CONSTRAINT     �   ALTER TABLE ONLY public."TimesheetDetail"
    ADD CONSTRAINT fk_modifiedby FOREIGN KEY ("ModifiedBy") REFERENCES public."AspNetUsers"("AspNetUserId");
 I   ALTER TABLE ONLY public."TimesheetDetail" DROP CONSTRAINT fk_modifiedby;
       public          postgres    false    290    4930    215            �           2606    49717 *   TimesheetDetailReimbursement fk_modifiedby    FK CONSTRAINT     �   ALTER TABLE ONLY public."TimesheetDetailReimbursement"
    ADD CONSTRAINT fk_modifiedby FOREIGN KEY ("ModifiedBy") REFERENCES public."AspNetUsers"("AspNetUserId");
 V   ALTER TABLE ONLY public."TimesheetDetailReimbursement" DROP CONSTRAINT fk_modifiedby;
       public          postgres    false    292    4930    215            �           2606    49633 $   PayrateByProvider fk_payratecategory    FK CONSTRAINT     �   ALTER TABLE ONLY public."PayrateByProvider"
    ADD CONSTRAINT fk_payratecategory FOREIGN KEY ("PayrateCategoryId") REFERENCES public."PayrateCategory"("PayrateCategoryId");
 P   ALTER TABLE ONLY public."PayrateByProvider" DROP CONSTRAINT fk_payratecategory;
       public          postgres    false    286    5002    284            �           2606    49663    Timesheet fk_physician    FK CONSTRAINT     �   ALTER TABLE ONLY public."Timesheet"
    ADD CONSTRAINT fk_physician FOREIGN KEY ("PhysicianId") REFERENCES public."Physician"("PhysicianId");
 B   ALTER TABLE ONLY public."Timesheet" DROP CONSTRAINT fk_physician;
       public          postgres    false    242    288    4960            �           2606    49638    PayrateByProvider fk_provider    FK CONSTRAINT     �   ALTER TABLE ONLY public."PayrateByProvider"
    ADD CONSTRAINT fk_provider FOREIGN KEY ("PhysicianId") REFERENCES public."Physician"("PhysicianId");
 I   ALTER TABLE ONLY public."PayrateByProvider" DROP CONSTRAINT fk_provider;
       public          postgres    false    242    4960    286            �           2606    49687    TimesheetDetail fk_timesheet    FK CONSTRAINT     �   ALTER TABLE ONLY public."TimesheetDetail"
    ADD CONSTRAINT fk_timesheet FOREIGN KEY ("TimesheetId") REFERENCES public."Timesheet"("TimesheetId");
 H   ALTER TABLE ONLY public."TimesheetDetail" DROP CONSTRAINT fk_timesheet;
       public          postgres    false    290    288    5006            �           2606    49707 /   TimesheetDetailReimbursement fk_timesheetdetail    FK CONSTRAINT     �   ALTER TABLE ONLY public."TimesheetDetailReimbursement"
    ADD CONSTRAINT fk_timesheetdetail FOREIGN KEY ("TimesheetDetailId") REFERENCES public."TimesheetDetail"("TimesheetDetailId");
 [   ALTER TABLE ONLY public."TimesheetDetailReimbursement" DROP CONSTRAINT fk_timesheetdetail;
       public          postgres    false    5008    290    292            b   �   x���1j�0E��)ri��5�ҥ�%���Ȓc�w��@n6��i>|f>���IS���)7gT�cR�CL.O���<��|�Z����׏����n`&��S`x��M����=�]X�P�0��Q�S�)ӽh��Z������~�㹱�D6q}Nq��k�H��3k��	�e˻�P�i)����<��D���z�-Y�����m�4?��w�      f   )   x�32�4�4�22R�\F�@ʄ�Ȃ�$h	���b���� n=<      g   -   x�3�tL��̋��2�H,�L�+�2�Ȩ,�L�L���qqq ��r      h   �   x��˭$0�3��dc���^�9��� !������W��$�v �(�25�~˥�S��*��Z9�Rݻ�F���j��H��؂A�ʲ^���;�^�r}'�����;�B�ݟm��	-H�T�`R�lb���9���J�h�b zQw�Qhj�zB�M5��.>�k���`�Q������޺,���\�r���ao�p��9��v��~�iC��ލ�s2��_^�/(e�:38�C=;�rB��}����a+      `   �  x��Wْ�8|����	�n�Dl�Bs��G�/�ecs���߲���af��ʬRUe�j�S�<Gk�F��(�j� �0�V/���]ǫמ>��&4��3���]��:�sq~Ŭ@�%r�QL%|��=���ڑR�9q��]�0n]/P���]�/(���w=A��sҥ��E1@�$w�	�c���e�O|",�>��L��O_P6)
��z�!
�PX$^<�ZL�p���a��|�!�\d·K��r�K�ӧ(E:?���Hޔ|�%_1.Px��$�4�}+8A1�a{�+���|�Ef�[��
u����.2�}��d��	�� _X#M��!&�Eܘo��"%3�(���-��O@����; R@�@HN&Q
`?0�`�e��K��X{!Q����ѱ��kzO�ҧ*�m7i��;8��0ʹ���OhA%
��Z���$.&ח�Ilp&Xv�
�E��/��(gz�<U��v��ӷ�'}�E��V9�J���Gs������A}35;;�9���mfח���n���	���^�	k�
��+�����&��lG���������#���������q�P��%f�l����	j{�������΍<��qA֝?���{D�hu��SqgTh���ԋ&Y`jO���&	J��ik 5��ER�D�g���+ara���0������$���V?j�
�iw�������q�H��u{wܒ3�v͚7����0f}�k+{YQ��[)D�q�� ڇ���2O��Q��\�"W@r�|�V���H:Jԥ���*���7�u���G1�K+�MY���)���[o�W��j��VwkÃ��zo��[E =��kJ���99��#��{T�!�X		gFy��6�1R�&:�'�[�<���f<²*�ڬ�o�O[�K�Y����Lms��*��v�~���rn��U%e�X��q�W��Mx�d�����H�*�b�;���d�P�Ͱ��
�D���~���=�}֛����S5�I]��w��Vf^v񹚷��8�/&��V���,�F�꽱��2L�~]ݏ�T�U
=�LZ�E �h��<ɆB.��+��&3�?I����Vz8��'�Ւ}6�W�f}6!aW��Z�ǇA��b�>mv���b��([�o�	�di ��b���s���3�XA�X�2�@p8M���^ �r���|`@�A��bTz���e���/�+������h���������wk{v:|�Mp����6������a�ɷ�Q��r:l�j%֫�*k��I)��8�nÿq@!�t,tF��U>�0f(�A�qh�$�B��1�}�W�}է�x�g/���^C٨t��6�I��'��i8ZF�a���{'��>V�u����Dϝ�S�N�z ��0JlB㴚0�JH�Π����8�����2oa�=��R���'S�仾�e���Ku\'%��Ai��YYm.޸Ӟ�K�O�^]�>�d����WL6#]��V��61�-Y@�o�RL����4����}��
?�p�x`��O����ح�^]�,<�q}��Z�ժ�J����ƅ}�u8�~���h}绑�����ŷht�7�[Y�J�;�N�}
��� �B9�(M+IFR�8O@C�8Zpr�0
���<��=��������SY>���bs/��:޸>��A����� ���Y��ҡ1������Dew�Ե��MP��L@���4��%�L���(MOk��@eC�4�H��f�2Z�������ˋ`�n�}{�S���0����3��LX��zk���jR��ҿ��*����I&�z��`��_�l�V��r���Y�Q�c��u�?M����?���_�����9ߊ��p�娡'o��E��J6l�&�c��m-+k��HR�.�ּ����.A���Z0W0�x�ѤЉ�
�E1�Z@�	���O����������޹v��ǃ�ɰM�����ӂ֦Kk�m�����0o��=o�۩P%K��5-p��V?�����!#�C�`#��u}W�{Arth��t�~������'-��\ݰr�AA���"�o�i����..��v\��ۺ�zc��{i�d�<���1����1�[�z�n�U�4 �9�n�݂#c��3���� [о�0��Ã�L�j�٠ݜuZ�rt�Wdy��z�\ۆ[�_z���s�����6?۷��S���0��g�I�<��.�'���))	��98�q���ʽ�����A.      j      x������ � �      l   o   x���1
�0й=�h1��J{G'AW�������$�%<�<o&缏��㞡{)kW�4	�3jS�����DԨ%L?/Ӻ��*�|�����$���m�To�=��<�      n   �   x�-��
1 ��W�D�y����֫���R�MIR�����a�مIpf�R]p��Q�?������f�d؇A�q4k�0kJe�?9�[s��w�w���Lp�}G�U�j"g��n?�a�Ȫ����SI�z������/�/6q      p   �   x�3�L/Ks�,///NL���f '�����yi�y�%����1~\&pM S� >�SN���ļ���L�4�q���h��X��Wj�	�i1�tL�J��M�+.-ʄj5y��Ո�G�����  �W�      q   q   x�3�,I�-�I,I�-��OLIMQp�O.�M�+)�,p042��"cN4202�5 "KCC+cK+C#=CsKC3#�R�朆@��eD��&�V�z��f渥L`��qqq ,L5k      �   �   x���M
�0�דSx�"5���
�O�橩�j,1Yx��S\tU�7�c&D�QPپI�F�U���H|��BY\/���0�� �ID��Oψnv���S��X�tI]�0/o'd�k�����:B��_�q��n�n�{���X�T������c���R�      s   >   x�3��H,�ML��4202�54�54R00�#NC�?.#N�Ң�̼t�#]KL%1z\\\ �ur      u   �   x���Mj�0�ףS��+i��	��*�@�j�PS|��FNJ	^�0��xo������@@��{��y톯qy[}w/�_A��u�Sَ��T��P5�<�U�}!��2|/�l�>N��~�ϳ�%i5��SI��$+ɛ����dVYbF����t�f�;m�y�Tܒ�����B�tX�"%����p��Q��Ƭ�Dw�� ���%�Q,;�JR5Gt��[;��ܬ�      w   �   x�]�Oo�0��H������`��N�x�i��XKR$��BP���������l=h�E	��H�F�6�
޴쮍M`
�RroC��������%��#��%��E+r�^Ϩ͎�,%���d�M��gmM���A�}1:��*~�ӓ�U�$����=qf3X�ߤ����Xb�������Z>��z=X�Y�rp�P9Œ��:sp�0��wrS�|�<E���t      y   �   x����J1�s��S��&9�=�^Į�ŕX||�."��
9���I0i:�&$NwǗ~:��8�i5���c���<�M�!쥪���5S�9O���E�R���-m�3C4��X�iF�##�L3wk�:Xo_ϧ�s?���'�	���\G>�o���зZ���06�kj?���mّ��������HK_v$����Ɇt(9�w#�k�      �      x������ � �      �      x������ � �      {   �  x����n�0����P�%�:�� H{�e%Q�
�2l�F���� ��m
��P"v�aFD ���x�U*1���k�26��N�t�0�;�b�n�Yzg�h�}7�C�}���# P^��?�8�#t�阦Oغ<$�鄚�Ò�D]ZW2ք��t���<9��_�:��N��!������qA|2�U�VؠṶSU�QE�B5�c�"U?
�/y����m�֓l�;��,.ɕ�J������E��ߑ^�4�	�Z�d��MJ�jR�=� �)e���繟�����\�˖�K�P��AeGq��5�M�bt�U�[q����g�N�v��2v�|�ȕ'^4��)]2��	(�}:�/���Ր�7޺V���*����ĨEW��2�Vv����&�m��[�7E=l/���'(Y�_�����\��髱���b��
�      }   �   x�Uλ
�@�z�+��]���R�4�6��`L�G�߻*��0�(����Q#"T%	KI���c�A�~v֍w��r�~4'@�B�J�\ׁ���>�\l��atD M@���P)���1���y6h���l��?%�T��m��X<�V]�ц�6��l��s/��3�         (   x�3�44�4�2�44R@��2��)�������� k�"      �   @   x����0Bѳ�
�I:L���pz���j��ST	���D�[����!��[�w����= ~\/�      d   <   x�3�,�,J���L2��9�R�+󋲁4�	gbNbqv"��2��M,��I�K2�b���� �]      �   X  x����R�H���S�t���U� d �=�U6=��
XdlC�<��,3V(�-l}>����E�\�q�
d�aN���;�!K���BC8��&�PGL	~�U!u!4��+g	���y(M8Q�,�$=���,pW��xYrɤP�r\2�D� ��<�Т�*!��`"����:����;m���t��~")��$���Hd��ZRi���'ќ��뿓䌜i�_�����k5_��z!p�\��Q��	=�@��� OU]���jx�oO��p���*�@�_�rQ0�`�h�@�/�#�9/�,��\
��4�D�d}�g�q�oɀP+�D���Q���?�7�I]<<�:��V��jZO��1���Z�BM��-�^5�ت%Hy�x����M�2��Qi�jH�\�'���aB��RC�5��<��M�aCdl�%Uo�շVL�쒾P�J'�{����4#�~����
�Xnm�Ph�
(���CuO�>�� r�T���#^�4*�Fr��\uw2�~w�~?ªK��w`�ʓ���j�+��\Y���S�:Ԃ���rF.��S�7�Jv`]��e�A�X��.�r��!X�5��c��t�B+#4
9�:�lZ�
H��z#Q���LvУ ��"|H3�i4cZ{qW���b4u*5}��~(:}kN���6���-hh�	��,�@3=4�;��41#��)o~�{$[�|\T��.lA���Q���>������dSٖ�fՊ<=��Z0��t�#���L�ǔ�PZ�!^��Ƒ�j���)ܧ>֐9�\���R��d2�%�L`J!3���8�>ő�Y�L��)�>d��w���=�kQ�,gպ�y��4
w_w�4�9��`Tz�R��{,�JI�PQ�5r�:�q�\Q�7F�K9����ƥ�6d�6�g��N�v/P�ݶ���ڗnX����C1[�Yp�#�l�F+(s�E�U^�}������'�����#���d1{g�)7��(|DTBR/�Ɩ����4�]�Ԣ�~o���J=W�Yt�:��:MF+��W�s����<29��6k��nm#yN@�#�a7w����j��]�`pN�n�&���E�O{9��:rYZ��<G���MO��Ť��h`�����Q�i����{����	��̆W���9�vP��.�a�W[u�U'>7��Y�{����Ce��娷�2��m�$3ɘa&
l�m��.��ono&�������:�}�8=;=���2�Y�47 @�X�㯺��GG��b��&_�^�=_@�c]1HP�%dy�/�;EJN���7�����w2&�f����S�¾���o-r��(0��������p�������{sP��z�=-SS^�!��zpp���<�      �   &   x�3�46�4���2�46�4�L8�L8M@�=... d��      �   �  x����n�8ǯO�b�`ll�n:S�V�jU��J+�͙��C�����|��d4CB�(���/x |�*o���3�iI�ı�����I��n=�
�O���*�}	l�B�����{\�U��5����<�i��d"���Έu��)Uu[�lT�s���8<!��<bqG�h��`���l��T�W'J ��D��:YZ�HV������ü����=�?�8	D�Pm��E��[8	�J�� ��aAd���~Z�8�ょ,���a�_#�@Ѓ:�ڟ
�q�uN��'gTv��U��K��ʉ���2��@� �6�y��{JO�Vj�O�H�?yY-a�aY��A�0�wt���|�0 ҇��k?�6)�ԅ���&~~��#�r�\�}�������w�]��6|"�z������E�T�2����@�jeC /�Œ��lZ`�nG�Z��k���d8���u>��H��:�{@�Cc����·��Rh�%˴�5�/�s�&��=x�h����Ǿ��)��$�o�>7*ˍ�-g�#�ݘ��:V��|v�^���.;�`�ݼD`��X���
�k�[�u�9A	�m<�59ybsD�K<!kMG��6ezj��/� ��-˪�k��[oq��$�8�hO�(<�B����1��ڹ>�Ɣ�_�[������H�=�LCwH�C��pC��	ke�+t[�:�t�-Q6���N�ЂRu�h�w�[˟��л�d@��h:����Zc�]�dp��3����mB��٘y�ϔ�$Cӻ���$����^g�AUY^Oo���Ѧ�4�Mٍ}O����jeq$ݝ� ��yF��Y����l�fF/74�����-��&no�5_c�,���|C�'/ͼ3efy���!�g{�Ȉ�*=h��iҖ����ג��^���k�쐔�2�<�G(3��Zsl�`ӛ`�a�V�?�������      �      x������ � �      �      x������ � �      �   �   x���Kj�0�|����h���]P�.��B�T'��Wu�S(���S���Z%���8B3������FH�Ī$
'j.��(oۦ��G㒦[�C�1kpL��i�k��)���尐��L*I�ߵV1�~'��o>�)����+%Ka@T�jG�	c�F�L�gq�`:�_��J�Pr����ŴyF�u�����ϧ��h�,7�5�6�f���!	B8���QY�aZ^�sV|      �   B  x����r9E׭���x�K2�e*���7�e+���$O&?`[d?;��r���� ��b��ͧ�篏��kKk-pN�����V��`������l�ѐ0�/�4l���6���0%��{�r���i�Q� ��8�
��3����c4����m�TL�&:q5��N��G(r`b0Q0H�PY?R���c߾��~�λ~�1`��9Yo��ї�ACI�](\cl�%���q�T���0O���vT4SVuI,�Zѿ^(���L������q��feTU������?�4Q0>��
��\Uv 5S���*�0��ն�#��t���w���|h����c6?�N@o�Hb��8�*H����;w����y����隄�j��$��c��KoVj�0��K~>�m�v�1e踒ҙ+C��3��R�߇��<����p�cqj�1�����ݦ?��ùo���S{{P�>o���;�7Ǜ}����$o	�Er��m"����n��!�FQ��A�P�����A}R�d0�(T��0|�×T����r�
֘�Y�kLH�u����2��w���\6��(^�����'$U��j��i�˩��kN-c�`M3��fr^S�'��x�N��R�l���!Y]�:%��8%>��&�N���u���?s��cr�& �:B=):��Y��w����[0癏�^Lo}I��B�Qҗ�p	1�7��J���
��&�uc�|U�[s��Pn%��h�����|^�8w��[�Ĳfՠ�w#��p:����_����9a*-�l�ei&&�n�j1���S~��6�ƬV�����	      �      x������ � �      �   �  x��XMo�6=˿b�����(����D����a'���P븍��'a/��<μy�F��p}w��?��z��]��x�gy��p)W���-��h�Ʉ2�H4�}��\ ��߯����O��Rn )�p�W��R�;� &�'��<@�x(|���'�Q���wNG?vO��7��c�|}�<B c� �%��(��y �^�� ����&�#�9���`����K��`����#6/9��_�å�6�`���h-��� ���\�[�5�>��;>� �_���ɮ�`E��I��㯞��S��(b��"�rq�~�8:�a�����v�ť�%'����y%z��8�ίK����(Zz�A�����.��v�g{��5@.a.�Y���a'�D��qq^f�_K��|�Ƶ'�ы�y�Q��{��_�9�� #@���#������:��uG��+������1"�>�+�4��Q�`��Z;��G�q1!E69��n6�gg�RcĹ[~8_~��6Z�Е0Z���{of�abd1N�'q�s�n�߀!n�a���X��l*���0p6\j5I�r��J�#x�_��	��nl��e?N0VB	%qȳ�NS�1�&Y�LI��C\B܅qf*j6@g�j�=�	�b}&D�sկ��I���d9C����$Pg3�P��M]�}im�"\R0iIZHbr�^-1�����n>d+JR��.;�1��R�YD�,TL(�t͸TA���R�9�5�n
EF�Q�'
���� �blU�f�������a�RvJ�����IdK���W�D�Z\2�z����"g(E��䀯ǡ� ��9��X���l��oq&Uj5f�#��p�c:�Y�Wg�w��f�V��}$�RVC���84uv��5�Z^�5kZ@M~Ĉ��W9S�� ���V�h�r��9��B���~u>Cy^!w�q��q��f$Ӡ�w����쇶so��G�����<K�Z!R����W���~,g��#��ʣW�����{L:j�%�L�w��[�dإ���xw��J���%ݵx�b�ʷPP,E��  ��&kb�ɀ��]�Z�y�����������r�EH�P�T�դ��ZH�{�N�2�=�rS֌&�p�Ԥ.7��r�P�����Y�'�,�L��������`�u:�m�T� �ǄD;QUp]�F`����_��t���9�y#8��$8J�mG�qp��i��~���DAw�Y{!��$�M�s`��(�֚)SXW�軎W�E��̙k0�H�	�Mm��=�η�Jv��kJ#���E�Q�u�U[�z5P�:�t�cSEm�6�/g&2���t���蚪=��-/�4������d������P��z8��M?�k�޾{U�М�x�{�����ſ���l      �   �   x�u�;
�0��Y>E.#�J�z�J��}@LIM�޾2�(�Ɵd��X�)����kZG`H�)���R�FQt�Yl{þ�z��5�;��>�Ɔ�w��b�����I/~%FQZ뽸 �[��m��&�k��B�%�.o2Xc�7 9>      �   O   x����0Bѳ~1������>�AR�^z��r��PR��2���&�a�S��7��qN5p�i:����;X|����      �      x������ � �      �   �  x���ˑ�0�3�$`�޶�F0��i�aeS;@�ih�8�.����D@� >�p��3�$KG�Ă��̜�E0��p���˾��P��&��JG4!�\�Kci��д�qJܗ�5��zɨ����������#��u��r����@�P�]���6A�;�4qH/N�%�%��(�����Ө_(MK˵��t��H{�A��H����]Ж͵�w:�q��E�t;�5���H��Ѯ��LM-�`�e�r��_F"	:��9=��I�7��Dd���k�ؿo���RF�0�'��t��8�gd�A�m�j����v��&�c�h��6�<.� �'�@�U��V?��i)ِM����^��q�ϩ�v$<��	-��Ե@�&:��	m�Q%!����5ڥk��0ܴg$3�Fˉ��F��-��!gv*��E���s&&#�i@v��ƳK�|�#�m�/��&���x�)��-      �   i  x��Xmr� �힢�}��N�����."5-e��LX�ݕ�xÄ�����Ap$���6� ߤ� �/���/>o�&�{J��]�yYo�a@l ��� ��M �?�������*;8��_}-�{�C���Ch��s�ܳ�rf���)o�`��z7CR�́JUrEb,�D!�M�,H	|<M�$��F�gi�a �p�4c�Ĕ�7�
����f-m�yK�H9�Q�����k�VKq+?�qy4� ���>g��j�n��w09���)�JGT-U�����2��;iʦ#N���>����� ��KC ٓ�Q߻T�^n"���A�(_ >܉�.@�m}���oר�TqD�=�h�1��t�(A���N�N*�q��@��Z�˞���_px�#rV�N��z0�()�	�0\��H-���p�������D^F~��� _�$� �J!�`�8+mu6���!��0�"�GyḤ��yY�-�:���NX�zwW�U���y�f�L2�3�Ң�VA�ڬ��r�p��L[�i�T��8d�I�|ZYN�j����n �g��P	�.�t����Cd�Ӷ�9q��5O��]<�\���e ��GW���'�}[��9�n���ۺx�jyc���*=��6 lچl�\���i>�Z�Y�1��Z�uu��Sah:��k,�i����<s�-�9w�"[���&Xn���W�Oe�OP_��� ?��y.�6�,�A=���qJ�w�*�t�y��:	���	�	@w��7�r9�or6:QPt�� �# �&�s2�!���`v��*}�#�S���©��pL��4�p�2��]<��㽭]L_n�t�����ܜ_���o�&������?��G      �   q   x�-�� Cϱ�~����ױ�y*$���
�ɚ�\��P6��E��CԀ�(�"J���D<Q!S�Q&⠲аBtQ���}����G+-s�<�ȃ��������XN      �      x������ � �      �      x������ � �      �      x������ � �      �   $  x����n�6���S�(p��N�6��@�]�@��E2v�؁�M���PR�P��
-ڞ������"�+�p�D!H�e���V! ���Pŗ����;�˽x�ڈx:������U<Q_a\��J�0'㶕JK׀���u�L��9X�W&�Rސ��W��jIE���8�P�V�FO��mĲ�c��l؝h7#Y}G�������v>:c�W�k�V�T+��$�Q]���)Uܖ�<s=�\0�b�k!���.�\oUg�r:��C��s2x�$f�)�$�sA*����q|�6���7=��V����k���dt|�{�7�����7{9�k����h��HP�����8��ge�cJ�$p������nC�=��	�E��p��3�p�]R���t؉[��B��O���FJ�x��p�U��e��Αl��h�l|{�����u8�8�l��s4�+�k�E�`-�ш
������FX<�4H�IPՅP�[�������1��:;��\G�_��iG����� �Q�t��/^�]*B�� G}22e	5fe��!e�+֮��$�hfB��~"3R�F�B���`��52+9.��e̚�3-��d,>��CQ�*�^�Ć�V���r�E�����\z��׫ԉ����W8������ZC�\�Y�|(v�s�>�͠up7皁��*A�N)4aU3/
�Ξ� h ����ަ=J=���`��3���Ɍ-�,'�TV�"�8��c}B���3Y�v�qpp������!׷s��������w6=����=Ǝ[�_ϱ(@��<��h�8����J5�84�W��fsx&�릔�i]�ӆs�}y}k�䷸��1��~w��Ƃ�����]��J���c�>��M�&�<�0��Ð8�(����V�@�܄�L����f�L�v���׹�pN@?��hQw<���t��/p���_�C�\� %Vô�45x�l�7�<�N|�Wz�7�{!�%��qI�Uh*�^}�7	�������$�Қ��Eϣ�����<+oi��=v��O����������jm�|ﮮ����q�     
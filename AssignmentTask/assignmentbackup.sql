PGDMP      6                |         
   Assignment    16.1    16.1     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    49505 
   Assignment    DATABASE        CREATE DATABASE "Assignment" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';
    DROP DATABASE "Assignment";
                postgres    false            �            1259    49507    Domain    TABLE     m   CREATE TABLE public."Domain" (
    "DomainId" integer NOT NULL,
    "Name" character varying(50) NOT NULL
);
    DROP TABLE public."Domain";
       public         heap    postgres    false            �            1259    49506    Domain_DomainId_seq    SEQUENCE     �   CREATE SEQUENCE public."Domain_DomainId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."Domain_DomainId_seq";
       public          postgres    false    216            �           0    0    Domain_DomainId_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."Domain_DomainId_seq" OWNED BY public."Domain"."DomainId";
          public          postgres    false    215            �            1259    49514    Project    TABLE     r  CREATE TABLE public."Project" (
    "ProjectID" integer NOT NULL,
    "ProjectName" character varying(50) NOT NULL,
    "Assignee" character varying(50) NOT NULL,
    "DomainId" integer NOT NULL,
    "Description" character varying(50),
    "DueDate" timestamp without time zone NOT NULL,
    "Domain" character varying(50) NOT NULL,
    "City" character varying(50)
);
    DROP TABLE public."Project";
       public         heap    postgres    false            �            1259    49513    Project_ProjectID_seq    SEQUENCE     �   CREATE SEQUENCE public."Project_ProjectID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public."Project_ProjectID_seq";
       public          postgres    false    218            �           0    0    Project_ProjectID_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."Project_ProjectID_seq" OWNED BY public."Project"."ProjectID";
          public          postgres    false    217            V           2604    49510    Domain DomainId    DEFAULT     x   ALTER TABLE ONLY public."Domain" ALTER COLUMN "DomainId" SET DEFAULT nextval('public."Domain_DomainId_seq"'::regclass);
 B   ALTER TABLE public."Domain" ALTER COLUMN "DomainId" DROP DEFAULT;
       public          postgres    false    216    215    216            W           2604    49517    Project ProjectID    DEFAULT     |   ALTER TABLE ONLY public."Project" ALTER COLUMN "ProjectID" SET DEFAULT nextval('public."Project_ProjectID_seq"'::regclass);
 D   ALTER TABLE public."Project" ALTER COLUMN "ProjectID" DROP DEFAULT;
       public          postgres    false    218    217    218            �          0    49507    Domain 
   TABLE DATA           6   COPY public."Domain" ("DomainId", "Name") FROM stdin;
    public          postgres    false    216   3       �          0    49514    Project 
   TABLE DATA           �   COPY public."Project" ("ProjectID", "ProjectName", "Assignee", "DomainId", "Description", "DueDate", "Domain", "City") FROM stdin;
    public          postgres    false    218   �       �           0    0    Domain_DomainId_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Domain_DomainId_seq"', 1, false);
          public          postgres    false    215            �           0    0    Project_ProjectID_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."Project_ProjectID_seq"', 3, true);
          public          postgres    false    217            Y           2606    49512    Domain Domain_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Domain"
    ADD CONSTRAINT "Domain_pkey" PRIMARY KEY ("DomainId");
 @   ALTER TABLE ONLY public."Domain" DROP CONSTRAINT "Domain_pkey";
       public            postgres    false    216            [           2606    49519    Project Project_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."Project"
    ADD CONSTRAINT "Project_pkey" PRIMARY KEY ("ProjectID");
 B   ALTER TABLE ONLY public."Project" DROP CONSTRAINT "Project_pkey";
       public            postgres    false    218            \           2606    49520    Project Project_DomainId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Project"
    ADD CONSTRAINT "Project_DomainId_fkey" FOREIGN KEY ("DomainId") REFERENCES public."Domain"("DomainId");
 K   ALTER TABLE ONLY public."Project" DROP CONSTRAINT "Project_DomainId_fkey";
       public          postgres    false    218    4697    216            �   =   x�3�,//�KK�KO�K���2�s���R�"FPɩI���`!C�Pz~~zDM� �$d      �      x�3��M�NUp��O�I���S�89��sr�����9��LtLt�������\/�G/9?���<�����bXZb^^:g��	�ǜϼ⒢����<������Fu��#����� ��0l     
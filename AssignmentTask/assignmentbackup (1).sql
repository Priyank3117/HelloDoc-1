PGDMP  '    1                |         
   Assignment    16.2    16.2     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    30216 
   Assignment    DATABASE        CREATE DATABASE "Assignment" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';
    DROP DATABASE "Assignment";
                postgres    false            �            1259    30217    Domain    TABLE     m   CREATE TABLE public."Domain" (
    "DomainId" integer NOT NULL,
    "Name" character varying(50) NOT NULL
);
    DROP TABLE public."Domain";
       public         heap    postgres    false            �            1259    30220    Domain_DomainId_seq    SEQUENCE     �   CREATE SEQUENCE public."Domain_DomainId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."Domain_DomainId_seq";
       public          postgres    false    215            �           0    0    Domain_DomainId_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."Domain_DomainId_seq" OWNED BY public."Domain"."DomainId";
          public          postgres    false    216            �            1259    30221    Project    TABLE     r  CREATE TABLE public."Project" (
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
       public         heap    postgres    false            �            1259    30224    Project_ProjectID_seq    SEQUENCE     �   CREATE SEQUENCE public."Project_ProjectID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public."Project_ProjectID_seq";
       public          postgres    false    217            �           0    0    Project_ProjectID_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."Project_ProjectID_seq" OWNED BY public."Project"."ProjectID";
          public          postgres    false    218            U           2604    30225    Domain DomainId    DEFAULT     x   ALTER TABLE ONLY public."Domain" ALTER COLUMN "DomainId" SET DEFAULT nextval('public."Domain_DomainId_seq"'::regclass);
 B   ALTER TABLE public."Domain" ALTER COLUMN "DomainId" DROP DEFAULT;
       public          postgres    false    216    215            V           2604    30226    Project ProjectID    DEFAULT     |   ALTER TABLE ONLY public."Project" ALTER COLUMN "ProjectID" SET DEFAULT nextval('public."Project_ProjectID_seq"'::regclass);
 D   ALTER TABLE public."Project" ALTER COLUMN "ProjectID" DROP DEFAULT;
       public          postgres    false    218    217            �          0    30217    Domain 
   TABLE DATA           6   COPY public."Domain" ("DomainId", "Name") FROM stdin;
    public          postgres    false    215   $       �          0    30221    Project 
   TABLE DATA           �   COPY public."Project" ("ProjectID", "ProjectName", "Assignee", "DomainId", "Description", "DueDate", "Domain", "City") FROM stdin;
    public          postgres    false    217   �       �           0    0    Domain_DomainId_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Domain_DomainId_seq"', 1, false);
          public          postgres    false    216            �           0    0    Project_ProjectID_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."Project_ProjectID_seq"', 62, true);
          public          postgres    false    218            X           2606    30228    Domain Domain_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Domain"
    ADD CONSTRAINT "Domain_pkey" PRIMARY KEY ("DomainId");
 @   ALTER TABLE ONLY public."Domain" DROP CONSTRAINT "Domain_pkey";
       public            postgres    false    215            Z           2606    30230    Project Project_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."Project"
    ADD CONSTRAINT "Project_pkey" PRIMARY KEY ("ProjectID");
 B   ALTER TABLE ONLY public."Project" DROP CONSTRAINT "Project_pkey";
       public            postgres    false    217            [           2606    30231    Project Project_DomainId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Project"
    ADD CONSTRAINT "Project_DomainId_fkey" FOREIGN KEY ("DomainId") REFERENCES public."Domain"("DomainId");
 K   ALTER TABLE ONLY public."Project" DROP CONSTRAINT "Project_DomainId_fkey";
       public          postgres    false    4696    215    217            �   V   x�3�,//�KK�KO�K���2�s���R�"FPɩI���`!C�Pz~~zD�)�)fh|s4���oh�.`�.`�&���� �CM      �     x��V�n�8=S_���^��Y�t&ɴ��\�b�H���v�)ْ{����EEV��^@��k)�`P$ W�(�j�I�����O}��C�����}s�ʒ|�A����ޙ�:#��YQ�[���RåhJ&?�/�_.݊	9����.�9SoL1zR-�ɟӜ��
TU�O���x���߹`"�k�C�oHf��'�YjM���#OsYhr+.�E�V��$�2��	<� 2��J��0��*�=-�����
��Lya�^)<��Tz#2gFKqB�X����TC�J|f�N�_��d�ptJ��ʜ�`���@�Y�ņ\�<e��S΋�/�� .�T�^+�!crQ��М���n��ң=�!�R���IM���vބ4���B����8���.5+�����A���Yi#���\ɵ�3�����sdVH��fئ� 4K(
|��1���S.A�^������<���-��d�L�Y�q����K�8�:M+̈́�U�=d�$;8z;p�A��9�<���·"��4����l�5���e�G�ӃϪ�R䮙� L�`�u&pR\zAD����
�5�aJam|�K��s^X>��h��5�:췇���G\r@1y�o\8��`�k��Y��D��F.sl�aF����)f{*�8�MtX4��(�������X [e�DoQ�$`��V�b	�#�~/>�J��;����Z������������Uƭ(�V��ؔ�=����!w9rwD,Us+=VjlIp(h�MD.�Bp�y�b��/!E�\��jce��c2p�zAG���]}Gz�Z˭��=u}%��s��{��<�B�<Hw�i�f*��L���&�[D�f�QpX��%��}r���q?bO��L�E�.1Fv�mUm͂[����P��"Ė��x@@=[) ��BǷ�^Z���wPu��)_��K.Z��!�?�U�M����[I��i�v'%�sD^�08x�+�~�0���Fd����	�������ntU��߹*��[���� �Ҿ��.���	�e����RvNx�����A1�d�Q$V�R��j���yaBv�k�������v���=�RA�@X�)�mw�����`�t����!��[�ݣ�␜ݢ��Zj��i��n��+�\����C���-SS'�;�ag��T��%�L���i�pL^����Ћ],ԭ#�mFq!�T���sX�`���'��b'�5;h���׬�n��T�fqb�)e�;�?��p���DV��!N3��y��l���^n��Ғ��X�]����
����6���4�m[�u�RD��*�:�h�{hw0�Ɋ릵���\�b`�Jh\@�?]`�`o��%���;��ϱ!4x��1s�V��S�/����v�x�Hc�Rc����}鍽1/����Q���hx���zM�ѸǨM��ʱ��ǈ�q�sT���G�8�5*�IQ9������q�Q9����Q9	���Ix���D�G�$�;*'I�Q9���Q_Q9�������?jT}E�a�kT���� � �     
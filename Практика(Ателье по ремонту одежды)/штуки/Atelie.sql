PGDMP      #                |            Atelie    16.1    16.0 b    #           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            $           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            %           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            &           1262    24903    Atelie    DATABASE     |   CREATE DATABASE "Atelie" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE "Atelie";
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            '           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4            �            1259    25020    clients    TABLE       CREATE TABLE public.clients (
    clientid integer NOT NULL,
    first_name character varying(70) NOT NULL,
    last_name character varying(70) NOT NULL,
    patronymic character varying(70),
    email character varying(40) NOT NULL,
    phone_number character varying(16) NOT NULL
);
    DROP TABLE public.clients;
       public         heap    postgres    false    4            �            1259    25019    clients_clientid_seq    SEQUENCE     �   CREATE SEQUENCE public.clients_clientid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.clients_clientid_seq;
       public          postgres    false    4    216            (           0    0    clients_clientid_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.clients_clientid_seq OWNED BY public.clients.clientid;
          public          postgres    false    215            �            1259    25059 	   materials    TABLE     �   CREATE TABLE public.materials (
    materialid integer NOT NULL,
    name character varying(100) NOT NULL,
    unit character varying(7) NOT NULL,
    quantity numeric NOT NULL,
    unit_cost numeric NOT NULL,
    providerid integer NOT NULL
);
    DROP TABLE public.materials;
       public         heap    postgres    false    4            �            1259    25058    materials_materialid_seq    SEQUENCE     �   CREATE SEQUENCE public.materials_materialid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.materials_materialid_seq;
       public          postgres    false    224    4            )           0    0    materials_materialid_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.materials_materialid_seq OWNED BY public.materials.materialid;
          public          postgres    false    223            �            1259    25097    measurements    TABLE     =  CREATE TABLE public.measurements (
    measurementid integer NOT NULL,
    clientid integer NOT NULL,
    measurement_date date NOT NULL,
    shoulder_width numeric NOT NULL,
    chest_width numeric NOT NULL,
    waist_size numeric NOT NULL,
    hip_circumference numeric NOT NULL,
    arm_length numeric NOT NULL
);
     DROP TABLE public.measurements;
       public         heap    postgres    false    4            �            1259    25096    measurements_measurementid_seq    SEQUENCE     �   CREATE SEQUENCE public.measurements_measurementid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.measurements_measurementid_seq;
       public          postgres    false    4    228            *           0    0    measurements_measurementid_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.measurements_measurementid_seq OWNED BY public.measurements.measurementid;
          public          postgres    false    227            �            1259    25111    modernization    TABLE       CREATE TABLE public.modernization (
    modernid integer NOT NULL,
    orderid integer NOT NULL,
    measurementid integer NOT NULL,
    workerid integer NOT NULL,
    materialid integer NOT NULL,
    modern_cost numeric NOT NULL,
    modern_time character varying(14) NOT NULL
);
 !   DROP TABLE public.modernization;
       public         heap    postgres    false    4            �            1259    25110    modernization_modernid_seq    SEQUENCE     �   CREATE SEQUENCE public.modernization_modernid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.modernization_modernid_seq;
       public          postgres    false    4    230            +           0    0    modernization_modernid_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.modernization_modernid_seq OWNED BY public.modernization.modernid;
          public          postgres    false    229            �            1259    25027    orders    TABLE     �   CREATE TABLE public.orders (
    orderid integer NOT NULL,
    clientid integer NOT NULL,
    order_date date NOT NULL,
    description text NOT NULL,
    status character varying(12) NOT NULL
);
    DROP TABLE public.orders;
       public         heap    postgres    false    4            �            1259    25026    orders_orderid_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_orderid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.orders_orderid_seq;
       public          postgres    false    218    4            ,           0    0    orders_orderid_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.orders_orderid_seq OWNED BY public.orders.orderid;
          public          postgres    false    217            �            1259    25140    payments    TABLE     �   CREATE TABLE public.payments (
    paymentid integer NOT NULL,
    orderid integer NOT NULL,
    payment_date date NOT NULL,
    modernid integer,
    repairid integer,
    payment_amount numeric NOT NULL
);
    DROP TABLE public.payments;
       public         heap    postgres    false    4            �            1259    25139    payments_paymentid_seq    SEQUENCE     �   CREATE SEQUENCE public.payments_paymentid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.payments_paymentid_seq;
       public          postgres    false    4    232            -           0    0    payments_paymentid_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.payments_paymentid_seq OWNED BY public.payments.paymentid;
          public          postgres    false    231            �            1259    25171 	   positions    TABLE     u   CREATE TABLE public.positions (
    positionid integer NOT NULL,
    position_name character varying(15) NOT NULL
);
    DROP TABLE public.positions;
       public         heap    postgres    false    4            �            1259    25170    positions_positionid_seq    SEQUENCE     �   CREATE SEQUENCE public.positions_positionid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.positions_positionid_seq;
       public          postgres    false    236    4            .           0    0    positions_positionid_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.positions_positionid_seq OWNED BY public.positions.positionid;
          public          postgres    false    235            �            1259    25050 	   providers    TABLE       CREATE TABLE public.providers (
    providerid integer NOT NULL,
    amount numeric NOT NULL,
    date date NOT NULL,
    material_name character varying(100) NOT NULL,
    provider_name character varying(100) NOT NULL,
    phone_number character varying(16) NOT NULL
);
    DROP TABLE public.providers;
       public         heap    postgres    false    4            �            1259    25049    providers_providerid_seq    SEQUENCE     �   CREATE SEQUENCE public.providers_providerid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.providers_providerid_seq;
       public          postgres    false    4    222            /           0    0    providers_providerid_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.providers_providerid_seq OWNED BY public.providers.providerid;
          public          postgres    false    221            �            1259    25073    repairs    TABLE     �   CREATE TABLE public.repairs (
    repairid integer NOT NULL,
    orderid integer NOT NULL,
    workerid integer NOT NULL,
    materialid integer NOT NULL,
    repair_cost numeric NOT NULL,
    repair_time character varying(14)
);
    DROP TABLE public.repairs;
       public         heap    postgres    false    4            �            1259    25072    repairs_repairid_seq    SEQUENCE     �   CREATE SEQUENCE public.repairs_repairid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.repairs_repairid_seq;
       public          postgres    false    226    4            0           0    0    repairs_repairid_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.repairs_repairid_seq OWNED BY public.repairs.repairid;
          public          postgres    false    225            �            1259    25164    users    TABLE     �   CREATE TABLE public.users (
    userid integer NOT NULL,
    login character varying(50) NOT NULL,
    password character varying(100) NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false    4            �            1259    25163    users_userid_seq    SEQUENCE     �   CREATE SEQUENCE public.users_userid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.users_userid_seq;
       public          postgres    false    4    234            1           0    0    users_userid_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.users_userid_seq OWNED BY public.users.userid;
          public          postgres    false    233            �            1259    25041    workers    TABLE     �  CREATE TABLE public.workers (
    workerid integer NOT NULL,
    last_name character varying(70) NOT NULL,
    first_name character varying(70) NOT NULL,
    patronymic character varying(70),
    birth_date date NOT NULL,
    passport_series character varying(4) NOT NULL,
    passport_number character varying(6) NOT NULL,
    address text NOT NULL,
    phone_number character varying(16) NOT NULL,
    positionid integer NOT NULL,
    userid integer NOT NULL
);
    DROP TABLE public.workers;
       public         heap    postgres    false    4            �            1259    25040    workers_workerid_seq    SEQUENCE     �   CREATE SEQUENCE public.workers_workerid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.workers_workerid_seq;
       public          postgres    false    220    4            2           0    0    workers_workerid_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.workers_workerid_seq OWNED BY public.workers.workerid;
          public          postgres    false    219            L           2604    25023    clients clientid    DEFAULT     t   ALTER TABLE ONLY public.clients ALTER COLUMN clientid SET DEFAULT nextval('public.clients_clientid_seq'::regclass);
 ?   ALTER TABLE public.clients ALTER COLUMN clientid DROP DEFAULT;
       public          postgres    false    216    215    216            P           2604    25062    materials materialid    DEFAULT     |   ALTER TABLE ONLY public.materials ALTER COLUMN materialid SET DEFAULT nextval('public.materials_materialid_seq'::regclass);
 C   ALTER TABLE public.materials ALTER COLUMN materialid DROP DEFAULT;
       public          postgres    false    224    223    224            R           2604    25100    measurements measurementid    DEFAULT     �   ALTER TABLE ONLY public.measurements ALTER COLUMN measurementid SET DEFAULT nextval('public.measurements_measurementid_seq'::regclass);
 I   ALTER TABLE public.measurements ALTER COLUMN measurementid DROP DEFAULT;
       public          postgres    false    228    227    228            S           2604    25114    modernization modernid    DEFAULT     �   ALTER TABLE ONLY public.modernization ALTER COLUMN modernid SET DEFAULT nextval('public.modernization_modernid_seq'::regclass);
 E   ALTER TABLE public.modernization ALTER COLUMN modernid DROP DEFAULT;
       public          postgres    false    230    229    230            M           2604    25030    orders orderid    DEFAULT     p   ALTER TABLE ONLY public.orders ALTER COLUMN orderid SET DEFAULT nextval('public.orders_orderid_seq'::regclass);
 =   ALTER TABLE public.orders ALTER COLUMN orderid DROP DEFAULT;
       public          postgres    false    218    217    218            T           2604    25143    payments paymentid    DEFAULT     x   ALTER TABLE ONLY public.payments ALTER COLUMN paymentid SET DEFAULT nextval('public.payments_paymentid_seq'::regclass);
 A   ALTER TABLE public.payments ALTER COLUMN paymentid DROP DEFAULT;
       public          postgres    false    232    231    232            V           2604    25174    positions positionid    DEFAULT     |   ALTER TABLE ONLY public.positions ALTER COLUMN positionid SET DEFAULT nextval('public.positions_positionid_seq'::regclass);
 C   ALTER TABLE public.positions ALTER COLUMN positionid DROP DEFAULT;
       public          postgres    false    235    236    236            O           2604    25053    providers providerid    DEFAULT     |   ALTER TABLE ONLY public.providers ALTER COLUMN providerid SET DEFAULT nextval('public.providers_providerid_seq'::regclass);
 C   ALTER TABLE public.providers ALTER COLUMN providerid DROP DEFAULT;
       public          postgres    false    222    221    222            Q           2604    25076    repairs repairid    DEFAULT     t   ALTER TABLE ONLY public.repairs ALTER COLUMN repairid SET DEFAULT nextval('public.repairs_repairid_seq'::regclass);
 ?   ALTER TABLE public.repairs ALTER COLUMN repairid DROP DEFAULT;
       public          postgres    false    226    225    226            U           2604    25167    users userid    DEFAULT     l   ALTER TABLE ONLY public.users ALTER COLUMN userid SET DEFAULT nextval('public.users_userid_seq'::regclass);
 ;   ALTER TABLE public.users ALTER COLUMN userid DROP DEFAULT;
       public          postgres    false    234    233    234            N           2604    25044    workers workerid    DEFAULT     t   ALTER TABLE ONLY public.workers ALTER COLUMN workerid SET DEFAULT nextval('public.workers_workerid_seq'::regclass);
 ?   ALTER TABLE public.workers ALTER COLUMN workerid DROP DEFAULT;
       public          postgres    false    220    219    220                      0    25020    clients 
   TABLE DATA           c   COPY public.clients (clientid, first_name, last_name, patronymic, email, phone_number) FROM stdin;
    public          postgres    false    216   ^x                 0    25059 	   materials 
   TABLE DATA           \   COPY public.materials (materialid, name, unit, quantity, unit_cost, providerid) FROM stdin;
    public          postgres    false    224   �~                 0    25097    measurements 
   TABLE DATA           �   COPY public.measurements (measurementid, clientid, measurement_date, shoulder_width, chest_width, waist_size, hip_circumference, arm_length) FROM stdin;
    public          postgres    false    228   x�                 0    25111    modernization 
   TABLE DATA           y   COPY public.modernization (modernid, orderid, measurementid, workerid, materialid, modern_cost, modern_time) FROM stdin;
    public          postgres    false    230   >�                 0    25027    orders 
   TABLE DATA           T   COPY public.orders (orderid, clientid, order_date, description, status) FROM stdin;
    public          postgres    false    218   ̋                 0    25140    payments 
   TABLE DATA           h   COPY public.payments (paymentid, orderid, payment_date, modernid, repairid, payment_amount) FROM stdin;
    public          postgres    false    232   �                  0    25171 	   positions 
   TABLE DATA           >   COPY public.positions (positionid, position_name) FROM stdin;
    public          postgres    false    236   ��                 0    25050 	   providers 
   TABLE DATA           i   COPY public.providers (providerid, amount, date, material_name, provider_name, phone_number) FROM stdin;
    public          postgres    false    222   �                 0    25073    repairs 
   TABLE DATA           d   COPY public.repairs (repairid, orderid, workerid, materialid, repair_cost, repair_time) FROM stdin;
    public          postgres    false    226   ��                 0    25164    users 
   TABLE DATA           8   COPY public.users (userid, login, password) FROM stdin;
    public          postgres    false    234   $�                 0    25041    workers 
   TABLE DATA           �   COPY public.workers (workerid, last_name, first_name, patronymic, birth_date, passport_series, passport_number, address, phone_number, positionid, userid) FROM stdin;
    public          postgres    false    220   R�       3           0    0    clients_clientid_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.clients_clientid_seq', 100, true);
          public          postgres    false    215            4           0    0    materials_materialid_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.materials_materialid_seq', 165, true);
          public          postgres    false    223            5           0    0    measurements_measurementid_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.measurements_measurementid_seq', 100, true);
          public          postgres    false    227            6           0    0    modernization_modernid_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.modernization_modernid_seq', 100, true);
          public          postgres    false    229            7           0    0    orders_orderid_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.orders_orderid_seq', 100, true);
          public          postgres    false    217            8           0    0    payments_paymentid_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.payments_paymentid_seq', 100, true);
          public          postgres    false    231            9           0    0    positions_positionid_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.positions_positionid_seq', 3, true);
          public          postgres    false    235            :           0    0    providers_providerid_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.providers_providerid_seq', 100, true);
          public          postgres    false    221            ;           0    0    repairs_repairid_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.repairs_repairid_seq', 200, true);
          public          postgres    false    225            <           0    0    users_userid_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.users_userid_seq', 100, true);
          public          postgres    false    233            =           0    0    workers_workerid_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.workers_workerid_seq', 100, true);
          public          postgres    false    219            X           2606    25025    clients clients_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (clientid);
 >   ALTER TABLE ONLY public.clients DROP CONSTRAINT clients_pkey;
       public            postgres    false    216            `           2606    25066    materials materials_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.materials
    ADD CONSTRAINT materials_pkey PRIMARY KEY (materialid);
 B   ALTER TABLE ONLY public.materials DROP CONSTRAINT materials_pkey;
       public            postgres    false    224            d           2606    25104    measurements measurements_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.measurements
    ADD CONSTRAINT measurements_pkey PRIMARY KEY (measurementid);
 H   ALTER TABLE ONLY public.measurements DROP CONSTRAINT measurements_pkey;
       public            postgres    false    228            f           2606    25118     modernization modernization_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.modernization
    ADD CONSTRAINT modernization_pkey PRIMARY KEY (modernid);
 J   ALTER TABLE ONLY public.modernization DROP CONSTRAINT modernization_pkey;
       public            postgres    false    230            Z           2606    25034    orders orders_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (orderid);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    218            h           2606    25147    payments payments_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (paymentid);
 @   ALTER TABLE ONLY public.payments DROP CONSTRAINT payments_pkey;
       public            postgres    false    232            l           2606    25176    positions positions_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.positions
    ADD CONSTRAINT positions_pkey PRIMARY KEY (positionid);
 B   ALTER TABLE ONLY public.positions DROP CONSTRAINT positions_pkey;
       public            postgres    false    236            ^           2606    25057    providers providers_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.providers
    ADD CONSTRAINT providers_pkey PRIMARY KEY (providerid);
 B   ALTER TABLE ONLY public.providers DROP CONSTRAINT providers_pkey;
       public            postgres    false    222            b           2606    25080    repairs repairs_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.repairs
    ADD CONSTRAINT repairs_pkey PRIMARY KEY (repairid);
 >   ALTER TABLE ONLY public.repairs DROP CONSTRAINT repairs_pkey;
       public            postgres    false    226            j           2606    25169    users users_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    234            \           2606    25048    workers workers_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.workers
    ADD CONSTRAINT workers_pkey PRIMARY KEY (workerid);
 >   ALTER TABLE ONLY public.workers DROP CONSTRAINT workers_pkey;
       public            postgres    false    220            p           2606    25067 #   materials materials_providerid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials
    ADD CONSTRAINT materials_providerid_fkey FOREIGN KEY (providerid) REFERENCES public.providers(providerid);
 M   ALTER TABLE ONLY public.materials DROP CONSTRAINT materials_providerid_fkey;
       public          postgres    false    222    4702    224            t           2606    25105 '   measurements measurements_clientid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.measurements
    ADD CONSTRAINT measurements_clientid_fkey FOREIGN KEY (clientid) REFERENCES public.clients(clientid);
 Q   ALTER TABLE ONLY public.measurements DROP CONSTRAINT measurements_clientid_fkey;
       public          postgres    false    4696    228    216            u           2606    25134 +   modernization modernization_materialid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.modernization
    ADD CONSTRAINT modernization_materialid_fkey FOREIGN KEY (materialid) REFERENCES public.materials(materialid);
 U   ALTER TABLE ONLY public.modernization DROP CONSTRAINT modernization_materialid_fkey;
       public          postgres    false    230    4704    224            v           2606    25124 .   modernization modernization_measurementid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.modernization
    ADD CONSTRAINT modernization_measurementid_fkey FOREIGN KEY (measurementid) REFERENCES public.measurements(measurementid);
 X   ALTER TABLE ONLY public.modernization DROP CONSTRAINT modernization_measurementid_fkey;
       public          postgres    false    228    4708    230            w           2606    25119 (   modernization modernization_orderid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.modernization
    ADD CONSTRAINT modernization_orderid_fkey FOREIGN KEY (orderid) REFERENCES public.orders(orderid);
 R   ALTER TABLE ONLY public.modernization DROP CONSTRAINT modernization_orderid_fkey;
       public          postgres    false    4698    230    218            x           2606    25129 )   modernization modernization_workerid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.modernization
    ADD CONSTRAINT modernization_workerid_fkey FOREIGN KEY (workerid) REFERENCES public.workers(workerid);
 S   ALTER TABLE ONLY public.modernization DROP CONSTRAINT modernization_workerid_fkey;
       public          postgres    false    220    4700    230            m           2606    25035    orders orders_clientid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_clientid_fkey FOREIGN KEY (clientid) REFERENCES public.clients(clientid);
 E   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_clientid_fkey;
       public          postgres    false    216    4696    218            y           2606    25148    payments payments_orderid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_orderid_fkey FOREIGN KEY (orderid) REFERENCES public.orders(orderid);
 H   ALTER TABLE ONLY public.payments DROP CONSTRAINT payments_orderid_fkey;
       public          postgres    false    232    4698    218            z           2606    25158    payments payments_repairid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_repairid_fkey FOREIGN KEY (repairid) REFERENCES public.repairs(repairid);
 I   ALTER TABLE ONLY public.payments DROP CONSTRAINT payments_repairid_fkey;
       public          postgres    false    226    232    4706            {           2606    25153     payments payments_upgradeid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_upgradeid_fkey FOREIGN KEY (modernid) REFERENCES public.modernization(modernid);
 J   ALTER TABLE ONLY public.payments DROP CONSTRAINT payments_upgradeid_fkey;
       public          postgres    false    4710    230    232            q           2606    25091    repairs repairs_materialid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.repairs
    ADD CONSTRAINT repairs_materialid_fkey FOREIGN KEY (materialid) REFERENCES public.materials(materialid);
 I   ALTER TABLE ONLY public.repairs DROP CONSTRAINT repairs_materialid_fkey;
       public          postgres    false    224    226    4704            r           2606    25081    repairs repairs_orderid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.repairs
    ADD CONSTRAINT repairs_orderid_fkey FOREIGN KEY (orderid) REFERENCES public.orders(orderid);
 F   ALTER TABLE ONLY public.repairs DROP CONSTRAINT repairs_orderid_fkey;
       public          postgres    false    4698    226    218            s           2606    25086    repairs repairs_workerid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.repairs
    ADD CONSTRAINT repairs_workerid_fkey FOREIGN KEY (workerid) REFERENCES public.workers(workerid);
 G   ALTER TABLE ONLY public.repairs DROP CONSTRAINT repairs_workerid_fkey;
       public          postgres    false    226    220    4700            n           2606    25179    workers workers_positionid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.workers
    ADD CONSTRAINT workers_positionid_fkey FOREIGN KEY (positionid) REFERENCES public.positions(positionid) NOT VALID;
 I   ALTER TABLE ONLY public.workers DROP CONSTRAINT workers_positionid_fkey;
       public          postgres    false    236    220    4716            o           2606    25184    workers workers_userid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.workers
    ADD CONSTRAINT workers_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(userid) NOT VALID;
 E   ALTER TABLE ONLY public.workers DROP CONSTRAINT workers_userid_fkey;
       public          postgres    false    234    220    4714               _  x����n�F���O�P �ɻ<Ho�JuI�!	�}�$r�N���A�>�*[(��
�uf����%u�&����o�@;��cy]��S��m��x(-��o}�_�� ��3�t�Ͳ�&}>�L��ɳ��A���zC?�Q<LF��|�iP|)��+hb���
>�[�˷���z��(1]�a4����aޠ�P<�7�ԯ �8��x�����Z�*/ ����a�E���A�Q�`�}���s��'�����d>9�D�N�¡�`P|����gUL�VMr�!,�m�s]��;
z>�;��=�Ѿ�F�,?Ö�*c���f���f6���|\�m:Pɰ�,�&z.;P4�ђ�|߄̢�أ���j�Ps:�LWZ�,�@�0�,��$�݊�jSW�ˍ>;O׆�V�^L��΃���k��x�E��q��r=�_i��(��9��aq�o��MsŃ)���ؐՔ>�5��t9�E�4dGt ����印]�x��/��<��H��1���0��"G祔��י"���i���J鐛�����J��T9��}ˠ��Q�HJ�Ӡ��cϱ�k>����q�e<�x�m�\;๶�sO	�{z�\{����l��Yϳ�g<�x�-�S��<�x�5�|[�����-���Ϸ�o<�����Ϸ�o��x�CҠ<SsO:�s@�yp��Uԓ� ��Ɠ ���b��q�$�^2�\xhp<���v�A��2�9��b �?Q��@m�N��F�Y�ł�х!���Zb�A�j�-u�"*�EN�D'p�������Q;2���2A��Gp� !����`��쬈@;p�p$Q��^��"�T�xD�.:b\�lm�Qr���R�'�~�BW� �p��3B>`���f��i���h��$�V��\�j�.�����q�ωəqn#��!�	R�cXcI��� �'����p��4H�����mB���pW9ݦ�sB���	�aZ�m<r�Ma�Fu1��,�@!�[��Rv�M�T��uQ;�Փ39��k������J� �W�Zsͥ�Eի���O�!�+v�Rb� ���s�	�b�;#(iQ�)�뇗��y?�j��V��lz��(��v��G�������(Bq�]����G�����@���jd�׸�PP�7DE�|�M�q�/JHAS��x����5&a0�)�#�y�kwa��N5��o�^A��@��R�ᓶ�/�/2}F1�]�U�����}U�"���� O�m=x���Q�(���j���'Q�N���탱NQB�c�+�����ψ��J�T (�qX�ݸD4^���7C7�tm��G��Ǵ{7�q(�q,��%�O��e�B��e6N��F��I����5�wmݕ�-o�M!_O��*�R� ������\u�'�)�	��I�[`X�m�����t��uєӄs����KY�������ė�B&R���6Kf�8�i��I�T^M{������D����Oˋ���aKG�L"1�݉������K{�Lb!�n6K��Fdתn�re�1h�X&�tB�x"��̛П�����$:j����ۨw���T������?>c�����>         �  x��X�n�F<��b��%�g�%c)/V`� 	䔣#i��ce _@�Q���9.��@h��ꙩ���j�߻��Sw�v��n߿�/���}w�>��w����?�n��Ƶ�<
z���{螺/��Sw= �?�=};"�=f���+�pZ����7������m��(�,v��� �;��;	U-���pM��l����%����HA��ty�����g���S_L ��6Y�{�p��-�h�32�F(COD:�e���z��a-=	�-�+1�4*>��2�PjBd�-퍹�OODd^�Q
JW	��L&�@ e��|.��X>�O(�)�S�O��E�,�;K�g��)F�[�A�R�R;z2�,Em)�C�� s���CT��uA.5� 	��&�K�X������,-�B�s���4M]jryL%có"��T�s���5�vM�S�'�����A�%��o�W�SV����|c/xwY�:@ǒ�RY�f�����ާ5q=��:��u)�k�<�M���yeR�\?�`��e-K��2d4�f�.7�10��TA���f�7����I.f�x�eMp�a6��b�1W��m*��)����g"��#���$؅!�HRV�<�a�y_���
vՉfccL�a�����j�v��C%Z������-K:��:�҈j��Ĺ��33�([�s�?��*I�0�n{�j�ELp/p��,���pgjQ�Q�N�-,��Y��pfC�|)�)e��>UA	�T<G7�M�*�6�b:��TK�5�Ҝ��0���ϳ��ҲV/�JZ���E������sR.��ݫ��q4_�}�m^�6��`T�Ƶ>[u֜���k�A��~�_�i�6_���w/��V� /�@G�����_7DΗ\
��a:yg���i�|���v����Gx��G��Fx<�����/��:�'��_��^�hU[��c�&HS$�_��,2>�-K�����p�#/���fcf�n���]��F^�i�����%~��\�&-�?�HI�"�*�� OL2�&��q���Sm�ɒ/5! P�&��t;>		����_I�p�9ѳ��트��<������p��O������B�T��"�J�P�~&�_щ���t�؜7�m�����/����MԈf��*C<K�7� �2>��/���q'q�������_Sn������g,�fp@�D�H��E�|)��{��C��,�b;,��Ĉ�桕7١�cB��8�t/��E~�A��)M����+I�N��t��MRH���*�HZ�7I#�)�I(WݣP[�ʔ��I���S>�Eret�>�CZ�'>?kaǦE��L���{~̣I�h�G����pDS3y����9�4��B
H��4Ӝz)"U<�Z����ah��i��j2]IS��Li��W ���w\         �  x�m�Q��*��q/s�������uLA���t7�F�"LL�H���G�=�~�O��VjBKh��K�T�j��h���ҨU��4�ڵt�Q�tҚ4��gQҨB�?���O4������Tʤ��٠�h�7me�:ꊂ�|o���I�b����tfb�
�_ع�m<�1�D�����6�p%Nf����hW������`����$A��x�8XB����9��8hڰ��Ԃ�8xڸ��p�,���"^�Bm3�&��-b8C�|���bs.�A�k�S�zr� e��G=���J��ˑ��R>��:$H�c�˕��Pܾ�J%H�c�3ס��7�C�9l�kV���CkV�(1��mh8��hK��g���1k��S���HƬ�j?�fMƬJUC j��#�b�-��Y'��n�`;��̺���,�ΏA��R��l���8S��䨟9���zԯ�l��O�ٰ�`���	y�\��e�%b��L�%�of6�;H"I��fB�GH�����V�
u݈ۚ]�35q z�Dt�;5��~+���N��޳B__�=��ŲݶU���+����=�=���V���;;����rs���m_؆�5�GW��|Z���F�m�O�S������cN��?� YÜ�I��쩕[hEݛ9��ME�������l��zS�;8Zd����L������ɰ��҇ꬸ[� ��8$��>��'��V�� �����5�G�L��#�`�1�B�H������xg!ٚ����k�cFn��f+��a]d��	�>�5�or���9�e�:߹9�o�y9s�9��37���T��&<ǡ��i�����&�n�P���ˉl�/�����Y���rj[�q~z�v�P�W����ˏ�}�<�'w��hwp.�o��p��ra����qz9��|�-��⻲?�̬[Ѳ?�!�+��ד�������2J         ~  x�m�ۑ1E��(��� �\����?�����Т�>�5[j	�.�B7��8��o�_��~�*��l��_��Ý��_�u�+6!֯��j�2'>����������$�J��R�7�g�G�&��I��¤��rP����nAxl�+�f�T
,�4�� ���Lc��)�f��M�`lTyX(����V
.b����{o�5���:�{���Bo{��س3�D�G!/g�Gb��Vp�]�{fc����6�P��ݕ-h3Ʌ�X������V�*���'��ݩ�e��o��
:Mw�Yo���;�~��s�+o��7*�t7��7�`��Ss�B��x��1� %���d��<��
�j`R �cn1�Z͏s�~� h�������n�-�{� 9׮���FysĎ�7�;S ^7N���P���շ�+���l��$%dpn~]aR��u����/�.��F��\�b�6�*�%��E��{���B� �De�U��Na�
�q��� t�@���-�@�]�W�g �m�2f���z[��%��eh��Dk�=����,��H���Ϯ����q	F��օ���V�ٞ|�D�+�)���9(R�QM�Q����{��o�M�t ��[��N`x��gq,� �8��䗞����>��ju45ņ.�^.�(�'ݪ��i�W=ê�H�&uao�Ҩ��G��-��
�صnly=\m �a�_�:���}b�ހ��g���a���sJ�b�Ku������:πQi����΀2��O��4v!�o{��'�rx���,_4
į=Y|Pse/+{Z�3lǱ��&��5���d
A��z�X��N
���	�c�0t���Vޛ����z��߀�         B  x�ř]n�8���W��.�2�q��E�8/L�ـ��@��-�;ꥥ�,�u[�t� I�����O􍀀,�Zb%�_ն�Z��C�]�/�3��T=-�2܄u�Te�G���-��a�����\��?<�!�VOa>.�-����Ѻ穟Xi���T��VrӷpS���;�~�(}���G^���G^�Yn��Ѝ�^�:��g$.�k~��Y1N9� �s�q�]����Lbڻz�=Oڰ>�}:V��y��g���Wxϡ�-��X��Y3F���L#k�t�e�y]�Ǒ{^�ޜA����gjZ?w�7�ݒ�}���jWb��1�2��9Wqp��'�U��a��>p�e믇��Cx;v��oV3�˼��Te�/�)&��b�.���4ۂ���\4ɿ1��W<���'�%':���s�����V��Ze,Eg���������w�kS��߹^���^(�Y����~�f\���31����c�Y�k(��T��<F�o���0fa.���4s���Ej[|֨:5��rm��m�%�gh�k�X3l@���~=�{?�W�@�W�kܴA�2��������{��/zd�(/�J������$�J��Q�|��Tlq�$�Ɩ�d�bK�{�fŖty�%�\�T��݇
����		�k�JI(9X��*���RJ_	Z����K��2\�Bٜ�R�>sS��<��.]@I����
.-���K+h��\Zw����MW��6�&!������{%|i�g���%T��4�"9�E$���T�!o:�H�tRt�(+�ȀL
t�|cA6�ȁ\2l��+`�0�l�V��YF��WB�Q0*����i�e��xdc�"�X;Y���Y�������:��l��UV�^���iY	{���{��
V]WV�ꄷ,K��:�e�y%dY�9�������f�E�y�l�xW��z?�7S��o�;	���\�f��p:�F���D.g��u㝅�W �sp.!����ѓ���z�Ü��Oٗ�>Q_ޫ�;�]^�O��{��ߓ�~^O������㽃w9���iK4��CQ����Ǜ�b��         �  x�]�˕1D�L.��蓄#p�q�Ԕ��ӏ���;S�n�J�ŋ����W)�w)?��7k�gL���LIsV}�l��ܠqflc���F<�h�}�߾j�kN�O�M���r*>6�;�}��T}:m��V�A`�>]���k��)��lL�5cl��7�A��Ђҽ��*�j��_���lXIV#�*��ƕh5���ؒo�V#�j�����L��y�ÛR�Ȭ�j��yT���Ej\��T@��,��θ� Z��Y/Q�D�]�LMI�q��Y2Y$�Ƒgϴ�&Gj�E�F�h�q6M����qVM)�Ej�]�E
h�Zˮ�J�"��]��Ek�Zv�+u����A}�?���ٽ��Gj-�6*���H�e�F�h����С4 -Rk��0g Z�f����^4 -R��==+M@��$�6M@��Ivm*�D�*i�9h&ھPɮ�E3���JvmUZ��/T�k��J�}��][J�"5��֠h��dז��"5���A��-��L٠�-�H7)�޷Un&]��V��{q��޷Q��٭	z��z�"�}[���k�z��z�n5�������P�G����^�_	����~%|���,��#�����z?�z/������;����+��-~ݠ�-�o��|A�[ާ�'�}K��{��o	zg�0�;��?!�;?�فH��/ߧdv�h�v��Y�5��w�S4�Z&����i*����Oմ�Z'~������k�P�I��Zg�-ݞ�u�.��I��a�g�S�z��g���]�F�q�r@�� 4q��v����Hmt�������=i ��j�ӳ���n��M�	h˛hSh&�]�<6��f�م�+43Z�م�ӵUh%�]�<][L+��B���Z��^k���Dh��][��o=t��-�M���������?x�@          @   x�3估�¾�M.6_�ra�vqq^�sa��ƋM�^l�2q��Ul��qqq a"�         �	  x��Z�r�6}��B���A� o�ҏ��{��M�i;i�L2�4��cŊɿ@�Q, bA	��_$�{vq��bIQ��(��\,�BTE�������p:��W����x8�7��p6�d8џ�?����ϳy�~��f���Q������jo�'��v�.�FU���Y	�Z������~����� ���+��P��k4��o�S�t�
ֿ�k}'����5�tJ8J�U�hڙ,DE8�E9�����8��Ͼ,q4��*�x;� 6/�~ot�E�n/�n�
�<�<����.o ��b�!h�0�:��?������-��СE��UE�|j�������𯕻�wa��x�. �%��#����A�*�f���-�kz��������C'ΰ�(8�.�������Y�Ԭ)ʒ t9��!���<I���5zg/ F�d�AǁE��(�w�̠1XkJ�il=��?��h�1`y����8"�`׬+JIH�>"�	�)�����6P��O��ފ��|	��0��쿤���b~Ƕ'x��#dY�Dρ�3!��A�Jö� k��
�u���ɘ{��-v[����&@�a(�����Hm�]2�/uR�%�eB���<i�Ii�v!�����~�4M(��)�N�&%%�Vg=�-���^1�N�T���צ�Ni�7�&8�O��q���J؄JfO�h�	�K�{�0�En�R��L����<."�՘ɕ�H�U�h'�U�x��Vi D�,�f	�Ӊ0�*i�گ�Q��n8�V��lM*r����ʔ��Yq���Wޘ���8X��Qoio/�b8��6Ҽo����Ye�g�� %t�}݀���L(k"a���c�i
N�摺m�W�D���DL�ij���</FD��|WfG�Ż���JD������F�8����[��:�̖.�w,�[,�4w�����5��'��w�h!ˀ�Ӳ���Fs:ɤ ��2�7�2Ƒ~3Z�5�n�L��SN����
<Ѻ�&U"�������UF��^V��{ܷvXt����:�,G��8޿�ȼ�溞ˊ�\3��h��'�d%%i�������H��C)I�dC�35:>��!�5�>��)�j��{u�VǇ�c��uYv��u�.�9��Rg��j�>�©}���u�ٛp=V"��a���{&N�U�yR�w79������u�
g5�L`��Nu��4�S�l9������P�c�q�t�&�$̪�T?�g�G�d��uZ��^�����ʝ蚇Q�tJ߆�#��+�"Ty����Sk-�%Y����\L�ʜ���^�¹`8���^�+8(�$��;��ܕG5�ܕ���2�8D�C4&��Q�+{Gɖ�dͤ�c~*�^��ڋ�}N-���v(x���ݧ�;u<g&Mj^��"&��|bD|�1�+z
g��G�u���Y���P2���I
�F�V�B9�У��F*Ұ�$�i�Cߩ�)�W�c-�����;�x�MrZ��r�b�R7��uU���a�#ӤiII�:�m��u�G��	�)�S{3��hK���g��ù7zR�+5Z��֍�۰�'<���<
����� �wGז��H�w�v���I��vF� k������kd�SZ�C1�7g9Q�����ݚ$	�S�i>A8:�<.���=��0��8��D<�L�A��xpp^.�����7$��ǥ�n�;!��p�]S��H*W�),�a�����_�Q$�U�)��<0-��nM~M ��BS0�@W�K=>G/�PP�N1 x�x/�-BS�&�F���2��̤��c�*�4�h��)La�^����W̦-Z�c�ß�T /sM3-D��FB���lvbw^�o��o�%��ES&vY<�#v���f�ex#�+&`#x����vz��Խ
�0 ^2[AJ�K��|��s�����G?�פFfN.۲h�A�� oj�k��s^*[i��\�Z�q�77e�"󚟆{��e�2���U��>�˔��@�{�λE-�aP��;L�+���~�CZ[�\���&�a*F��-�r͹�	�TR��!���}�}�9YGƅ1y<^<ۦ�Z���P�#1&��3�-�bضEGl�Ep6b8�u��Hūd����2B�˫E�!�~��T��B@�c�;E�XX���o�����6�xCى �)#���d"��q?c�ܮ�>�Z���=t� ����B����_�<��#e9<����%�S���xL����oҘ���W�j(�.����J���D��]]�؋p��;ǭ�$����O��oר|o;~�[��	÷p�.\�;��Ed��шJB���p��M����CR�L-;�$��J �������@g�e�J� {n�0l�ӻ��oz��ɂV.�^�2���0���~|��l6�_�#;         r  x�mV���0|�UAL�'Y�����ptĮ�8��4@gKZ�VN��|�8���o�_��~��di��ܾ8�iU����H�ʻ�J��g���J�w�����K����K$��I�/�z���jr� 5��Ķ`���זp)I
0Z��,0^Ŗ� ,�Ir��Ǭ��m�I���Y��SI,��~F��gS����l�*�[H@�����Ƹ6��qe9��%$I¬.��ׇ-�䒋��K��y��0I��R ��l ��1SI	Ý7c�|1^i7i�T��L�<�����;k�K~���'֔$0srǶ�%K	d���5��T�=}���z"w�VfiR�5�s�f�*��9�<����c4zo&���o��{�c�{۷Z�!��0�u�i@��2���ДA�)b-Rcpʭ6�9�M�x�M��\��D_�i�W��<�f�	㊶�m�R���*r>�k=���m��Ai"C��Є�� Ҩ�6M���(Y������'~g��P ?n&=a���A��t��B�0��M h!�z�1�B�!	��"��,����B�W*���R�umQc��R'wOH0�x��'��5�����Kc{�>IOxzق��j`�l�I��`>H��b�P�W��m� ޥ���;qU��_��ӂ=į���P[��J��!�0�j*��V9���s!@!}q�����v#�s����6�\��k�o�׃4H��R٦s��5܃6�\��g0��f��3�E*{��3g��t�m��wĊ��^�e�b���~�3��'��)8^?[�{�=���.�j<V��~��JJ��R�c{�8���O����FP	_v�w�x�`�>����1>0.t�1?�3�2?�F9?��^��
�U�           x�mV�r�:��߂8��������-=��i;;g&c�K\���!mx��C
�vo��X��I�L\��s���&,�2M+��2!n�]�i.c���������?(�AS/�I
WB��8H�樆����(R���m�]5���x�1���ԑoG�"�j�
Org\%���1��~j���O�+&��-^��N:��)F��c3X��	�r�0Ú�9<ʭ!pc���v� zmy-����,Hb��)������WHD�z�p�bLi'F�FIW���;��(&Q
s�����##[�sw��>Q3i����A���B;n��4�+�l�0A��m#<)�gcǭ@��ڍ�X�b�ǛSx����߀�9��-�z9Q��9�4>�[�k$��l�ތMx!nGP��B�;v�@Ó�Bף��~Vc<�~ܸ�c�9��}��٧N�k�_�.�=�����^��b�$���>6��)ڒ$�g��n��vY�'?v��%nGfYQ��$���N���gj>����~������J�H������lI�?+�4$Mp���ѹ;{�0�Cu�n�N
I�a�Y�]�b/V�'q���������>a�J��O�l)I��;	FR��=l�i(��$ά�%��d�| ��J�����U$��j�`;u�o�Ű�%m��v%9�0/��-"�%�f��#�E��rF�#U.�w���LI��o���;����ūd�(����J�����<x�=�a�����9�8w�pI��F�;c7�G��π�< ����r/��>֜��+L�M�v�c"v�	{a�i����̲����.�pK�Fz�c���V�K�!v_����T1i1jB�7^�zsh���k�!�y��	Q���V�����;^Լ��à����]�|�w�x�L���H)����zU	�^ ��>��;���g&#E��[%��iż��~u]��Jw`�������L�i,�����:�O9!r��j+�`��|'G-rx��w��SPXR8�1_?�潆�}Џ��վ��/���B~�a��         �  x���m�����N�����.9�JJ1b[���q +�\���h�t΍\U$��aq�	���j�~�]����=����_���}��_5���m��_��>/��}}|y���ǿ5����BkBc��M�)��9��o�?��__�7�o��ӳ���g�ÿo����B���RZcL�W���]���?�w�}{�.����v��]�͇��7S���']����K�gTaO*L7ʰֶ|���?`����IȻ�}C?��~��E�K��j�k��������, 1p����s-_(��o�_��/8����rP��b�ε64�~j�}7	�?
��|{j�No�o���=���u|�/S(p `�_������� n�G������I���ݱ~$�Y���!��/� 6�p n�&l�D��_Ћ�;��غmM� h��0	�w�}|č�x���1�|��Iv K��૒'�WR����y���<0ԇ$e%)͒��I)�|�����������Q��yW��m���:��?��bKO)�J�$������^Lq�O"��/#�/��4�O��#ox�>���SV8��o;ߚ�!�	��'e�0���?^(� �N�����0uŏ��K��
]/���2�1%�31S�"����g�'p��z��~t�:@����S�Н�����9��$���Z|
~� 5���̡Ax8�e��)eg%�ajZ�w���4�M����nECp`���b�d�b*O-S�ըA�80�"����>N04���/R��	�KUh53[��V����%Lߋ�y򆺆�m96�o|_�ؤ�0q��B�a�u�34�b�셬�)�5ʚ��~��g��=#��'�"���5��8� W^���`�bޣ�����f�jѸj2�B1B��?YÉ�& Yq�!���Z4��د�;���gds����Q�T�	�A�v`����܌�B����d�^�F�ޅZ#�8jщG)ް=�$@���&�=��+�L�p��-��=���7��.]�bkʥ^���(���:���f�<���S9!G����v�QM����q\+�nVW,��Bn���6)Km �����4�
3�1�D^���$�3I�jXm;Z����Vm�a��v��&!H�M�\X6��hӴ��I ��z�jg�հ����7�!�� �h��9XV[���� �U����rX���^ؠ~��AV'Ȫ�Uׁ34$ÛN�Y���� ��dW�Y'8��Ug�!g�r3�A��� ��Rx�kw��	��F�ẟ��e���~��@
��3�><��4N)Յ AZյ:��
���AR%萹��u�u���yu0�9fn��Y��:C�S(�kH�iU���xZs�;{X�֍�q�&즭�U�����Y��r)���eD�>�:�[տ��y{�6�A���������F���N0W5�.�+C�b�X�Iu~6���JN�Vu�� N�������θ.���g���kU7�;�f��^ ><~�)�AYE[o� ��ހG��t�������d	����Ϥ��������k�J�tVX��_��Q=a�b4�z�7,j�R�U?Z�+l��^�`�"��o��K��Y	V!mbO[GZ/ꯪ����i/�X5��r��塞�)kUO�#�t��AX�0��'!G#�O�,b�	#���(W���l����|�˟�}R������/B��W_ -&O�C�^Ҋ��;�	�8� (�:��A0+��gQ7�4��ںA�U�l0�j�Y@m#sׁ�.��Y����6/�ʍ
K��#�jck�� ��V��E�i$/R�� x�xW�}ȅ�5��!��c�5�6�]�b���;9��7�._vs5�*��D�^����no�`L�jTU|+�I2ق�q��ׂ��x���R5�*�EdU1���y��[�1]�c���cE	b7�z1��E$Ĉ��ҵ��q��S�*N�D3@�nި81T�X�c�����k����M�=뭲G�#vL�.�ƙ�N�(�BtL��?U�d�|;�o-O�"4�FѓA}��E�H���q&�S*J��X�a�7m6�E�FE-q���AH�x �������{Uꋃ�����r"`��9��\O�s�c�j��Z���Iũ���U�(J}:W�@5W��U��U�!^���w*{����*�l��j,B���X uC�c/�7�Z������$���S�1;H�ZT���d���� ��SQ��d��"[-p:���N$�Tŧ�i����)0S��á+SM�$����� y��x!Z�3���j\U�j����_�^]L)��x)����IUu�)@�����~���y����$x�z�Q���r����T;��y�J0U��)A�C��D���q���<M���OMRy�϶W�uLM���WMr7�{�~��^�OJ�35�L��W�d���OyU�I[K�l����@�#;�]���S�����g�zթf٭-��F������	!W���\�}r`�
).��9�:�晦^u��C���v>��8IyIi�H����4�qZÜ�Q#'Ԛ�q�9�g�z՗�y<bu��X����u~NB��Ϝ �.�-���FD*�P?�agXUW�3`/�!���9B�X����5������Gs������[���39I�9ZGo���Гr�\��ӡ�:�ATţ��*[�g�j��j�US���RQ����>��5����Z��Rţ�E���52��:̹u��"���Sࡄ�N��u�^l�뮫�AUş�� %*�m��ۆ��AUŝ��%-��O����)`��jTU\)
IP�j{�������~ZQ_�22��:O��! T~<@Vq�(�>!Э�ϜmȜ�KB���#'9Aq�HƮ�??�? #s��     
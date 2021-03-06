PGDMP                         x           spring_filmdb    12.3    12.3 A    q           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            r           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            s           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            t           1262    16877    spring_filmdb    DATABASE     �   CREATE DATABASE spring_filmdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Hungarian_Hungary.1250' LC_CTYPE = 'Hungarian_Hungary.1250';
    DROP DATABASE spring_filmdb;
                postgres    false            �            1259    16878    favorite_film    TABLE     ^   CREATE TABLE public.favorite_film (
    userid bigint NOT NULL,
    filmid bigint NOT NULL
);
 !   DROP TABLE public.favorite_film;
       public         heap    postgres    false            �            1259    16883    favorite_genre    TABLE     `   CREATE TABLE public.favorite_genre (
    userid bigint NOT NULL,
    genreid bigint NOT NULL
);
 "   DROP TABLE public.favorite_genre;
       public         heap    postgres    false            �            1259    16888    favorite_people    TABLE     b   CREATE TABLE public.favorite_people (
    userid bigint NOT NULL,
    peopleid bigint NOT NULL
);
 #   DROP TABLE public.favorite_people;
       public         heap    postgres    false            �            1259    16893 
   film_genre    TABLE     \   CREATE TABLE public.film_genre (
    filmid bigint NOT NULL,
    genreid bigint NOT NULL
);
    DROP TABLE public.film_genre;
       public         heap    postgres    false            �            1259    16951    film_seq    SEQUENCE     r   CREATE SEQUENCE public.film_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    DROP SEQUENCE public.film_seq;
       public          postgres    false            �            1259    16949    filmrate_seq    SEQUENCE     v   CREATE SEQUENCE public.filmrate_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.filmrate_seq;
       public          postgres    false            �            1259    16898 	   filmrates    TABLE     �   CREATE TABLE public.filmrates (
    film_rateid bigint NOT NULL,
    filmid bigint NOT NULL,
    film_rate_comment character varying(255),
    star_count integer NOT NULL,
    userid bigint NOT NULL
);
    DROP TABLE public.filmrates;
       public         heap    postgres    false            �            1259    16903    films    TABLE     T  CREATE TABLE public.films (
    filmid bigint NOT NULL,
    film_description character varying(255),
    film_length_mins integer NOT NULL,
    film_original_title character varying(255) NOT NULL,
    film_release_date timestamp without time zone,
    film_sub_title character varying(255),
    film_type character varying(255) NOT NULL
);
    DROP TABLE public.films;
       public         heap    postgres    false            �            1259    16953 	   genre_seq    SEQUENCE     s   CREATE SEQUENCE public.genre_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
     DROP SEQUENCE public.genre_seq;
       public          postgres    false            �            1259    16911    genres    TABLE     l   CREATE TABLE public.genres (
    genreid bigint NOT NULL,
    genre_name character varying(255) NOT NULL
);
    DROP TABLE public.genres;
       public         heap    postgres    false            �            1259    16916    people    TABLE     %  CREATE TABLE public.people (
    peopleid bigint NOT NULL,
    biography character varying(255),
    born_country character varying(255),
    born_date timestamp without time zone,
    born_place character varying(255),
    gender integer NOT NULL,
    name character varying(255) NOT NULL
);
    DROP TABLE public.people;
       public         heap    postgres    false            �            1259    16955 
   people_seq    SEQUENCE     t   CREATE SEQUENCE public.people_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE public.people_seq;
       public          postgres    false            �            1259    16924 
   profession    TABLE     b   CREATE TABLE public.profession (
    peopleid bigint NOT NULL,
    role_typeid bigint NOT NULL
);
    DROP TABLE public.profession;
       public         heap    postgres    false            �            1259    16957    role_seq    SEQUENCE     r   CREATE SEQUENCE public.role_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    DROP SEQUENCE public.role_seq;
       public          postgres    false            �            1259    16929    roles    TABLE     �   CREATE TABLE public.roles (
    roleid bigint NOT NULL,
    filmid bigint NOT NULL,
    peopleid bigint NOT NULL,
    role_name character varying(255),
    role_typeid bigint NOT NULL
);
    DROP TABLE public.roles;
       public         heap    postgres    false            �            1259    16959    roletype_seq    SEQUENCE     v   CREATE SEQUENCE public.roletype_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.roletype_seq;
       public          postgres    false            �            1259    16934 	   roletypes    TABLE     w   CREATE TABLE public.roletypes (
    role_typeid bigint NOT NULL,
    role_type_name character varying(255) NOT NULL
);
    DROP TABLE public.roletypes;
       public         heap    postgres    false            �            1259    16961    user_seq    SEQUENCE     r   CREATE SEQUENCE public.user_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    DROP SEQUENCE public.user_seq;
       public          postgres    false            �            1259    16939    users    TABLE     �  CREATE TABLE public.users (
    userid bigint NOT NULL,
    user_born_date date,
    user_email character varying(255) NOT NULL,
    user_gender integer,
    user_is_admin integer NOT NULL,
    user_last_login timestamp without time zone,
    user_name character varying(255) NOT NULL,
    user_password character varying(255) NOT NULL,
    user_reg_date timestamp without time zone,
    user_status integer NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            \          0    16878    favorite_film 
   TABLE DATA           7   COPY public.favorite_film (userid, filmid) FROM stdin;
    public          postgres    false    202   �K       ]          0    16883    favorite_genre 
   TABLE DATA           9   COPY public.favorite_genre (userid, genreid) FROM stdin;
    public          postgres    false    203   L       ^          0    16888    favorite_people 
   TABLE DATA           ;   COPY public.favorite_people (userid, peopleid) FROM stdin;
    public          postgres    false    204   .L       _          0    16893 
   film_genre 
   TABLE DATA           5   COPY public.film_genre (filmid, genreid) FROM stdin;
    public          postgres    false    205   SL       `          0    16898 	   filmrates 
   TABLE DATA           _   COPY public.filmrates (film_rateid, filmid, film_rate_comment, star_count, userid) FROM stdin;
    public          postgres    false    206   �L       a          0    16903    films 
   TABLE DATA           �   COPY public.films (filmid, film_description, film_length_mins, film_original_title, film_release_date, film_sub_title, film_type) FROM stdin;
    public          postgres    false    207   �L       b          0    16911    genres 
   TABLE DATA           5   COPY public.genres (genreid, genre_name) FROM stdin;
    public          postgres    false    208   uM       c          0    16916    people 
   TABLE DATA           h   COPY public.people (peopleid, biography, born_country, born_date, born_place, gender, name) FROM stdin;
    public          postgres    false    209   qN       d          0    16924 
   profession 
   TABLE DATA           ;   COPY public.profession (peopleid, role_typeid) FROM stdin;
    public          postgres    false    210   lO       e          0    16929    roles 
   TABLE DATA           Q   COPY public.roles (roleid, filmid, peopleid, role_name, role_typeid) FROM stdin;
    public          postgres    false    211   �O       f          0    16934 	   roletypes 
   TABLE DATA           @   COPY public.roletypes (role_typeid, role_type_name) FROM stdin;
    public          postgres    false    212   �O       g          0    16939    users 
   TABLE DATA           �   COPY public.users (userid, user_born_date, user_email, user_gender, user_is_admin, user_last_login, user_name, user_password, user_reg_date, user_status) FROM stdin;
    public          postgres    false    213   �P       u           0    0    film_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('public.film_seq', 51, true);
          public          postgres    false    215            v           0    0    filmrate_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.filmrate_seq', 51, true);
          public          postgres    false    214            w           0    0 	   genre_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('public.genre_seq', 51, true);
          public          postgres    false    216            x           0    0 
   people_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.people_seq', 51, true);
          public          postgres    false    217            y           0    0    role_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('public.role_seq', 51, true);
          public          postgres    false    218            z           0    0    roletype_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.roletype_seq', 51, true);
          public          postgres    false    219            {           0    0    user_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('public.user_seq', 51, true);
          public          postgres    false    220            �
           2606    16882     favorite_film favorite_film_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.favorite_film
    ADD CONSTRAINT favorite_film_pkey PRIMARY KEY (userid, filmid);
 J   ALTER TABLE ONLY public.favorite_film DROP CONSTRAINT favorite_film_pkey;
       public            postgres    false    202    202            �
           2606    16887 "   favorite_genre favorite_genre_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.favorite_genre
    ADD CONSTRAINT favorite_genre_pkey PRIMARY KEY (userid, genreid);
 L   ALTER TABLE ONLY public.favorite_genre DROP CONSTRAINT favorite_genre_pkey;
       public            postgres    false    203    203            �
           2606    16892 $   favorite_people favorite_people_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.favorite_people
    ADD CONSTRAINT favorite_people_pkey PRIMARY KEY (userid, peopleid);
 N   ALTER TABLE ONLY public.favorite_people DROP CONSTRAINT favorite_people_pkey;
       public            postgres    false    204    204            �
           2606    16897    film_genre film_genre_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.film_genre
    ADD CONSTRAINT film_genre_pkey PRIMARY KEY (filmid, genreid);
 D   ALTER TABLE ONLY public.film_genre DROP CONSTRAINT film_genre_pkey;
       public            postgres    false    205    205            �
           2606    16902    filmrates filmrates_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.filmrates
    ADD CONSTRAINT filmrates_pkey PRIMARY KEY (film_rateid);
 B   ALTER TABLE ONLY public.filmrates DROP CONSTRAINT filmrates_pkey;
       public            postgres    false    206            �
           2606    16910    films films_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.films
    ADD CONSTRAINT films_pkey PRIMARY KEY (filmid);
 :   ALTER TABLE ONLY public.films DROP CONSTRAINT films_pkey;
       public            postgres    false    207            �
           2606    16915    genres genres_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (genreid);
 <   ALTER TABLE ONLY public.genres DROP CONSTRAINT genres_pkey;
       public            postgres    false    208            �
           2606    16923    people people_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.people
    ADD CONSTRAINT people_pkey PRIMARY KEY (peopleid);
 <   ALTER TABLE ONLY public.people DROP CONSTRAINT people_pkey;
       public            postgres    false    209            �
           2606    16928    profession profession_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.profession
    ADD CONSTRAINT profession_pkey PRIMARY KEY (peopleid, role_typeid);
 D   ALTER TABLE ONLY public.profession DROP CONSTRAINT profession_pkey;
       public            postgres    false    210    210            �
           2606    16933    roles roles_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (roleid);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    211            �
           2606    16938    roletypes roletypes_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.roletypes
    ADD CONSTRAINT roletypes_pkey PRIMARY KEY (role_typeid);
 B   ALTER TABLE ONLY public.roletypes DROP CONSTRAINT roletypes_pkey;
       public            postgres    false    212            �
           2606    16948 !   users uk_33uo7vet9c79ydfuwg1w848f 
   CONSTRAINT     b   ALTER TABLE ONLY public.users
    ADD CONSTRAINT uk_33uo7vet9c79ydfuwg1w848f UNIQUE (user_email);
 K   ALTER TABLE ONLY public.users DROP CONSTRAINT uk_33uo7vet9c79ydfuwg1w848f;
       public            postgres    false    213            �
           2606    16946    users users_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    213            �
           2606    16973 *   favorite_genre fk20roryphk0vdxnelry5mn0k8l    FK CONSTRAINT     �   ALTER TABLE ONLY public.favorite_genre
    ADD CONSTRAINT fk20roryphk0vdxnelry5mn0k8l FOREIGN KEY (genreid) REFERENCES public.genres(genreid);
 T   ALTER TABLE ONLY public.favorite_genre DROP CONSTRAINT fk20roryphk0vdxnelry5mn0k8l;
       public          postgres    false    203    208    2759            �
           2606    16983 +   favorite_people fk2ec9k9s0yrl2db998rd10ehq7    FK CONSTRAINT     �   ALTER TABLE ONLY public.favorite_people
    ADD CONSTRAINT fk2ec9k9s0yrl2db998rd10ehq7 FOREIGN KEY (peopleid) REFERENCES public.people(peopleid);
 U   ALTER TABLE ONLY public.favorite_people DROP CONSTRAINT fk2ec9k9s0yrl2db998rd10ehq7;
       public          postgres    false    2761    204    209            �
           2606    16968 )   favorite_film fk43cnkm1olj28c1ow0vomfyi00    FK CONSTRAINT     �   ALTER TABLE ONLY public.favorite_film
    ADD CONSTRAINT fk43cnkm1olj28c1ow0vomfyi00 FOREIGN KEY (userid) REFERENCES public.users(userid);
 S   ALTER TABLE ONLY public.favorite_film DROP CONSTRAINT fk43cnkm1olj28c1ow0vomfyi00;
       public          postgres    false    213    202    2771            �
           2606    16963 )   favorite_film fk8hylol82cg6pd8ds2nk2rd6tn    FK CONSTRAINT     �   ALTER TABLE ONLY public.favorite_film
    ADD CONSTRAINT fk8hylol82cg6pd8ds2nk2rd6tn FOREIGN KEY (filmid) REFERENCES public.films(filmid);
 S   ALTER TABLE ONLY public.favorite_film DROP CONSTRAINT fk8hylol82cg6pd8ds2nk2rd6tn;
       public          postgres    false    202    2757    207            �
           2606    17003 &   profession fk9m5ncvu99tghq7nxu7006ytgp    FK CONSTRAINT     �   ALTER TABLE ONLY public.profession
    ADD CONSTRAINT fk9m5ncvu99tghq7nxu7006ytgp FOREIGN KEY (role_typeid) REFERENCES public.roletypes(role_typeid);
 P   ALTER TABLE ONLY public.profession DROP CONSTRAINT fk9m5ncvu99tghq7nxu7006ytgp;
       public          postgres    false    212    210    2767            �
           2606    16998 &   film_genre fkfu1qr1g64n0hpgjjovjofb6u0    FK CONSTRAINT     �   ALTER TABLE ONLY public.film_genre
    ADD CONSTRAINT fkfu1qr1g64n0hpgjjovjofb6u0 FOREIGN KEY (filmid) REFERENCES public.films(filmid);
 P   ALTER TABLE ONLY public.film_genre DROP CONSTRAINT fkfu1qr1g64n0hpgjjovjofb6u0;
       public          postgres    false    2757    207    205            �
           2606    16993 &   film_genre fkjf15mjxr4lm1cd6yloy11ggj1    FK CONSTRAINT     �   ALTER TABLE ONLY public.film_genre
    ADD CONSTRAINT fkjf15mjxr4lm1cd6yloy11ggj1 FOREIGN KEY (genreid) REFERENCES public.genres(genreid);
 P   ALTER TABLE ONLY public.film_genre DROP CONSTRAINT fkjf15mjxr4lm1cd6yloy11ggj1;
       public          postgres    false    208    2759    205            �
           2606    16988 +   favorite_people fkq9pgggubd63xoqmq06s0bnwod    FK CONSTRAINT     �   ALTER TABLE ONLY public.favorite_people
    ADD CONSTRAINT fkq9pgggubd63xoqmq06s0bnwod FOREIGN KEY (userid) REFERENCES public.users(userid);
 U   ALTER TABLE ONLY public.favorite_people DROP CONSTRAINT fkq9pgggubd63xoqmq06s0bnwod;
       public          postgres    false    213    2771    204            �
           2606    16978 *   favorite_genre fks7crmoqilvnaqq8st150ajvmt    FK CONSTRAINT     �   ALTER TABLE ONLY public.favorite_genre
    ADD CONSTRAINT fks7crmoqilvnaqq8st150ajvmt FOREIGN KEY (userid) REFERENCES public.users(userid);
 T   ALTER TABLE ONLY public.favorite_genre DROP CONSTRAINT fks7crmoqilvnaqq8st150ajvmt;
       public          postgres    false    203    2771    213            �
           2606    17008 &   profession fkta97c64b1gedywqyon64ncgaf    FK CONSTRAINT     �   ALTER TABLE ONLY public.profession
    ADD CONSTRAINT fkta97c64b1gedywqyon64ncgaf FOREIGN KEY (peopleid) REFERENCES public.people(peopleid);
 P   ALTER TABLE ONLY public.profession DROP CONSTRAINT fkta97c64b1gedywqyon64ncgaf;
       public          postgres    false    209    210    2761            \      x�3�4�2�4����� ��      ]      x�3�4�2�44����� 5�      ^      x�3�4�2�4����� ��      _      x�3�4�2�44�2�42�2�b���� '�$      `   +   x�3�4�tK�+I,.�L�44�4�2�4�t��O�b���� ��      a   �   x�U�A
�0EדS�"�6U۝Z�	�ҕ�P��ӂ�7�����7��j��ۋ^� �,smH��TD� �0{V�l���%��ϓL��/�)G���`o��26<��[VS�ɮ�+�,܊��GZ���&.�=rWa>��qH6��\N.��.�#Gϣzl�R_�:�      b   �   x�%�=n�0��ǻ��d��.][�[�$��o��C�"@���C�U��H�� *2C��M&8/�I������:;��$3��:쩍��mȓǁZ��I��f6���D�cvÔp�΄l���^�Kd�LP���J�`FZ���R]2ˣ3P514�3Ԟ�+�R��/�w�Ը��A�([���Ŗər�n-C�(�gق��V��6��a�	Z�]ޮ7YKc���զ�
�5-6"^�� ��l1      c   �   x�E�Mk�0��ɯ�����.�f����E[(�t��8Y&n��ۊ0��y���X�׺qq��tP��Q�0�r�:�"��5���h��Mp�4z�lh��h��h��P?;���poVT�ZS��nֺv��Ƨ�7��;��:A�D�=bh�8�5�3#N�d&Dy�3�VEvZR*��hm#���� ����p����}�,��B��}��/x�w�#Tf^"��U/����ux�P~<H) e�[C      d      x�3�4�2�44�22L���c���� ,.      e   8   x�3�4�4�����S.H,*I��4�2
q���e�%*x�V�Vrq��qqq 7�C      f   �   x�E���0��)� ��M��H`���X���))\Eb�S�¢H�����)�I���OXA�Nwwb��Ք��p��A��|m%�Lx�D���%��<0�!�ؔ�O2oJ�8�WВ}2K���������*���DU�C[:�-"� �	J�      g   �   x�}�MO�@���Wx�uǙY�m9i�q�� 4%^J]ȪJ�=p0x�����ő�Ē�h헭��tPm7	FF������`?A래�����'��Y�t2k=����e��-J�)Ci�[�7.~�Q��u=VC�x��<>�N��̢����6�i�c������v����P��Y��TL�Z�w��:����X����5�|nFnQ��_��#�~P`     
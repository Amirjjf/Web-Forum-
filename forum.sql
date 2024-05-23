PGDMP                      |            forum    16.1    16.1 1    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    42099    forum    DATABASE     z   CREATE DATABASE forum WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Finland.1252';
    DROP DATABASE forum;
                postgres    false            �            1259    42100    category    TABLE     y   CREATE TABLE public.category (
    category_id integer NOT NULL,
    name character varying(50),
    description text
);
    DROP TABLE public.category;
       public         heap    postgres    false            �            1259    42105    category_category_id_seq    SEQUENCE     �   ALTER TABLE public.category ALTER COLUMN category_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.category_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    215            �            1259    42106    comment    TABLE     �   CREATE TABLE public.comment (
    post_id integer NOT NULL,
    comment_id integer NOT NULL,
    body text,
    author integer,
    time_posted timestamp with time zone,
    last_modified timestamp with time zone
);
    DROP TABLE public.comment;
       public         heap    postgres    false            �            1259    42111    comment_comment_id_seq    SEQUENCE     �   ALTER TABLE public.comment ALTER COLUMN comment_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.comment_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    217            �            1259    42112 	   post_tags    TABLE     ]   CREATE TABLE public.post_tags (
    post_id integer NOT NULL,
    tag_id integer NOT NULL
);
    DROP TABLE public.post_tags;
       public         heap    postgres    false            �            1259    42115    role    TABLE     s   CREATE TABLE public.role (
    role_id integer NOT NULL,
    name character varying(50),
    permission boolean
);
    DROP TABLE public.role;
       public         heap    postgres    false            �            1259    42118    role_role_id_seq    SEQUENCE     �   ALTER TABLE public.role ALTER COLUMN role_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.role_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    220            �            1259    42119    tag    TABLE     k   CREATE TABLE public.tag (
    tag_id integer NOT NULL,
    name character varying,
    description text
);
    DROP TABLE public.tag;
       public         heap    postgres    false            �            1259    42124    tag_tag_id_seq    SEQUENCE     �   ALTER TABLE public.tag ALTER COLUMN tag_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.tag_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    222            �            1259    42125    thread    TABLE     �   CREATE TABLE public.thread (
    post_id integer NOT NULL,
    title character varying,
    text text,
    category integer,
    author integer,
    posted timestamp with time zone
);
    DROP TABLE public.thread;
       public         heap    postgres    false            �            1259    42130    thread_post_id_seq    SEQUENCE     �   ALTER TABLE public.thread ALTER COLUMN post_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.thread_post_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    224            �            1259    42131    users    TABLE     *  CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(50),
    password character varying(100),
    email character varying(320),
    register_date timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "profile_picture_TEMP" text,
    role integer DEFAULT 3
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    42138    users_user_id_seq    SEQUENCE     �   ALTER TABLE public.users ALTER COLUMN user_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    226            �          0    42100    category 
   TABLE DATA           B   COPY public.category (category_id, name, description) FROM stdin;
    public          postgres    false    215   �6       �          0    42106    comment 
   TABLE DATA           `   COPY public.comment (post_id, comment_id, body, author, time_posted, last_modified) FROM stdin;
    public          postgres    false    217   �8       �          0    42112 	   post_tags 
   TABLE DATA           4   COPY public.post_tags (post_id, tag_id) FROM stdin;
    public          postgres    false    219   0C       �          0    42115    role 
   TABLE DATA           9   COPY public.role (role_id, name, permission) FROM stdin;
    public          postgres    false    220   WD       �          0    42119    tag 
   TABLE DATA           8   COPY public.tag (tag_id, name, description) FROM stdin;
    public          postgres    false    222   �D       �          0    42125    thread 
   TABLE DATA           P   COPY public.thread (post_id, title, text, category, author, posted) FROM stdin;
    public          postgres    false    224   F       �          0    42131    users 
   TABLE DATA           p   COPY public.users (user_id, username, password, email, register_date, "profile_picture_TEMP", role) FROM stdin;
    public          postgres    false    226   KN       �           0    0    category_category_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.category_category_id_seq', 17, true);
          public          postgres    false    216            �           0    0    comment_comment_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.comment_comment_id_seq', 113, true);
          public          postgres    false    218            �           0    0    role_role_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.role_role_id_seq', 1, false);
          public          postgres    false    221            �           0    0    tag_tag_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.tag_tag_id_seq', 10, true);
          public          postgres    false    223            �           0    0    thread_post_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.thread_post_id_seq', 64, true);
          public          postgres    false    225            �           0    0    users_user_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.users_user_id_seq', 70, true);
          public          postgres    false    227            :           2606    42140    category category_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (category_id);
 @   ALTER TABLE ONLY public.category DROP CONSTRAINT category_pkey;
       public            postgres    false    215            <           2606    42142    comment comment_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (post_id, comment_id);
 >   ALTER TABLE ONLY public.comment DROP CONSTRAINT comment_pkey;
       public            postgres    false    217    217            @           2606    42144    post_tags post_tags_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.post_tags
    ADD CONSTRAINT post_tags_pkey PRIMARY KEY (post_id, tag_id);
 B   ALTER TABLE ONLY public.post_tags DROP CONSTRAINT post_tags_pkey;
       public            postgres    false    219    219            B           2606    42146    role role_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (role_id);
 8   ALTER TABLE ONLY public.role DROP CONSTRAINT role_pkey;
       public            postgres    false    220            E           2606    42148    tag tag_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_pkey PRIMARY KEY (tag_id);
 6   ALTER TABLE ONLY public.tag DROP CONSTRAINT tag_pkey;
       public            postgres    false    222            H           2606    42150    thread thread_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.thread
    ADD CONSTRAINT thread_pkey PRIMARY KEY (post_id);
 <   ALTER TABLE ONLY public.thread DROP CONSTRAINT thread_pkey;
       public            postgres    false    224            J           2606    42152    users user_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT user_pkey PRIMARY KEY (user_id);
 9   ALTER TABLE ONLY public.users DROP CONSTRAINT user_pkey;
       public            postgres    false    226            =           1259    42195    idx_post_tags_post_id    INDEX     N   CREATE INDEX idx_post_tags_post_id ON public.post_tags USING btree (post_id);
 )   DROP INDEX public.idx_post_tags_post_id;
       public            postgres    false    219            >           1259    42193    idx_post_tags_tag_id    INDEX     L   CREATE INDEX idx_post_tags_tag_id ON public.post_tags USING btree (tag_id);
 (   DROP INDEX public.idx_post_tags_tag_id;
       public            postgres    false    219            C           1259    42194    idx_tag_tag_id    INDEX     @   CREATE INDEX idx_tag_tag_id ON public.tag USING btree (tag_id);
 "   DROP INDEX public.idx_tag_tag_id;
       public            postgres    false    222            F           1259    42196    idx_thread_author    INDEX     F   CREATE INDEX idx_thread_author ON public.thread USING btree (author);
 %   DROP INDEX public.idx_thread_author;
       public            postgres    false    224            K           2606    42153    comment fk_comment_author    FK CONSTRAINT     |   ALTER TABLE ONLY public.comment
    ADD CONSTRAINT fk_comment_author FOREIGN KEY (author) REFERENCES public.users(user_id);
 C   ALTER TABLE ONLY public.comment DROP CONSTRAINT fk_comment_author;
       public          postgres    false    217    226    4682            L           2606    42158    comment fk_comment_post_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment
    ADD CONSTRAINT fk_comment_post_id FOREIGN KEY (post_id) REFERENCES public.thread(post_id) ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.comment DROP CONSTRAINT fk_comment_post_id;
       public          postgres    false    217    224    4680            N           2606    42163    thread fk_thread_author    FK CONSTRAINT     z   ALTER TABLE ONLY public.thread
    ADD CONSTRAINT fk_thread_author FOREIGN KEY (author) REFERENCES public.users(user_id);
 A   ALTER TABLE ONLY public.thread DROP CONSTRAINT fk_thread_author;
       public          postgres    false    226    4682    224            O           2606    42168    thread fk_thread_category    FK CONSTRAINT     �   ALTER TABLE ONLY public.thread
    ADD CONSTRAINT fk_thread_category FOREIGN KEY (category) REFERENCES public.category(category_id) ON DELETE CASCADE;
 C   ALTER TABLE ONLY public.thread DROP CONSTRAINT fk_thread_category;
       public          postgres    false    224    215    4666            Q           2606    42173    users fk_users_role    FK CONSTRAINT     s   ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_users_role FOREIGN KEY (role) REFERENCES public.role(role_id);
 =   ALTER TABLE ONLY public.users DROP CONSTRAINT fk_users_role;
       public          postgres    false    4674    220    226            R           2606    42178 
   users role    FK CONSTRAINT     t   ALTER TABLE ONLY public.users
    ADD CONSTRAINT role FOREIGN KEY (role) REFERENCES public.role(role_id) NOT VALID;
 4   ALTER TABLE ONLY public.users DROP CONSTRAINT role;
       public          postgres    false    220    4674    226            P           2606    42183    thread user    FK CONSTRAINT     z   ALTER TABLE ONLY public.thread
    ADD CONSTRAINT "user" FOREIGN KEY (author) REFERENCES public.users(user_id) NOT VALID;
 7   ALTER TABLE ONLY public.thread DROP CONSTRAINT "user";
       public          postgres    false    4682    224    226            M           2606    42188    comment user    FK CONSTRAINT     {   ALTER TABLE ONLY public.comment
    ADD CONSTRAINT "user" FOREIGN KEY (author) REFERENCES public.users(user_id) NOT VALID;
 8   ALTER TABLE ONLY public.comment DROP CONSTRAINT "user";
       public          postgres    false    4682    226    217            �   �  x�U�1S�@����PEE�\�@R��&U��Z>�^9Z����H{6st���I��_�6D�ݯ�1#�%v1@K�9b�[�Ɋ����`����L�n�{�Z�G�� ̞#M:� u�Uc=��||��R"ee޺���~�ԩ8����YG*l�Y[/��؃�
�*��g�m����mO��^P�jW� u}H�X�bO���V��'s��ѫўt2�����3���VYMa��XY��۱�1-I-̸��Չ�q���/�L6_�QkI+;��{:�T������d ~ą�!���x>K���}�^�Q���nV�8�Ҵ�����ŧ����>��H,+��1�zP�:���j9��%��o���ն����%��ݞ�NX�YRng���b>eQ�ʹUNW5A�����U�4��      �   �
  x��Y˒�]C_������k�PV�%9�*�K�T��� &hhR�U~#��/ɹ=J��b���׹�s��L�b1�2���𧑛.w�Ȱ��U�H�u!�l��6I�u4�]�W���o��I��V9��`s��Q�^ym�	M����ޙ�n�l.&���f4���h�j65]ܮ�����O�����b:�;��ʦD��*fY�$�̶1�$���u�.z*=ߖ��m-mN2]{�[��W���)�Z9�y<�Z�$a^\��N,��3:�ୖM��'�6����B�w�T-�._�ò�����g�5>@Q����{s�) 3A]^u.��6�b�M��7�-2��@��I�7*r9�y�	�~�������Mu+�3^� �<�PK����v��)��������/�b)�Q�^��{]���u t�	���)#��w�%����D{٨���Fs
���u�[q7��R,V�r���r�X�4[_f�kJ-�6��v�9��V��7�ԝ����e�Vb9��!@�?�Vy����no�Vw6Y_F�����X�)��oBܚ�y�!�~hY�G\�!�^�x6�1
�͖
����������O6��Bܡ�IV]��\�u-�Ѩ]zBnP�ҐGxw����D�K-0%��*fe��Z�$���� f`a����aG$1+�i��2�M�r�:����+�����{n=�km�˵V�\��iQGA�VY�����5�����"&༐/�b9�X~(G?�xR-%+|��Z�]�<
�y�Y��4{�!Q��+�t�S~C�f���d�XM��;�J���y���(3��Ԣ`Ԕ�d|�O5%t�2�kvF�(WGIR{_��#�ϝ�� ��3�T�4� ��V&�84+qc&�'mbد�)�ߪM�ڵi��Y��.�H=A7\Zs^��.�A�U��o_��� �Ӏ#���[y�1C��z��^="E=B��OD<�.�"�.ϟS���^�%T��y�L���i�)�s�C����X��)B��V�%�:�=s�]F��7�:�S�����!�T�]sW#�=ؿ@�Q�
��� t��5.XPˌ��0G�[I�
a�ί��fO�GjG�:+b�A�+�X�sB7��chN\Ԡ�_p		���S�6'�0��`O�G�qu��h�l`���x^Ǟ:����:Ŵ�����,�$��@4=l4�7���寨��Sg>۵u4kr60I9��NDyVڞ�x,V�h[�����h���9Kh j�-���6�*��	=ҹ��lk���1lUC�}N��{"VSA<����H���o��T�f�>�	�s�D����Uc����c��
E~P}� ��S�7
�b����S����X�����OV�M�ȹ7=1�^�}��_1ҁxЉ���|TL�no�|\F泙X݉�k�
K�c��î�%c�Cɵi�`@�vnh�tإQ;�އ�+�h���K�dL� �q��N��8��6������pO�S<zM&C���7'3�Ǳ�P�7�v��~Bc������VJQȈ��U�:���2"��Y-�۠;&�QN[�1:�c�,L�i�~�	#1_љ�c��:�4�(�����_Rf�fM�����e���Z���#*��Q��<���+Qɦ2 H,���J�R	�0�z'���w���т��9�'Qj`�t�})V+��0n|8����O�cQ���T���2f���!~�!�Jy��۹΃�_(D+1�����m�!��pn���������k������������y�� f�3��{�=�%��}l�>��NYqvױ�-����p�6�j��~K;E�Gb]ׂ�a�A`1%�{���R��qӻ�x^��C�(:^&��Fn�D�Y���}���CD�1 ���SG51����/��j���vx���� 'd�/,�M�_;�WǞ��X���>��h�WT~��f'Q��Ȩp�w�gP�t�᩶uVE�5���5b.�paS1c��!cH�S�m��uʛ|MrIBJ�N3��=V��b���L�VW�{��l�=Xj���xT�U4h��a��{�m����Ȱ��l,"X���%;m�o��Ds�)��"y���ΈO�(�o]��K�qx��h.��.B ap`��>>6�s9�X���fX�`L!�):��ڣ���+if��e�M$BTy8��?l�����B<�~�al8]t��솎M� P��5����澍�<��A�nx+CY�Rp�߃0��~�Z��7N���|	�K���Ç�e��$r��+>f�6��t�.����������c�~`��_j���������.^��H W�/��BY�m'G��6Y�I����%��`����|I-�b�a�.�G��Yt���u���xT�H:���{�����#U�9�=�u���yc�t�XK�ϰA��S���o#���9P!m�13Q�zT��UՀ%*��-��>-�'��K�Q�Ix�ɥ�whd:�Lwr�B���Ѵ��]���������K�Ū(�ѐ_X�!ƾͰ�x�Q¾.ڞ���hU�D�g=�yޝ� �OK)�LH��^���P��Sq_N�q͐K:�_\�jS}{+������L�S�|x���/��6u�      �     x�%��q1D�3�k@ld.�?��/S#�xd��6�uͿ�{�����j�Xn~ױXe;��[�V~��Wy׏���Nt���R4��b�3����xc�©az)Z�!�l@k�ނ77a\+��� �7M��LD��T��3���������;쇛Mz�E�ƌ(M%�W�!�����^RI*�3���WS�F�(E���J�BT�(u%j͝���i��'ՠjT�*P�A�ՠT��Q�@5�U�
T�jP�@5��>r���E������ D�T      �   +   x�3�tL����,�2���OI-J,�/�L�2�-N1b���� �s
      �   w  x�mR�n�0<�_�h�&M9E
������Me��HE����w���d��ΐ�4_+���K�b��ԺL�X�d��:�-�RV8��8\�n��i�YO��X񶸙���6��x:�r�w��2`{~�M꣢hX����f�e���\'�A�-{Zʲ�����A�K�ٵr�Y���d�4ߛ/�
6�ÿ�%�|�3���1�E��s���B�SF�6"�bVG��k��$�C?��JE_�/��}�:��0�<C��,@�����d>3K�"�b�R���}9[M3b�T���b,֩��ޘ�U��f�R�8�/��>V��E�(�_�5ߩ����{�8`�o?P�і�7}�T���k�tۮa~~��0���      �   "  x��X�r#7<c�7v�A�/I�DI;ڰ��ь7����B��T�iÿ�/٬B���3A( Q��*���[��c�ZK��/�ʴ|x���U4މ*�e��k,j߬� 3��VK�V�,J�d`�X���R����h=��ߢ�u�r}#�b2Ëɧ���p&�����z:\ǳ��oË����2!(��o�(���6��g����A�oQؒy�k ���n�,}�k�]�Xz�����x�xf���s����ۆ�soBք �ѻm%o+T�[7:��ڗ�� }m���}�����F�A˵v�1��s�f�N�(_2����g�1pو�B!��oj���E��,�$d�}�2��L�5� ��Î�-�2D��8�bru�\�h��U��g�2:�%H0�q1��vB��2Y!�޿���S�A��IK�&�?�<:�ޙ��nĕ��a�o>"<���q��A~wm����G�]��(l2G���=�~n������Nu0��������~��\4�����N������pY�p�ZǨ�V#mBd��Æ���i�P�@Cf[_��F�.�t|�d(�\�k�Z���&:��6A�Wƶ�+�o�~O�����a\���w���^!�6&�&>J�eZ��!+t�X_��tz�H<��^��/�����.�?�V�. �Ŵ�E�?H��t��JK�
�֌T��qڭ���~4�s�5��O`)�7]�t���\s��W	�̞],"�U��q�����є�[T�G)G��h&��xl������i�r�U����.~ԑ�H��R�'������Ԍ���dU�C#Nk�����A]0�@��>�����t>�btF�N���vI	�w���V���D����-Q~C����{�c18��_f��*eb"�?��G��` 5��0�1�)��j��|��(��y��Ak(N)$3ʚ�pw�ƪ��v ��f�6�w�-t^gB����W���	�C��{�5���&�Ɩ�r���;���e��ݥe�%e�l�f�����j���}���ؒ�����P�(����A��#<��?!b6�;�z<�����܃bf#w�:�L�&)��'NÁL�r��@*1�8��R|�� ϵ����b.�}�8PZ_�� D���=��8�T2V�0���Y0f'4}�����ɣ�9z���GViK��p��
��{U��āi�+J
�NY�:r��e@�1����}����V6��^@�9������Ǹ�b)��hQN��S�Ća���]n�d!���!T���� (�$+�t�i�9�НE/,=MwV-���zo�w6�ސ�Lκ�C��Xy���ߔpeY��<Y��xɼ[��Yd���:+��~����՝[05�x۸+��a?gZ9hǽ�bx�u�S�)KE�.�n�qO��\����5��
A� ����Ɖ�Sbz����%�(�*/yA�4���{���/��&��v������vʐ���NFO����t�T�b\kQ���p-o����I&��i���L���i�����M�qT~��ڮ�Bd��!�]9F6�(��?t�ª@ҵ W�J,
��S��N��w�~$@���E��%���OF�O_tBz'�1����u�u�='
��:E���ҭ���T��fmb����#��&`� R�T|����u��R������K��jEf�N����~�	*�o����YgJ�AHc����&7�6��]� �6P��e�I��j�=!��Dd
=@�PǛ<������d�˱���� NeU8���РS�կ��aCM����7`m8����R�Jg�3��������UE�]1I �h�#Fǜ�PKcy�HŹ.m
��Kh�"�"^N$�#Nټ����f{����I�VC*:�K6�U�+zy��F�f�4Y�S,4,w�g�����u[E�l5ܐ�-S�t�����8e����NR�i/�a�'��1�1zP���{7��z�)�	Q
�5z�ժb��oNӎ����ކ��N�m1u> ���3��p�0Q�X�r$�X��b~�����xt=���>|��?�E      �   �  x�uTI{�0=���A�X��)��la)Nh藋.�x!���W#��(����,oF��,d�X"e��s��t�D�E�#̮Z�Ģ�ψO�7��a�f;�J�ET"�%:�|^��N�E�"W�.\�e����b�E���u�,��BT�xp-�D��D�P�3b��O�*��	?�Tj@v��!9��>�� t
�$Ј�:��JB%��J�BW�[��_�c�����gU>��\<j@�FYc�X<���s!�&��$'ʚe��Ά'�R���f���"'͎i]�Ԁ�LY��jgԴ�������3j��;ǁC4ae�[�`��q��¨����q����'t�3G��r�i�i@v��Y<�R���a���Ğ�+۶�V��p�����]����zO��ܱa�I��0�?h﫯�x珔C;)����0����=3ۆv�$4WYc��o^�qZ6�.Ҁ�Ge����gW��A�������&��	_TU�@��ZP
,���bC׽b��5��{��fNcj��mw��`��u7a�߷ٺ彴��,�:��*�qR}�*e���^����N�:M�9f]�]I�7���Mk�ڑ\�^�}�}1�p�簍�?o�O���[��m6�ˬ�E�ϔJ�ԨK�L��~w�w��0�����s�3>��C7��g��۝A�[?����T\e{;�ͥ)�����Sc�Z����     
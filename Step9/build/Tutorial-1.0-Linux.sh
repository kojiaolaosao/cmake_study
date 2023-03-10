#!/bin/sh

# Display usage
cpack_usage()
{
  cat <<EOF
Usage: $0 [options]
Options: [defaults in brackets after descriptions]
  --help            print this message
  --version         print cmake installer version
  --prefix=dir      directory in which to install
  --include-subdir  include the Tutorial-1.0-Linux subdirectory
  --exclude-subdir  exclude the Tutorial-1.0-Linux subdirectory
  --skip-license    accept license
EOF
  exit 1
}

cpack_echo_exit()
{
  echo $1
  exit 1
}

# Display version
cpack_version()
{
  echo "Tutorial Installer Version: 1.0, Copyright (c) Humanity"
}

# Helper function to fix windows paths.
cpack_fix_slashes ()
{
  echo "$1" | sed 's/\\/\//g'
}

interactive=TRUE
cpack_skip_license=FALSE
cpack_include_subdir=""
for a in "$@"; do
  if echo $a | grep "^--prefix=" > /dev/null 2> /dev/null; then
    cpack_prefix_dir=`echo $a | sed "s/^--prefix=//"`
    cpack_prefix_dir=`cpack_fix_slashes "${cpack_prefix_dir}"`
  fi
  if echo $a | grep "^--help" > /dev/null 2> /dev/null; then
    cpack_usage
  fi
  if echo $a | grep "^--version" > /dev/null 2> /dev/null; then
    cpack_version
    exit 2
  fi
  if echo $a | grep "^--include-subdir" > /dev/null 2> /dev/null; then
    cpack_include_subdir=TRUE
  fi
  if echo $a | grep "^--exclude-subdir" > /dev/null 2> /dev/null; then
    cpack_include_subdir=FALSE
  fi
  if echo $a | grep "^--skip-license" > /dev/null 2> /dev/null; then
    cpack_skip_license=TRUE
  fi
done

if [ "x${cpack_include_subdir}x" != "xx" -o "x${cpack_skip_license}x" = "xTRUEx" ]
then
  interactive=FALSE
fi

cpack_version
echo "This is a self-extracting archive."
toplevel="`pwd`"
if [ "x${cpack_prefix_dir}x" != "xx" ]
then
  toplevel="${cpack_prefix_dir}"
fi

echo "The archive will be extracted to: ${toplevel}"

if [ "x${interactive}x" = "xTRUEx" ]
then
  echo ""
  echo "If you want to stop extracting, please press <ctrl-C>."

  if [ "x${cpack_skip_license}x" != "xTRUEx" ]
  then
    more << '____cpack__here_doc____'
This is the open source License.txt file introduced in
CMake/Tutorial/Step9...

____cpack__here_doc____
    echo
    while true
      do
        echo "Do you accept the license? [yn]: "
        read line leftover
        case ${line} in
          y* | Y*)
            cpack_license_accepted=TRUE
            break;;
          n* | N* | q* | Q* | e* | E*)
            echo "License not accepted. Exiting ..."
            exit 1;;
        esac
      done
  fi

  if [ "x${cpack_include_subdir}x" = "xx" ]
  then
    echo "By default the Tutorial will be installed in:"
    echo "  \"${toplevel}/Tutorial-1.0-Linux\""
    echo "Do you want to include the subdirectory Tutorial-1.0-Linux?"
    echo "Saying no will install in: \"${toplevel}\" [Yn]: "
    read line leftover
    cpack_include_subdir=TRUE
    case ${line} in
      n* | N*)
        cpack_include_subdir=FALSE
    esac
  fi
fi

if [ "x${cpack_include_subdir}x" = "xTRUEx" ]
then
  toplevel="${toplevel}/Tutorial-1.0-Linux"
  mkdir -p "${toplevel}"
fi
echo
echo "Using target directory: ${toplevel}"
echo "Extracting, please wait..."
echo ""

# take the archive portion of this file and pipe it to tar
# the NUMERIC parameter in this command should be one more
# than the number of lines in this header file
# there are tails which don't understand the "-n" argument, e.g. on SunOS
# OTOH there are tails which complain when not using the "-n" argument (e.g. GNU)
# so at first try to tail some file to see if tail fails if used with "-n"
# if so, don't use "-n"
use_new_tail_syntax="-n"
tail $use_new_tail_syntax +1 "$0" > /dev/null 2> /dev/null || use_new_tail_syntax=""

extractor="pax -r"
command -v pax > /dev/null 2> /dev/null || extractor="tar xf -"

tail $use_new_tail_syntax +152 "$0" | gunzip | (cd "${toplevel}" && ${extractor}) || cpack_echo_exit "Problem unpacking the Tutorial-1.0-Linux"

echo "Unpacking finished successfully"

exit 0
#-----------------------------------------------------------
#      Start of TAR.GZ file
#-----------------------------------------------------------;
� <��c �]pŕ��՟$��@�Č������~V�㕥5#,Œ�`�x�����v��-q�(�8a�().8��*���	�]�3��3?w��J���K�	�!8�9��^�t������Ȯ�b�5z�~�������~�H�2t���������zjk<<Փ䩮�zj�d���TU�T"��B;�S2����]�m��Yɝ+�^�N�����p4���hP�Ģ	W`jˀ��VW[��ZoM�v������J������Z7�ӧ��/�| �~�2ɘ�Y�n^U�r�L3v8:�+��:z�H���;��Bډ+���-;�u�L����˙�/����m6�c��L��hF��G�:Q)�c�������;���:K?�Y��,>����N�:��p�=sc v0�	�|���mm��ɃI^��89O���3_;{QN������1y�<<�M'����Ii/������w���:@�М���bu�&:K��,��0�|�A�5	\�dF�V@� 
��g#����jC.��1��X�%Nd�(bv�C�wloզ�i��Oqu�Lm?�JNm?mKV~i�d:}n����y|�̸��H��O��|���@Q������GW>���?�~�[#�w���լI|������n�-����n��蕯����|ߋU���-��V�-�'�nՒ���=}Rg$�Q)���@��5ГK�>�ۗT#�.	7x)�)!��Y�?�^��ηqz���W��P_�R*o�HFդ��U�rWx����[�v��]��N���p�����+�a�A�ͥ�v�d�w��,,�Z�iN*�U��+���ǝ6!y���͈˷7�l�;Ϳ��o!ٖ�F|�C�,�aڳ1���,��,l&);���>K��p/5�V7���s?H���X�3��n�ϰ��k6	�,�~6R�E8fs�ɮ�kHk/bz������9���[�-�g�-�8��wR���Y�	��"����5��Z�rE��p��ڣ(�m�F�
�䑻��H	DCJ(��a�� 冦���5�J�CiTL_����`,���7�]��oS���4��ߓhlU=�`w ���@DM4���Uu�K�z�m���FiY�솣�����Ӆݠ��E�o��$�-k7��Z��ș�<K(��n�:����"E	%bJ7T��,�M(�Pj���gJ�-Ž���k���m�z�&��鴖�P�����uH{2<�����]��R���{��N�C�/�q�K9������r��×	���Z;�,����g'���n��<����ÿ�ɗq��v����2��?���e�'�Ş�w_�ǈO��sq��3;ȕ腗?P5��nv�\��U�
� ru$��4���g���������԰^���	�I��h������� Uw+��@oMA�h�o(V�.�z�7��սO�jt#��b���Te�^Kq�M.Q��".�K�MQ��n��{P�����	�����������E]���O�� ��p�������/�*���/p�@[Qv��t���U�l|������$�b}�%2���?��Vd^�i�ɔ��7eןY�8����G3�=.5��_pfU����fY�R�w����T�H4ؓ�/��'�����͍�]���[R����>�t�����s���+=����׍�����s�#-[F7��'���#��|�K���3Rg,.�&2��P�3�r3��h�i��\w�M$�Y׃�[ho�+ͷ6׵�濃s�B'��� S������U��WC�w{�jq��x+s��b�P,��5�!�r��/�\�?~:RG$�s��:��w1���5}���w����W��o>��o���&���I�]u��U�l��Q|�>��C��W�~�_AF*�_�"=f7R���A���Ob���)F���9-i�ʦ�^>ǋ�ӌ��#�I�[#��p�L�a���� ��3�٩^Y�Ɨ�2R6#��3�˩]���z��H٨r'�S�j�|�k�z�h�H@F����ϭ�'v{7���C��HY;Ëb���zB=�h������[�J�\��_g�u��s)��o\y�n��+=Ҳ��fM�x���AT����!~��~r�f��_靷{&�;�i��f'�f��Q63���	;�Y������R<b��6�?�����բ�U�ba�
�=2���n��������~��?����kQ�P�&x��h.@�>��8�oj(�d	�+^�(]��(�H�����ƶf%���"	5ok��E�t���&%�Y���~m��ϙmU+�E�Ƕ)���@O$��]I<U�M��oUk�f������H�ˬ8╿����Z��IҬ�W���_���(��([����S�u�ܙ"B���f�-�ϧj2wL��7��n  J�S��]a\24�� �ĭɃ���H4�l'���� kfd&M	vߩt"=���B�yhE	��ј���|����}743�m�7��8J�ˍ�7n�[Өx\U膦�5�\͟�*=�T�8�t��0v�N%���_��O��(��l4����_�=ӿ[����^�g���28w��?ug>~C�Ju���,¶~C��&��˻����3�ɹ�H1~���Xr~d�������%���ГUF|h������~�>tغ+}֌�ct]~��+ms8?�r����c>�Ïs�\��y>��r�$��q��^�W�Ξ���a>����Bd��9��>h�p��x#��k��px!�ws8?������~�Ǌ9�_�t����/���^��ί�����{l�����~	ʥ\�t&��Vz�Hޙ�o��1�cL����C�i�k�5�>��f��+�<�8��o����m�?��v��y���y������~�/ ��t���w�|�:?��_��鄯������L�/��b������t���8Cy��.\Z��~��W���_	�/�g����X���'�Q�X��Z��~��o�yϻ���wȩ��C�5���4��Y��s���,9?��Ѽ8��7��E� ��bR�Mo}�������^1���!JA�hY�2&��ȩ	������I�l{Q>zF������;�_L�7��Q(%���C�^�r�u��sU��/��:���b�v��m]��[� ��Bo��ҝھGN%GB�μkʉ=��glh�[�g0��?"�$+�W]��
��xp���}�?�!����vмSA�y��<��~�R}�����g��y2Ɵ������S���e2��,�m=�~��[�$��
���b���1x4���OA֘�z�>H���t/��N��^���_��I{����}$�`��=#�|x��	�j����B��q_ծ�k3�Ҏ�"�u��~m'�ӯ� �'>�l�U3��RW�]E{�C��N|�0��'�ç��?�|���+��
ߖa�3<��H�������h|d�-��/ENm��&7=�u������:��2(�}z�f���4��x3��tb#)����S�ɒ]�eю�d��%����;g����$��Tp�Y�?@?x�ON��SͣBG�����4���#��^�E��*�飬m��#�
���L�������س��+��z�x��ZH����-�u͓h�)$��<�}�#�(�T娜r⸙� Ҽ�y��Mq7H�V�]�z��3�>{Fo0Oc7�|`�`>QһE|қE|R����g���N��������~�Bҵ�$���!��-ɮ�\�}��|悐>Ez��B����[�.r�~�E�K��O�.���$餧�%���rґ^�Vsa���;i���/�N���ni^��U��ܘz���1�~][]�t�<\��֦��o��/�	
>��C���}�4�N6�N4�ެK��Oy�M^�����ئ�u��m���N9ԙ)�w���ӿ�r)�r)�r)��F	<T.��'"���\�=�
���M�v�㨭;,%�J�a)�Ѹ�HB�عXQ�����a<����t�0���tz�Pu5�tz�'�(����N���u}����t�>���t��@�t�?����/�O�>���S �(�}x��D&�`�U�-���c�Yh�PH�-��������(q�-)��tƶ�A�z��몮���őf�����Ǒu���Ÿ�������5`Q�ZT�����&�i�C�Z�����6��-ﻶ���Ñ��ѿ������/�#S�S|�,�Ր�4�����i�؇'��[�_ry��Ό�@V�U����͢�q�s��@��������}k��!������ˡ�!��q�-q�7��}��/����%�_�o(q�@.Y>TxC�/Z����]WR��DZSR��Ĺ����u�p��6ɏ�ӶK�Ǔ�;���;�{�+����H��7�gC���h�\ʥ\ʥ\ʥ\ʥO[b�W�z�>��G��m��{)��i��l-�aj��]a�hP��ak@������b�&M�����.싮�.rak]�|�&c6��ZV��'������bkL酲�7l�[�22È�O7��M���V�Bd��0�]��Bg(��*�)����|�?E�����_��M﷏�J�P�G� �#��R���1J�Pz��	���.ZrR*񋘦 e�{e��nw�O���Y^	W�0���zt#��׷�<t�)���;#^��7#^��K#^��W#>Mo�F|�ޟ�����[ 9�i$��%�mҎ��Lq�b�g��9#>�t�������H^d��CcW����S#~��5�e���Og��3�󳷛 xfݳ�<��G�w;��;�g�P�%�E?.൤�h�.SNk�yv=�R;�#>@��s������(O2�;F��_��_i�^��a���)��ìͱ��\�E�ߴ(��2c�xL	������~�]�l�>�3i�f�~�@v;_Y�������� v.ɺ�q���k��ݞ�X����2�����|�u�����8�t�hr	��x�LgkQ��k�g�OZ�3<ooPB�w�Ŵ����v��<�>?�V�0�Y�? |�a�x��������Ͻ�-����$_�.�\e�����4�.��v�����;-�A|O�Vob{؛g�q��ލ�i�~zI{[�v����k����+��9�on��5;��/Q;{h{[C��v�Z}���ȶ��Y�,���,䟰�_���Q����u5��YH�^�y��k&������oY�?i!_a��a>�|�v�z����0���>
�Մ���tQ&.HQ{� ��I��cJWO�#У��X<���(���	��k���1m�5%U��쥦������qJf�6*�Ҙ苻m$	:�����URY���ٯ��7�*���_��ܰ)���kn��<õ�� �u�ڎR�����%L6�Sn�m�
E�&q�_{,�
o���mn�em�Ҳ�ͣ���V)}m�
��qE��+��Gilkei�A�7��P$�$���0QT�2q?�0"���;2�P����9b����ʺ҆[\�p��4NM�����ʮ��D/��[�K�],XP�Wc�X�K���\Ϻ�W����bM��V�_��M߭l��t��J+&��U���8<-ɓ,U;�:�~�٣�Ī�H$tO�z���	�֭oU>n��[z���BI�^0�T��IS���x==bT�s�@TC�!��(@>��+�����}��G^%ِW�m;�1L�ܚT�E�*YlivԬѣ�mΊ�x��tsU�HFzB����T��.D��n�
D���q-g��R��(q�g+ҳ���_>uu��I"Dt�X�Z�c�v�Jw(�᠘`P	��}�B�� î����e�74lG�v����ǭ��4���`I���|�c���`I��+��U\-ȋ{�4
�l����E�[��S:c�l\��r���?�� ���>?d��B��?�]H��l�����x�X�w!m,���HF���v�ދ��yƳqKFGP�ʾ�a��)�g㛌������?H���:6�� �����������aI��{}6�ʨS�pq������+��0���O�g��x�9�Fԟm�;��`�l���bA^�����d��y���Lз�?ƪ��}6��h��(/�����ƥ],ȋ���qi}?�?M� /�"��iq��vCl_�
sE}��<3��/D�����c��qd�ś�3�Ӂ�c�(��&���@K��f���G��3���3��*��.�L������"�����A<���ǃ�����J��n��~�v�>@�KQ?�r)�r����f�� r  
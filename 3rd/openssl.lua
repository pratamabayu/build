--
-- Copyright (c) 2017 Milos Tosic. All rights reserved.
-- License: http://www.opensource.org/licenses/BSD-2-Clause
--

-- https://github.com/milostosic/openssl

local params		= { ... }
local OSSL_ROOT		= params[1] .. "openssl/"

local OSSL_FILES_COMMON = {
	OSSL_ROOT .. "include/**.h",
--	OSSL_ROOT .. "crypto/**.c",
--	OSSL_ROOT .. "crypto/**.h",
	OSSL_ROOT .. 'ssl/bio_ssl.c',
	OSSL_ROOT .. 'ssl/d1_both.c',
	OSSL_ROOT .. 'ssl/d1_clnt.c',
	OSSL_ROOT .. 'ssl/d1_lib.c',
	OSSL_ROOT .. 'ssl/d1_meth.c',
	OSSL_ROOT .. 'ssl/d1_pkt.c',
	OSSL_ROOT .. 'ssl/d1_srtp.c',
	OSSL_ROOT .. 'ssl/d1_srvr.c',
	OSSL_ROOT .. 'ssl/kssl.c',
	OSSL_ROOT .. 'ssl/s23_clnt.c',
	OSSL_ROOT .. 'ssl/s23_lib.c',
	OSSL_ROOT .. 'ssl/s23_meth.c',
	OSSL_ROOT .. 'ssl/s23_pkt.c',
	OSSL_ROOT .. 'ssl/s23_srvr.c',
	OSSL_ROOT .. 'ssl/s2_clnt.c',
	OSSL_ROOT .. 'ssl/s2_enc.c',
	OSSL_ROOT .. 'ssl/s2_lib.c',
	OSSL_ROOT .. 'ssl/s2_meth.c',
	OSSL_ROOT .. 'ssl/s2_pkt.c',
	OSSL_ROOT .. 'ssl/s2_srvr.c',
	OSSL_ROOT .. 'ssl/s3_both.c',
	OSSL_ROOT .. 'ssl/s3_cbc.c',
	OSSL_ROOT .. 'ssl/s3_clnt.c',
	OSSL_ROOT .. 'ssl/s3_enc.c',
	OSSL_ROOT .. 'ssl/s3_lib.c',
	OSSL_ROOT .. 'ssl/s3_meth.c',
	OSSL_ROOT .. 'ssl/s3_pkt.c',
	OSSL_ROOT .. 'ssl/s3_srvr.c',
	OSSL_ROOT .. 'ssl/ssl_algs.c',
	OSSL_ROOT .. 'ssl/ssl_asn1.c',
	OSSL_ROOT .. 'ssl/ssl_cert.c',
	OSSL_ROOT .. 'ssl/ssl_ciph.c',
	OSSL_ROOT .. 'ssl/ssl_conf.c',
	OSSL_ROOT .. 'ssl/ssl_err.c',
	OSSL_ROOT .. 'ssl/ssl_err2.c',
	OSSL_ROOT .. 'ssl/ssl_lib.c',
	OSSL_ROOT .. 'ssl/ssl_rsa.c',
	OSSL_ROOT .. 'ssl/ssl_sess.c',
	OSSL_ROOT .. 'ssl/ssl_stat.c',
	OSSL_ROOT .. 'ssl/ssl_txt.c',
	OSSL_ROOT .. 'ssl/ssl_utst.c',
	OSSL_ROOT .. 'ssl/t1_clnt.c',
	OSSL_ROOT .. 'ssl/t1_enc.c',
	OSSL_ROOT .. 'ssl/t1_ext.c',
	OSSL_ROOT .. 'ssl/t1_lib.c',
	OSSL_ROOT .. 'ssl/t1_meth.c',
	OSSL_ROOT .. 'ssl/t1_reneg.c',
	OSSL_ROOT .. 'ssl/t1_srvr.c',
	OSSL_ROOT .. 'ssl/t1_trce.c',
	OSSL_ROOT .. 'ssl/tls_srp.c',

	OSSL_ROOT .. 'crypto/aes/aes_cfb.c',
	OSSL_ROOT .. 'crypto/aes/aes_ctr.c',
	OSSL_ROOT .. 'crypto/aes/aes_ecb.c',
	OSSL_ROOT .. 'crypto/aes/aes_ige.c',
	OSSL_ROOT .. 'crypto/aes/aes_misc.c',
	OSSL_ROOT .. 'crypto/aes/aes_ofb.c',
	OSSL_ROOT .. 'crypto/aes/aes_wrap.c',
	OSSL_ROOT .. 'crypto/asn1/a_bitstr.c',
	OSSL_ROOT .. 'crypto/asn1/a_bool.c',
	OSSL_ROOT .. 'crypto/asn1/a_bytes.c',
	OSSL_ROOT .. 'crypto/asn1/a_d2i_fp.c',
	OSSL_ROOT .. 'crypto/asn1/a_digest.c',
	OSSL_ROOT .. 'crypto/asn1/a_dup.c',
	OSSL_ROOT .. 'crypto/asn1/a_enum.c',
	OSSL_ROOT .. 'crypto/asn1/a_gentm.c',
	OSSL_ROOT .. 'crypto/asn1/a_i2d_fp.c',
	OSSL_ROOT .. 'crypto/asn1/a_int.c',
	OSSL_ROOT .. 'crypto/asn1/a_mbstr.c',
	OSSL_ROOT .. 'crypto/asn1/a_object.c',
	OSSL_ROOT .. 'crypto/asn1/a_octet.c',
	OSSL_ROOT .. 'crypto/asn1/a_print.c',
	OSSL_ROOT .. 'crypto/asn1/a_set.c',
	OSSL_ROOT .. 'crypto/asn1/a_sign.c',
	OSSL_ROOT .. 'crypto/asn1/a_strex.c',
	OSSL_ROOT .. 'crypto/asn1/a_strnid.c',
	OSSL_ROOT .. 'crypto/asn1/a_time.c',
	OSSL_ROOT .. 'crypto/asn1/a_type.c',
	OSSL_ROOT .. 'crypto/asn1/a_utctm.c',
	OSSL_ROOT .. 'crypto/asn1/a_utf8.c',
	OSSL_ROOT .. 'crypto/asn1/a_verify.c',
	OSSL_ROOT .. 'crypto/asn1/ameth_lib.c',
	OSSL_ROOT .. 'crypto/asn1/asn1_err.c',
	OSSL_ROOT .. 'crypto/asn1/asn1_gen.c',
	OSSL_ROOT .. 'crypto/asn1/asn1_lib.c',
	OSSL_ROOT .. 'crypto/asn1/asn1_par.c',
	OSSL_ROOT .. 'crypto/asn1/asn_mime.c',
	OSSL_ROOT .. 'crypto/asn1/asn_moid.c',
	OSSL_ROOT .. 'crypto/asn1/asn_pack.c',
	OSSL_ROOT .. 'crypto/asn1/bio_asn1.c',
	OSSL_ROOT .. 'crypto/asn1/bio_ndef.c',
	OSSL_ROOT .. 'crypto/asn1/d2i_pr.c',
	OSSL_ROOT .. 'crypto/asn1/d2i_pu.c',
	OSSL_ROOT .. 'crypto/asn1/evp_asn1.c',
	OSSL_ROOT .. 'crypto/asn1/f_enum.c',
	OSSL_ROOT .. 'crypto/asn1/f_int.c',
	OSSL_ROOT .. 'crypto/asn1/f_string.c',
	OSSL_ROOT .. 'crypto/asn1/i2d_pr.c',
	OSSL_ROOT .. 'crypto/asn1/i2d_pu.c',
	OSSL_ROOT .. 'crypto/asn1/n_pkey.c',
	OSSL_ROOT .. 'crypto/asn1/nsseq.c',
	OSSL_ROOT .. 'crypto/asn1/p5_pbe.c',
	OSSL_ROOT .. 'crypto/asn1/p5_pbev2.c',
	OSSL_ROOT .. 'crypto/asn1/p8_pkey.c',
	OSSL_ROOT .. 'crypto/asn1/t_bitst.c',
	OSSL_ROOT .. 'crypto/asn1/t_crl.c',
	OSSL_ROOT .. 'crypto/asn1/t_pkey.c',
	OSSL_ROOT .. 'crypto/asn1/t_req.c',
	OSSL_ROOT .. 'crypto/asn1/t_spki.c',
	OSSL_ROOT .. 'crypto/asn1/t_x509.c',
	OSSL_ROOT .. 'crypto/asn1/t_x509a.c',
	OSSL_ROOT .. 'crypto/asn1/tasn_dec.c',
	OSSL_ROOT .. 'crypto/asn1/tasn_enc.c',
	OSSL_ROOT .. 'crypto/asn1/tasn_fre.c',
	OSSL_ROOT .. 'crypto/asn1/tasn_new.c',
	OSSL_ROOT .. 'crypto/asn1/tasn_prn.c',
	OSSL_ROOT .. 'crypto/asn1/tasn_typ.c',
	OSSL_ROOT .. 'crypto/asn1/tasn_utl.c',
	OSSL_ROOT .. 'crypto/asn1/x_algor.c',
	OSSL_ROOT .. 'crypto/asn1/x_attrib.c',
	OSSL_ROOT .. 'crypto/asn1/x_bignum.c',
	OSSL_ROOT .. 'crypto/asn1/x_crl.c',
	OSSL_ROOT .. 'crypto/asn1/x_exten.c',
	OSSL_ROOT .. 'crypto/asn1/x_info.c',
	OSSL_ROOT .. 'crypto/asn1/x_long.c',
	OSSL_ROOT .. 'crypto/asn1/x_name.c',
	OSSL_ROOT .. 'crypto/asn1/x_nx509.c',
	OSSL_ROOT .. 'crypto/asn1/x_pkey.c',
	OSSL_ROOT .. 'crypto/asn1/x_pubkey.c',
	OSSL_ROOT .. 'crypto/asn1/x_req.c',
	OSSL_ROOT .. 'crypto/asn1/x_sig.c',
	OSSL_ROOT .. 'crypto/asn1/x_spki.c',
	OSSL_ROOT .. 'crypto/asn1/x_val.c',
	OSSL_ROOT .. 'crypto/asn1/x_x509.c',
	OSSL_ROOT .. 'crypto/asn1/x_x509a.c',
	OSSL_ROOT .. 'crypto/bf/bf_cfb64.c',
	OSSL_ROOT .. 'crypto/bf/bf_ecb.c',
	OSSL_ROOT .. 'crypto/bf/bf_ofb64.c',
	OSSL_ROOT .. 'crypto/bf/bf_skey.c',
	OSSL_ROOT .. 'crypto/bio/b_dump.c',
	OSSL_ROOT .. 'crypto/bio/b_print.c',
	OSSL_ROOT .. 'crypto/bio/b_sock.c',
	OSSL_ROOT .. 'crypto/bio/bf_buff.c',
	OSSL_ROOT .. 'crypto/bio/bf_nbio.c',
	OSSL_ROOT .. 'crypto/bio/bf_null.c',
	OSSL_ROOT .. 'crypto/bio/bio_cb.c',
	OSSL_ROOT .. 'crypto/bio/bio_err.c',
	OSSL_ROOT .. 'crypto/bio/bio_lib.c',
	OSSL_ROOT .. 'crypto/bio/bss_acpt.c',
	OSSL_ROOT .. 'crypto/bio/bss_bio.c',
	OSSL_ROOT .. 'crypto/bio/bss_conn.c',
	OSSL_ROOT .. 'crypto/bio/bss_dgram.c',
	OSSL_ROOT .. 'crypto/bio/bss_fd.c',
	OSSL_ROOT .. 'crypto/bio/bss_file.c',
	OSSL_ROOT .. 'crypto/bio/bss_log.c',
	OSSL_ROOT .. 'crypto/bio/bss_mem.c',
	OSSL_ROOT .. 'crypto/bio/bss_null.c',
	OSSL_ROOT .. 'crypto/bio/bss_sock.c',
	OSSL_ROOT .. 'crypto/bn/bn_add.c',
	OSSL_ROOT .. 'crypto/bn/bn_blind.c',
	OSSL_ROOT .. 'crypto/bn/bn_const.c',
	OSSL_ROOT .. 'crypto/bn/bn_ctx.c',
	OSSL_ROOT .. 'crypto/bn/bn_depr.c',
	OSSL_ROOT .. 'crypto/bn/bn_div.c',
	OSSL_ROOT .. 'crypto/bn/bn_err.c',
	OSSL_ROOT .. 'crypto/bn/bn_exp.c',
	OSSL_ROOT .. 'crypto/bn/bn_exp2.c',
	OSSL_ROOT .. 'crypto/bn/bn_gcd.c',
	OSSL_ROOT .. 'crypto/bn/bn_gf2m.c',
	OSSL_ROOT .. 'crypto/bn/bn_kron.c',
	OSSL_ROOT .. 'crypto/bn/bn_lib.c',
	OSSL_ROOT .. 'crypto/bn/bn_mod.c',
	OSSL_ROOT .. 'crypto/bn/bn_mont.c',
	OSSL_ROOT .. 'crypto/bn/bn_mpi.c',
	OSSL_ROOT .. 'crypto/bn/bn_mul.c',
	OSSL_ROOT .. 'crypto/bn/bn_nist.c',
	OSSL_ROOT .. 'crypto/bn/bn_prime.c',
	OSSL_ROOT .. 'crypto/bn/bn_print.c',
	OSSL_ROOT .. 'crypto/bn/bn_rand.c',
	OSSL_ROOT .. 'crypto/bn/bn_recp.c',
	OSSL_ROOT .. 'crypto/bn/bn_shift.c',
	OSSL_ROOT .. 'crypto/bn/bn_sqr.c',
	OSSL_ROOT .. 'crypto/bn/bn_sqrt.c',
	OSSL_ROOT .. 'crypto/bn/bn_word.c',
	OSSL_ROOT .. 'crypto/bn/bn_x931p.c',
	OSSL_ROOT .. 'crypto/buffer/buf_err.c',
	OSSL_ROOT .. 'crypto/buffer/buf_str.c',
	OSSL_ROOT .. 'crypto/buffer/buffer.c',
	OSSL_ROOT .. 'crypto/camellia/cmll_cfb.c',
	OSSL_ROOT .. 'crypto/camellia/cmll_ctr.c',
	OSSL_ROOT .. 'crypto/camellia/cmll_ecb.c',
	OSSL_ROOT .. 'crypto/camellia/cmll_ofb.c',
	OSSL_ROOT .. 'crypto/camellia/cmll_utl.c',
	OSSL_ROOT .. 'crypto/cast/c_cfb64.c',
	OSSL_ROOT .. 'crypto/cast/c_ecb.c',
	OSSL_ROOT .. 'crypto/cast/c_ofb64.c',
	OSSL_ROOT .. 'crypto/cast/c_skey.c',
	OSSL_ROOT .. 'crypto/cmac/cm_ameth.c',
	OSSL_ROOT .. 'crypto/cmac/cm_pmeth.c',
	OSSL_ROOT .. 'crypto/cmac/cmac.c',
	OSSL_ROOT .. 'crypto/cms/cms_asn1.c',
	OSSL_ROOT .. 'crypto/cms/cms_att.c',
	OSSL_ROOT .. 'crypto/cms/cms_cd.c',
	OSSL_ROOT .. 'crypto/cms/cms_dd.c',
	OSSL_ROOT .. 'crypto/cms/cms_enc.c',
	OSSL_ROOT .. 'crypto/cms/cms_env.c',
	OSSL_ROOT .. 'crypto/cms/cms_err.c',
	OSSL_ROOT .. 'crypto/cms/cms_ess.c',
	OSSL_ROOT .. 'crypto/cms/cms_io.c',
	OSSL_ROOT .. 'crypto/cms/cms_kari.c',
	OSSL_ROOT .. 'crypto/cms/cms_lib.c',
	OSSL_ROOT .. 'crypto/cms/cms_pwri.c',
	OSSL_ROOT .. 'crypto/cms/cms_sd.c',
	OSSL_ROOT .. 'crypto/cms/cms_smime.c',
	OSSL_ROOT .. 'crypto/conf/conf_api.c',
	OSSL_ROOT .. 'crypto/conf/conf_def.c',
	OSSL_ROOT .. 'crypto/conf/conf_err.c',
	OSSL_ROOT .. 'crypto/conf/conf_lib.c',
	OSSL_ROOT .. 'crypto/conf/conf_mall.c',
	OSSL_ROOT .. 'crypto/conf/conf_mod.c',
	OSSL_ROOT .. 'crypto/conf/conf_sap.c',
	OSSL_ROOT .. 'crypto/cpt_err.c',
	OSSL_ROOT .. 'crypto/cryptlib.c',
	OSSL_ROOT .. 'crypto/cversion.c',
	OSSL_ROOT .. 'crypto/des/cbc_cksm.c',
	OSSL_ROOT .. 'crypto/des/cbc_enc.c',
	OSSL_ROOT .. 'crypto/des/cfb64ede.c',
	OSSL_ROOT .. 'crypto/des/cfb64enc.c',
	OSSL_ROOT .. 'crypto/des/cfb_enc.c',
	OSSL_ROOT .. 'crypto/des/des_old.c',
	OSSL_ROOT .. 'crypto/des/des_old2.c',
	OSSL_ROOT .. 'crypto/des/ecb3_enc.c',
	OSSL_ROOT .. 'crypto/des/ecb_enc.c',
	OSSL_ROOT .. 'crypto/des/ede_cbcm_enc.c',
	OSSL_ROOT .. 'crypto/des/enc_read.c',
	OSSL_ROOT .. 'crypto/des/enc_writ.c',
	OSSL_ROOT .. 'crypto/des/fcrypt.c',
	OSSL_ROOT .. 'crypto/des/ofb64ede.c',
	OSSL_ROOT .. 'crypto/des/ofb64enc.c',
	OSSL_ROOT .. 'crypto/des/ofb_enc.c',
	OSSL_ROOT .. 'crypto/des/pcbc_enc.c',
	OSSL_ROOT .. 'crypto/des/qud_cksm.c',
	OSSL_ROOT .. 'crypto/des/rand_key.c',
	OSSL_ROOT .. 'crypto/des/read2pwd.c',
	OSSL_ROOT .. 'crypto/des/rpc_enc.c',
	OSSL_ROOT .. 'crypto/des/set_key.c',
	OSSL_ROOT .. 'crypto/des/str2key.c',
	OSSL_ROOT .. 'crypto/des/xcbc_enc.c',
	OSSL_ROOT .. 'crypto/dh/dh_ameth.c',
	OSSL_ROOT .. 'crypto/dh/dh_asn1.c',
	OSSL_ROOT .. 'crypto/dh/dh_check.c',
	OSSL_ROOT .. 'crypto/dh/dh_depr.c',
	OSSL_ROOT .. 'crypto/dh/dh_err.c',
	OSSL_ROOT .. 'crypto/dh/dh_gen.c',
	OSSL_ROOT .. 'crypto/dh/dh_kdf.c',
	OSSL_ROOT .. 'crypto/dh/dh_key.c',
	OSSL_ROOT .. 'crypto/dh/dh_lib.c',
	OSSL_ROOT .. 'crypto/dh/dh_pmeth.c',
	OSSL_ROOT .. 'crypto/dh/dh_prn.c',
	OSSL_ROOT .. 'crypto/dh/dh_rfc5114.c',
	OSSL_ROOT .. 'crypto/dsa/dsa_ameth.c',
	OSSL_ROOT .. 'crypto/dsa/dsa_asn1.c',
	OSSL_ROOT .. 'crypto/dsa/dsa_depr.c',
	OSSL_ROOT .. 'crypto/dsa/dsa_err.c',
	OSSL_ROOT .. 'crypto/dsa/dsa_gen.c',
	OSSL_ROOT .. 'crypto/dsa/dsa_key.c',
	OSSL_ROOT .. 'crypto/dsa/dsa_lib.c',
	OSSL_ROOT .. 'crypto/dsa/dsa_ossl.c',
	OSSL_ROOT .. 'crypto/dsa/dsa_pmeth.c',
	OSSL_ROOT .. 'crypto/dsa/dsa_prn.c',
	OSSL_ROOT .. 'crypto/dsa/dsa_sign.c',
	OSSL_ROOT .. 'crypto/dsa/dsa_vrf.c',
	OSSL_ROOT .. 'crypto/dso/dso_beos.c',
	OSSL_ROOT .. 'crypto/dso/dso_dl.c',
	OSSL_ROOT .. 'crypto/dso/dso_dlfcn.c',
	OSSL_ROOT .. 'crypto/dso/dso_err.c',
	OSSL_ROOT .. 'crypto/dso/dso_lib.c',
	OSSL_ROOT .. 'crypto/dso/dso_null.c',
	OSSL_ROOT .. 'crypto/dso/dso_openssl.c',
	OSSL_ROOT .. 'crypto/dso/dso_vms.c',
	OSSL_ROOT .. 'crypto/dso/dso_win32.c',
	OSSL_ROOT .. 'crypto/ebcdic.c',
	OSSL_ROOT .. 'crypto/ec/ec2_mult.c',
	OSSL_ROOT .. 'crypto/ec/ec2_oct.c',
	OSSL_ROOT .. 'crypto/ec/ec2_smpl.c',
	OSSL_ROOT .. 'crypto/ec/ec_ameth.c',
	OSSL_ROOT .. 'crypto/ec/ec_asn1.c',
	OSSL_ROOT .. 'crypto/ec/ec_check.c',
	OSSL_ROOT .. 'crypto/ec/ec_curve.c',
	OSSL_ROOT .. 'crypto/ec/ec_cvt.c',
	OSSL_ROOT .. 'crypto/ec/ec_err.c',
	OSSL_ROOT .. 'crypto/ec/ec_key.c',
	OSSL_ROOT .. 'crypto/ec/ec_lib.c',
	OSSL_ROOT .. 'crypto/ec/ec_mult.c',
	OSSL_ROOT .. 'crypto/ec/ec_oct.c',
	OSSL_ROOT .. 'crypto/ec/ec_pmeth.c',
	OSSL_ROOT .. 'crypto/ec/ec_print.c',
	OSSL_ROOT .. 'crypto/ec/eck_prn.c',
	OSSL_ROOT .. 'crypto/ec/ecp_mont.c',
	OSSL_ROOT .. 'crypto/ec/ecp_nist.c',
	OSSL_ROOT .. 'crypto/ec/ecp_nistp224.c',
	OSSL_ROOT .. 'crypto/ec/ecp_nistp256.c',
	OSSL_ROOT .. 'crypto/ec/ecp_nistp521.c',
	OSSL_ROOT .. 'crypto/ec/ecp_nistputil.c',
	OSSL_ROOT .. 'crypto/ec/ecp_oct.c',
	OSSL_ROOT .. 'crypto/ec/ecp_smpl.c',
	OSSL_ROOT .. 'crypto/ecdh/ech_err.c',
	OSSL_ROOT .. 'crypto/ecdh/ech_kdf.c',
	OSSL_ROOT .. 'crypto/ecdh/ech_key.c',
	OSSL_ROOT .. 'crypto/ecdh/ech_lib.c',
	OSSL_ROOT .. 'crypto/ecdh/ech_ossl.c',
	OSSL_ROOT .. 'crypto/ecdsa/ecs_asn1.c',
	OSSL_ROOT .. 'crypto/ecdsa/ecs_err.c',
	OSSL_ROOT .. 'crypto/ecdsa/ecs_lib.c',
	OSSL_ROOT .. 'crypto/ecdsa/ecs_ossl.c',
	OSSL_ROOT .. 'crypto/ecdsa/ecs_sign.c',
	OSSL_ROOT .. 'crypto/ecdsa/ecs_vrf.c',
	OSSL_ROOT .. 'crypto/engine/eng_all.c',
	OSSL_ROOT .. 'crypto/engine/eng_cnf.c',
	OSSL_ROOT .. 'crypto/engine/eng_cryptodev.c',
	OSSL_ROOT .. 'crypto/engine/eng_ctrl.c',
	OSSL_ROOT .. 'crypto/engine/eng_dyn.c',
	OSSL_ROOT .. 'crypto/engine/eng_err.c',
	OSSL_ROOT .. 'crypto/engine/eng_fat.c',
	OSSL_ROOT .. 'crypto/engine/eng_init.c',
	OSSL_ROOT .. 'crypto/engine/eng_lib.c',
	OSSL_ROOT .. 'crypto/engine/eng_list.c',
	OSSL_ROOT .. 'crypto/engine/eng_openssl.c',
	OSSL_ROOT .. 'crypto/engine/eng_pkey.c',
	OSSL_ROOT .. 'crypto/engine/eng_rdrand.c',
	OSSL_ROOT .. 'crypto/engine/eng_table.c',
	OSSL_ROOT .. 'crypto/engine/tb_asnmth.c',
	OSSL_ROOT .. 'crypto/engine/tb_cipher.c',
	OSSL_ROOT .. 'crypto/engine/tb_dh.c',
	OSSL_ROOT .. 'crypto/engine/tb_digest.c',
	OSSL_ROOT .. 'crypto/engine/tb_dsa.c',
	OSSL_ROOT .. 'crypto/engine/tb_ecdh.c',
	OSSL_ROOT .. 'crypto/engine/tb_ecdsa.c',
	OSSL_ROOT .. 'crypto/engine/tb_pkmeth.c',
	OSSL_ROOT .. 'crypto/engine/tb_rand.c',
	OSSL_ROOT .. 'crypto/engine/tb_rsa.c',
	OSSL_ROOT .. 'crypto/engine/tb_store.c',
	OSSL_ROOT .. 'crypto/err/err.c',
	OSSL_ROOT .. 'crypto/err/err_all.c',
	OSSL_ROOT .. 'crypto/err/err_prn.c',
	OSSL_ROOT .. 'crypto/evp/bio_b64.c',
	OSSL_ROOT .. 'crypto/evp/bio_enc.c',
	OSSL_ROOT .. 'crypto/evp/bio_md.c',
	OSSL_ROOT .. 'crypto/evp/bio_ok.c',
	OSSL_ROOT .. 'crypto/evp/c_all.c',
	OSSL_ROOT .. 'crypto/evp/c_allc.c',
	OSSL_ROOT .. 'crypto/evp/c_alld.c',
	OSSL_ROOT .. 'crypto/evp/digest.c',
	OSSL_ROOT .. 'crypto/evp/e_aes.c',
	OSSL_ROOT .. 'crypto/evp/e_aes_cbc_hmac_sha1.c',
	OSSL_ROOT .. 'crypto/evp/e_aes_cbc_hmac_sha256.c',
	OSSL_ROOT .. 'crypto/evp/e_bf.c',
	OSSL_ROOT .. 'crypto/evp/e_camellia.c',
	OSSL_ROOT .. 'crypto/evp/e_cast.c',
	OSSL_ROOT .. 'crypto/evp/e_des.c',
	OSSL_ROOT .. 'crypto/evp/e_des3.c',
	OSSL_ROOT .. 'crypto/evp/e_idea.c',
	OSSL_ROOT .. 'crypto/evp/e_null.c',
	OSSL_ROOT .. 'crypto/evp/e_old.c',
	OSSL_ROOT .. 'crypto/evp/e_rc2.c',
	OSSL_ROOT .. 'crypto/evp/e_rc4.c',
	OSSL_ROOT .. 'crypto/evp/e_rc4_hmac_md5.c',
	OSSL_ROOT .. 'crypto/evp/e_rc5.c',
	OSSL_ROOT .. 'crypto/evp/e_seed.c',
	OSSL_ROOT .. 'crypto/evp/e_xcbc_d.c',
	OSSL_ROOT .. 'crypto/evp/encode.c',
	OSSL_ROOT .. 'crypto/evp/evp_acnf.c',
	OSSL_ROOT .. 'crypto/evp/evp_cnf.c',
	OSSL_ROOT .. 'crypto/evp/evp_enc.c',
	OSSL_ROOT .. 'crypto/evp/evp_err.c',
	OSSL_ROOT .. 'crypto/evp/evp_key.c',
	OSSL_ROOT .. 'crypto/evp/evp_lib.c',
	OSSL_ROOT .. 'crypto/evp/evp_pbe.c',
	OSSL_ROOT .. 'crypto/evp/evp_pkey.c',
	OSSL_ROOT .. 'crypto/evp/m_dss.c',
	OSSL_ROOT .. 'crypto/evp/m_dss1.c',
	OSSL_ROOT .. 'crypto/evp/m_ecdsa.c',
	OSSL_ROOT .. 'crypto/evp/m_md2.c',
	OSSL_ROOT .. 'crypto/evp/m_md4.c',
	OSSL_ROOT .. 'crypto/evp/m_md5.c',
	OSSL_ROOT .. 'crypto/evp/m_mdc2.c',
	OSSL_ROOT .. 'crypto/evp/m_null.c',
	OSSL_ROOT .. 'crypto/evp/m_ripemd.c',
	OSSL_ROOT .. 'crypto/evp/m_sha.c',
	OSSL_ROOT .. 'crypto/evp/m_sha1.c',
	OSSL_ROOT .. 'crypto/evp/m_sigver.c',
	OSSL_ROOT .. 'crypto/evp/m_wp.c',
	OSSL_ROOT .. 'crypto/evp/names.c',
	OSSL_ROOT .. 'crypto/evp/p5_crpt.c',
	OSSL_ROOT .. 'crypto/evp/p5_crpt2.c',
	OSSL_ROOT .. 'crypto/evp/p_dec.c',
	OSSL_ROOT .. 'crypto/evp/p_enc.c',
	OSSL_ROOT .. 'crypto/evp/p_lib.c',
	OSSL_ROOT .. 'crypto/evp/p_open.c',
	OSSL_ROOT .. 'crypto/evp/p_seal.c',
	OSSL_ROOT .. 'crypto/evp/p_sign.c',
	OSSL_ROOT .. 'crypto/evp/p_verify.c',
	OSSL_ROOT .. 'crypto/evp/pmeth_fn.c',
	OSSL_ROOT .. 'crypto/evp/pmeth_gn.c',
	OSSL_ROOT .. 'crypto/evp/pmeth_lib.c',
	OSSL_ROOT .. 'crypto/ex_data.c',
	OSSL_ROOT .. 'crypto/fips_ers.c',
	OSSL_ROOT .. 'crypto/hmac/hm_ameth.c',
	OSSL_ROOT .. 'crypto/hmac/hm_pmeth.c',
	OSSL_ROOT .. 'crypto/hmac/hmac.c',
	OSSL_ROOT .. 'crypto/idea/i_cbc.c',
	OSSL_ROOT .. 'crypto/idea/i_cfb64.c',
	OSSL_ROOT .. 'crypto/idea/i_ecb.c',
	OSSL_ROOT .. 'crypto/idea/i_ofb64.c',
	OSSL_ROOT .. 'crypto/idea/i_skey.c',
	OSSL_ROOT .. 'crypto/krb5/krb5_asn.c',
	OSSL_ROOT .. 'crypto/lhash/lh_stats.c',
	OSSL_ROOT .. 'crypto/lhash/lhash.c',
	OSSL_ROOT .. 'crypto/md4/md4_dgst.c',
	OSSL_ROOT .. 'crypto/md4/md4_one.c',
	OSSL_ROOT .. 'crypto/md5/md5_dgst.c',
	OSSL_ROOT .. 'crypto/md5/md5_one.c',
	OSSL_ROOT .. 'crypto/mdc2/mdc2_one.c',
	OSSL_ROOT .. 'crypto/mdc2/mdc2dgst.c',
	OSSL_ROOT .. 'crypto/mem.c',
	OSSL_ROOT .. 'crypto/mem_dbg.c',
	OSSL_ROOT .. 'crypto/modes/cbc128.c',
	OSSL_ROOT .. 'crypto/modes/ccm128.c',
	OSSL_ROOT .. 'crypto/modes/cfb128.c',
	OSSL_ROOT .. 'crypto/modes/ctr128.c',
	OSSL_ROOT .. 'crypto/modes/cts128.c',
	OSSL_ROOT .. 'crypto/modes/gcm128.c',
	OSSL_ROOT .. 'crypto/modes/ofb128.c',
	OSSL_ROOT .. 'crypto/modes/wrap128.c',
	OSSL_ROOT .. 'crypto/modes/xts128.c',
	OSSL_ROOT .. 'crypto/o_dir.c',
	OSSL_ROOT .. 'crypto/o_fips.c',
	OSSL_ROOT .. 'crypto/o_init.c',
	OSSL_ROOT .. 'crypto/o_str.c',
	OSSL_ROOT .. 'crypto/o_time.c',
	OSSL_ROOT .. 'crypto/objects/o_names.c',
	OSSL_ROOT .. 'crypto/objects/obj_dat.c',
	OSSL_ROOT .. 'crypto/objects/obj_err.c',
	OSSL_ROOT .. 'crypto/objects/obj_lib.c',
	OSSL_ROOT .. 'crypto/objects/obj_xref.c',
	OSSL_ROOT .. 'crypto/ocsp/ocsp_asn.c',
	OSSL_ROOT .. 'crypto/ocsp/ocsp_cl.c',
	OSSL_ROOT .. 'crypto/ocsp/ocsp_err.c',
	OSSL_ROOT .. 'crypto/ocsp/ocsp_ext.c',
	OSSL_ROOT .. 'crypto/ocsp/ocsp_ht.c',
	OSSL_ROOT .. 'crypto/ocsp/ocsp_lib.c',
	OSSL_ROOT .. 'crypto/ocsp/ocsp_prn.c',
	OSSL_ROOT .. 'crypto/ocsp/ocsp_srv.c',
	OSSL_ROOT .. 'crypto/ocsp/ocsp_vfy.c',
	OSSL_ROOT .. 'crypto/pem/pem_all.c',
	OSSL_ROOT .. 'crypto/pem/pem_err.c',
	OSSL_ROOT .. 'crypto/pem/pem_info.c',
	OSSL_ROOT .. 'crypto/pem/pem_lib.c',
	OSSL_ROOT .. 'crypto/pem/pem_oth.c',
	OSSL_ROOT .. 'crypto/pem/pem_pk8.c',
	OSSL_ROOT .. 'crypto/pem/pem_pkey.c',
	OSSL_ROOT .. 'crypto/pem/pem_seal.c',
	OSSL_ROOT .. 'crypto/pem/pem_sign.c',
	OSSL_ROOT .. 'crypto/pem/pem_x509.c',
	OSSL_ROOT .. 'crypto/pem/pem_xaux.c',
	OSSL_ROOT .. 'crypto/pem/pvkfmt.c',
	OSSL_ROOT .. 'crypto/pkcs12/p12_add.c',
	OSSL_ROOT .. 'crypto/pkcs12/p12_asn.c',
	OSSL_ROOT .. 'crypto/pkcs12/p12_attr.c',
	OSSL_ROOT .. 'crypto/pkcs12/p12_crpt.c',
	OSSL_ROOT .. 'crypto/pkcs12/p12_crt.c',
	OSSL_ROOT .. 'crypto/pkcs12/p12_decr.c',
	OSSL_ROOT .. 'crypto/pkcs12/p12_init.c',
	OSSL_ROOT .. 'crypto/pkcs12/p12_key.c',
	OSSL_ROOT .. 'crypto/pkcs12/p12_kiss.c',
	OSSL_ROOT .. 'crypto/pkcs12/p12_mutl.c',
	OSSL_ROOT .. 'crypto/pkcs12/p12_npas.c',
	OSSL_ROOT .. 'crypto/pkcs12/p12_p8d.c',
	OSSL_ROOT .. 'crypto/pkcs12/p12_p8e.c',
	OSSL_ROOT .. 'crypto/pkcs12/p12_utl.c',
	OSSL_ROOT .. 'crypto/pkcs12/pk12err.c',
	OSSL_ROOT .. 'crypto/pkcs7/bio_pk7.c',
	OSSL_ROOT .. 'crypto/pkcs7/pk7_asn1.c',
	OSSL_ROOT .. 'crypto/pkcs7/pk7_attr.c',
	OSSL_ROOT .. 'crypto/pkcs7/pk7_doit.c',
	OSSL_ROOT .. 'crypto/pkcs7/pk7_lib.c',
	OSSL_ROOT .. 'crypto/pkcs7/pk7_mime.c',
	OSSL_ROOT .. 'crypto/pkcs7/pk7_smime.c',
	OSSL_ROOT .. 'crypto/pkcs7/pkcs7err.c',
	OSSL_ROOT .. 'crypto/pqueue/pqueue.c',
	OSSL_ROOT .. 'crypto/rand/md_rand.c',
	OSSL_ROOT .. 'crypto/rand/rand_egd.c',
	OSSL_ROOT .. 'crypto/rand/rand_err.c',
	OSSL_ROOT .. 'crypto/rand/rand_lib.c',
	OSSL_ROOT .. 'crypto/rand/rand_nw.c',
	OSSL_ROOT .. 'crypto/rand/rand_os2.c',
	OSSL_ROOT .. 'crypto/rand/rand_unix.c',
	OSSL_ROOT .. 'crypto/rand/rand_win.c',
	OSSL_ROOT .. 'crypto/rand/randfile.c',
	OSSL_ROOT .. 'crypto/rc2/rc2_cbc.c',
	OSSL_ROOT .. 'crypto/rc2/rc2_ecb.c',
	OSSL_ROOT .. 'crypto/rc2/rc2_skey.c',
	OSSL_ROOT .. 'crypto/rc2/rc2cfb64.c',
	OSSL_ROOT .. 'crypto/rc2/rc2ofb64.c',
	OSSL_ROOT .. 'crypto/rc4/rc4_utl.c',
	OSSL_ROOT .. 'crypto/ripemd/rmd_dgst.c',
	OSSL_ROOT .. 'crypto/ripemd/rmd_one.c',
	OSSL_ROOT .. 'crypto/rsa/rsa_ameth.c',
	OSSL_ROOT .. 'crypto/rsa/rsa_asn1.c',
	OSSL_ROOT .. 'crypto/rsa/rsa_chk.c',
	OSSL_ROOT .. 'crypto/rsa/rsa_crpt.c',
	OSSL_ROOT .. 'crypto/rsa/rsa_depr.c',
	OSSL_ROOT .. 'crypto/rsa/rsa_eay.c',
	OSSL_ROOT .. 'crypto/rsa/rsa_err.c',
	OSSL_ROOT .. 'crypto/rsa/rsa_gen.c',
	OSSL_ROOT .. 'crypto/rsa/rsa_lib.c',
	OSSL_ROOT .. 'crypto/rsa/rsa_none.c',
	OSSL_ROOT .. 'crypto/rsa/rsa_null.c',
	OSSL_ROOT .. 'crypto/rsa/rsa_oaep.c',
	OSSL_ROOT .. 'crypto/rsa/rsa_pk1.c',
	OSSL_ROOT .. 'crypto/rsa/rsa_pmeth.c',
	OSSL_ROOT .. 'crypto/rsa/rsa_prn.c',
	OSSL_ROOT .. 'crypto/rsa/rsa_pss.c',
	OSSL_ROOT .. 'crypto/rsa/rsa_saos.c',
	OSSL_ROOT .. 'crypto/rsa/rsa_sign.c',
	OSSL_ROOT .. 'crypto/rsa/rsa_ssl.c',
	OSSL_ROOT .. 'crypto/rsa/rsa_x931.c',
	OSSL_ROOT .. 'crypto/seed/seed.c',
	OSSL_ROOT .. 'crypto/seed/seed_cbc.c',
	OSSL_ROOT .. 'crypto/seed/seed_cfb.c',
	OSSL_ROOT .. 'crypto/seed/seed_ecb.c',
	OSSL_ROOT .. 'crypto/seed/seed_ofb.c',
	OSSL_ROOT .. 'crypto/sha/sha1_one.c',
	OSSL_ROOT .. 'crypto/sha/sha1dgst.c',
	OSSL_ROOT .. 'crypto/sha/sha256.c',
	OSSL_ROOT .. 'crypto/sha/sha512.c',
	OSSL_ROOT .. 'crypto/sha/sha_dgst.c',
	OSSL_ROOT .. 'crypto/sha/sha_one.c',
	OSSL_ROOT .. 'crypto/srp/srp_lib.c',
	OSSL_ROOT .. 'crypto/srp/srp_vfy.c',
	OSSL_ROOT .. 'crypto/stack/stack.c',
	OSSL_ROOT .. 'crypto/ts/ts_asn1.c',
	OSSL_ROOT .. 'crypto/ts/ts_conf.c',
	OSSL_ROOT .. 'crypto/ts/ts_err.c',
	OSSL_ROOT .. 'crypto/ts/ts_lib.c',
	OSSL_ROOT .. 'crypto/ts/ts_req_print.c',
	OSSL_ROOT .. 'crypto/ts/ts_req_utils.c',
	OSSL_ROOT .. 'crypto/ts/ts_rsp_print.c',
	OSSL_ROOT .. 'crypto/ts/ts_rsp_sign.c',
	OSSL_ROOT .. 'crypto/ts/ts_rsp_utils.c',
	OSSL_ROOT .. 'crypto/ts/ts_rsp_verify.c',
	OSSL_ROOT .. 'crypto/ts/ts_verify_ctx.c',
	OSSL_ROOT .. 'crypto/txt_db/txt_db.c',
	OSSL_ROOT .. 'crypto/ui/ui_err.c',
	OSSL_ROOT .. 'crypto/ui/ui_lib.c',
	OSSL_ROOT .. 'crypto/ui/ui_openssl.c',
	OSSL_ROOT .. 'crypto/ui/ui_util.c',
	OSSL_ROOT .. 'crypto/uid.c',
	OSSL_ROOT .. 'crypto/whrlpool/wp_dgst.c',
	OSSL_ROOT .. 'crypto/x509/by_dir.c',
	OSSL_ROOT .. 'crypto/x509/by_file.c',
	OSSL_ROOT .. 'crypto/x509/x509_att.c',
	OSSL_ROOT .. 'crypto/x509/x509_cmp.c',
	OSSL_ROOT .. 'crypto/x509/x509_d2.c',
	OSSL_ROOT .. 'crypto/x509/x509_def.c',
	OSSL_ROOT .. 'crypto/x509/x509_err.c',
	OSSL_ROOT .. 'crypto/x509/x509_ext.c',
	OSSL_ROOT .. 'crypto/x509/x509_lu.c',
	OSSL_ROOT .. 'crypto/x509/x509_obj.c',
	OSSL_ROOT .. 'crypto/x509/x509_r2x.c',
	OSSL_ROOT .. 'crypto/x509/x509_req.c',
	OSSL_ROOT .. 'crypto/x509/x509_set.c',
	OSSL_ROOT .. 'crypto/x509/x509_trs.c',
	OSSL_ROOT .. 'crypto/x509/x509_txt.c',
	OSSL_ROOT .. 'crypto/x509/x509_v3.c',
	OSSL_ROOT .. 'crypto/x509/x509_vfy.c',
	OSSL_ROOT .. 'crypto/x509/x509_vpm.c',
	OSSL_ROOT .. 'crypto/x509/x509cset.c',
	OSSL_ROOT .. 'crypto/x509/x509name.c',
	OSSL_ROOT .. 'crypto/x509/x509rset.c',
	OSSL_ROOT .. 'crypto/x509/x509spki.c',
	OSSL_ROOT .. 'crypto/x509/x509type.c',
	OSSL_ROOT .. 'crypto/x509/x_all.c',
	OSSL_ROOT .. 'crypto/x509v3/pcy_cache.c',
	OSSL_ROOT .. 'crypto/x509v3/pcy_data.c',
	OSSL_ROOT .. 'crypto/x509v3/pcy_lib.c',
	OSSL_ROOT .. 'crypto/x509v3/pcy_map.c',
	OSSL_ROOT .. 'crypto/x509v3/pcy_node.c',
	OSSL_ROOT .. 'crypto/x509v3/pcy_tree.c',
	OSSL_ROOT .. 'crypto/x509v3/v3_addr.c',
	OSSL_ROOT .. 'crypto/x509v3/v3_akey.c',
	OSSL_ROOT .. 'crypto/x509v3/v3_akeya.c',
	OSSL_ROOT .. 'crypto/x509v3/v3_alt.c',
	OSSL_ROOT .. 'crypto/x509v3/v3_asid.c',
	OSSL_ROOT .. 'crypto/x509v3/v3_bcons.c',
	OSSL_ROOT .. 'crypto/x509v3/v3_bitst.c',
	OSSL_ROOT .. 'crypto/x509v3/v3_conf.c',
	OSSL_ROOT .. 'crypto/x509v3/v3_cpols.c',
	OSSL_ROOT .. 'crypto/x509v3/v3_crld.c',
	OSSL_ROOT .. 'crypto/x509v3/v3_enum.c',
	OSSL_ROOT .. 'crypto/x509v3/v3_extku.c',
	OSSL_ROOT .. 'crypto/x509v3/v3_genn.c',
	OSSL_ROOT .. 'crypto/x509v3/v3_ia5.c',
	OSSL_ROOT .. 'crypto/x509v3/v3_info.c',
	OSSL_ROOT .. 'crypto/x509v3/v3_int.c',
	OSSL_ROOT .. 'crypto/x509v3/v3_lib.c',
	OSSL_ROOT .. 'crypto/x509v3/v3_ncons.c',
	OSSL_ROOT .. 'crypto/x509v3/v3_ocsp.c',
	OSSL_ROOT .. 'crypto/x509v3/v3_pci.c',
	OSSL_ROOT .. 'crypto/x509v3/v3_pcia.c',
	OSSL_ROOT .. 'crypto/x509v3/v3_pcons.c',
	OSSL_ROOT .. 'crypto/x509v3/v3_pku.c',
	OSSL_ROOT .. 'crypto/x509v3/v3_pmaps.c',
	OSSL_ROOT .. 'crypto/x509v3/v3_prn.c',
	OSSL_ROOT .. 'crypto/x509v3/v3_purp.c',
	OSSL_ROOT .. 'crypto/x509v3/v3_scts.c',
	OSSL_ROOT .. 'crypto/x509v3/v3_skey.c',
	OSSL_ROOT .. 'crypto/x509v3/v3_sxnet.c',
	OSSL_ROOT .. 'crypto/x509v3/v3_utl.c',
	OSSL_ROOT .. 'crypto/x509v3/v3err.c',
	OSSL_ROOT .. 'engines/e_4758cca.c',
	OSSL_ROOT .. 'engines/e_aep.c',
	OSSL_ROOT .. 'engines/e_atalla.c',
	OSSL_ROOT .. 'engines/e_capi.c',
	OSSL_ROOT .. 'engines/e_chil.c',
	OSSL_ROOT .. 'engines/e_cswift.c',
	OSSL_ROOT .. 'engines/e_gmp.c',
	OSSL_ROOT .. 'engines/e_nuron.c',
	OSSL_ROOT .. 'engines/e_sureware.c',
	OSSL_ROOT .. 'engines/e_ubsec.c', 
}

local OSSL_FILES_NO_ASM = {
	OSSL_ROOT .. 'crypto/aes/aes_cbc.c',
	OSSL_ROOT .. 'crypto/aes/aes_core.c',
	OSSL_ROOT .. 'crypto/bf/bf_enc.c',
	OSSL_ROOT .. 'crypto/bn/bn_asm.c',
	OSSL_ROOT .. 'crypto/cast/c_enc.c',
	OSSL_ROOT .. 'crypto/camellia/camellia.c',
	OSSL_ROOT .. 'crypto/camellia/cmll_cbc.c',
	OSSL_ROOT .. 'crypto/camellia/cmll_misc.c',
	OSSL_ROOT .. 'crypto/des/des_enc.c',
	OSSL_ROOT .. 'crypto/des/fcrypt_b.c',
	OSSL_ROOT .. 'crypto/mem_clr.c',
	OSSL_ROOT .. 'crypto/rc4/rc4_enc.c',
	OSSL_ROOT .. 'crypto/rc4/rc4_skey.c',
	OSSL_ROOT .. 'crypto/whrlpool/wp_block.c'
}

local OSSL_FILES = mergeTables(OSSL_FILES_COMMON, OSSL_FILES_NO_ASM)

local OSSL_INCLUDES = {
	OSSL_ROOT,
	OSSL_ROOT .. "test/",
	OSSL_ROOT .. "crypto/",
	OSSL_ROOT .. "crypto/asn1",
	OSSL_ROOT .. "crypto/evp",
	OSSL_ROOT .. "crypto/modes",
	OSSL_ROOT .. "include/"
}

local OSSL_DEFINES = {}

if os.is("windows") then
	OSSL_DEFINES = mergeTables(OSSL_DEFINES, {
		"OPENSSL_SYSNAME_WIN32",
		"NO_WINDOWS_BRAINDEATH",
		"WIN32_LEAN_AND_MEAN"
	})
end

function projectInclude_openssl()
	return OSSL_ROOT .. "include/"
end

function projectExtraConfig_openssl()
	includedirs { OSSL_INCLUDES }
	defines { OSSL_DEFINES }
end

function projectAdd_openssl()
	addProject_3rdParty_lib("openssl", OSSL_FILES)
end


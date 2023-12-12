# https://samsclass.info/141/proj/pCH-ECB.htm
tux: 
	@eog tux.bmp

ecb:
	@python3 aes_ecb.py
	@eog tux_ecb.bmp

cbc:
	@python3 aes_cbc.py
	@eog tux_cbc.bmp
cgm:
	@python3 aes_cgm.py
	@eog tux_cgm.bmp


cycle: 
	@python3 crypt_decrypt.py 


clean: 
	@rm -f   tux_cbc.bmp  tux_cgm.bmp  tux_ecb.bmp *.bin 

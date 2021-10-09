   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  18                     	bsct
  19  0000               L3_flagTimer1:
  20  0000 0000          	dc.w	0
  21  0002               L5_flagUartRXNE:
  22  0002 00            	dc.b	0
  23  0003               L11_flagUartTXE:
  24  0003 00            	dc.b	0
1094                     ; 172 void RS485_Init( RS485_t_ptr rs485 )
1094                     ; 173 {
1096                     .text:	section	.text,new
1097  0000               _RS485_Init:
1099  0000 89            	pushw	x
1100  0001 89            	pushw	x
1101       00000002      OFST:	set	2
1104                     ; 174 	rs485->Flags.flags = 0;
1106  0002 6f21          	clr	(33,x)
1107                     ; 176 	BufferInit( &rs485->Buffer );
1110  0004 1c0012        	addw	x,#18
1111  0007 1f01          	ldw	(OFST-1,sp),x
1113                     ; 81 	buffer->Tx.buffer[0] = 0;
1115  0009 7f            	clr	(x)
1116                     ; 82 	buffer->Tx.buffer[1] = 0;
1118  000a 6f01          	clr	(1,x)
1119                     ; 83 	buffer->Tx.buffer[2] = 0;
1121  000c 6f02          	clr	(2,x)
1122                     ; 84 	buffer->Tx.buffer[3] = 0;
1124  000e 6f03          	clr	(3,x)
1125                     ; 85 	buffer->Tx.buffer[4] = 0;
1127  0010 6f04          	clr	(4,x)
1128                     ; 86 	buffer->Tx.buffer[5] = 0;
1130  0012 6f05          	clr	(5,x)
1131                     ; 87 	buffer->Tx.buffer[6] = 0;
1133  0014 6f06          	clr	(6,x)
1134                     ; 88 	buffer->Tx.buffer[7] = 0;
1136  0016 6f07          	clr	(7,x)
1137                     ; 89 	buffer->Tx.buffer[8] = 0;
1139  0018 6f08          	clr	(8,x)
1140                     ; 90 	buffer->Tx.buffer[9] = 0;
1142  001a 6f09          	clr	(9,x)
1143                     ; 91 	buffer->Tx.ptrBuffer = 0;
1145  001c 6f07          	clr	(7,x)
1146                     ; 93 	buffer->Rx.buffer[0] = 0;
1148  001e 6f08          	clr	(8,x)
1149                     ; 94 	buffer->Rx.buffer[1] = 0;
1151  0020 6f09          	clr	(9,x)
1152                     ; 95 	buffer->Rx.buffer[2] = 0;
1154  0022 6f0a          	clr	(10,x)
1155                     ; 96 	buffer->Rx.buffer[3] = 0;
1157  0024 6f0b          	clr	(11,x)
1158                     ; 97 	buffer->Rx.buffer[4] = 0;
1160  0026 6f0c          	clr	(12,x)
1161                     ; 98 	buffer->Rx.buffer[5] = 0;
1163  0028 6f0d          	clr	(13,x)
1164                     ; 99 	buffer->Rx.ptrBuffer = 0;
1166  002a 6f0e          	clr	(14,x)
1167                     ; 178 	Sujeto_Init( &rs485->Sujeto, &cbRS485_SetSubscriptor, 1 );
1169  002c 4b01          	push	#1
1170  002e ae0000        	ldw	x,#_cbRS485_SetSubscriptor
1171  0031 89            	pushw	x
1172  0032 1e06          	ldw	x,(OFST+4,sp)
1173  0034 1c0029        	addw	x,#41
1174  0037 cd0000        	call	_Sujeto_Init
1176  003a 5b03          	addw	sp,#3
1177                     ; 180 	rs485->Recibir = &cbRS485_Recibir;
1179  003c 1e03          	ldw	x,(OFST+1,sp)
1180  003e 90ae0000      	ldw	y,#_cbRS485_Recibir
1181  0042 ef23          	ldw	(35,x),y
1182                     ; 181 	rs485->Run = &cbRS485_Run;
1184  0044 90ae0000      	ldw	y,#_cbRS485_Run
1185  0048 ef27          	ldw	(39,x),y
1186                     ; 182 	rs485->Enviar = &cbRS485_Enviar;
1188  004a 90ae0000      	ldw	y,#_cbRS485_Enviar
1189  004e ef25          	ldw	(37,x),y
1190                     ; 184 	Nhal_UART_Init( &rs485->Config.UART );
1192  0050 cd0000        	call	_Nhal_UART_Init
1194                     ; 186 	rs485->Flags.bit.Inicializado = 1;
1196  0053 1e03          	ldw	x,(OFST+1,sp)
1197  0055 e621          	ld	a,(33,x)
1198                     ; 187 	rs485->Flags.bit.Standby = 1;
1200  0057 aa06          	or	a,#6
1201  0059 e721          	ld	(33,x),a
1202                     ; 188 	rs485->Error = RS485_SIN_FALLO;
1204  005b 6f22          	clr	(34,x)
1205                     ; 189 }
1208  005d 5b04          	addw	sp,#4
1209  005f 81            	ret	
1311                     ; 226 void cbRS485_Recibir( RS485_t_ptr rs485 )
1311                     ; 227 {
1312                     .text:	section	.text,new
1313  0000               _cbRS485_Recibir:
1315  0000 89            	pushw	x
1316  0001 520e          	subw	sp,#14
1317       0000000e      OFST:	set	14
1320                     ; 228 	if( getFlagUartRXNE( )  == ( RS485_BYTES_BUFFER_RX ) )
1322  0003 cd0000        	call	_getFlagUartRXNE
1324  0006 a106          	cp	a,#6
1325  0008 2677          	jrne	L157
1326                     ; 230 		rs485->Flags.bit.NuevaRecepcion = true;
1328  000a 1e0f          	ldw	x,(OFST+1,sp)
1329  000c e621          	ld	a,(33,x)
1330  000e a4fb          	and	a,#251
1331  0010 aa01          	or	a,#1
1332                     ; 231 		rs485->Flags.bit.Standby = false;
1334  0012 e721          	ld	(33,x),a
1335                     ; 233 		cogerDatosBufferRX( rs485 );
1338  0014 1f07          	ldw	(OFST-7,sp),x
1340                     ; 127 	tempBuffer = getBufferRX( );
1342  0016 96            	ldw	x,sp
1343  0017 1c0009        	addw	x,#OFST-5
1344  001a 89            	pushw	x
1345  001b cd0000        	call	_getBufferRX
1347  001e 85            	popw	x
1348                     ; 129 	rs485->Buffer.Rx.buffer[0] = tempBuffer.temp[0];
1350  001f 1e07          	ldw	x,(OFST-7,sp)
1351  0021 7b09          	ld	a,(OFST-5,sp)
1352  0023 e71a          	ld	(26,x),a
1353                     ; 130 	rs485->Buffer.Rx.buffer[1] = tempBuffer.temp[1];
1355  0025 7b0a          	ld	a,(OFST-4,sp)
1356  0027 e71b          	ld	(27,x),a
1357                     ; 131 	rs485->Buffer.Rx.buffer[2] = tempBuffer.temp[2];
1359  0029 7b0b          	ld	a,(OFST-3,sp)
1360  002b e71c          	ld	(28,x),a
1361                     ; 132 	rs485->Buffer.Rx.buffer[3] = tempBuffer.temp[3];
1363  002d 7b0c          	ld	a,(OFST-2,sp)
1364  002f e71d          	ld	(29,x),a
1365                     ; 133 	rs485->Buffer.Rx.buffer[4] = tempBuffer.temp[4];
1367  0031 7b0d          	ld	a,(OFST-1,sp)
1368  0033 e71e          	ld	(30,x),a
1369                     ; 134 	rs485->Buffer.Rx.buffer[5] = tempBuffer.temp[5];
1371  0035 7b0e          	ld	a,(OFST+0,sp)
1372  0037 e71f          	ld	(31,x),a
1373                     ; 235 		rs485->Buffer.Rx.ptrBuffer = 0;
1375  0039 1e0f          	ldw	x,(OFST+1,sp)
1376                     ; 237 		notificarObservadores( rs485 );
1379  003b 1f0c          	ldw	(OFST-2,sp),x
1380  003d 6f20          	clr	(32,x)
1382                     ; 110 	uint8_t auxiliar = 0;
1384  003f 0f0e          	clr	(OFST+0,sp)
1387  0041 2028          	jra	L757
1388  0043               L357:
1389                     ; 114 		if( rs485->Sujeto.Observadores[auxiliar]->TipoNotificacion == RECEPCION )
1391  0043 7b0e          	ld	a,(OFST+0,sp)
1392  0045 5f            	clrw	x
1393  0046 97            	ld	xl,a
1394  0047 58            	sllw	x
1395  0048 72fb0c        	addw	x,(OFST-2,sp)
1396  004b ee2b          	ldw	x,(43,x)
1397  004d f6            	ld	a,(x)
1398  004e 4a            	dec	a
1399  004f 2618          	jrne	L367
1400                     ; 116 			rs485->Sujeto.Observadores[auxiliar]->Notificacion( &rs485->Buffer.Rx );
1402  0051 1e0c          	ldw	x,(OFST-2,sp)
1403  0053 1c001a        	addw	x,#26
1404  0056 7b0e          	ld	a,(OFST+0,sp)
1405  0058 905f          	clrw	y
1406  005a 9097          	ld	yl,a
1407  005c 9058          	sllw	y
1408  005e 72f90c        	addw	y,(OFST-2,sp)
1409  0061 90ee2b        	ldw	y,(43,y)
1410  0064 90ee01        	ldw	y,(1,y)
1411  0067 90fd          	call	(y)
1413  0069               L367:
1414                     ; 118 		auxiliar = auxiliar + 1;
1416  0069 0c0e          	inc	(OFST+0,sp)
1418  006b               L757:
1419                     ; 112 	while( auxiliar < rs485->Sujeto.MaxSubscritos )
1421  006b 1e0c          	ldw	x,(OFST-2,sp)
1422  006d e62a          	ld	a,(42,x)
1423  006f 110e          	cp	a,(OFST+0,sp)
1424  0071 22d0          	jrugt	L357
1425                     ; 120 	auxiliar = 0;
1427                     ; 239 		rs485->Flags.bit.NuevaRecepcion = false;
1429  0073 1e0f          	ldw	x,(OFST+1,sp)
1430  0075 e621          	ld	a,(33,x)
1431  0077 a4fe          	and	a,#254
1432                     ; 240 		rs485->Flags.bit.Standby = true;
1434  0079 aa04          	or	a,#4
1435  007b e721          	ld	(33,x),a
1436                     ; 241 		setFlagUartRXNE( 0 );
1438  007d 4f            	clr	a
1439  007e cd0000        	call	_setFlagUartRXNE
1441  0081               L157:
1442                     ; 243 }
1445  0081 5b10          	addw	sp,#16
1446  0083 81            	ret	
1485                     ; 280 void cbRS485_Run( RS485_t_ptr rs485 )
1485                     ; 281 {
1486                     .text:	section	.text,new
1487  0000               _cbRS485_Run:
1489  0000 89            	pushw	x
1490       00000000      OFST:	set	0
1493                     ; 282 	cbRS485_Recibir( rs485 );
1495  0001 cd0000        	call	_cbRS485_Recibir
1497                     ; 283 	cbRS485_Enviar( rs485 );
1499  0004 1e01          	ldw	x,(OFST+1,sp)
1500  0006 cd0000        	call	_cbRS485_Enviar
1502                     ; 284 }
1505  0009 85            	popw	x
1506  000a 81            	ret	
1556                     ; 320 void cbRS485_SetSubscriptor( Sujeto_t_ptr sujeto, Observador_t_ptr observador )
1556                     ; 321 {
1557                     .text:	section	.text,new
1558  0000               _cbRS485_SetSubscriptor:
1560  0000 89            	pushw	x
1561       00000000      OFST:	set	0
1564                     ; 322 	if( sujeto->NumeroSuscritos < sujeto->MaxSubscritos )
1566  0001 f6            	ld	a,(x)
1567  0002 e101          	cp	a,(1,x)
1568  0004 241e          	jruge	L3301
1569                     ; 324 		if( sujeto->Observadores[sujeto->NumeroSuscritos]->Notificacion == NULL )
1571  0006 5f            	clrw	x
1572  0007 97            	ld	xl,a
1573  0008 58            	sllw	x
1574  0009 72fb01        	addw	x,(OFST+1,sp)
1575  000c ee02          	ldw	x,(2,x)
1576  000e e602          	ld	a,(2,x)
1577  0010 ea01          	or	a,(1,x)
1578  0012 2610          	jrne	L3301
1579                     ; 326 			sujeto->Observadores[sujeto->NumeroSuscritos] = observador;
1581  0014 1e01          	ldw	x,(OFST+1,sp)
1582  0016 f6            	ld	a,(x)
1583  0017 5f            	clrw	x
1584  0018 97            	ld	xl,a
1585  0019 58            	sllw	x
1586  001a 72fb01        	addw	x,(OFST+1,sp)
1587  001d 1605          	ldw	y,(OFST+5,sp)
1588  001f ef02          	ldw	(2,x),y
1589                     ; 327 			sujeto->NumeroSuscritos = sujeto->NumeroSuscritos + 1;
1591  0021 1e01          	ldw	x,(OFST+1,sp)
1592  0023 7c            	inc	(x)
1593  0024               L3301:
1594                     ; 330 }
1597  0024 85            	popw	x
1598  0025 81            	ret	
1653                     ; 367 void cbRS485_Enviar( RS485_t_ptr rs485 )
1653                     ; 368 {
1654                     .text:	section	.text,new
1655  0000               _cbRS485_Enviar:
1657  0000 89            	pushw	x
1658  0001 89            	pushw	x
1659       00000002      OFST:	set	2
1662                     ; 369 	if( rs485->Flags.bit.EnvioPreparado || rs485->Flags.bit.NuevoEnvio )
1664  0002 e621          	ld	a,(33,x)
1665  0004 a510          	bcp	a,#16
1666  0006 2604          	jrne	L1701
1668  0008 a508          	bcp	a,#8
1669  000a 275e          	jreq	L7601
1670  000c               L1701:
1671                     ; 371 		if( rs485->Buffer.Tx.ptrBuffer == 0 )
1673  000c e619          	ld	a,(25,x)
1674  000e 2622          	jrne	L3701
1675                     ; 373 			rs485->Flags.bit.NuevoEnvio = 1;
1677  0010 e621          	ld	a,(33,x)
1678  0012 a4fb          	and	a,#251
1679  0014 aa08          	or	a,#8
1680                     ; 374 			rs485->Flags.bit.Standby = 0;
1682  0016 e721          	ld	(33,x),a
1683                     ; 376 			UART_Limpiar_IT( TXE );
1685  0018 4f            	clr	a
1686  0019 cd0000        	call	_UART_Limpiar_IT
1688                     ; 378 			UART_Enviar_8( rs485->Buffer.Tx.buffer[rs485->Buffer.Tx.ptrBuffer] );
1690  001c 1e03          	ldw	x,(OFST+1,sp)
1691  001e e619          	ld	a,(25,x)
1692  0020 5f            	clrw	x
1693  0021 97            	ld	xl,a
1694  0022 72fb03        	addw	x,(OFST+1,sp)
1695  0025 e612          	ld	a,(18,x)
1696  0027 cd0000        	call	_UART_Enviar_8
1698                     ; 380 			rs485->Buffer.Tx.ptrBuffer = rs485->Buffer.Tx.ptrBuffer + 1;
1700  002a 1e03          	ldw	x,(OFST+1,sp)
1701                     ; 382 			UART_Habilitar_IT( TXE );
1703  002c 4f            	clr	a
1704  002d 6c19          	inc	(25,x)
1705  002f cd0000        	call	_UART_Habilitar_IT
1707  0032               L3701:
1708                     ; 385 		if( getFlagUartTXE( ) > 0 )
1710  0032 cd0000        	call	_getFlagUartTXE
1712  0035 4d            	tnz	a
1713  0036 2732          	jreq	L7601
1714                     ; 387 			UART_Enviar_8( rs485->Buffer.Tx.buffer[rs485->Buffer.Tx.ptrBuffer] );
1716  0038 1e03          	ldw	x,(OFST+1,sp)
1717  003a e619          	ld	a,(25,x)
1718  003c 5f            	clrw	x
1719  003d 97            	ld	xl,a
1720  003e 72fb03        	addw	x,(OFST+1,sp)
1721  0041 e612          	ld	a,(18,x)
1722  0043 cd0000        	call	_UART_Enviar_8
1724                     ; 389 			rs485->Buffer.Tx.ptrBuffer = rs485->Buffer.Tx.ptrBuffer + 1;
1726  0046 1e03          	ldw	x,(OFST+1,sp)
1727  0048 6c19          	inc	(25,x)
1728                     ; 393 			if( rs485->Buffer.Tx.ptrBuffer == ( RS485_BYTES_BUFFER_TX ) )
1730  004a e619          	ld	a,(25,x)
1731  004c a107          	cp	a,#7
1732  004e 2616          	jrne	L7701
1733                     ; 395 				rs485->Buffer.Tx.ptrBuffer = 0;
1735  0050 6f19          	clr	(25,x)
1736                     ; 397 				ResetFlagsEnvio( rs485 );
1739  0052 1f01          	ldw	(OFST-1,sp),x
1741                     ; 104 	rs485->Flags.bit.NuevoEnvio = 0;
1743  0054 e621          	ld	a,(33,x)
1744                     ; 105 	rs485->Flags.bit.EnvioPreparado = 0;
1746  0056 a4e7          	and	a,#231
1747                     ; 399 				rs485->Flags.bit.Standby = 1;
1749  0058 aa04          	or	a,#4
1750  005a e721          	ld	(33,x),a
1751                     ; 400 				UART_Limpiar_IT( TXE );
1753  005c 4f            	clr	a
1754  005d cd0000        	call	_UART_Limpiar_IT
1756                     ; 401 				UART_Deshabilitar_IT( TXE );
1758  0060 4f            	clr	a
1759  0061 cd0000        	call	_UART_Deshabilitar_IT
1762  0064 2004          	jra	L7601
1763  0066               L7701:
1764                     ; 405 				UART_Habilitar_IT( TXE );
1766  0066 4f            	clr	a
1767  0067 cd0000        	call	_UART_Habilitar_IT
1769  006a               L7601:
1770                     ; 409 }
1773  006a 5b04          	addw	sp,#4
1774  006c 81            	ret	
1787                     	xdef	_cbRS485_SetSubscriptor
1788                     	xdef	_cbRS485_Run
1789                     	xdef	_cbRS485_Enviar
1790                     	xdef	_cbRS485_Recibir
1791                     	xdef	_RS485_Init
1792                     	xref	_UART_Enviar_8
1793                     	xref	_UART_Deshabilitar_IT
1794                     	xref	_UART_Habilitar_IT
1795                     	xref	_UART_Limpiar_IT
1796                     	xref	_Nhal_UART_Init
1797                     	xref	_Sujeto_Init
1798                     	xref	_getFlagUartTXE
1799                     	xref	_setFlagUartRXNE
1800                     	xref	_getBufferRX
1801                     	xref	_getFlagUartRXNE
1820                     	end

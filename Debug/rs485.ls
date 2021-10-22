   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.3 - 05 Nov 2020
   3                     ; Generator (Limited) V4.5.1 - 29 Sep 2020
   4                     ; Optimizer V4.5.1 - 29 Sep 2020
  18                     	bsct
  19  0000               L3_flagTimer1:
  20  0000 0000          	dc.w	0
  21  0002               L5_flagTimer2:
  22  0002 0000          	dc.w	0
  23  0004               L7_flagUartRXNE:
  24  0004 00            	dc.b	0
  25  0005               L31_flagUartTXE:
  26  0005 00            	dc.b	0
1105                     ; 312 void RS485_Init( RS485_t_ptr rs485 )
1105                     ; 313 {
1107                     .text:	section	.text,new
1108  0000               _RS485_Init:
1110  0000 89            	pushw	x
1111  0001 89            	pushw	x
1112       00000002      OFST:	set	2
1115                     ; 314 	rs485->Flags.flags = 0;
1117  0002 6f21          	clr	(33,x)
1118                     ; 316 	BufferInit( &rs485->Buffer );
1121  0004 1c0012        	addw	x,#18
1122  0007 1f01          	ldw	(OFST-1,sp),x
1124                     ; 116 	buffer->Tx.buffer[0] = 0;
1126  0009 7f            	clr	(x)
1127                     ; 117 	buffer->Tx.buffer[1] = 0;
1129  000a 6f01          	clr	(1,x)
1130                     ; 118 	buffer->Tx.buffer[2] = 0;
1132  000c 6f02          	clr	(2,x)
1133                     ; 119 	buffer->Tx.buffer[3] = 0;
1135  000e 6f03          	clr	(3,x)
1136                     ; 120 	buffer->Tx.buffer[4] = 0;
1138  0010 6f04          	clr	(4,x)
1139                     ; 121 	buffer->Tx.buffer[5] = 0;
1141  0012 6f05          	clr	(5,x)
1142                     ; 122 	buffer->Tx.buffer[6] = 0;
1144  0014 6f06          	clr	(6,x)
1145                     ; 123 	buffer->Tx.buffer[7] = 0;
1147  0016 6f07          	clr	(7,x)
1148                     ; 124 	buffer->Tx.buffer[8] = 0;
1150  0018 6f08          	clr	(8,x)
1151                     ; 125 	buffer->Tx.buffer[9] = 0;
1153  001a 6f09          	clr	(9,x)
1154                     ; 126 	buffer->Tx.ptrBuffer = 0;
1156  001c 6f07          	clr	(7,x)
1157                     ; 128 	buffer->Rx.buffer[0] = 0;
1159  001e 6f08          	clr	(8,x)
1160                     ; 129 	buffer->Rx.buffer[1] = 0;
1162  0020 6f09          	clr	(9,x)
1163                     ; 130 	buffer->Rx.buffer[2] = 0;
1165  0022 6f0a          	clr	(10,x)
1166                     ; 131 	buffer->Rx.buffer[3] = 0;
1168  0024 6f0b          	clr	(11,x)
1169                     ; 132 	buffer->Rx.buffer[4] = 0;
1171  0026 6f0c          	clr	(12,x)
1172                     ; 133 	buffer->Rx.buffer[5] = 0;
1174  0028 6f0d          	clr	(13,x)
1175                     ; 134 	buffer->Rx.ptrBuffer = 0;
1177  002a 6f0e          	clr	(14,x)
1178                     ; 318 	Sujeto_Init( &rs485->Sujeto, &cbRS485_SetSubscriptor, 1 );
1180  002c 4b01          	push	#1
1181  002e ae0000        	ldw	x,#_cbRS485_SetSubscriptor
1182  0031 89            	pushw	x
1183  0032 1e06          	ldw	x,(OFST+4,sp)
1184  0034 1c0029        	addw	x,#41
1185  0037 cd0000        	call	_Sujeto_Init
1187  003a 5b03          	addw	sp,#3
1188                     ; 320 	rs485->Recibir = &cbRS485_Recibir;
1190  003c 1e03          	ldw	x,(OFST+1,sp)
1191  003e 90ae0000      	ldw	y,#_cbRS485_Recibir
1192  0042 ef23          	ldw	(35,x),y
1193                     ; 321 	rs485->Run = &cbRS485_Run;
1195  0044 90ae0000      	ldw	y,#_cbRS485_Run
1196  0048 ef27          	ldw	(39,x),y
1197                     ; 322 	rs485->Enviar = &cbRS485_Enviar;
1199  004a 90ae0000      	ldw	y,#_cbRS485_Enviar
1200  004e ef25          	ldw	(37,x),y
1201                     ; 324 	Nhal_UART_Init( &rs485->Config.UART );
1203  0050 cd0000        	call	_Nhal_UART_Init
1205                     ; 326 	rs485->Flags.bit.Inicializado = 1;
1207  0053 1e03          	ldw	x,(OFST+1,sp)
1208  0055 e621          	ld	a,(33,x)
1209                     ; 327 	rs485->Flags.bit.Standby = 1;
1211  0057 aa06          	or	a,#6
1212  0059 e721          	ld	(33,x),a
1213                     ; 328 	rs485->Error = RS485_SIN_FALLO;
1215  005b 6f22          	clr	(34,x)
1216                     ; 329 }
1219  005d 5b04          	addw	sp,#4
1220  005f 81            	ret	
1322                     ; 366 void cbRS485_Recibir( RS485_t_ptr rs485 )
1322                     ; 367 {
1323                     .text:	section	.text,new
1324  0000               _cbRS485_Recibir:
1326  0000 89            	pushw	x
1327  0001 520e          	subw	sp,#14
1328       0000000e      OFST:	set	14
1331                     ; 368 	if( getFlagUartRXNE( )  == ( RS485_BYTES_BUFFER_RX ) )
1333  0003 cd0000        	call	_getFlagUartRXNE
1335  0006 a106          	cp	a,#6
1336  0008 2677          	jrne	L757
1337                     ; 370 		rs485->Flags.bit.NuevaRecepcion = true;
1339  000a 1e0f          	ldw	x,(OFST+1,sp)
1340  000c e621          	ld	a,(33,x)
1341  000e a4fb          	and	a,#251
1342  0010 aa01          	or	a,#1
1343                     ; 371 		rs485->Flags.bit.Standby = false;
1345  0012 e721          	ld	(33,x),a
1346                     ; 373 		cogerDatosBufferRX( rs485 );
1349  0014 1f07          	ldw	(OFST-7,sp),x
1351                     ; 267 	tempBuffer = getBufferRX( );
1353  0016 96            	ldw	x,sp
1354  0017 1c0009        	addw	x,#OFST-5
1355  001a 89            	pushw	x
1356  001b cd0000        	call	_getBufferRX
1358  001e 85            	popw	x
1359                     ; 269 	rs485->Buffer.Rx.buffer[0] = tempBuffer.temp[0];
1361  001f 1e07          	ldw	x,(OFST-7,sp)
1362  0021 7b09          	ld	a,(OFST-5,sp)
1363  0023 e71a          	ld	(26,x),a
1364                     ; 270 	rs485->Buffer.Rx.buffer[1] = tempBuffer.temp[1];
1366  0025 7b0a          	ld	a,(OFST-4,sp)
1367  0027 e71b          	ld	(27,x),a
1368                     ; 271 	rs485->Buffer.Rx.buffer[2] = tempBuffer.temp[2];
1370  0029 7b0b          	ld	a,(OFST-3,sp)
1371  002b e71c          	ld	(28,x),a
1372                     ; 272 	rs485->Buffer.Rx.buffer[3] = tempBuffer.temp[3];
1374  002d 7b0c          	ld	a,(OFST-2,sp)
1375  002f e71d          	ld	(29,x),a
1376                     ; 273 	rs485->Buffer.Rx.buffer[4] = tempBuffer.temp[4];
1378  0031 7b0d          	ld	a,(OFST-1,sp)
1379  0033 e71e          	ld	(30,x),a
1380                     ; 274 	rs485->Buffer.Rx.buffer[5] = tempBuffer.temp[5];
1382  0035 7b0e          	ld	a,(OFST+0,sp)
1383  0037 e71f          	ld	(31,x),a
1384                     ; 375 		rs485->Buffer.Rx.ptrBuffer = 0;
1386  0039 1e0f          	ldw	x,(OFST+1,sp)
1387                     ; 377 		notificarObservadores( rs485 );
1390  003b 1f0c          	ldw	(OFST-2,sp),x
1391  003d 6f20          	clr	(32,x)
1393                     ; 215 	uint8_t auxiliar = 0;
1395  003f 0f0e          	clr	(OFST+0,sp)
1398  0041 2028          	jra	L567
1399  0043               L167:
1400                     ; 219 		if( rs485->Sujeto.Observadores[auxiliar]->TipoNotificacion == RECEPCION )
1402  0043 7b0e          	ld	a,(OFST+0,sp)
1403  0045 5f            	clrw	x
1404  0046 97            	ld	xl,a
1405  0047 58            	sllw	x
1406  0048 72fb0c        	addw	x,(OFST-2,sp)
1407  004b ee2b          	ldw	x,(43,x)
1408  004d f6            	ld	a,(x)
1409  004e 4a            	dec	a
1410  004f 2618          	jrne	L177
1411                     ; 221 			rs485->Sujeto.Observadores[auxiliar]->Notificacion( &rs485->Buffer.Rx );
1413  0051 1e0c          	ldw	x,(OFST-2,sp)
1414  0053 1c001a        	addw	x,#26
1415  0056 7b0e          	ld	a,(OFST+0,sp)
1416  0058 905f          	clrw	y
1417  005a 9097          	ld	yl,a
1418  005c 9058          	sllw	y
1419  005e 72f90c        	addw	y,(OFST-2,sp)
1420  0061 90ee2b        	ldw	y,(43,y)
1421  0064 90ee01        	ldw	y,(1,y)
1422  0067 90fd          	call	(y)
1424  0069               L177:
1425                     ; 223 		auxiliar = auxiliar + 1;
1427  0069 0c0e          	inc	(OFST+0,sp)
1429  006b               L567:
1430                     ; 217 	while( auxiliar < rs485->Sujeto.MaxSubscritos )
1432  006b 1e0c          	ldw	x,(OFST-2,sp)
1433  006d e62a          	ld	a,(42,x)
1434  006f 110e          	cp	a,(OFST+0,sp)
1435  0071 22d0          	jrugt	L167
1436                     ; 225 	auxiliar = 0;
1438                     ; 379 		rs485->Flags.bit.NuevaRecepcion = false;
1440  0073 1e0f          	ldw	x,(OFST+1,sp)
1441  0075 e621          	ld	a,(33,x)
1442  0077 a4fe          	and	a,#254
1443                     ; 380 		rs485->Flags.bit.Standby = true;
1445  0079 aa04          	or	a,#4
1446  007b e721          	ld	(33,x),a
1447                     ; 381 		setFlagUartRXNE( 0 );
1449  007d 4f            	clr	a
1450  007e cd0000        	call	_setFlagUartRXNE
1452  0081               L757:
1453                     ; 383 }
1456  0081 5b10          	addw	sp,#16
1457  0083 81            	ret	
1496                     ; 420 void cbRS485_Run( RS485_t_ptr rs485 )
1496                     ; 421 {
1497                     .text:	section	.text,new
1498  0000               _cbRS485_Run:
1500  0000 89            	pushw	x
1501       00000000      OFST:	set	0
1504                     ; 422 	cbRS485_Recibir( rs485 );
1506  0001 cd0000        	call	_cbRS485_Recibir
1508                     ; 423 	cbRS485_Enviar( rs485 );
1510  0004 1e01          	ldw	x,(OFST+1,sp)
1511  0006 cd0000        	call	_cbRS485_Enviar
1513                     ; 424 }
1516  0009 85            	popw	x
1517  000a 81            	ret	
1567                     ; 460 void cbRS485_SetSubscriptor( Sujeto_t_ptr sujeto, Observador_t_ptr observador )
1567                     ; 461 {
1568                     .text:	section	.text,new
1569  0000               _cbRS485_SetSubscriptor:
1571  0000 89            	pushw	x
1572       00000000      OFST:	set	0
1575                     ; 462 	if( sujeto->NumeroSuscritos < sujeto->MaxSubscritos )
1577  0001 f6            	ld	a,(x)
1578  0002 e101          	cp	a,(1,x)
1579  0004 241e          	jruge	L1401
1580                     ; 464 		if( sujeto->Observadores[sujeto->NumeroSuscritos]->Notificacion == NULL )
1582  0006 5f            	clrw	x
1583  0007 97            	ld	xl,a
1584  0008 58            	sllw	x
1585  0009 72fb01        	addw	x,(OFST+1,sp)
1586  000c ee02          	ldw	x,(2,x)
1587  000e e602          	ld	a,(2,x)
1588  0010 ea01          	or	a,(1,x)
1589  0012 2610          	jrne	L1401
1590                     ; 466 			sujeto->Observadores[sujeto->NumeroSuscritos] = observador;
1592  0014 1e01          	ldw	x,(OFST+1,sp)
1593  0016 f6            	ld	a,(x)
1594  0017 5f            	clrw	x
1595  0018 97            	ld	xl,a
1596  0019 58            	sllw	x
1597  001a 72fb01        	addw	x,(OFST+1,sp)
1598  001d 1605          	ldw	y,(OFST+5,sp)
1599  001f ef02          	ldw	(2,x),y
1600                     ; 467 			sujeto->NumeroSuscritos = sujeto->NumeroSuscritos + 1;
1602  0021 1e01          	ldw	x,(OFST+1,sp)
1603  0023 7c            	inc	(x)
1604  0024               L1401:
1605                     ; 470 }
1608  0024 85            	popw	x
1609  0025 81            	ret	
1664                     ; 507 void cbRS485_Enviar( RS485_t_ptr rs485 )
1664                     ; 508 {
1665                     .text:	section	.text,new
1666  0000               _cbRS485_Enviar:
1668  0000 89            	pushw	x
1669  0001 89            	pushw	x
1670       00000002      OFST:	set	2
1673                     ; 509 	if( rs485->Flags.bit.EnvioPreparado || rs485->Flags.bit.NuevoEnvio )
1675  0002 e621          	ld	a,(33,x)
1676  0004 a510          	bcp	a,#16
1677  0006 2604          	jrne	L7701
1679  0008 a508          	bcp	a,#8
1680  000a 275e          	jreq	L5701
1681  000c               L7701:
1682                     ; 511 		if( rs485->Buffer.Tx.ptrBuffer == 0 )
1684  000c e619          	ld	a,(25,x)
1685  000e 2622          	jrne	L1011
1686                     ; 513 			rs485->Flags.bit.NuevoEnvio = 1;
1688  0010 e621          	ld	a,(33,x)
1689  0012 a4fb          	and	a,#251
1690  0014 aa08          	or	a,#8
1691                     ; 514 			rs485->Flags.bit.Standby = 0;
1693  0016 e721          	ld	(33,x),a
1694                     ; 516 			UART_Limpiar_IT( TXE );
1696  0018 4f            	clr	a
1697  0019 cd0000        	call	_UART_Limpiar_IT
1699                     ; 518 			UART_Enviar_8( rs485->Buffer.Tx.buffer[rs485->Buffer.Tx.ptrBuffer] );
1701  001c 1e03          	ldw	x,(OFST+1,sp)
1702  001e e619          	ld	a,(25,x)
1703  0020 5f            	clrw	x
1704  0021 97            	ld	xl,a
1705  0022 72fb03        	addw	x,(OFST+1,sp)
1706  0025 e612          	ld	a,(18,x)
1707  0027 cd0000        	call	_UART_Enviar_8
1709                     ; 520 			rs485->Buffer.Tx.ptrBuffer = rs485->Buffer.Tx.ptrBuffer + 1;
1711  002a 1e03          	ldw	x,(OFST+1,sp)
1712                     ; 522 			UART_Habilitar_IT( TXE );
1714  002c 4f            	clr	a
1715  002d 6c19          	inc	(25,x)
1716  002f cd0000        	call	_UART_Habilitar_IT
1718  0032               L1011:
1719                     ; 525 		if( getFlagUartTXE( ) > 0 )
1721  0032 cd0000        	call	_getFlagUartTXE
1723  0035 4d            	tnz	a
1724  0036 2732          	jreq	L5701
1725                     ; 527 			UART_Enviar_8( rs485->Buffer.Tx.buffer[rs485->Buffer.Tx.ptrBuffer] );
1727  0038 1e03          	ldw	x,(OFST+1,sp)
1728  003a e619          	ld	a,(25,x)
1729  003c 5f            	clrw	x
1730  003d 97            	ld	xl,a
1731  003e 72fb03        	addw	x,(OFST+1,sp)
1732  0041 e612          	ld	a,(18,x)
1733  0043 cd0000        	call	_UART_Enviar_8
1735                     ; 529 			rs485->Buffer.Tx.ptrBuffer = rs485->Buffer.Tx.ptrBuffer + 1;
1737  0046 1e03          	ldw	x,(OFST+1,sp)
1738  0048 6c19          	inc	(25,x)
1739                     ; 533 			if( rs485->Buffer.Tx.ptrBuffer == ( RS485_BYTES_BUFFER_TX ) )
1741  004a e619          	ld	a,(25,x)
1742  004c a107          	cp	a,#7
1743  004e 2616          	jrne	L5011
1744                     ; 535 				rs485->Buffer.Tx.ptrBuffer = 0;
1746  0050 6f19          	clr	(25,x)
1747                     ; 537 				ResetFlagsEnvio( rs485 );
1750  0052 1f01          	ldw	(OFST-1,sp),x
1752                     ; 174 	rs485->Flags.bit.NuevoEnvio = 0;
1754  0054 e621          	ld	a,(33,x)
1755                     ; 175 	rs485->Flags.bit.EnvioPreparado = 0;
1757  0056 a4e7          	and	a,#231
1758                     ; 539 				rs485->Flags.bit.Standby = 1;
1760  0058 aa04          	or	a,#4
1761  005a e721          	ld	(33,x),a
1762                     ; 540 				UART_Limpiar_IT( TXE );
1764  005c 4f            	clr	a
1765  005d cd0000        	call	_UART_Limpiar_IT
1767                     ; 541 				UART_Deshabilitar_IT( TXE );
1769  0060 4f            	clr	a
1770  0061 cd0000        	call	_UART_Deshabilitar_IT
1773  0064 2004          	jra	L5701
1774  0066               L5011:
1775                     ; 545 				UART_Habilitar_IT( TXE );
1777  0066 4f            	clr	a
1778  0067 cd0000        	call	_UART_Habilitar_IT
1780  006a               L5701:
1781                     ; 549 }
1784  006a 5b04          	addw	sp,#4
1785  006c 81            	ret	
1798                     	xdef	_cbRS485_SetSubscriptor
1799                     	xdef	_cbRS485_Run
1800                     	xdef	_cbRS485_Enviar
1801                     	xdef	_cbRS485_Recibir
1802                     	xdef	_RS485_Init
1803                     	xref	_UART_Enviar_8
1804                     	xref	_UART_Deshabilitar_IT
1805                     	xref	_UART_Habilitar_IT
1806                     	xref	_UART_Limpiar_IT
1807                     	xref	_Nhal_UART_Init
1808                     	xref	_Sujeto_Init
1809                     	xref	_getFlagUartTXE
1810                     	xref	_setFlagUartRXNE
1811                     	xref	_getBufferRX
1812                     	xref	_getFlagUartRXNE
1831                     	end

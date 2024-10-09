CREATE DATABASE ecosys;

\c ecosys;

CREATE TABLE app_user (
	id int4 GENERATED BY DEFAULT AS IDENTITY( INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1 NO CYCLE) NOT NULL,
	country varchar(255) NULL,
	firstname varchar(255) NULL,
	lastname varchar(255) NULL,
	"password" varchar(255) NULL,
	"role" varchar(255) NULL,
	username varchar(255) NOT NULL,
	CONSTRAINT app_user_pkey PRIMARY KEY (id),
	CONSTRAINT app_user_role_check CHECK (((role)::text = ANY ((ARRAY['ADMIN'::character varying, 'USER'::character varying])::text[]))),
	CONSTRAINT uk3k4cplvh82srueuttfkwnylq0 UNIQUE (username)
);

CREATE TABLE manifiestos (
    id SERIAL PRIMARY KEY,
    folio INT NOT NULL,
    folio_dia INT, 
    fecha_manifiesto DATE,
    cliente VARCHAR(50),
    tipo_disposicion VARCHAR(50),
    num_economico INT, 
    placa VARCHAR(20),
    operador VARCHAR(75),
    ruta VARCHAR(100),
    tipo_servicio VARCHAR (50),
    archivo BYTEA,
    usuario_id INT,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    cliente VARCHAR(-1) NOT NULL,
    clave_sedema VARCHAR(100) NOT NULL,
    domicilio VARCHAR(100) NOT NULL,
    telefono VARCHAR(15),
    ciudad VARCHAR(20),
    cp INT NOT NULL
);

CREATE TABLE destino (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    clave_sedema VARCHAR(100) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    telefono VARCHAR(15),
    ciudad VARCHAR(20),
    cp INT NOT NULL
);

CREATE TABLE operadores (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(75) NOT NULL,
    licencia VARCHAR(20) NOT NULL
);

CREATE TABLE folios(
    id SERIAL PRIMARY KEY,
    empresa VARCHAR(100) NOT NULL,
    folio VARCHAR(20) NOT NULL
);

INSERT INTO clientes (cliente, clave_sedema, domicilio, telefono, ciudad, cp) VALUES ('ADMINISTRACION  DEL SISTEMA PORTUARIO NACIONAL VERACRUZ, S.A. DE C.V.', 'SEDEMA/GRME-API931215CSA-19/435', 'AV. MARINA MERCANTE No. 210, SEPTIMO PISO, COL. CENTRO', 'NULL', 'VERACRUZ,VER.', 91700);
INSERT INTO clientes (cliente, clave_sedema, domicilio, telefono, ciudad, cp) VALUES ('AGROINDUSTRIAS DE CORDOBA S.A DE C.V GRANJA AVICOLA EL RESPLANDOR II', 'SEDEMA/GRME-ACO031110RIA-2023/242', 'KM 87 CAMINO DE TERRACERIA RESPLANDOR-CASAS BLANCAS EJIDO LA CAMPANA', 'NULL', 'TIERRA BLANCA VERACRUZ', 95209);
INSERT INTO clientes (cliente, clave_sedema, domicilio, telefono, ciudad, cp) VALUES ('AGROINDUSTRIAS DE CORDOBA S.A DE C.V GRANJA AVICOLA EL DOLAR', 'SEDEMA/GRME-ACO03110RIA-2023/240', 'KM 7.5 CARRETERA TIERRA BLANCA- EL JICARO', 'NULL', 'TIERRA BLANCA VERACRUZ', 95215);
INSERT INTO clientes (cliente, clave_sedema, domicilio, telefono, ciudad, cp) VALUES ('AKWEL ORIZABA MEXICO S.A DE CV', 'SEDEMA/GRME-CRP950711HK7-18/1171', 'AV REFORMA No 745 COL POTRERILLO', '7242855', 'IXTACZOQUITLAN VER', 94450);
INSERT INTO clientes (cliente, clave_sedema, domicilio, telefono, ciudad, cp) VALUES ('ALBAOSA S.A. DE C.V.', 'ALB06010338C0-2021/2215', 'SUR 11 2101 COL. CENTRO', 'NULL', 'ORIZABA, VER.', 94300);
INSERT INTO clientes (cliente, clave_sedema, domicilio, telefono, ciudad, cp) VALUES ('ALIMEXA S.A. DE C.V.', 'SEDEMA/ALI960427PE0-835/14', 'CARRETERA FEDERAL 140, XALAPA- VERACRUZ KM 18 LOCALIDAD CORRAL FALSO, EMILIANO ZAPATA', 'NULL', 'EMILIANO ZAPATA, VERACRUZ', 91680);
INSERT INTO clientes (cliente, clave_sedema, domicilio, telefono, ciudad, cp) VALUES ('BARRADAS REFRIGERACION COMERCIAL S.A. DE C.V.', 'SEDEMA/GRME-BRC0109073DO-2023/372', 'CARRETERA FEDERAL XALAPA-VERACRUZ KM 16 S/N LOCALIDAD MIRADORES DEL MAR', 'NULL', 'EMILIANO ZAPATA, VERACRUZ', 91640);
INSERT INTO clientes (cliente, clave_sedema, domicilio, telefono, ciudad, cp) VALUES ('BELLOTA MEXICO S.A DE C.V', 'SEDEMA/GRME-BME9209917PE2-2019/518', 'PROLONGACION AV. 16, CARRETERA FORTIN-HUATUSCO KM 1 ESQUINA No 400 COL.RICARDO BALLINAS', 'NULL', 'FORTIN DE LAS FLORES VERACRUZ', 94472);
INSERT INTO clientes (cliente, clave_sedema, domicilio, telefono, ciudad, cp) VALUES ('BEREQUAT, S.A. DE C.V.', 'SEDEMA/GRME-BER111027HC4-2023/482', 'BLVD. CORDOBA-PEÑUELA KM 343.5 NO. 8540, INT. B, RANCHO NUEVO', 'NULL', 'CORDOBA, VERACRUZ', 94696);
INSERT INTO clientes (cliente, clave_sedema, domicilio, telefono, ciudad, cp) VALUES ('BIO PAPPEL SCRIBE S.A. DE C.V.', 'GRME-GPS 031229372-17/250', 'AV. SAN JUAN N° 155 CONGREGACION ESCAMELA', 'NULL', 'IXTACZOQUITLAN VERACRUZ', 94452);
INSERT INTO clientes (cliente, clave_sedema, domicilio, telefono, ciudad, cp) VALUES ('BUGA PAPPER PRODUCTS S.A DE C.V', 'SEDEMA/GRME-BPP1010207U8-2022/0226', 'COLON ORIENTE S/N ESQ NORTE 34 COL CENTRO', 'NULL', 'ORIZABA VERACRUZ', 94300);
INSERT INTO clientes (cliente, clave_sedema, domicilio, telefono, ciudad, cp) VALUES ('CAFES BASA DE CORDOBA S.A. DE C.V.', 'GRME CBC790409N65-2022/0219', 'PARQUE INDUSTRIAL ATOYAQUILLO L1 PARAJE NUEVO', '27148515', 'CORDOBA ', 94949);
INSERT INTO clientes (cliente, clave_sedema, domicilio, telefono, ciudad, cp) VALUES ('CAFIVER S.A DE C.V', 'SEDEMA/GRME-CAF820619U79-2021/2239', 'CAMINO A POTRERILLO FRACC OJO DE AGUA S/N LOCALIDAD OJO DE AGUA', 'NULL', 'IXTACZOQUITLAN VER', 94450);
INSERT INTO clientes (cliente, clave_sedema, domicilio, telefono, ciudad, cp) VALUES ('CENTRAL EL POTRERO', 'SEDEMA/GRME-CPO160823C66-2020/949', 'CALLE PRINCIPAL S/N COL. CENTRO', '2737350311', 'ATOYAC', 94965);
INSERT INTO clientes (cliente, clave_sedema, domicilio, telefono, ciudad, cp) VALUES ('CENTRAL EL PROGRESO S.A. DE C.V.', 'SEDEMA/GRME-CPR810827R86-2022/0148', 'DOMICILIO CONOCIDO S/N MATA DEL GAYO', 'NULL', 'PASO DEL MACHO, VER.', 99970);
INSERT INTO clientes (cliente, clave_sedema, domicilio, telefono, ciudad, cp) VALUES ('CENTRAL SAN MIGUELITO S.A. DE C.V.', 'SEDEMA/GRME-CSM160823BZ1-2022/0228', 'CARRETERA CORDOBA-AMATLAN S/N ENTRE AV. 39 Y BOULEVARD 5 DE MAYO COL. SAN MIGUELITO', '2717141222', 'CORDOBA, VERACRUZ', 94680);
INSERT INTO clientes (cliente, clave_sedema, domicilio, telefono, ciudad, cp) VALUES ('CERVECERIA CUAUHTEMOC MOCTEZUMA, S.A DE C.V', 'SEDEMA/GRME-CCM080101IL8593-18/1165', 'CALLE SUR 10 Y PONIENTE 9 S/N COL. CENTRO', 'NULL', 'ORIZABA VER', 94300);
INSERT INTO clientes (cliente, clave_sedema, domicilio, telefono, ciudad, cp) VALUES ('DESARROLLADORA CARPIN S.A. DE C.V', 'SEDEMA/GRME-AAA850730TR7-19/379', 'CONSTRUCCION DEL FRACCIONAMIENTO CABO ALTO', 'NULL', 'TUXPAN, VERACRUZ', 92783);
INSERT INTO clientes (cliente, clave_sedema, domicilio, telefono, ciudad, cp) VALUES ('DESARROLLADORA CARPIN S.A. DE C.V.', 'GRME-AAA850730TR7-2021/1988', 'CONSTRUCCION DEL FRACCIONAMIENTO LAS COLINAS', 'NULL', 'XALAPA', 91194);
INSERT INTO clientes (cliente, clave_sedema, domicilio, telefono, ciudad, cp) VALUES ('DESARROLLADORA CARPIN S.A DE C.V', 'SEDEMA/DGCCEA/O001568/2022', 'AVENIDA VILLAS DE FORTIN N°375 PASO AGUSTIN', 'NULL', 'FORTIN DE LAS FLORES VERACRUZ', 94473);
INSERT INTO clientes (cliente, clave_sedema, domicilio, telefono, ciudad, cp) VALUES ('DESARROLLADORA CARPIN S.A. DE C.V', 'GRME-AAA850730TR7-19/368', 'CONSTRUCCION DEL FRACCIONAMIENTO SANTA ANA BOCA', 'NULL', 'BOCA DEL RIO ', 94286);
INSERT INTO clientes (cliente, clave_sedema, domicilio, telefono, ciudad, cp) VALUES ('DESARROLLADORA CARPIN S.A. DE C.V.', 'GRME-AAA850730TR7-19/373', 'CONSTRUCCION DEL FRACCIONAMIENTO TERRANOVA', 'NULL', 'XALAPA', 91637);
INSERT INTO clientes (cliente, clave_sedema, domicilio, telefono, ciudad, cp) VALUES ('DESARROLLADORA CARPIN S.A. DE C.V', 'GRME-AAA850730TR7-19/380', 'CONSTRUCCION DEL FRACCIONAMIENTO VALLE ALEGRE', 'NULL', 'IXTACZOQUITLAN', 94642);
INSERT INTO clientes (cliente, clave_sedema, domicilio, telefono, ciudad, cp) VALUES ('DIGITOP S.A. DE C.V.', 'EN TRAMITE N 013852', 'CARRETERA XALAPA- VERACRUZ KM 16 LOC.MIRADORES DEL MAR', 'NULL', 'EMILIANO ZAPATA VERACRUZ', 91640);
INSERT INTO clientes (cliente, clave_sedema, domicilio, telefono, ciudad, cp) VALUES ('EDITH MARIA ANTONIETA RODRIGUEZ CASTILLO', 'EN TAMITE', ' AVENIDA OTE 6  NO. 679 ENTRE CALLE SUR 13 COLONIA ORIZABA CENTRO', 'NULL', 'ORIZABA, VERACRUZ', 94300);
INSERT INTO clientes (cliente, clave_sedema, domicilio, telefono, ciudad, cp) VALUES ('EXPORTADORA DE CAFE CALIFORNIA S.A DE C.V', 'SEDEMA/GRME-ECC94020996A-2023/187', 'ALVARO OBREGON ESQUINA 5 DE MAYO VI CALLE CUAUHTEMOC Y AV. 5 DE MAYO S/N  COL. SUMIDERO', 'NULL', 'IXTACZOQUITLAN, VERACRUZ', 94463);
INSERT INTO clientes (cliente, clave_sedema, domicilio, telefono, ciudad, cp) VALUES ('FERMENTACIONES MEXICANAS S.A. DE C.V.', 'SEDEMA/GRME-FME750221AP0-2020/1337', 'AV. BENITO JUAREZ No 11 COL. POTRERILLO PUEBLO', '2727210040', 'IXTACZOQUITLAN, VERACRUZ', 94450);
INSERT INTO clientes (cliente, clave_sedema, domicilio, telefono, ciudad, cp) VALUES ('FERTILIZANTES TEPEYAC S.A. DE C.V.', 'EN TRAMITE', 'CARR. COATZACOALCOS-VILLAHERMOSA KM 4.2', 'NULL', 'COATZACOALCOS, VERACRUZ', 0);
INSERT INTO clientes (cliente, clave_sedema, domicilio, telefono, ciudad, cp) VALUES ('FERTILIZANTES TEPEYAC S.A. DE C.V.', 'EN TRAMITE', 'CARRETERA TAMARINDO-CARDEL KM 2.5 CONGREGACION CHICHICAXTLE', 'NULL', 'JOSE CARDEL', 91656);
INSERT INTO clientes (cliente, clave_sedema, domicilio, telefono, ciudad, cp) VALUES ('FIDEICOMISO85101771BIM-GOLF JALAPA', 'SEDEMA/GRME-SAFC4911037R9-2021/2136', 'DESVIACION CARRETERA XALAPA- VERACRUZ KM 13.5 S/N COL. CENTRO LOC. MIRADORES DEL MAR, EMILIANO ZAPATA, VER.', 'NULL', 'XALAPA, VER.', 91640);
INSERT INTO clientes (cliente, clave_sedema, domicilio, telefono, ciudad, cp) VALUES ('FIDEICOMISO DEL SISTEMA DE AGUAS RESIDUALES DEL ALTO RIO BLANCO', 'SEDEMA/GRME-FSA910423H85-19/253', 'NORTE 15 No. 1 ESQ. DIAZ MIRON, COLONIA CENTRO IXTACZOQUITLAN', '272 72 1 16 00', 'IXTACZOQUITLAN VERACRUZ', 94450);
INSERT INTO clientes (cliente, clave_sedema, domicilio, telefono, ciudad, cp) VALUES ('FUNDICION Y MECANICA SUSANO SOLIS S.A. DE C.V.', 'GRME-FMS750424ME1-17/394', 'AV. ORIENTE 4 555', '2727242964', 'ORIZABA', 94300);
INSERT INTO clientes (cliente, clave_sedema, domicilio, telefono, ciudad, cp) VALUES ('GRUPO CONSTRUCTO, S.A. DE C.V. "TALLER DE LIMPIEZA Y PINTURA  EN HUILOAPAN"', 'SEDEMA/GRME-GCO770202A59-2021/2290', 'AUTOPISTA VERACRUZ-PUEBLA KM. 270, LOTE 9, LOCALIDAD SAN CRISTOBAL', 'NULL', 'HUILOAPAN, VER.', 94780);
INSERT INTO clientes (cliente, clave_sedema, domicilio, telefono, ciudad, cp) VALUES ('GRUPO DECME S.A. DE C.V.', 'SEDEMA/GRME-GDE0812042J1-2022/0052', 'AV. 11 ENTRE CALLE 22 Y 24 No. 2223 COL. DEL MAESTRO', '2711246673', 'CORDOBA, VERACRUZ', 94550);
INSERT INTO clientes (cliente, clave_sedema, domicilio, telefono, ciudad, cp) VALUES ('GRUPO INDUSTRIAL PARISSI S.A. DE C.V.', 'SEDEMA/GRME-GIP010702IE5-2023/483', 'BLVD. CORDOBA-PEÑUELA KM 343.5 NO.8540, RANCHO NUEVO', 'NULL', 'CORDOBA, VERACRUZ', 94696);
INSERT INTO clientes (cliente, clave_sedema, domicilio, telefono, ciudad, cp) VALUES ('HABITAT PROMOTORA Y CONSTRUCTORA DE CIUDADES S.A. DE C.V.', 'GRME-HPC020706AQ8-2020/1182', 'CONSTRUCCION DE FRACCIONAMIENTO LOMAS DE SAN PABLO', 'NULL', 'RIO BLANCO, VERACRUZ', 0);
INSERT INTO clientes (cliente, clave_sedema, domicilio, telefono, ciudad, cp) VALUES ('INDUSTRIAS CHAHIN DE ORIZABA S.A DE C.V', 'SEDEMA/GRME-ICO8407027P3-2022/0207', 'SUR 25 No 650 COL. CENTRO', '2727244800', 'ORIZABA', 94300);
INSERT INTO clientes (cliente, clave_sedema, domicilio, telefono, ciudad, cp) VALUES ('INDUSTRIA  DE PRODUCTOS  PETROLEROS S.A. DE C.V.', 'SEDEMA/GRME-IPP040803BC5-2024/43', 'CALLE 21 NO. 524 COLONIA CENTRO', 'NULL', 'CORDOBA, VERACRUZ', 94500);
INSERT INTO clientes (cliente, clave_sedema, domicilio, telefono, ciudad, cp) VALUES ('INGENIO AZUCARERO MODELO S.A. DE C.V.', 'SEDEMA/GRME-ISS470710CC2-18/919', 'SALVADOR ESQUER No. 9 COL. EL MODELO LA ANTIGUA VER.', 'NULL', 'CARDEL, VERACRUZ', 91685);
INSERT INTO clientes (cliente, clave_sedema, domicilio, telefono, ciudad, cp) VALUES ('INGENIO CENTRAL LA PROVIDENCIA S.A DE C.V.', 'REGRMECPR151218KY-17/166', 'CALLE 3 S/N ENTRE AV. LIBERTADORES E IGUALDAD COL. CENTRO', '2787330110', 'CUICHAPA VERACRUZ', 94920);
INSERT INTO clientes (cliente, clave_sedema, domicilio, telefono, ciudad, cp) VALUES ('INGENIO CONSTANCIA', 'SEDEMA/ICO791108KK5-1676/14', 'CALLE SAAVEDRA S/N', '2787322200', 'TEZONAPA, VERACRUZ', 95095);
INSERT INTO clientes (cliente, clave_sedema, domicilio, telefono, ciudad, cp) VALUES ('JOSE ANTONIO RAMIREZ COETO', 'SEDEMA/AARME-RACA790315LJ6-2023/0054', 'HEROES DE CHAPULTEPEC 1 B COL. BARRIO NUEVO', '777 420 33 77', 'ORIZABA VER', 94340);
INSERT INTO clientes (cliente, clave_sedema, domicilio, telefono, ciudad, cp) VALUES ('KIMBERLY CLARK DE MEXICO, SAB  DE CV', 'KCM810226DEA-1974/16', 'AV. SAN JUAN N° 1 COL. ESCAMELA', 'NULL', 'IXTACZOQUITLAN, VER.', 94452);
INSERT INTO clientes (cliente, clave_sedema, domicilio, telefono, ciudad, cp) VALUES ('LAMINA Y PLACA COMERCIAL S.A. DE C.V.', 'GRME-LPC990316N43-2021/1749', 'CARRETERA FEDERAL CORDOBA-VERACRUZ S/N COL. VENTA PARADA', '2717166595', 'AMATLAN DE LOS REYES', 94946);
INSERT INTO clientes (cliente, clave_sedema, domicilio, telefono, ciudad, cp) VALUES ('NUEVA GALLETERA VERACRUZANA S.A. DE C.V.', 'GRME-NGV8312273D0-1982/16', 'FRATERNIDAD 265 COL. UNIDAD VERACRUZANA', 'NULL', 'VERACRUZ', 91859);
INSERT INTO clientes (cliente, clave_sedema, domicilio, telefono, ciudad, cp) VALUES ('PROLIMP DEL CENTRO S.A. DE C.V.', 'GRME-PCE9104014L7-2021/1999', 'BLVD. FERNANDO GUITERREZ BARRIOS LOTE 19, BODEGA 3', 'NULL', 'IXTACZOQUITLAN, VER.', 94450);
INSERT INTO clientes (cliente, clave_sedema, domicilio, telefono, ciudad, cp) VALUES ('ROVIANDA S.A.P.I. DE C.V.', 'SEDEMA/ROV8607056P8-2288/15', 'AV. 1 No. 5, ESQ. CALLE 1 CONGREGACION DONATO GUERRA PARQUE INDUSTRIAL VALLE DE ORIZABA', 'NULL', 'HUILOAPAN DE CUAUHTEMOC, VER.', 94780);
INSERT INTO clientes (cliente, clave_sedema, domicilio, telefono, ciudad, cp) VALUES ('SIGNODE MEXICO, S. DE R.L. DE C.V', 'SEDEMA/ISM9804026WA-567/15', 'CARRETERA ESTATAL COR-VER KM 3.4 LOTE 32 Y 33 PARQUE INDUSTRIAL PARAJE NUEVO', 'NULL', 'AMATLAN DE LOS REYES', 94940);
INSERT INTO clientes (cliente, clave_sedema, domicilio, telefono, ciudad, cp) VALUES ('SILICES DE VERACRUZ S.A DE C.V.', 'SEDEMA/GRME-SVE770906NS5-17/232', 'AV. FERROCARRIL S/N ENTRE CALLE MELCHOR OCAMPO Y 20 DE NOVIEMBRE', 'NULL', 'NOGALES, VERACRUZ', 94720);
INSERT INTO clientes (cliente, clave_sedema, domicilio, telefono, ciudad, cp) VALUES ('SILICES DE VERACRUZ S.A DE C.V.', 'SEDEMA/GRME-SVE770906NS5-17/233', 'AV. PONIENTE 9 No. 888, COL. CENTRO', '272728200', 'ORIZABA', 94300);
INSERT INTO clientes (cliente, clave_sedema, domicilio, telefono, ciudad, cp) VALUES ('TA 2000 S.A DE C.V', 'SEDedEMA/GRME-TDM991012M33/2020/748', 'CARRETERA FEDERAL MEX-VER KM 321 INT 2', '2727210588', 'IXTACZOQUITLAN', 94450);
INSERT INTO clientes (cliente, clave_sedema, domicilio, telefono, ciudad, cp) VALUES ('TALLERES PEBSA S.A. DE C.V.', 'GRME-TPE071213PZ9-2021/1675', 'AV. 53 1120 ENTRE CALLES 11 Y 13 COL. ZACATEPEC', '2717125589', 'CORDOBA, VERACRUZ', 94650);
INSERT INTO clientes (cliente, clave_sedema, domicilio, telefono, ciudad, cp) VALUES ('TENERIA COMPANY S.A DE C.V', 'GRME-TCO500403LB8-17/805', 'AV. ORIENTE 12 103 COL. CENTRO', '2727250701', 'ORIZABA, VER', 94300);
INSERT INTO clientes (cliente, clave_sedema, domicilio, telefono, ciudad, cp) VALUES ('TENERIA COMPANY S.A DE C.V', 'GRME/TCO500403LB8-1651/15', 'PARQUE INDUSTRIAL AVENIDA 1 3', 'NULL', 'IXTACZOQUITLAN, VER.', 94450);

INSERT INTO destino (nombre, clave_sedema, direccion, telefono, ciudad, cp) VALUES ('GEOCYCLE MEXICO S.A. DE C.V.', 'SEDEMA/ARTRME-ECO930716HM7-17/081', 'BLVD. FERNANDO GUITERREZ BARRIOS NO. 2931 COL. CRUZ VERDE', 'NULL', 'IXTACZOQUITLAN, VERACRUZ.', 94450);
INSERT INTO destino (nombre, clave_sedema, direccion, telefono, ciudad, cp) VALUES ('JOSE ANTONIO RAMIREZ COETO', 'SEDEMA/AARME-RACA790315LJ6-2023/0054', 'HEROES DE CHAPULTEPEC 1 B COL. BARRIO NUEVO', '7774203377', 'ORIZABA, VERACRUZ', 94340);
INSERT INTO destino (nombre, clave_sedema, direccion, telefono, ciudad, cp) VALUES ('JOSE ANTONIO RAMIREZ COETO', 'SEDEMA/ARTRME-RACA790315LJ6-2020/874', 'PARCELA No 105 Z-1 P2/2 EJIDO MOYOAPAN ', '7774203377', 'IXTACZOQUITLAN, VERACRUZ.', 94455);
INSERT INTO destino (nombre, clave_sedema, direccion, telefono, ciudad, cp) VALUES ('MATERIALES OCONIT S.A. DE C.V.', 'CONVENIO PMA03/2022', 'AUTOPISTA MEXICO-VERACRUZ KM 258 LOCALIDAD ESPERANZA', '2727842740', 'NOGALES, VERACRUZ.', 94724);
INSERT INTO destino (nombre, clave_sedema, direccion, telefono, ciudad, cp) VALUES ('PROCESADORA DE RESIDUOS VERACRUZANOS S.A DE C.V.', 'DGCC/OFICIO N°6527/2018', 'EX HACIENDA EL CONTINENTE, LOCALIDAD EL GUAYABO', 'NULL', 'MEDELLIN BRAVO, VERACRUZ.', 94283);

INSERT INTO operadores(nombre, licencia) VALUES ('ARCADIO OSORIO HERNANDEZ','UB0633IK7');
INSERT INTO operadores(nombre, licencia) VALUES ('FLAVIO CESAR ARENAS FLORES','UB063ECO5');
INSERT INTO operadores(nombre, licencia) VALUES ('JORGE SANCHEZ QUIRINO','UB0638H12');
INSERT INTO operadores(nombre, licencia) VALUES ('MARTIN OSORIO HERNANDEZ','VER0403041');

INSERT INTO folios(empresa, folio) VALUES ('ADMINISTRACION  DEL SISTEMA PORTUARIO NACIONAL VERACRUZ, S.A. DE C.V.', '3-2024');
INSERT INTO folios(empresa, folio) VALUES ('AGROINDUSTRIAS DE CORDOBA S.A DE C.V GRANJA AVICOLA EL RESPLANDOR II', 'NO SE HAN HECHO MANIFIESTOS');
INSERT INTO folios(empresa, folio) VALUES ('AGROINDUSTRIAS DE CORDOBA S.A DE C.V GRANJA AVICOLA EL DOLAR', 'NO SE HAN HECHO MANIFIESTOS');
INSERT INTO folios(empresa, folio) VALUES ('AKWEL ORIZABA MEXICO S.A DE CV', 'NO SE HAN HECHO MANIFIESTOS');
INSERT INTO folios(empresa, folio) VALUES ('ALBAOSA S.A. DE C.V.', '4-2024');
INSERT INTO folios(empresa, folio) VALUES ('ALIMEXA S.A. DE C.V.', '14-2024');
INSERT INTO folios(empresa, folio) VALUES ('BARRADAS REFRIGERACION COMERCIAL S.A. DE C.V.', '6-2024');
INSERT INTO folios(empresa, folio) VALUES ('BELLOTA MEXICO S.A DE C.V', '12-2024');
INSERT INTO folios(empresa, folio) VALUES ('BEREQUAT, S.A. DE C.V.', '3-2024');
INSERT INTO folios(empresa, folio) VALUES ('BIO PAPPEL SCRIBE S.A. DE C.V.', '60-2024');
INSERT INTO folios(empresa, folio) VALUES ('BUGA PAPPER PRODUCTS S.A DE C.V', 'NO SE HAN HECHO MANIFIESTOS');
INSERT INTO folios(empresa, folio) VALUES ('CAFES BASA DE CORDOBA S.A. DE C.V.', '11-2024');
INSERT INTO folios(empresa, folio) VALUES ('CAFIVER S.A DE C.V', 'NO SE HAN HECHO MANIFIESTOS');
INSERT INTO folios(empresa, folio) VALUES ('CENTRAL EL POTRERO', '29-2024');
INSERT INTO folios(empresa, folio) VALUES ('CENTRAL EL PROGRESO S.A. DE C.V.', '17-2024');
INSERT INTO folios(empresa, folio) VALUES ('CENTRAL SAN MIGUELITO S.A. DE C.V.', '11-2024');
INSERT INTO folios(empresa, folio) VALUES ('CERVECERIA CUAUHTEMOC MOCTEZUMA, S.A DE C.V', '41-2024');
INSERT INTO folios(empresa, folio) VALUES ('DESARROLLADORA CARPIN S.A. DE C.V (CABO ALTO)', '4-2024');
INSERT INTO folios(empresa, folio) VALUES ('DESARROLLADORA CARPIN S.A. DE C.V. (LAS COLINAS)', '31-2024');
INSERT INTO folios(empresa, folio) VALUES ('DESARROLLADORA CARPIN S.A. DE C.V. (FORTIN)', '6-2024');
INSERT INTO folios(empresa, folio) VALUES ('DESARROLLADORA CARPIN S.A. DE C.V. (SANTA ANA BOCA)', '11-2024');
INSERT INTO folios(empresa, folio) VALUES ('DESARROLLADORA CARPIN S.A. DE C.V. (TERRANOVA)', '25-2024');
INSERT INTO folios(empresa, folio) VALUES ('DESARROLLADORA CARPIN S.A. DE C.V. (VALLE ALEGRE)', '10-2024');
INSERT INTO folios(empresa, folio) VALUES ('DIGITOP S.A. DE C.V.', '4-2024');
INSERT INTO folios(empresa, folio) VALUES ('EDITH MARIA ANTONIETA RODRIGUEZ CASTILLO', '22-2024');
INSERT INTO folios(empresa, folio) VALUES ('EXPORTADORA DE CAFE CALIFORNIA S.A DE C.V', '2-2024');
INSERT INTO folios(empresa, folio) VALUES ('FERMENTACIONES MEXICANAS S.A. DE C.V.', '36-2024');
INSERT INTO folios(empresa, folio) VALUES ('FERTILIZANTES TEPEYAC S.A. DE C.V. (COATZACOALCOS)', '1-2024');
INSERT INTO folios(empresa, folio) VALUES ('FERTILIZANTES TEPEYAC S.A. DE C.V. (CHICHICAXTLE)', '13-2024');
INSERT INTO folios(empresa, folio) VALUES ('FIDEICOMISO85101771BIM-GOLF JALAPA', '1-2024');
INSERT INTO folios(empresa, folio) VALUES ('FIDEICOMISO DEL SISTEMA DE AGUAS RESIDUALES DEL ALTO RIO BLANCO', '41-2024');
INSERT INTO folios(empresa, folio) VALUES ('FUNDICION Y MECANICA SUSANO SOLIS S.A. DE C.V.', '48-2024');
INSERT INTO folios(empresa, folio) VALUES ('GRUPO CONSTRUCTO, S.A. DE C.V. "TALLER DE LIMPIEZA Y PINTURA  EN HUILOAPAN"', '6-2024');
INSERT INTO folios(empresa, folio) VALUES ('GRUPO DECME S.A. DE C.V.', '16-2024');
INSERT INTO folios(empresa, folio) VALUES ('GRUPO INDUSTRIAL PARISSI S.A. DE C.V.', '3-2024');
INSERT INTO folios(empresa, folio) VALUES ('HABITAT PROMOTORA Y CONSTRUCTORA DE CIUDADES S.A. DE C.V.', '5-2024');
INSERT INTO folios(empresa, folio) VALUES ('INDUSTRIAS CHAHIN DE ORIZABA S.A DE C.V', '93-2024');
INSERT INTO folios(empresa, folio) VALUES ('INDUSTRIA  DE PRODUCTOS  PETROLEROS S.A. DE C.V.', '3-2024');
INSERT INTO folios(empresa, folio) VALUES ('INGENIO AZUCARERO MODELO S.A. DE C.V.', '14-2024');
INSERT INTO folios(empresa, folio) VALUES ('INGENIO CENTRAL LA PROVIDENCIA S.A DE C.V.', '7-2024');
INSERT INTO folios(empresa, folio) VALUES ('INGENIO CONSTANCIA', '13-2024');
INSERT INTO folios(empresa, folio) VALUES ('JOSE ANTONIO RAMIREZ COETO', '5-2024');
INSERT INTO folios(empresa, folio) VALUES ('KIMBERLY CLARK DE MEXICO, SAB  DE CV', '1-2024');
INSERT INTO folios(empresa, folio) VALUES ('LAMINA Y PLACA COMERCIAL S.A. DE C.V.', '11-2024');
INSERT INTO folios(empresa, folio) VALUES ('NUEVA GALLETERA VERACRUZANA S.A. DE C.V.', '18-2024');
INSERT INTO folios(empresa, folio) VALUES ('PROLIMP DEL CENTRO S.A. DE C.V.', '5-2024');
INSERT INTO folios(empresa, folio) VALUES ('ROVIANDA S.A.P.I. DE C.V.', '2-2024');
INSERT INTO folios(empresa, folio) VALUES ('SIGNODE MEXICO, S. DE R.L. DE C.V', '17-2024');
INSERT INTO folios(empresa, folio) VALUES ('SILICES DE VERACRUZ S.A DE C.V. (NOGALES)', '4-2024');
INSERT INTO folios(empresa, folio) VALUES ('SILICES DE VERACRUZ S.A DE C.V. (ORIZABA)', '26-2024');
INSERT INTO folios(empresa, folio) VALUES ('TA 2000 S.A DE C.V', '1130-2024');
INSERT INTO folios(empresa, folio) VALUES ('TALLERES PEBSA S.A. DE C.V.', '7-2024');
INSERT INTO folios(empresa, folio) VALUES ('TENERIA COMPANY S.A DE C.V (ORIZABA)', '2-2024');
INSERT INTO folios(empresa, folio) VALUES ('TENERIA COMPANY S.A DE C.V (IXTACZOQUITLAN)', '51-2024');
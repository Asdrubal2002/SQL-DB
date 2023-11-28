CREATE TABLE cliente (
    id_cliente NUMBER NOT NULL,
    identificacion VARCHAR2(50) NOT NULL,
    primer_nombre VARCHAR2(50) NOT NULL,
    segundo_nombre VARCHAR2(50) NULL,
    primero_apellido VARCHAR2(50) NOT NULL,
    segundo_apellido VARCHAR2(50) NOT NULL,
    celular VARCHAR2(50) NOT NULL,
    email VARCHAR2(50) NOT NULL,
    direccion VARCHAR2(50) NOT NULL,
    PRIMARY KEY (id_cliente)
);

CREATE TABLE estado (
    id_estado NUMBER NOT NULL,
    evaluado VARCHAR2(1) NULL,
    cotizado VARCHAR2(1) NULL,
    en_progreso VARCHAR2(1) NULL,
    pendiente VARCHAR2(1)NULL,
    terminado VARCHAR2(1) NULL,
    PRIMARY KEY (id_estado)
);


CREATE TABLE factura (
    id_factura NUMBER NOT NULL,
    fecha_factura DATE NOT NULL,
    valor  NUMBER NOT NULL,
    PRIMARY KEY (id_factura)
);

CREATE TABLE proyecto (
    id_proyecto NUMBER NOT NULL,
    nombre_proyecto VARCHAR2(30) NOT NULL,
    direccion_construccion VARCHAR2(30) NOT NULL,
    inicio_construccion DATE NOT NULL,
    fin_construccion DATE NOT NULL,
    id_cliente INT NOT NULL,
    id_estado INT NOT NULL,
    id_factura int NOT NULL,
    PRIMARY KEY (id_proyecto),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente) ON DELETE CASCADE,
    FOREIGN KEY (id_estado) REFERENCES estado(id_estado),
    FOREIGN KEY (id_factura) REFERENCES factura(id_factura)

);

CREATE TABLE insumo (
    id_insumo NUMBER NOT NULL,
    herramiento VARCHAR2(30) NOT NULL,
    cantidad  NUMBER NOT NULL,
    PRIMARY KEY (id_insumo)
);

CREATE TABLE asignacion_insumo (
    id_asignacion_ins NUMBER NOT NULL,
    id_insumo INT NOT NULL,
    id_proyecto INT NOT NULL,
    PRIMARY KEY (id_asignacion_ins),
    FOREIGN KEY (id_insumo) REFERENCES insumo(id_insumo),
    FOREIGN KEY (id_proyecto) REFERENCES proyecto(id_proyecto) ON DELETE CASCADE
);


CREATE TABLE cargo (
    id_cargo NUMBER NOT NULL,
    nombre_cargo VARCHAR2(30) NOT NULL,
    salario INT NOT NULL,
    PRIMARY KEY (id_cargo)
);

CREATE TABLE empleado (
    id_empleado NUMBER NOT NULL,
    identificacion VARCHAR2(50) NOT NULL,
    primer_nombre VARCHAR2(50) NOT NULL,
    segundo_nombre VARCHAR2(50) NULL,
    primero_apellido VARCHAR2(50) NOT NULL,
    segundo_apellido VARCHAR2(50) NOT NULL,
    celular VARCHAR2(50) NOT NULL,
    email VARCHAR2(50) NOT NULL,
    curso_altura VARCHAR2(1) NOT NULL,
    id_cargo INT NOT NULL,
    PRIMARY KEY (id_empleado),
    FOREIGN KEY (id_cargo) REFERENCES cargo(id_cargo) 
);

CREATE TABLE asignacion_empleado (
    id_asignacion_emp NUMBER NOT NULL,
    id_empleado INT NOT NULL,
    id_proyecto INT NOT NULL,
    PRIMARY KEY (id_asignacion_emp),
    FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado),
    FOREIGN KEY (id_proyecto) REFERENCES proyecto(id_proyecto) ON DELETE CASCADE
);

CREATE TABLE proveedor (
    id_proveedor NUMBER NOT NULL,
    nombre VARCHAR2(50) NOT NULL,
    direccion VARCHAR2(50) NOT NULL,
    telefono VARCHAR2(10) NOT NULL,
    PRIMARY KEY (id_proveedor)  
);

CREATE TABLE material (
    id_material NUMBER NOT NULL,
    nombre VARCHAR2(50) NOT NULL,
    descripcion VARCHAR2(100) NOT NULL,
    costo NUMBER NOT NULL,
    id_proveedor NUMBER NOT NULL,
    PRIMARY KEY (id_material),
    FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor) ON DELETE CASCADE
);


CREATE TABLE asignacion_material (
    id_asignacion_mat NUMBER NOT NULL,
    id_material INT NOT NULL,
    id_proyecto INT NOT NULL,
    PRIMARY KEY (id_asignacion_mat),
    FOREIGN KEY (id_material) REFERENCES material(id_material),
    FOREIGN KEY (id_proyecto) REFERENCES proyecto(id_proyecto) ON DELETE CASCADE
);


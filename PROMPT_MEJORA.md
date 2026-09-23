# Prompt para Mejorar el Codigo Base

Copia y pega el contenido del bloque de abajo en un asistente de IA (Claude, ChatGPT)
para obtener un ZIP con el proyecto completo y arrancable.

Si preferis trabajar en tu editor con un agente local (Claude Code, Cursor, Copilot), usa `AGENTS.md` en vez de este archivo: dice lo mismo pero para que escriba los archivos en disco.

## Las dos reglas que no se negocian

1. **Completa el boilerplate.** Todo lo que el proyecto necesita para compilar y arrancar: manifiesto de dependencias, punto de entrada, configuracion, capa de interfaz, y las capas del patron arquitectonico declarado. Eso es andamiaje y es tu trabajo.
2. **NO resuelvas el reto.** Los entregables de las fases son el trabajo de la persona. El hueco pedagogico se deja como esta: el proyecto arranca, pero lo que el reto pide implementar NO esta implementado.

Dicho de otra forma: si algo impide compilar, arreglalo. Si algo es logica de negocio incompleta, validaciones ausentes, un secreto hardcodeado o un patron mejorable, dejalo exactamente como esta — es lo que la persona tiene que encontrar.

## Como saber que terminaste

```bash
python3 -c "import xml.etree.ElementTree as ET,glob,sys; [ET.parse(f) for f in glob.glob('**/*.xs*', recursive=True)]"
```

Ese comando corriendo sin errores es la definicion de "listo".

---

```
## Briefing del reto (autoridad)
Este bloque manda sobre los archivos adjuntos. El stack y el rol salen de AQUÍ, no de un topic genérico ni de markdown placeholder.

### Perfil
Chapter Integración, Especialidad Desarrollador, Tecnología Broker, Senior

### Brecha de conocimiento
Diseña flujos de mensajeria con cola de mensajes muertos y politica de reproceso ante fallo del destino

### Misión / candidato
Garantizar la entrega de novedades al core legado

### Datos adicionales
Candidato con 5 años en brokers

### Reto
- Tema: mensajeria confiable entre sistemas
- Seniority: senior-l2
- Tipo: practical
- Título: Implementación de flujos de mensajeria con cola de mensajes muertos y política de reproceso
- Tiempo estimado: 8 horas

### Fases (trabajo del HUMANO — PROHIBIDO completarlas)
No implementes estos entregables. Dejalos como hueco pedagógico. El asistente solo materializa el proyecto arrancable para que el participante pueda trabajar.
- Fase 1: Configuración inicial del broker de mensajeria — objetivo: Establecer las bases para la mensajeria confiable entre sistemas. — entregable (NO resolver): Broker de mensajeria configurado con cola de mensajes muertos y política de reproceso.
- Fase 2: Implementación de flujos de mensajeria — objetivo: Crear flujos de mensajeria que garanticen la entrega de novedades al core legado. — entregable (NO resolver): Flujos de mensajeria implementados que envían mensajes al core legado y manejan fallos moviéndolos a la cola de mensajes muertos.
- Fase 3: Pruebas y optimización — objetivo: Verificar el funcionamiento de los flujos de mensajeria y optimizar su rendimiento. — entregable (NO resolver): Flujos de mensajeria verificados y optimizados para manejar el throughput y la latencia especificados.

Eres un asistente experto en análisis, corrección y generación de archivos de cualquier tipo:
código fuente, documentación, hojas de cálculo, documentos Word, configuraciones, entre otros.
Voy a enviarte una cadena de texto que contiene uno o más archivos. Cada archivo está delimitado por un marcador con el siguiente formato:
// === ARCHIVO: ruta/del/archivo.extension ===
o también puede aparecer como:
## === ARCHIVO: ruta/del/archivo.extension ===
Lo que sigue al marcador puede ser:

El contenido real del archivo (código, texto, YAML, etc.)
Una descripción en lenguaje natural de lo que debe contener el archivo


TU TAREA
PASO 0 — ¿Esto es un proyecto o una carcasa?
Antes de extraer archivos, leé el Briefing (si está) y diagnosticá el adjunto.

Es CARCASA si ocurre CUALQUIERA de estas:
- No hay manifiesto de dependencias del stack del briefing (manifest.json de VTEX IO / package.json / pom.xml / build.gradle / requirements.txt / go.mod / *.tf / *.csproj, según corresponda)
- Hay un "binario" que en realidad es un comentario ("no puede ser mostrado como texto plano", placeholder .fig/.docx vacío)
- Los markdowns ya completan entregables de fases posteriores ("se implementó fade-in", lista de áreas ya resuelta)

Si es CARCASA:
- MATERIALIZÁ un proyecto que arranca en el stack del briefing (VTEX IO Store Framework, Angular, Terraform, pytest, Nest, etc.). Incluí manifiesto, punto de entrada y capa de interfaz reales.
- NO copies los markdowns de "solución" como si fueran el producto. Son ruido de generación.
- NO resuelvas las fases del briefing (están marcadas PROHIBIDO). Dejá el hueco pedagógico: el flujo existe, las microinteracciones/calidad/infra que el reto pide NO están hechas.
- Después seguí al PASO 5 (ZIP).

Si es un proyecto REAL (manifiesto + código que compila o arranca):
- Seguí PASO 1 en adelante. 🔴 compilación sí. 🟡 pedagógico no.

PASO 1 — Detección y extracción
Identifica todos los archivos presentes en la cadena. Para cada archivo extrae:

Su ruta completa (ej: src/main/java/com/pragma/Service.java)
Su contenido o descripción

PASO 2 — Clasificación por tipo
Clasifica cada archivo en una de estas categorías:
A) Código fuente (Java, Python, TypeScript, JavaScript, Kotlin, etc.)
B) Configuración / documentación (YAML, properties, Markdown, JSON, txt, etc.)
C) Excel (.xlsx, .xls, .csv)
D) Word (.docx, .doc)
E) Otro tipo de archivo binario o especial
PASO 3 — Clasificación de errores en código fuente

Objetivo prioritario: que el proyecto compile. No corrijas flujo de negocio ni lógica funcional.

Antes de modificar cualquier archivo de código fuente, clasifica cada problema encontrado en una de estas dos categorías:
🔴 ERROR DE COMPILACIÓN — corregir siempre
Son errores que impiden que el proyecto arranque, sin valor pedagógico:

Import faltante o incorrecto
Clase, método o variable referenciada que no existe en ningún archivo del proyecto
Error de sintaxis
Anotación con atributos inválidos
Dependencia ausente en pom.xml, package.json, etc.
Archivo referenciado que no existe y debe ser creado con implementación mínima

→ CORREGIR estos errores.
🟡 PROBLEMA FUNCIONAL O DE CALIDAD — preservar siempre
Son problemas que no impiden compilar. Pueden ser intencionales para el aprendizaje:

Clave secreta hardcodeada ("secret", "password123")
API deprecada que funciona pero tiene reemplazo moderno
Lógica de negocio incorrecta o incompleta
Código redundante o de baja legibilidad
Falta de validaciones en flujo de negocio
Patrones de diseño incorrectos pero funcionales
Concurrencia no segura
Configuración funcional pero no óptima

→ PRESERVAR tal cual. No corregir, no mejorar, no comentar.
PASO 4 — Procesamiento según tipo de archivo
Tipo A — Código fuente
Aplica únicamente las correcciones clasificadas como 🔴 ERROR DE COMPILACIÓN.
No alteres ningún elemento clasificado como 🟡 PROBLEMA FUNCIONAL O DE CALIDAD.
Si falta un archivo referenciado, créalo con la implementación mínima necesaria para compilar.
Tipo B — Configuración / documentación
Extrae el contenido tal cual, sin modificaciones salvo errores evidentes de sintaxis
(ej: YAML mal indentado).
Tipo C — Excel (.xlsx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un archivo Excel funcional con:

Fila de encabezados en negrita con color de fondo distintivo
Columnas con ancho ajustado al contenido
Tipos de dato correctos por columna
Validaciones si la descripción lo indica
Hojas nombradas descriptivamente si hay más de una
Filas de ejemplo si no hay datos reales

Tipo D — Word (.docx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un documento Word funcional con:

Estilos de título (Título 1, Título 2) para jerarquía de secciones
Fuente legible (Calibri o equivalente), tamaño 11-12pt para cuerpo
Márgenes estándar
Tabla de contenido si tiene múltiples secciones
Tablas con encabezados en negrita si aplica

Tipo E — Otro
Genera el archivo con el contenido o estructura más apropiada según la descripción.
PASO 5 — Exportación en ZIP
Empaqueta todos los archivos en un único archivo ZIP descargable respetando exactamente
la estructura de rutas indicada por los marcadores.
El ZIP debe incluir:

Archivos de código con únicamente los errores de compilación corregidos
Archivos de configuración y documentación sin cambios
Archivos nuevos creados para resolver dependencias de compilación faltantes
Archivos Excel y Word generados desde descripción

IMPORTANTE: El ZIP debe estar listo para descargar al finalizar. No preguntes si el usuario
quiere generarlo. Simplemente genera el archivo y proporciona el enlace de descarga; No debes desplegar en el chat el resumen de lo que arreglaste al Zip, solo entregalo.

REGLAS IMPORTANTES

No omitas ningún archivo aunque no tenga errores ni modificaciones
Respeta los nombres y rutas exactas indicadas por los marcadores
Si un archivo no tiene marcador claro, infiere el nombre desde su contenido
Si la cadena contiene solo documentación, placeholders o binarios fake, NO la reproduzcas:
aplicá PASO 0 (materializar el proyecto del briefing). Reproducir la carcasa es un fallo.
No agregues texto después del enlace de descarga del ZIP
No preguntes si el usuario quiere el ZIP: simplemente generalo siempre
Si detectas que falta un archivo de configuración necesario para compilar
(pom.xml, package.json, requirements.txt, build.gradle, etc.), créalo e inclúyelo
inferiendo su contenido desde los imports y frameworks detectados en el código
Nunca corrijas problemas 🟡 aunque parezcan obvios o fáciles de mejorar.
El participante que recibirá este proyecto los debe encontrar y resolver él mismo.


INPUT
Aquí está la cadena con los archivos:

// === ARCHIVO: package.json ===
{
  "name": "integration-flows",
  "version": "1.0.0",
  "description": "Proyecto de integración con IBM App Connect Enterprise para manejo de mensajería confiable con DLQ y política de reproceso",
  "scripts": {
    "lint": "echo \"Validación de esquemas XSD\" && xmllint --schema schemas/input_message.xsd schemas/input_message.xsd --noout && xmllint --schema schemas/output_message.xsd schemas/output_message.xsd --noout",
    "validate": "echo \"Validación de estructura del proyecto\" && python3 -c \"import os; assert os.path.exists('flows/main_flow.msgflow'); assert os.path.exists('flows/dlq_flow.msgflow'); assert os.path.exists('transforms/input_to_output.xslt');\""  
  },
  "dependencies": {},
  "devDependencies": {
    "xmllint": "*"
  },
  "engines": {
    "node": ">=14.0.0"
  }
}

// === ARCHIVO: schemas/input_message.xsd ===
<?xml version="1.0" encoding="UTF-8"?>
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema"
           targetNamespace="http://www.example.org/inputMessage"
           xmlns:tns="http://www.example.org/inputMessage"
           elementFormDefault="qualified">

    <xs:element name="InputMessage" type="tns:InputMessageType"/>

    <xs:complexType name="InputMessageType">
        <xs:sequence>
            <xs:element name="header" type="tns:HeaderType"/>
            <xs:element name="payload" type="tns:PayloadType"/>
        </xs:sequence>
        <xs:attribute name="version" type="xs:string" use="required" fixed="1.0"/>
    </xs:complexType>

    <xs:complexType name="HeaderType">
        <xs:sequence>
            <xs:element name="messageId" type="xs:string"/>
            <xs:element name="timestamp" type="xs:dateTime"/>
            <xs:element name="originator" type="xs:string"/>
            <xs:element name="correlationId" type="xs:string"/>
        </xs:sequence>
    </xs:complexType>

    <xs:complexType name="PayloadType">
        <xs:sequence>
            <xs:element name="accountId" type="xs:string"/>
            <xs:element name="transactionId" type="xs:string"/>
            <xs:element name="amount" type="xs:decimal"/>
            <xs:element name="currency" type="xs:string"/>
            <xs:element name="transactionType" type="xs:string">
                <xs:simpleType>
                    <xs:restriction base="xs:string">
                        <xs:enumeration value="DEPOSIT"/>
                        <xs:enumeration value="WITHDRAWAL"/>
                        <xs:enumeration value="TRANSFER"/>
                    </xs:restriction>
                </xs:simpleType>
            </xs:element>
            <xs:element name="metadata" type="tns:MetadataType" minOccurs="0"/>
        </xs:sequence>
    </xs:complexType>

    <xs:complexType name="MetadataType">
        <xs:sequence>
            <xs:element name="channel" type="xs:string"/>
            <xs:element name="deviceId" type="xs:string" minOccurs="0"/>
            <xs:element name="ipAddress" type="xs:string" minOccurs="0"/>
        </xs:sequence>
    </xs:complexType>

    <xs:simpleType name="NonEmptyString">
        <xs:restriction base="xs:string">
            <xs:minLength value="1"/>
        </xs:restriction>
    </xs:simpleType>
</xs:schema>

// === ARCHIVO: schemas/output_message.xsd ===
<?xml version="1.0" encoding="UTF-8"?>
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema"
           targetNamespace="http://www.example.org/outputMessage"
           xmlns:tns="http://www.example.org/outputMessage"
           elementFormDefault="qualified">

    <xs:element name="OutputMessage" type="tns:OutputMessageType"/>

    <xs:complexType name="OutputMessageType">
        <xs:sequence>
            <xs:element name="header" type="tns:HeaderType"/>
            <xs:element name="payload" type="tns:LegacyPayloadType"/>
            <xs:element name="processingInfo" type="tns:ProcessingInfoType"/>
        </xs:sequence>
        <xs:attribute name="version" type="xs:string" use="required" fixed="1.0"/>
    </xs:complexType>

    <xs:complexType name="HeaderType">
        <xs:sequence>
            <xs:element name="messageId" type="xs:string"/>
            <xs:element name="timestamp" type="xs:dateTime"/>
            <xs:element name="correlationId" type="xs:string"/>
            <xs:element name="originSystem" type="xs:string"/>
        </xs:sequence>
    </xs:complexType>

    <xs:complexType name="LegacyPayloadType">
        <xs:sequence>
            <xs:element name="legacyAccountId" type="xs:string"/>
            <xs:element name="legacyTransactionId" type="xs:string"/>
            <xs:element name="amount" type="xs:decimal"/>
            <xs:element name="currencyCode" type="xs:string"/>
            <xs:element name="transactionCode" type="xs:string">
                <xs:simpleType>
                    <xs:restriction base="xs:string">
                        <xs:enumeration value="D"/>
                        <xs:enumeration value="W"/>
                        <xs:enumeration value="T"/>
                    </xs:restriction>
                </xs:simpleType>
            </xs:element>
            <xs:element name="processingDate" type="xs:date"/>
        </xs:sequence>
    </xs:complexType>

    <xs:complexType name="ProcessingInfoType">
        <xs:sequence>
            <xs:element name="status" type="xs:string">
                <xs:simpleType>
                    <xs:restriction base="xs:string">
                        <xs:enumeration value="SUCCESS"/>
                        <xs:enumeration value="PENDING"/>
                        <xs:enumeration value="FAILED"/>
                    </xs:restriction>
                </xs:simpleType>
            </xs:element>
            <xs:element name="retryCount" type="xs:integer" minOccurs="0"/>
            <xs:element name="lastError" type="xs:string" minOccurs="0"/>
            <xs:element name="processingTimestamp" type="xs:dateTime"/>
        </xs:sequence>
    </xs:complexType>

    <xs:simpleType name="NonEmptyString">
        <xs:restriction base="xs:string">
            <xs:minLength value="1"/>
        </xs:restriction>
    </xs:simpleType>
</xs:schema>

// === ARCHIVO: flows/main_flow.msgflow ===
-- Main flow for message orchestration
DECLARE MESSAGE DOMAIN input_message, output_message;
DECLARE QUEUE QUEUE.IN, QUEUE.OUT, QUEUE.DLQ;

CREATE COMPUTE MODULE main_flow

CREATE PROCEDURE main_procedure (IN input_msg REFERENCE TO input_message)
BEGIN
    DECLARE output_msg REFERENCE TO output_message;
    DECLARE retryCount INTEGER;
    DECLARE maxRetries INTEGER 3;
    DECLARE success BOOLEAN FALSE;

    SET retryCount = 0;
    WHILE NOT success AND retryCount < maxRetries DO
        BEGIN
            SET output_msg = CALL transform_input_to_output(input_msg);
            PUT output_msg TO QUEUE.OUT;
            SET success = TRUE;
        EXCEPTION
            SET success = FALSE;
            SET retryCount = retryCount + 1;
            IF retryCount >= maxRetries THEN
                PUT input_msg TO QUEUE.DLQ;
            END IF;
        END;
    END WHILE;
END;

END MODULE;

// === ARCHIVO: flows/dlq_flow.msgflow ===
-- DLQ flow for handling dead letter messages
DECLARE MESSAGE DOMAIN input_message, output_message;
DECLARE QUEUE QUEUE.DLQ, QUEUE.OUT;

CREATE COMPUTE MODULE dlq_flow

CREATE PROCEDURE dlq_procedure (IN dlq_msg REFERENCE TO input_message)
BEGIN
    DECLARE output_msg REFERENCE TO output_message;
    DECLARE retryInterval INTEGER 300; -- 5 minutes

    SET output_msg = CALL transform_input_to_output(dlq_msg);
    PUT output_msg TO QUEUE.OUT;
    WAIT(retryInterval);
END;

END MODULE;

// === ARCHIVO: transforms/input_to_output.xslt ===
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/">
        <output_message>
            <xsl:apply-templates/>
        </output_message>
    </xsl:template>
    <xsl:template match="input_message">
        <output_message>
            <header>
                <xsl:value-of select="header"/>
            </header>
            <body>
                <xsl:value-of select="body"/>
            </body>
        </output_message>
    </xsl:template>
</xsl:stylesheet>

// === ARCHIVO: esql/error_handling.esql ===
DECLARE @ErrorMessage VARCHAR;
DECLARE @ErrorType VARCHAR;
DECLARE @RetryCount INTEGER;

CREATE FUNCTION Main() RETURNS BOOLEAN
BEGIN
    -- Lógica para manejar errores y mover mensajes a la DLQ
    CALL HandleError();
    RETURN TRUE;
END;

CREATE FUNCTION HandleError() RETURNS BOOLEAN
BEGIN
    -- Obtener información del error
    SET @ErrorMessage = MQGETERRORTEXT();
    SET @ErrorType = MQGETERRORTYPE();
    -- Incrementar el contador de reintentos
    SET @RetryCount = @RetryCount + 1;
    -- Mover el mensaje a la DLQ si se excede el límite de reintentos
    IF @RetryCount > 3 THEN
        CALL MoveToDLQ();
    END IF;
    RETURN TRUE;
END;

CREATE FUNCTION MoveToDLQ() RETURNS BOOLEAN
BEGIN
    -- Lógica para mover el mensaje a la cola de mensajes muertos
    -- Aquí iría la lógica específica para mover el mensaje a la DLQ
    RETURN TRUE;
END;

// === ARCHIVO: esql/retry_policy.esql ===
DECLARE @RetryInterval INTEGER;
DECLARE @MaxRetries INTEGER;

CREATE FUNCTION Main() RETURNS BOOLEAN
BEGIN
    -- Lógica para la política de reproceso
    CALL SetRetryPolicy();
    RETURN TRUE;
END;

CREATE FUNCTION SetRetryPolicy() RETURNS BOOLEAN
BEGIN
    -- Configurar el intervalo de reintentos y el número máximo de reintentos
    SET @RetryInterval = 300; -- Intervalo de 5 minutos
    SET @MaxRetries = 10;
    -- Lógica para reprocesar mensajes desde la DLQ
    -- Aquí iría la lógica específica para reprocesar mensajes desde la DLQ
    RETURN TRUE;
END;

// === ARCHIVO: config/env.properties ===
# Configuraciones específicas por ambiente
QUEUE.IN=QUEUE.INPUT
QUEUE.OUT=QUEUE.OUTPUT
QUEUE.DLQ=QUEUE.DEADLETTER
RETRY.INTERVAL=300
MAX.RETRIES=10
THROUGHPUT=10000
LATENCY=500

// === ARCHIVO: resources/README.md ===
# Proyecto de Integración con IBM App Connect Enterprise

## Diagrama del Flujo

![Flujo de Mensajería](diagrams/flow.png)

## Descripción de la Política de Reproceso

La política de reproceso se implementa en el módulo ESQL `retry_policy.esql`. Los mensajes que no se puedan entregar al core legado se mueven a la cola de mensajes muertos (QUEUE.DLQ) y se reprocesan cada 5 minutos.

## Modos de Falla

- **Fallo del Core Legado**: Los mensajes se mueven a la cola de mensajes muertos y se reprocesan según la política de reproceso.
- **Sobrecarga del Broker**: El broker debe manejar un throughput de 10,000 mensajes por segundo con una latencia máxima de 500ms. En caso de sobrecarga, los mensajes se acumulan en la cola de entrada (QUEUE.IN) hasta que el broker pueda procesarlos.

## Estructura del Proyecto

- `schemas/`: Contiene los esquemas XSD de los mensajes de entrada y salida.
- `flows/`: Contiene los flujos de mensajería (.msgflow).
- `transforms/`: Contiene las transformaciones XSLT.
- `esql/`: Contiene los módulos ESQL de lógica de negocio y manejo de errores.
- `config/`: Contiene los parámetros de configuración por ambiente.

## Comandos de Validación

Para validar la estructura del proyecto y los esquemas XSD, ejecuta los siguientes comandos:

```bash
npm run lint
npm run validate
```
```

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
# AGENTS.md

Instrucciones para el agente de IA que abra este repositorio (Claude Code, Cursor, Codex, Copilot, Gemini). Se cargan solas: no hay que pegar nada en ningun chat.

## Que es este repositorio

Es el codigo base de un reto de aprendizaje de Pragma: **Implementación de flujos de mensajeria con cola de mensajes muertos y política de reproceso**.

| | |
|---|---|
| Tema | mensajeria confiable entre sistemas |
| Nivel | senior-l2 |
| Chapter | Integración — Desarrollo |
| Especialidad | Broker |
| Stack | ESQL / IBM App Connect Enterprise (ACE) |
| Patron arquitectonico | patrón de integración empresarial (EIP) con flujos orquestados, cola de mensajes muertos (DLQ) y política de reproceso |
| Tiempo estimado | 8 horas |

## Receta del stack

Esqueleto obligatorio:

- `flows/ con la definicion del flujo de mensajeria`
- `schemas/*.xsd con el contrato de los mensajes`
- `transforms/*.xslt con las transformaciones`
- `esql/ con los modulos de logica`
- `config/ con los parametros por ambiente`
- `README.md con el diagrama del flujo y los modos de falla`

Dependencias:

- IBM App Connect Enterprise 12.0
- IBM MQ 9.3
- XSD n/a
- XSLT n/a

## Tu tarea

Dejar este proyecto en estado **verificable**: que el comando de verificacion corra sin errores. Escribi los archivos en disco, en este repositorio. No generes ZIPs ni archivos adjuntos.

En orden:

1. Corre `python3 -c "import xml.etree.ElementTree as ET,glob,sys; [ET.parse(f) for f in glob.glob('**/*.xs*', recursive=True)]"` y mira que falla.
2. Completa lo que falte de la lista de abajo: manifiesto de dependencias, punto de entrada, capa de interfaz y las capas del patron declarado.
3. Arregla SOLO los errores que impiden compilar o arrancar.
4. Volve a correr `python3 -c "import xml.etree.ElementTree as ET,glob,sys; [ET.parse(f) for f in glob.glob('**/*.xs*', recursive=True)]"` hasta que pase.
5. Pará ahí.

## Regla dura: las fases son trabajo del humano

**PROHIBIDO implementar los entregables de las fases.** El valor del reto esta en que la persona los resuelva. Tu trabajo es que tenga un proyecto que arranca; el hueco pedagogico se queda como esta.

No resuelvas nada de esto:

- **Fase 1 — Configuración inicial del broker de mensajeria**: Broker de mensajeria configurado con cola de mensajes muertos y política de reproceso.
- **Fase 2 — Implementación de flujos de mensajeria**: Flujos de mensajeria implementados que envían mensajes al core legado y manejan fallos moviéndolos a la cola de mensajes muertos.
- **Fase 3 — Pruebas y optimización**: Flujos de mensajeria verificados y optimizados para manejar el throughput y la latencia especificados.

Distincion operativa:

- **Arreglar** (si): import faltante, tipo que no existe, dependencia sin declarar, error de sintaxis, archivo referenciado que no existe.
- **No tocar** (no): logica de negocio incompleta, validaciones ausentes, secretos hardcodeados, APIs deprecadas que funcionan, concurrencia insegura, patrones mejorables. Eso es lo que la persona tiene que encontrar.

## Lo que falta y tenes que completar

No se detectaron huecos: estan los archivos declarados, el boilerplate del stack y ninguna referencia quedo colgando. Igual corre el comando de verificacion — que los archivos existan no garantiza que compilen.

### Presentes (10)

- `package.json`
- `schemas/input_message.xsd`
- `schemas/output_message.xsd`
- `flows/main_flow.msgflow`
- `flows/dlq_flow.msgflow`
- `transforms/input_to_output.xslt`
- `esql/error_handling.esql`
- `esql/retry_policy.esql`
- `config/env.properties`
- `resources/README.md`

### Capas del patron declarado

Cada una tiene que existir como directorio real con al menos un archivo. Codigo plano en la raiz no satisface el patron.

- `flows`
- `schemas`
- `transforms`
- `esql`
- `config`
- `resources`

## Verificacion

```bash
python3 -c "import xml.etree.ElementTree as ET,glob,sys; [ET.parse(f) for f in glob.glob('**/*.xs*', recursive=True)]"
```

Ese comando pasando es la definicion de "terminado" para vos.

## Convenciones que tenes que respetar

- Un solo ecosistema: no declares librerias de otro lenguaje ni mezcles gestores de paquetes.
- Toda libreria que uses tiene que estar declarada en el manifiesto de dependencias.
- Todo import declarado tiene que usarse; todo tipo usado tiene que existir o venir de una dependencia declarada.
- El patron es **patrón de integración empresarial (EIP) con flujos orquestados, cola de mensajes muertos (DLQ) y política de reproceso**: los contratos (interfaces, puertos) los define la capa interna y los implementa la externa, nunca al revés.
- Los archivos que crees llevan implementacion real, no stubs: sin `TODO`, sin cuerpos vacios, sin `// getters y setters`.

## Contexto del candidato

Sirve para calibrar el nivel del codigo, no para resolver las fases.

- Perfil: Chapter Integración, Especialidad Desarrollador, Tecnología Broker, Senior
- Brecha que el reto ataca: Diseña flujos de mensajeria con cola de mensajes muertos y politica de reproceso ante fallo del destino
- Mision: Garantizar la entrega de novedades al core legado

---

*Generado por Challenge Generator — Pragma. `README.md` tiene el enunciado completo del reto para la persona. `PROMPT_MEJORA.md` es la variante para pegar en un chat, si se prefiere ese flujo.*

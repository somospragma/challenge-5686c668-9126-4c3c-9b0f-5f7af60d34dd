# Implementación de flujos de mensajeria con cola de mensajes muertos y política de reproceso

El sistema de mensajeria debe garantizar la entrega de novedades al core legado, manejando posibles fallos en el destino. Se requiere diseñar flujos que utilicen una cola de mensajes muertos y una política de reproceso para asegurar que los mensajes no se pierdan. Los actores involucrados son el originador de mensajes, el broker de mensajeria y el core legado. El broker debe ser capaz de manejar un throughput de 10 000 mensajes por segundo con una latencia máxima de 500ms. En caso de fallo del core legado, los mensajes deben ser movidos a una cola de mensajes muertos y reprocesados cada 5 minutos.

## Informacion General

| Campo | Valor |
|-------|-------|
| **Tema** | mensajeria confiable entre sistemas |
| **Nivel** | senior-l2 |
| **Tipo** | practical |
| **Tiempo estimado** | 8 horas |

## Fases del Reto

### Fase 0: Configuración del Proyecto

**Objetivo:** Obtener el proyecto base funcional enviando el Código Base a un asistente de IA, que lo analizará, corregirá errores y generará un ZIP listo para usar.

**Tiempo estimado:** 15-30 minutos

**Instrucciones:**

- Asegúrate de tener instalado para ejecutar el proyecto: Node.js 18+, npm, VS Code o similar.
- Copia todo el contenido del campo **Código Base** de este reto — incluyendo el texto de instrucciones que aparece al inicio.
- Abre un asistente de IA (Claude en claude.ai, ChatGPT o Gemini — se recomienda Claude), pega el contenido copiado en el chat y envíalo.
- El asistente analizará los archivos, corregirá errores y generará un archivo ZIP descargable. Descárgalo y extráelo en la carpeta donde quieras trabajar.
- Ejecuta `npm install && npm run build` (o `npm start`). Si no hay errores, estás listo.

**Entregable:** El proyecto compila/arranca sin errores.

<details>
<summary>Pistas de conocimiento</summary>

- Copia el Código Base completo incluyendo el texto de instrucciones al inicio — esas instrucciones le indican al asistente exactamente qué hacer con los archivos.
- Si el asistente no genera el ZIP automáticamente al terminar el análisis, escríbele: "genera el ZIP ahora".
- Si el proyecto tiene errores al arrancar, comparte el mensaje de error con el mismo asistente para que lo corrija.

</details>

### Fase 1: Configuración inicial del broker de mensajeria

**Objetivo:** Establecer las bases para la mensajeria confiable entre sistemas.

**Tiempo estimado:** 2 horas

**Instrucciones:**

- Configurar el broker de mensajeria para manejar un throughput de 10 000 mensajes por segundo con una latencia máxima de 500ms.
- Definir la cola de mensajes muertos y establecer la política de reproceso cada 5 minutos.

**Entregable:** Broker de mensajeria configurado con cola de mensajes muertos y política de reproceso.

<details>
<summary>Pistas de conocimiento</summary>

- Considera las implicaciones de la latencia y el throughput en la configuración del broker.
- Piensa en cómo manejar los edge cases donde el core legado falla repetidamente.

</details>

### Fase 2: Implementación de flujos de mensajeria

**Objetivo:** Crear flujos de mensajeria que garanticen la entrega de novedades al core legado.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Diseñar flujos que envíen mensajes desde el originador al broker y luego al core legado.
- Implementar la lógica para mover mensajes a la cola de mensajes muertos en caso de fallo del core legado.

**Entregable:** Flujos de mensajeria implementados que envían mensajes al core legado y manejan fallos moviéndolos a la cola de mensajes muertos.

<details>
<summary>Pistas de conocimiento</summary>

- Considera cómo asegurar que los mensajes se envíen de manera idempotente.
- Piensa en cómo manejar edge cases donde el core legado falla repetidamente.

</details>

### Fase 3: Pruebas y optimización

**Objetivo:** Verificar el funcionamiento de los flujos de mensajeria y optimizar su rendimiento.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Realizar pruebas para asegurar que los flujos de mensajeria funcionan correctamente.
- Optimizar el rendimiento de los flujos para manejar el throughput y la latencia especificados.

**Entregable:** Flujos de mensajeria verificados y optimizados para manejar el throughput y la latencia especificados.

<details>
<summary>Pistas de conocimiento</summary>

- Considera cómo realizar pruebas unitarias y de integración para verificar el funcionamiento de los flujos.
- Piensa en estrategias de optimización para mejorar el rendimiento de los flujos.

</details>

## Dimensiones Evaluadas

- **queEs**: ¿Qué es un broker de mensajeria y cómo funciona en el contexto de este reto?
- **paraQueSirve**: ¿Para qué sirve la cola de mensajes muertos en este escenario?
- **comoSeUsa**: ¿Cómo se usa la política de reproceso para manejar fallos en el destino?
- **erroresComunes**: ¿Cuáles son los errores comunes que pueden ocurrir al implementar flujos de mensajeria y cómo se pueden mitigar?
- **queDecisionesImplica**: ¿Qué decisiones implica el diseño de flujos de mensajeria confiables en este contexto?

## Criterios de Evaluacion

- Configuración correcta del broker de mensajeria con cola de mensajes muertos y política de reproceso.
- Implementación de flujos de mensajeria que garanticen la entrega de novedades al core legado.
- Manejo adecuado de edge cases donde el core legado falla repetidamente.
- Verificación y optimización del rendimiento de los flujos de mensajeria.

## Como trabajar con un asistente de IA

Hay dos caminos, elegi uno:

- **AGENTS.md** (recomendado) — instrucciones nativas del repo. Abri esta carpeta con tu agente local (Claude Code, Cursor, Codex, Copilot, Gemini) y las carga solo. Sabe que archivos faltan y con que comando se verifica, y completa el scaffold escribiendo en disco.
- **PROMPT_MEJORA.md** — para copiar y pegar en un chat (claude.ai, ChatGPT). Devuelve un ZIP con el proyecto. Sirve si no tenes un agente en el IDE.

Ninguno de los dos resuelve las fases del reto: eso es tu trabajo.

## Verificacion

El proyecto esta listo para trabajar cuando este comando corre sin errores:

```bash
python3 -c "import xml.etree.ElementTree as ET,glob,sys; [ET.parse(f) for f in glob.glob('**/*.xs*', recursive=True)]"
```

---

*Reto generado automaticamente por Challenge Generator - Pragma*

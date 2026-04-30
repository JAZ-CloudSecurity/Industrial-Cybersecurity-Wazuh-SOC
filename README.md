# Implementación de SOC Industrial: Wazuh XDR + Suricata IDS (IEC 62443)

Este repositorio documenta el diseño e implementación de una plataforma de detección y respuesta extendida (XDR) orientada a la protección de redes **SCADA** e infraestructura crítica. El proyecto sigue los lineamientos de la normativa internacional **IEC 62443-2-4**, integrando herramientas de monitoreo de host y de red para una visibilidad 360°.

## 🎯 Objetivos Técnicos
* Desplegar una arquitectura **SIEM/XDR** utilizando Wazuh para la gestión centralizada de eventos.
* Integrar un sistema de detección de intrusiones de red (**IDS**) mediante Suricata.
* Automatizar la respuesta ante incidentes mediante **Active Response**.
* Asegurar el cumplimiento de estándares de ciberseguridad industrial.

## 🛠️ Stack Tecnológico
* **Wazuh (XDR/SIEM):** Análisis de logs, monitoreo de integridad (FIM) y cumplimiento.
* **Suricata (IDS):** Inspección profunda de paquetes y detección de amenazas de red (DoS, escaneos).
* **VirusTotal API:** Enriquecimiento de alertas y análisis de malware en tiempo real.
* **Linux & Bash:** Automatización de scripts de mitigación.
* **XML:** Configuración avanzada de reglas y decodificadores.

## 🛡️ Hitos del Proyecto

### 1. Detección de Amenazas y Hardening
Se configuró el monitoreo de intentos de acceso por fuerza bruta (SSH) y la monitorización de integridad de archivos (**FIM**) en directorios críticos como `/root`. Cualquier modificación no autorizada genera una alerta de alta prioridad en el dashboard.

### 2. Integración IDS Suricata
Implementación de Suricata para el análisis de tráfico de red. Se configuraron reglas específicas para detectar rasgos de ataques de **Denegación de Servicio (DoS)**, permitiendo que Wazuh procese las alertas de red y las correlacione con eventos de host.

### 3. Respuesta Activa (Active Response)
La característica más destacada es la capacidad de respuesta automática. Ante la detección de una amenaza confirmada (vía VirusTotal o firmas de Suricata), el sistema ejecuta el script `remove-threat.sh` para mitigar el riesgo en tiempo real sin intervención humana.

```xml
<active-response>
  <disabled>no</disabled>
  <command>remove-threat</command>
  <location>local</location>
  <rules_id>87105</rules_id> </active-response>

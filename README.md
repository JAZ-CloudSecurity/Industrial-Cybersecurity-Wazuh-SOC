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
<img width="854" height="442" alt="image" src="https://github.com/user-attachments/assets/0c16980e-57b9-4380-96c4-7e12f7f5cff9" />
<img width="877" height="658" alt="image" src="https://github.com/user-attachments/assets/2288ed7c-4df3-4fb3-803a-add9e736b703" />

### 2. Integración IDS Suricata
Implementación de Suricata para el análisis de tráfico de red. Se configuraron reglas específicas para detectar rasgos de ataques de **Denegación de Servicio (DoS)**, permitiendo que Wazuh procese las alertas de red y las correlacione con eventos de host.
<img width="877" height="658" alt="image" src="https://github.com/user-attachments/assets/abf04f42-b2ed-41ef-99dd-4b60f17cd056" />
<img width="891" height="191" alt="image" src="https://github.com/user-attachments/assets/a9e47ec5-6514-4322-8b03-773f35848918" />
<img width="892" height="478" alt="image" src="https://github.com/user-attachments/assets/bd0f0c58-cc58-4bea-a825-0c42ef34069d" />
<img width="763" height="810" alt="image" src="https://github.com/user-attachments/assets/96769e3b-f5c4-4df3-910e-864dbcdccf31" />
<img width="891" height="400" alt="image" src="https://github.com/user-attachments/assets/04a2d5d5-6679-4543-aac7-12ce9dd526c9" />
<img width="885" height="666" alt="image" src="https://github.com/user-attachments/assets/1a1cd54d-6b68-4a43-8c79-584b61abd853" />


### 3. Respuesta Activa (Active Response)
La característica más destacada es la capacidad de respuesta automática. Ante la detección de una amenaza confirmada (vía VirusTotal o firmas de Suricata), el sistema ejecuta el script `remove-threat.sh` para mitigar el riesgo en tiempo real sin intervención humana.

<img width="984" height="94" alt="image" src="https://github.com/user-attachments/assets/5591dff6-3719-43a2-aace-f8b6bf34764c" />
<img width="515" height="254" alt="image" src="https://github.com/user-attachments/assets/a520f6b9-c564-4038-ad53-a74337b27593" />
<img width="715" height="446" alt="image" src="https://github.com/user-attachments/assets/d149b2e1-8a18-48ee-b7d2-d5be2cbd326d" />
<img width="880" height="715" alt="image" src="https://github.com/user-attachments/assets/3ede888d-aa66-4bb7-a5b4-1b1114c6e618" />

---
### 🔗 Integración con Telemetría de Nube
Este centro de operaciones de seguridad (SOC) está diseñado para ser agnóstico a la fuente de datos, permitiendo la ingesta de telemetría proveniente de infraestructuras críticas en la nube.

*   **Fuente de Telemetría de Red**: [Auditoría de Red en AWS VPC Flow Logs](https://github.com/JAZ-CloudSecurity/Auditor-a-de-Red-en-AWS-VPC-Flow-Logs)
    *   *Sinergia Técnica*: El pipeline de datos establecido en el proyecto de Flow Logs permite que este servidor Wazuh realice el monitoreo de eventos de red, detección de escaneo de puertos y análisis de tráfico rechazado (REJECT) mediante la lectura automatizada de buckets de Amazon S3.



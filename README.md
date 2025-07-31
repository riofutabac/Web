# 🍽️ Evaluador de Restaurantes - Examen Práctico

Sistema completo de evaluación de restaurantes con arquitectura de microservicios.

## 📋 Estructura del Proyecto

```
Examen_Alexis_Lapo/
├── 01-restaurantes.sql          # Script de base de datos
├── EvaRest/                     # Backend API
│   └── EvaRestApi/             # Proyecto .NET 8 Minimal API
├── EvaRestWeb/                  # Frontend WebForms .NET 4.8
├── DOCUMENTACION_PASO_A_PASO.md # Guía completa
└── README.md                    # Este archivo
```

## 🚀 Cómo ejecutar

### 1. Base de Datos
```powershell
sqlcmd -S localhost -U sa -P "TuPasswordSA" -i .\01-restaurantes.sql
```

### 2. Backend API
```powershell
cd EvaRest/EvaRestApi
dotnet run
# Swagger: https://localhost:5001/swagger
```

### 3. Frontend WebForms
- Abrir `EvaRestWeb.sln` en Visual Studio
- Ejecutar con F5
- Navegar a `http://localhost:54321`

## 🛠️ Tecnologías

- **Backend:** .NET 8, Minimal API, Entity Framework Core
- **Frontend:** ASP.NET WebForms 4.8, HttpClient
- **Base de Datos:** SQL Server Express
- **Características:** CRUD completo, Async/await, Validaciones

## ✅ Funcionalidades

- ➕ **Crear** restaurantes con validaciones
- 📋 **Listar** todos los restaurantes
- ✏️ **Editar** información existente
- 🗑️ **Eliminar** con confirmación

Cada operación incluye manejo de errores y feedback visual para el usuario.
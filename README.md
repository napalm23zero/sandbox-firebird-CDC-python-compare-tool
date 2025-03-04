# Data Synchronization Engine

A robust Change Data Capture (CDC) system that monitors differences between databases and serves them through a Python API.

![Status](https://img.shields.io/badge/Status-In_Development-yellow)
![License](https://img.shields.io/badge/License-MIT-blue)
![Build](https://img.shields.io/badge/Build-Passing-success)

## 📊 Overview

This project creates a sophisticated data synchronization system that:

1. **Extracts** data from two Firebird databases
2. **Compares** records to identify new, modified, and deleted entries
3. **Stores** differences in PostgreSQL
4. **Exposes** the synchronized data through a Python API
5. **Automates** the entire process to run on schedule

## 🔧 Technology Stack

| Technology | Purpose |
|------------|---------|
| **Firebird** | Source databases containing the original records |
| **PostgreSQL** | Storage for detected changes and differences |
| **FastAPI** | High-performance Python API for data access |
| **Docker & DevContainers** | Containerized development environment |
| **LocalStack** | AWS service simulation for local development |
| **Redis & Celery** | Optional asynchronous task processing |
| **DynamoDB** | Optional NoSQL storage for specific use cases |

## 🛠️ Development Setup

This project uses VS Code DevContainers for consistent development environments. The `.devcontainer` directory contains all necessary configurations.

```bash
# Clone the repository
git clone https://github.com/yourusername/data-sync-engine.git

# Open with VS Code and reopen in container
code data-sync-engine
# Then click "Reopen in Container" when prompted
```

## 🏗️ Architecture

```
┌─────────────────┐     ┌─────────────────┐
│                 │     │                 │
│  Firebird DB 1  │     │  Firebird DB 2  │
│                 │     │                 │
└────────┬────────┘     └────────┬────────┘
         │                       │
         └───────────┬───────────┘
                     ▼
           ┌───────────────────┐
           │                   │
           │  Python Extractor │
           │                   │
           └─────────┬─────────┘
                     │
                     ▼
           ┌───────────────────┐
           │                   │
           │  Celery Workers   │
           │                   │
           └─────────┬─────────┘
                     │
                     ▼
           ┌───────────────────┐
           │                   │
           │    PostgreSQL     │
           │                   │
           └─────────┬─────────┘
                     │
                     ▼
           ┌───────────────────┐
           │                   │
           │    Python API     │
           │                   │
           └───────────────────┘
```

## ⚡ Key Features

- **Real-time Change Detection**: Identifies modifications as they happen
- **Configurable Comparison Logic**: Adapt to different data structures
- **API-First Design**: Everything accessible through RESTful endpoints
- **Dev-Friendly Environment**: Complete setup with Docker Compose
- **Scalable Architecture**: Ready for production workloads

## 🚨 Warning

```
┌─────────────────────────────────────┐
│  Development Environment Only       │
│                                     │
│  This configuration is intended     │
│  for development purposes only.     │
│                                     │
│  Not suitable for production use    │
│  without proper security review.    │
│                                     │
│  Passwords in .env are visible.     │
└─────────────────────────────────────┘
```

## 📜 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 👨‍💻 Maintainer

Rodrigo Dantas - [rodrigo.dantas@hustletech.dev](mailto:rodrigo.dantas@hustletech.dev)

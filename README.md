# 🐳 Docker & Java — Quick Reference Guide

A hands-on command reference for working with Java and Docker from scratch.

---

## ☕ Java Version Check

```bash
java -version
```

---

## 🐳 Docker Basics

### Check Docker Version

```bash
docker --version
```

---

### Pull & Run a Docker Image

```bash
docker run hello-world
```

> This pulls the `hello-world` image (if not already present) and runs it in a new container.

---

## 📋 Container Management

### List Running Containers

```bash
docker ps
```

### List All Containers (including stopped)

```bash
docker ps -a
```

---

## 🖼️ Image Management

### List All Local Images

```bash
docker images
```

### Search for an Image on Docker Hub

```bash
docker search hello-world
```

---

## 🗑️ Cleanup Commands

### Remove a Container

```bash
docker rm <container_id>

# Example:
docker rm f96f79033388
```

### Remove an Image

```bash
docker rmi <image_id>

# Example:
docker rmi 452a468a4bf9
```

---

## 🚀 Container Lifecycle — Step by Step

This section walks through the full lifecycle: **pull → create → start → verify**.

### Step 1 — Pull the Image

```bash
docker pull hello-world
```

### Step 2 — Check Existing Containers

```bash
docker ps -a
```

### Step 3 — Create a Container (without starting it)

```bash
docker create hello-world
```

**Example output:**

```
0fadb2ea420e9f8dca74c0c3621f0377c65122838268531bee19a50d561d351f
```

### Step 4 — Verify the Created Container

```bash
docker ps -a
```

**Example output:**

```
CONTAINER ID   IMAGE         COMMAND    CREATED         STATUS    PORTS   NAMES
0fadb2ea420e   hello-world   "/hello"   5 seconds ago   Created           jolly_hertz
```

> 🔵 **STATUS: Created** — container exists but has not been started yet.

### Step 5 — Start the Container

```bash
docker start 0fadb2ea420e
```

### Step 6 — Verify After Start

```bash
docker ps -a
```

**Example output:**

```
CONTAINER ID   IMAGE         COMMAND    CREATED          STATUS                      PORTS   NAMES
0fadb2ea420e   hello-world   "/hello"   ~1 minute ago    Exited (0) 16 seconds ago           jolly_hertz
```

> ✅ **STATUS: Exited (0)** — container ran successfully and exited cleanly.

---

## 📌 Quick Command Cheatsheet

| Command | Description |
|---|---|
| `docker --version` | Check Docker version |
| `docker run <image>` | Pull (if needed) and run a container |
| `docker ps` | List running containers |
| `docker ps -a` | List all containers (running + stopped) |
| `docker images` | List all local images |
| `docker search <name>` | Search Docker Hub for an image |
| `docker pull <image>` | Pull an image without running it |
| `docker create <image>` | Create a container without starting it |
| `docker start <id>` | Start an existing container |
| `docker rm <id>` | Remove a container |
| `docker rmi <id>` | Remove an image |

---

## 💡 Key Concepts

- **Image** — A read-only template used to create containers (like a blueprint).
- **Container** — A running instance of an image.
- **`docker run`** — Combines `pull` + `create` + `start` in one command.
- **Exit code 0** — The container finished successfully with no errors.
- **`docker ps -a`** — Always use `-a` to see stopped/exited containers too.

---

> 📝 *Notes taken while learning Docker hands-on on Windows (Docker Desktop).*

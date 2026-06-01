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

---

## ☕ Running Java (OpenJDK) Inside Docker

### Step 1 — Search for OpenJDK Image

```bash
docker search openjdk
```

### Step 2 — Pull the OpenJDK Image

```bash
docker pull openjdk:27-ea-oraclelinux10
```

### Step 3 — Run OpenJDK Container (Detached / Normal Mode)

```bash
docker run openjdk:27-ea-oraclelinux10
```

> ⚠️ This exits immediately because the default command is `jshell` with no interactive terminal.

### Step 4 — Run in Interactive (Attach) Mode

```bash
docker run -it openjdk:27-ea-oraclelinux10
```

> `-i` = interactive, `-t` = allocate a terminal (TTY). Together they give you a live shell inside the container.

**Example JShell session inside the container:**

```
|  Welcome to JShell -- Version 27-ea
|  For an introduction type: /help intro

jshell> int num = 8
num ==> 8

jshell> /exit
```

---

## 🌱 Dockerizing a Spring Boot Application

### Prerequisites

- Spring Boot project built locally
- JAR file available at `target/rest-demo.jar`

```bash
# Build the JAR locally first
java -jar target/rest-demo.jar

# Navigate to your project folder
cd C:\Users\goura\Documents\workspace-spring-tools-for-eclipse-4.32.2.RELEASE\docker-project
```

---

### Method 1 — Manual (docker commit approach)

#### Step 1 — Verify the OpenJDK container is running

```bash
docker ps
```

#### Step 2 — Inspect files inside the running container

```bash
docker exec trusting_greider ls -a
```

#### Step 3 — Check the `/tmp` folder inside container

```bash
docker exec trusting_greider ls /tmp
```

**Output:**
```
hsperfdata_root
```

#### Step 4 — Copy local JAR into the container

```bash
docker cp .\target\rest-demo.jar trusting_greider:/tmp
```

**Output:**
```
Successfully copied 19.8MB to trusting_greider:/tmp
```

#### Step 5 — Verify the JAR was copied

```bash
docker exec trusting_greider ls /tmp
```

**Output:**
```
hsperfdata_root
rest-demo.jar
```

#### Step 6 — Commit container as a new image (v1)

```bash
docker commit trusting_greider gourabdocker:v1
```

**Output:**
```
sha256:8f432a2261942595bc885cf31741979cf7c2bd5f536231f99fe8b765bda188e9
```

#### Step 7 — Verify the new image

```bash
docker images
```

**Output:**
```
IMAGE                         ID             DISK USAGE   CONTENT SIZE
gourabdocker:v1               8f432a226194        962MB          327MB
openjdk:27-ea-oraclelinux10   b87052b059f0        926MB          312MB
```

#### Step 8 — Problem: Default CMD is still `jshell`

```bash
docker run gourabdocker:v1
# Opens JShell instead of running the Spring Boot app ❌
```

#### Step 9 — Fix: Commit with a custom CMD (v2 / v8)

```bash
docker commit --change='CMD ["java","-jar","/tmp/rest-demo.jar"]' trusting_greider gourabdocker:v2

# Alternative syntax:
docker commit --change "CMD java -jar /tmp/rest-demo.jar" trusting_greider gourabdocker:v8
```

**Output:**
```
sha256:012c569325d8a610d1629a6b6d5819b2b454c9dbffd11855972c3333f5778cdb
```

#### Step 10 — Run the fixed image

```bash
docker run gourabdocker:v8
```

#### Step 11 — Run with Port Mapping

```bash
docker run -p 8081:8080 gourabdocker:v8
```

```
Host Port  →  8081
Container  →  8080
```

> Access your Spring Boot app at `http://localhost:8081`

---

### Method 2 — Dockerfile (Recommended ✅)

This is the cleaner, repeatable, production-ready approach.

#### Step 1 — Create a `Dockerfile` in your project root

```dockerfile
# Base image with Java
FROM openjdk:27-ea-oraclelinux10

# Set working directory inside container
WORKDIR /app

# Copy the built JAR into the container
COPY target/rest-demo.jar app.jar

# Expose Spring Boot default port
EXPOSE 8080

# Command to run the application
CMD ["java", "-jar", "app.jar"]
```

#### Step 2 — Build the Docker Image

```bash
docker build -t gourabdocker:v1 .
```

**Output:**
```
[+] Building 0.5s (8/8) FINISHED
```

#### Step 3 — Run the Container with Port Mapping

```bash
docker run -p 8081:8080 gourabdocker:v1
```

> ✅ Spring Boot app is now live at `http://localhost:8081`

---

## 📌 Updated Quick Command Cheatsheet

| Command | Description |
|---|---|
| `docker run -it <image>` | Run container in interactive mode with terminal |
| `docker exec <name> ls /tmp` | Run a command inside a running container |
| `docker cp <src> <container>:<dest>` | Copy file from host into container |
| `docker commit <container> <image>:<tag>` | Create new image from container state |
| `docker commit --change 'CMD ...'` | Commit with a custom default command |
| `docker build -t <name>:<tag> .` | Build image from Dockerfile |
| `docker run -p <host>:<container> <image>` | Run with port mapping |

---

## 💡 Key Concepts (Updated)

- **`-it` flag** — Interactive + TTY. Required for running shells like `jshell` or `bash` inside a container.
- **`docker exec`** — Run a command in an *already running* container without restarting it.
- **`docker cp`** — Copy files between your local machine and a container.
- **`docker commit`** — Snapshot a container's current state into a new image.
- **`--change`** flag — Override image metadata (like `CMD`) at commit time.
- **`-p host:container`** — Map a port on your machine to a port inside the container.
- **Dockerfile** — The declarative, reproducible way to build images. Always prefer this over `docker commit` for real projects.

---

> 📝 *Notes taken while learning Docker hands-on on Windows (Docker Desktop).*

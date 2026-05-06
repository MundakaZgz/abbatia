# Abbatia

Abbatia is a legacy Java web game set in medieval monasteries. Players manage an abbey, grow its economy and cultural influence, train monks, produce goods, copy books, and compete within the ecclesiastical hierarchy of around the year 1000.

This repository is a work in progress. It is not a finished modernization effort, and some parts of the original application are still being reconstructed for local development and repeatable startup.

## Where This Project Comes From

- The codebase preserves the original Abbatia web application, historically tied to `abbatia.net` and still reflected in the legacy JSP metadata and static assets.
- This repository is currently hosted as `MundakaZgz/abbatia` and tracks `brodripe/abbatia` as its upstream remote.
- The current state of the repo includes a recent "local resurrection" effort focused on making the application build and boot again with Docker, Tomcat, Maven, and MySQL.

## Repository Layout

The actual application lives in the `Abbatia/` subdirectory.

- `Abbatia/src/`: Java sources and tests.
- `Abbatia/public_html/`: legacy web assets, JSPs, Struts configuration, and static content.
- `Abbatia/db/init/`: database bootstrap scripts used by the containerized local environment.
- `Abbatia/script_bdd/`: historical SQL data and support scripts.
- `Abbatia/tomcat-config/`: Tomcat runtime and entrypoint configuration.
- `Abbatia/tools/`: helper scripts used during the local recovery process.

## Tech Stack

- Java 8
- Maven WAR packaging
- Legacy Struts-based web application with JSPs and static assets
- Tomcat 5.5 runtime
- MySQL 5.7
- Docker Compose for local startup
- MailHog for local email capture

## Architecture

At a high level, the repository combines the original web application sources with a containerized local runtime that makes the legacy stack easier to boot today.

```text
Browser
	|
	v
Tomcat 5.5 container
	- deploys abbatia.war at /abbatia/
	- serves JSPs, static assets, and Struts actions
	- injects JNDI datasources at startup
	|
	+--> MySQL 5.7 container
	|     - initialized from Abbatia/db/init/
	|     - provides application and process datasources
	|
	+--> MailHog container
				- captures local outbound mail for testing
```

### Main Runtime Pieces

- `Abbatia/src/`: Java code, Struts actions, listeners, filters, and supporting logic.
- `Abbatia/public_html/`: the effective web root used to build the WAR, including JSPs, images, and `WEB-INF` resources.
- `Abbatia/Dockerfile`: builds the WAR with Maven, installs Tomcat 5.5, and deploys the application.
- `Abbatia/docker-compose.yml`: orchestrates the app container, MySQL, and MailHog for local development.
- `Abbatia/tomcat-config/docker-entrypoint.sh`: prepares runtime Tomcat configuration, including datasource wiring from environment variables.
- `Abbatia/db/init/`: bootstraps schema and compatibility data for local startup.

### Request And Data Flow

1. A browser hits `/abbatia/` on the local Tomcat container.
2. Tomcat routes requests into the legacy Struts-based web application.
3. The application renders JSPs and static assets from the packaged WAR.
4. Database access goes through Tomcat-managed JNDI datasources backed by MySQL.
5. Email generated in local development is routed to MailHog instead of a real SMTP inbox.

## Current Status

This repo should be treated as a recovery and maintenance effort for a legacy application.

- Work in progress: the project is being brought back to a reproducible local setup.
- Legacy constraints remain: the application keeps old runtime assumptions, old libraries, and legacy web packaging.
- Functional completeness is not guaranteed: local infrastructure is much stronger than full gameplay verification.

## How To Run It Locally

All commands below are run from `Abbatia/`.

### Prerequisites

- Docker Desktop
- Docker Compose v2

### Quick Start

1. Change into the application directory.
2. Copy the environment template.
3. Adjust passwords if needed.
4. Build and start the stack.

```bash
cd Abbatia
cp .env.example .env
docker compose up --build
```

Important environment values live in `.env`, especially:

- `DB_PASSWORD`
- `MYSQL_ROOT_PASSWORD`
- `APP_PORT`
- `MAILHOG_UI_PORT`

### Local Services

Once the stack is up, these endpoints are available:

- Game: `http://localhost:8080/abbatia/`
- Tomcat Manager: `http://localhost:8080/manager/html`
- MailHog: `http://localhost:8025/`

Default local manager credentials are:

- user: `admin`
- password: `admin`

### Database Notes

- The local MySQL container initializes from `Abbatia/db/init/`.
- Those bootstrap scripts are designed to recreate enough schema and compatibility data for local startup.
- MySQL only runs the init directory when the database volume is empty.

To reset the local database completely:

```bash
cd Abbatia
docker compose down -v
docker compose up --build
```

## Building Without Docker

If you only want to produce the WAR file:

```bash
cd Abbatia
mvn package
```

The project is packaged as a WAR and uses `public_html/` as the web source directory.

## Additional Notes

- The in-repo application README at `Abbatia/README.md` contains more detail about the local resurrection phase and database bootstrap process.
- The repo contains historical artifacts, IDE files, seed SQL, and migration-oriented helper scripts that are useful during recovery, even if they are not part of a clean modern application layout.

## Disclaimer

This is a legacy codebase under active recovery. Expect rough edges, incomplete features, and infrastructure-focused changes while the project is still being restored.

# DVD to Streaming Data Infrastructure Migration

## Project Overview
This project simulates the complete Data Engineering and ETL (Extract, Transform, Load) pipeline required to migrate a legacy physical DVD rental business (based on the Sakila database) into a modern, cloud-native digital streaming platform. 

It features a containerized PostgreSQL database, an idempotent schema design, and an isolated Python analytics environment to process simulated streaming telemetry (A/B testing, bitrates, and device tracking).

## Tech Stack
* **OS:** Arch Linux (Native Development)
* **Infrastructure:** Docker & Docker Compose
* **Database:** PostgreSQL
* **Data Transformation:** SQL (DDL/DML)
* **Analytics & Python:** Python 3 (venv), Jupyter Notebooks, Pandas, SQLAlchemy

## Data Migration & Mapping Plan
To pivot from physical rentals to digital streams, the legacy Sakila schema was refactored. 

| Old Sakila Table | Action | New Streaming Table | Transformation Notes |
| :--- | :--- | :--- | :--- |
| `customer` | **Split** | `users` & `profiles` | Mapped one paying user to multiple viewing profiles. |
| `film` | **Rename** | `content` | Dropped physical columns (replacement cost). Kept metadata. |
| `rental` | **Transform** | `streaming_sessions` | Physical 3-day rentals transformed into digital viewing sessions. Timestamps mapped; synthetic telemetry (bitrate) injected. |
| `payment` | **Rename** | `billing_history` | Shifted logic from pay-per-rental to subscription tiers. |
| `inventory` | **Drop** | N/A | Digital streams are infinite; physical tracking deprecated. |
| **N/A (New)** | **Create** | `devices` | Tracks hardware (Smart TV, Mobile, Drone) used for streaming. |

---
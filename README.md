
# OSM & PostGIS Spatial Analysis

**Student:** Elham Alavy
**Course:** GIST 604B – Open Source GIS
**Module:** Module 5 – OSM & PostGIS Spatial Analysis
**University of Arizona**

## Project Description
This repository contains a complete spatial analysis workflow built using OpenStreetMap (OSM) data, PostGIS, and Python. I developed a reusable Python setup workflow to create a PostGIS database, download OSM shapefiles from Geofabrik, and load them into the database. I then ran and interpreted a set of spatial SQL queries for Arizona, and independently adapted the workflow to a new geographic area of interest with three original analysis questions.

## Tools and Technologies
- Python (psycopg2, subprocess, Jupyter Notebooks)
- PostgreSQL with PostGIS extension
- OpenStreetMap (OSM) data via Geofabrik
- Docker / Docker Compose
- SQL (spatial queries, CTEs, geography type)
- GitHub Codespaces

## What I Did
- Built a reusable Python setup function to create a PostGIS database, enable PostGIS, download OSM shapefiles, and load them using `shp2pgsql`
- Ran and verified five prepared spatial SQL queries for Arizona covering restaurant distribution, park area by county, proximity analysis, and railway density
- Executed all SQL queries through a Jupyter Notebook and inspected the results
- Selected a new area of interest, developed three original spatial analysis questions, and wrote corresponding SQL queries
- Created a full analysis notebook for the new AOI including visualizations and written interpretations for each query result

## How to View / Run
- Open this repository in GitHub Codespaces
- Start the database: `docker compose up -d`
- Run `notebooks/setup_osm_postgis.ipynb` to set up the database and load data
- Run `notebooks/osm_postgis_queries.ipynb` to execute the Arizona queries
- Run `notebooks/osm_postgis_[AOI_NAME].ipynb` for the custom area of interest analysis
- SQL files are in the `sql/` folder and can be run directly in the PostgreSQL Explorer

## Repository Structure
```
/
├── notebooks/
│   ├── setup_osm_postgis.ipynb            # Database setup and OSM data loading
│   ├── osm_postgis_queries.ipynb          # Arizona spatial analysis queries
│   └── osm_postgis_[AOI_NAME].ipynb       # Custom area of interest analysis
├── sql/
│   ├── arizona/                           # Prepared SQL queries for Arizona
│   └── [aoi_name]/                        # Custom SQL queries for new AOI
├── src/
│   └── setup_osm_postgis.py              # Reusable Python setup function
├── .devcontainer/                         # Docker container configuration
├── docker-compose.yml
└── README.md
```

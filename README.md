# Retailer Data Project

## Project Overview

This project is meant to illustrate my skills in developing an end-to-end data analytics tech stack.  This includes developing pipelines to ingest data from 3rd party services and pipelines to transform data to usable format inside a cloud data warehouse, developing tools for end users inside a company to access this data, and running analyses myself.

This included:
- Automating data ingestion from Google Drive (meant to simulate 3rd party service) to BigQuery
- Automating transformation of data from raw format to analytics grade data tables, using dbt Cloud
- Creating version-controlled data models and transformations, using Github
- Enabling access to data via automated dashboard and interactive spreadsheet, using Preset and Google Sheets
- Running ad-hoc descriptive analysis on company performance, using BigQuery's SQL editor and Google Slides

## Key Deliverables

- **[Presentation](https://docs.google.com/presentation/d/16IMV9e-u14aAXUbimhqQgLfxw7fvGRAqyqnu8W9yry8/edit?usp=sharing)** - Insights on customer acquisition and retention
- **[Live Dashboard](https://340c79e3.us1a.app.preset.io/superset/dashboard/5/?native_filters_key=RIzc1Pxq9dEM3EbNSvhePyYsFqvPsoSukqXSzdUNQ0-0dxFFQk0NZpn4Hf0VNVSv)** - Dashboard meant to illustrate dashboarding capabilities
- **[Google Sheets Report](https://docs.google.com/spreadsheets/d/1FrdsaDrdkvVm1_TzR2dSxAbkEin57rB8O5FerKOrLGg/edit?gid=472178624#gid=472178624)** - Spreadsheet connected directly to BigQuery meant to illustrate capability
- **[Code Repository](https://github.com/jaime-colmenares/retailer-data-project/blob/main/README.md)** - Code for all data transfomations and data models
- **[Analytics Tables in BigQuery](https://console.cloud.google.com/bigquery?ws=!1m4!1m3!3m2!1sretailer-data-project!2sproduction_analytics)** - Tables ready for analytics use: dim_client, dim_product, fact_order_detail, fact_order_summary, agg_monthly_finance_report, agg_monthly_client_report.
- **[Project Raw Data](https://drive.google.com/drive/u/0/folders/1a71jlXnOEhfqnRUdxJ7bEw2jXpLYf7Iu)** - Storage of raw data files by period, meant to illustrate how periodic data ingestion process works

## Tech Stack

- **Google Drive** - Acts as external data provider (simulating real-world sources like Google Ads, Stripe, LogRocket, etc.)
- **Fivetran** - Manages process to ingest external data on periodic basis (in this case, daily at 1 am)
- **Google BigQuery** - Stores data and provides tools to run analyses on data.  Provides access to data via SQL editor and notebook functionality
- **dbt Cloud** - Manages data transformation inside BigQuery and runs periodic job to update all base, intermediate, and analytics tables (in this case, daily at 3 am)
- **GitHub** - Manages version control for all code and configurations
- **Preset** - Provides access to data via a dashboard
- **Google Sheets** - Provides access to data via a spreadsheet

## Data Source

The project uses the **Global Superstore Transaction Data (2011-2014)** dataset from data.world:
- [Dataset Summary](https://data.world/asepetruk/global-superstore)
- [Raw Data](https://data.world/jcolmenaresv/edaglobalsuperstoretransactiondata20112014/workspace/file?agentid=asepetruk&datasetid=global-superstore&filename=Global+Data+Superstore.xls)

The dataset contains order level transaction data, which includes sales amounts, profit margins, customer segments, product categories, and other customer segment and product category data across multiple years.

## Data Models

This repository contains the complete dbt project with all data models. The models are designed to run in Google BigQuery and integrate with the broader data stack described above.
The project implements a three-layer data architecture:

1. **Base Layer** - Raw data ingestion and basic cleaning
2. **Intermediate Layer** - Business logic application and data enrichment  
3. **Analytics Layer** - Final models optimized for reporting and analysis

All transformations are version-controlled, tested, and documented using dbt best practices.

## Development Timeline

**Total Project Time: ~24 hours**

- Dataset research (~2 hours)
- Infrastructure setup and tool configuration (~8 hours)*
- Data modeling and transformation development (~8 hours)
- Dashboard and visualization creation (~3 hours)
- Analysis and insight generation (~3 hours)

*One-time infrastructure investment - subsequent projects would not require additional time spent on this 

---

**Project Repository:** https://github.com/jaime-colmenares/retailer-data-project

# SQL Data Analytics Project

## 📌 Overview
This project showcases a complete **Data Analytics workflow** implemented purely in SQL.  
It follows two main phases:
1. **Exploratory Data Analysis (EDA)** – understanding the data and extracting key insights.
2. **Advanced Analytics** – deeper, more sophisticated analyses for performance monitoring and decision-making.

The project is structured so that **each analysis type has its own SQL script**, making it easy to follow, reproduce, and extend.

---

## 🗂 Project Map

![Data Analytics Roadmap](docs/Project Roadmap.png)

The diagram above shows all the analytical modules covered in this project.

---

## 1️⃣ Exploratory Data Analysis (EDA)
These scripts focus on understanding the structure, coverage, and basic trends in the dataset.

| #  | Module | Description | Script |
|----|--------|-------------|--------|
| 1 | **Database Exploration** | List tables, inspect schemas, row counts. | [`01_database_exploration.sql`](Scripts/01_database_exploration.sql) |
| 2 | **Dimensions Exploration** | Explore dimension tables for unique values. | [`02_dimensions_exploration.sql`](Scripts/02_dimensions_exploration.sql) |
| 3 | **Date Exploration** | Work with date fields: range, gaps, patterns. | [`03_date_exploration.sql`](Scripts/03_date_range_exploration.sql) |
| 4 | **Measures Exploration** | Summary stats for key numeric metrics. | [`04_measures_exploration.sql`](Scripts/04_measures_exploration.sql) |
| 5 | **Magnitude** | Identify largest/smallest metric values. | [`05_magnitude.sql`](Scripts/05_magnitude_analysis.sql) |
| 6 | **Ranking** | Rank entities (Top N / Bottom N). | [`06_ranking.sql`](Scripts/06_ranking_analysis.sql) |

---

## 2️⃣ Advanced Analytics
These scripts build on the EDA phase to uncover deeper patterns and performance metrics.

| #  | Module | Description | Script |
|----|--------|-------------|--------|
| 7 | **Change-Over-Time Trends** | Track growth/decline over time. | [`07_change_over_time.sql`](Scripts/07_change_over_time_analysis.sql) |
| 8 | **Cumulative Analysis** | Progressive totals (e.g., YTD sales). | [`08_cumulative_analysis.sql`](Scripts/08_cumulative_analysis.sql) |
| 9 | **Performance Analysis** | Compare performance against benchmarks. | [`09_performance_analysis.sql`](Scripts/09_performance_analysis.sql) |
| 10 | **Part-to-Whole** | Proportional contribution analysis. | [`10_part_to_whole.sql`](Scripts/10_data_segmentation.sql) |
| 11 | **Data Segmentation** | Break down data by meaningful groups. | [`11_data_segmentation.sql`](Scripts/11_part_to_whole_analysis.sql) |
| 12 | **Customer Data Reporting** | Final Customer Data aggregated outputs for BI dashboards. | [`12_report_customers.sql`](Scripts/12_report_customers.sql) |
| 12 | **Products Data Reporting** | Final Products Data aggregated outputs for BI dashboards. | [`13_report_products.sql`](Scripts/13_report_products.sql) |

---

## ⚙️ Tech Stack
- **SQL** – Core analytics language.
- **Database** – SQL Server
- **Visualization** – Diagram created with [draw.io](https://draw.io/)
---

## 🛡️ License

This project is licensed under the [MIT License](LICENSE). You are free to use, modify, and share this project with proper attribution.


## 🎓 Acknowledgment

This project was created by following along with the course:
**[The Complete SQL Bootcamp (30 Hours): Go from Zero to Hero](https://www.udemy.com/course/the-complete-sql-bootcamp-30-hours-go-from-zero-to-hero/)**  
by **Baraa Khatib Salkini** on Udemy.  
All credit goes to the instructor. I built this project as part of my learning, by watching the course videos and replicating the steps to better understand SQL and data warehousing concepts.


## 🌟 About Me

Hi there! I'm **Mohammad Junaid**, a dedicated learner with a background in **Business Administration** and a strong interest in **data, analytics, and technology**. I enjoy working on projects that allow me to explore real-world data, improve my technical skills, and deliver valuable insights.

Always curious and committed to growth, I’m on a continuous journey of learning and applying practical knowledge in tech.


Report on Performance Improvements after Partitioning the Booking Table
Objective
The goal was to improve query performance on the large Booking table by implementing partitioning based on the start_date column. This aims to optimize queries that filter bookings by date ranges, reducing query execution time and resource consumption.

Methodology
The Booking table was partitioned by RANGE on the year extracted from the start_date column.

Multiple partitions were created, each corresponding to a year (e.g., 2020, 2021, 2022, etc.).

Performance tests were conducted by running queries with date filters covering different partitions and without filters.

Query plans were examined using EXPLAIN to verify partition pruning.

Execution times were compared against the original non-partitioned table.

Observations
Partition Pruning Verified:

Queries filtering on specific date ranges scanned only the relevant partitions.

For example, a query filtering bookings for the year 2022 accessed only the p2022 partition.

This reduced the volume of data scanned significantly.

Improved Query Execution Times:

Date-range queries executed faster on the partitioned table compared to the non-partitioned version.

Queries that accessed a single partition saw the greatest performance gain.

Broader date range queries spanning multiple partitions still performed better than scanning the entire table.

No Performance Gain for Unfiltered Queries:

Queries without date filters scanned all partitions and showed no significant performance improvement.

This aligns with expectations since partition pruning depends on filtering by the partition key.

Maintenance Benefits:

Partitioning allows easier management of historical data (e.g., dropping old partitions).

Potential to improve data loading and archival operations in future.

Conclusion
Partitioning the Booking table by start_date has led to significant performance improvements for queries that filter by date ranges. Partition pruning effectively limits the data scanned during query execution, resulting in faster response times and better resource utilization. However, queries without date filters do not benefit from partitioning. Overall, partitioning is a recommended strategy for large date-based datasets to optimize query performance and manageability.
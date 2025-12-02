# Task – DimDate & HolidayCountry

A new schema `[edw]` has appeared in our data warehouse.

As mentioned earlier, we will talk about the layers in more detail later on, but in short, `edw` stands for **Enterprise Data Warehouse**.  
At this level, we can apply transformations related to dimensions, which are later used in our reporting layer / **Data Mart**.

Santa Claus asked the Elves to add two attributes to the `[dbo].[DimDate]` dimension:  
`[PL_Holiday]` and `[JP_Holiday]`.  
These attributes should show the value `1` or `0` depending on whether a given day is a public holiday in Poland (`[PL_Holiday]`) or in Japan (`[JP_Holiday]`).  
Public holidays are flagged as `1`, and non-holiday days as `0`.

The holiday information is stored in the table:  
`[edw].[HolidayCountry]`

Our base table, to which we will add these attributes, is:  
`[edw].[DimDate]`.

Starting from `[edw].[DimDate]`, prepare a query that uses data from `[edw].[HolidayCountry]` to add the attributes `[PL_Holiday]` and `[JP_Holiday]`.

In the next step, our jobs would recalculate the transformation you build and populate `dbo.DimDate`.  
(But this is NOT part of the task — your job is to create the logic in the lower `edw` layer.)

---

## Questions

**Question 1:**  
How many rows does your query return after applying the described transformations?

**Question 2:**  
Using `[edw].[HolidayCountry]`, determine how many more public holidays Japan had in **2024** compared to how many Poland will have in **2026**.

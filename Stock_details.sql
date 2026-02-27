Select *
From Daily_Return


--- Standardizing Date
Select Date, Convert (Date, [Date])
From Project..Stock_details

Update Project..Stock_details
Set Date = Convert (Date, [Date])

---- Calculate Daily Returns
--CREATE VIEW Daily_Return As
Select Company, [Date], [Close],
	LAG([Close]) OVER (PARTITION By Company Order By [Date]) AS Prev_Close,
	([Close] - LAG([Close]) OVER (PARTITION By Company Order By [Date]))
	/LAG([Close]) OVER (PARTITION By Company Order By [Date]) * 100 AS Daily_return
From Project..Stock_details


---- Compounded Monthly Return Using CTE
--CREATE VIEW Monthly_Compounded_Return AS
;With Daily_Returns AS (	
	Select Company, [Date], ([Close] - Lag ([Close]) OVER (Partition By Company Order By [Date]
		))/ Lag([Close]) OVER (
		Partition By Company Order By [Date]) AS Daily_Returns
	From Project..Stock_details)

,Monthly_Return As (
	Select
		Company, Year ([Date]) As Year_, Month ([Date]) as Month_, 
		EXP(SUM(LOG(1 + Daily_Returns))) - 1 As Monthly_Compounded_Return
From Daily_Returns
Where Daily_Returns IS NOT NULL
Group By Company, YEAR([Date]), MONTH([Date])
)

Select*
From Monthly_Return
Order By Company, Year_, Month_;

--- Moving Averages 30 MA
--CREATE VIEW MA_30 AS
Select Company, [Date], [Close], Avg([Close]) OVER
		(Partition By Company Order By [Date]
		Rows Between 29 Preceding And Current Row) AS MA_30
From Project..Stock_details
Order By Company, [Date]

--- Moving Averages 200 MA
--CREATE VIEW MA_200 AS
Select Company, [Date], [Close], Avg([Close]) OVER
		(Partition By Company Order By [Date]
		Rows Between 199 Preceding And Current Row) AS MA_200
From Project..Stock_details
Order By Company, [Date]

--- Companies Performances
--With Ranked_data AS (
--	Select Company, FIRST_VALUE([Close])
--		OVER (Partition By Company Order By [Date]) AS First_Price,
--		LAST_VALUE([Close])
--		OVER (Partition By Company Order By [Date]) Rows Between Unbounded Preceding
--		And Unboounded Following) AS Last_Price
--	From Project..Stock_details);

--Select Distinct Company, ((Last_Price - First_Price)/ First_Price) AS Total_Return,
--Order By ((ast_Price - First_Price)/ First_Price) DESC AS Performance_Rank
--From Ranked_Data

--CREATE VIEW Companies_Performance AS 
 With Ranked_Dates AS (
	Select Company, [Date], [Close], ROW_NUMBER() Over 
		(Partition By Company Order By [Date] ASC)  AS First_,
		ROW_NUMBER() Over 
		(Partition By Company Order By [Date] DESC)  AS Last_
	From Project..Stock_details )

	Select f.Company, f.[Close] As First_Price,l.[Close] As Last_Price,
	((l.[Close] - f.[Close]) / f.[Close]) AS Total_Return
	From Ranked_Dates f
	Join Ranked_Dates l
		ON  f.Company = l.Company
	Where f.First_ = 1
	And l. Last_ = 1
	Order By Total_Return DESC;


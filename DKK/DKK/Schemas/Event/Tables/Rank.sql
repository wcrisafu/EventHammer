﻿CREATE TABLE [Event].[Rank]
(
	[RankId] INT IDENTITY(1,1) NOT NULL PRIMARY KEY
	,[Name] NVARCHAR(30) NOT NULL
	,[Level] TINYINT NOT NULL
	,[Kyn] NVARCHAR(15) NOT NULL
)

USE [DWSample ]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [stg].[CustomerInformation](
	[PersonID] [INT] NULL,
	[EnglishEducation] [NVARCHAR](30) NULL,
	[EnglishOccupation] [NVARCHAR](50) NULL,
	[BirthDate] [DATE] NULL,
	[Gender] [NCHAR](5) NULL,
	[MaritalStatus] [NCHAR](5) NULL,
	[EmailAddress] [NVARCHAR](50) NULL
) ON [PRIMARY]
GO



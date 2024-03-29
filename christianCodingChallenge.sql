﻿/*Created in MY SQL*/
 
 USE [DbTwo]
GO
/****** Object:  Table [dbo].[Advertisement]    Script Date: 9/13/2019 1:23:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Advertisement](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[shortTitle] [nvarchar](255) NULL,
	[title] [nvarchar](10) NULL,
	[shortDescription] [nvarchar](255) NULL,
	[content] [nvarchar](255) NULL,
	[createdBy] [int] NULL,
	[slug] [nvarchar](255) NULL,
	[entityTypeId] [int] NULL,
	[statusId] [int] NULL,
	[dateCreated] [datetime2](7) NOT NULL,
	[dateModified] [datetime2](7) NULL,
 CONSTRAINT [PK_Advertisement] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 9/13/2019 1:23:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[latitude] [float] NULL,
	[longitude] [float] NULL,
	[zipcode] [int] NULL,
	[address] [nvarchar](100) NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Advertisement] ADD  CONSTRAINT [DF_Advertisement_dateCreated]  DEFAULT (getutcdate()) FOR [dateCreated]
GO
ALTER TABLE [dbo].[Advertisement] ADD  CONSTRAINT [DF_Advertisement_dateModified]  DEFAULT (getutcdate()) FOR [dateModified]
GO
/****** Object:  StoredProcedure [dbo].[advert_insert]    Script Date: 9/13/2019 1:23:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[advert_insert]
		@shortTitle nvarchar(255)
		,@title nvarchar(255)
		,@shortDescription nvarchar(255)
		,@content nvarchar(255)
		,@createdBy int
		,@slug nvarchar(255)
		,@entityTypeId int
		,@statusId int
		,@latitude float
        ,@longitude float
        ,@zipcode int
        ,@address nvarchar(255)
		,@Id int OUTPUT
		
		
as

/*
Declare @Id int

Declare @shortTitle nvarchar(255) = 'Shorter Title'
		,@title nvarchar(255)='a'
		,@shortDescription nvarchar(255)='b'
		,@content nvarchar(255)='adf'
		,@createdBy int= 1
		,@slug nvarchar(255) ='this.com'
		,@entityTypeId int = 4
		,@statusId int = 1
		,@latitude float = 3330.3
        ,@longitude float = 123.5
        ,@zipcode int = 91352
        ,@address nvarchar(255) = '7072 Tollhouse Dr'
		

		
		

				Execute dbo.advert_insert
							@shortTitle
							,@title
							,@shortDescription
							,@content
							,@createdBy
							,@slug
							,@entityTypeId
							,@statusId 
							,@latitude
							,@longitude
							,@zipcode
							,@address
							
						
							
							Select *
							From dbo.Location
							Where Id = @Id
						

							Select *
							From dbo.[Advertisement]
							Where Id = @Id
*/

BEGIN TRANSACTION

BEGIN

INSERT INTO [dbo].[Advertisement]
           ([shortTitle]
           ,[title]
           ,[shortDescription]
           ,[content]
           ,[createdBy]
           ,[slug]
           ,[entityTypeId]
           ,[statusId])
           
     VALUES(
           @shortTitle
           ,@title
           ,@shortDescription
           ,@content
           ,@createdBy
           ,@slug
           ,@entityTypeId
           ,@statusId )
	Set @Id = SCOPE_IDENTITY()
		   

INSERT INTO [dbo].[Location]
           (latitude
           ,longitude
           ,zipcode
           ,[address])
           
           
     VALUES
          (@latitude
           ,@longitude
           ,@zipcode
           ,@address)

		   Set @Id = SCOPE_IDENTITY()

 END

 COMMIT TRANSACTION
           
GO
/****** Object:  StoredProcedure [dbo].[Advertisment_SelectAll]    Script Date: 9/13/2019 1:23:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[Advertisment_SelectAll]
		@pageIndex int
		,@pageSize int

AS


/*
Declare 
		@pageIndex int = 0
		,@pageSize int = 1

Execute dbo.Advertisment_SelectAll
			@pageIndex
			,@pageSize
*/
BEGIN

	Declare @offset int = @pageIndex * @pageSize

SELECT [Id]
      ,[shortTitle]
      ,[title]
      ,[shortDescription]
      ,[content]
      ,[createdBy]
      ,[slug]
      ,[entityTypeId]
      ,[statusId]
      ,[dateCreated]
      ,[dateModified]
	  ,TotalCount= COUNT(1) OVER()
  FROM [dbo].[Advertisement]

  ORDER BY [Id]
  OFFSET @offset Rows
  Fetch NEXT @pageSize Rows only

  END

GO

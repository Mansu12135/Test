USE [Pekarchuk_M.DataBase.DataBase]
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 21.05.2016 20:16:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[IdAuthor] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[SurName] [nvarchar](max) NULL,
	[MiddleName] [nvarchar](max) NULL,
	[Birthday] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Authors] PRIMARY KEY CLUSTERED 
(
	[IdAuthor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Book_Author]    Script Date: 21.05.2016 20:16:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book_Author](
	[IdAuthor] [int] NOT NULL,
	[IdBook] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Book_Author] PRIMARY KEY CLUSTERED 
(
	[IdAuthor] ASC,
	[IdBook] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Books]    Script Date: 21.05.2016 20:16:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[IdBook] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[IdGenre] [int] NOT NULL,
	[Pages] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Books] PRIMARY KEY CLUSTERED 
(
	[IdBook] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Genres]    Script Date: 21.05.2016 20:16:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genres](
	[IdGenre] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Genres] PRIMARY KEY CLUSTERED 
(
	[IdGenre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[Book_Author]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Book_Author_dbo.Authors_IdAuthor] FOREIGN KEY([IdAuthor])
REFERENCES [dbo].[Authors] ([IdAuthor])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Book_Author] CHECK CONSTRAINT [FK_dbo.Book_Author_dbo.Authors_IdAuthor]
GO
ALTER TABLE [dbo].[Book_Author]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Book_Author_dbo.Books_IdBook] FOREIGN KEY([IdBook])
REFERENCES [dbo].[Books] ([IdBook])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Book_Author] CHECK CONSTRAINT [FK_dbo.Book_Author_dbo.Books_IdBook]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Books_dbo.Genres_IdGenre] FOREIGN KEY([IdGenre])
REFERENCES [dbo].[Genres] ([IdGenre])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_dbo.Books_dbo.Genres_IdGenre]
GO

USE [HAMI_VM]
GO
/****** Object:  View [dbo].[DELIVERYLOG]    Script Date: 12/01/2019 06:51:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[DELIVERYLOG]
AS
Select CCODE,TRCD,TRNO,USERID,DATE from Tranlog Where mODULEID = 'JOB' AND TRCD = 'DELY' AND CCODE <> '' AND OPTAG = 'A'
GROUP BY CCODE,TRCD,TRNO,USERID,DATE






GO
/****** Object:  View [dbo].[GLUVIEW]    Script Date: 12/01/2019 06:51:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[GLUVIEW]
AS
SELECT     *
FROM         HAMI_DATA.dbo.glumast






GO
/****** Object:  View [dbo].[VW_TRANLOG]    Script Date: 12/01/2019 06:51:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VW_TRANLOG]
AS
SELECT DATE,TRCD,TRNO,USERID,OPTAG,moduleid,cocode,YRCD,REMARKS,ccode
FROM dbo.TRANLOG WITH(NOLOCK, INDEX=IDX_TRANLOG)
UNION ALL
SELECT DATE,TRCD,TRNO,USERID,OPTAG,moduleid,cocode,YRCD,REMARKS,ccode
FROM TRANLOG_ARCHIVE WITH(NOLOCK, INDEX=IDX_TranLogArchive)


GO
/****** Object:  StoredProcedure [dbo].[NRV_UserMastUpdate]    Script Date: 12/01/2019 06:51:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:                            <Author,,Name>
-- Create date: <Create Date,,>
-- Description:   <Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[NRV_UserMastUpdate]
(
                @Mode varchar(max),
                @userID varchar(max),
                @name varchar(max),
                @password varchar(max),
                @groupid varchar(max),
                @cocode varchar(max),
                @locode varchar(max)='',
                @loc varchar(max)='',
                @enggcode varchar(max),
                @emailid varchar(max),
                @discper float=0,
                @cashbackperc float=0,
                @allowdate char(1),
                @allowcost char(1),
                @allowloc char(1),
                @multilocreport char(1),
                @block char(1),
                @engtype char(1)
)
as            
BEGIN
                
                IF @Mode='I'
                Begin
                                
                                insert into usermast(userid,name,[password],GroupID,
                                cocode,locode,enggcode,emailid,
                                DiscPer,CASHBACKPERC,allowdate,allowcost,
                                allowloc,multilocreport,Block,loc,enggtype,enggtype1)
                                values(@userid,@name,@password,@GroupID,
                                @cocode,@locode,@enggcode,@emailid,
                                @DiscPer,@CASHBACKPERC,@allowdate,@allowcost,
                                @allowloc,@multilocreport,@Block,@loc,@engtype,@engtype)
                                
                End
                
                IF @Mode='U'
                Begin
                
                                update usermast set userid=@userid,name=@name,password=@password,GroupID=@GroupID,
                                cocode=@cocode,locode=@locode,enggcode=@enggcode,emailid=@emailid,
                                DiscPer=@DiscPer,CASHBACKPERC=@CASHBACKPERC,allowdate=@allowdate,allowcost=@allowcost,
                                allowloc=@allowloc,multilocreport=@multilocreport,Block=@Block,loc=@loc,
                                enggtype=@engtype,enggtype1=@engtype
                                where userid =@userID 
                
                End
                
                IF @Mode='D'
                Begin
                
                                delete from usermast where userid =@userID
                
                End
END






GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_TRANLOG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_TRANLOG'
GO

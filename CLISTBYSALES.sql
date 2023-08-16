CREATE OR ALTER PROCEDURE CustomerListBySales
    @SalesMin DECIMAL(10,2)=NULL,
    @SalesMax DECIMAL(10,2)=NULL
AS
BEGIN
    IF @SalesMin IS NULL OR @SalesMax IS NULL
    BEGIN
        Print 'Neither @SalesMin or @SalesMax can be null';
        Return -1;
    END
    IF @SalesMin>@SalesMax
    BEGIN
        Declare @X Decimal(10,2)=@SalesMin
        Set @SalesMin=@SalesMax
        Set @SalesMax=@X
    END
    SELECT * FROM Customers C
    Where  C.Sales BETWEEN @SalesMin AND @SalesMax
    ORDER BY C.Sales DESC
END
GO
EXEC CustomerListBySales @SalesMin=10000000,@SalesMax=100 
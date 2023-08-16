CREATE OR ALTER PROCEDURE DISPLAYREQANDLINESTEST1
    @REQUESTID INT = null
AS 
BEGIN
    IF @REQUESTID IS NULL
    BEGIN
        PRINT 'ERROR EXPECTED INT'
        RETURN
    END
    ELSE
    BEGIN
        select r.id,r.[Description],r.total,rl.quantity,p.price, (rl.quantity * p.price) Linetotal
        from requests r
        join requestline rl on r.id=rl.requestid
        join products p on p.id=rl.productid
        WHERE R.ID=@REQUESTID;
    END
END
GO
EXEC DISPLAYREQANDLINESTEST1 @REQUESTID=1;
GO
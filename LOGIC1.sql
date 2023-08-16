
BEGIN TRY
    DECLARE @INDEX INT=1;
    SET @INDEX+=5
    RAISERROR('bye',1,1);
END TRY
BEGIN CATCH

END CATCH










/*
--SELECT * FROM requests r JOIN requestline rl ON r.ID=rl.ID

DECLARE cur CURSOR FOR
SELECT ID, [Description] FROM Requests WHERE ID IN (1,2,3);

DECLARE @ID INT, @DESCRIPTION VARCHAR(80), @TOTAL DECIMAL(9,2);

OPEN cur;

FETCH NEXT FROM cur INTO @ID, @DESCRIPTION
WHILE @@FETCH_STATUS=0
BEGIN
    PRINT 'Request ID is '+STR(@ID);
    SELECT @TOTAL = SUM(RL.Quantity*P.Price)
        FROM Requestline Rl
        JOIN Products P ON P.ID=Rl.ProductID
        WHERE Rl.RequestID=@ID
        GROUP BY Rl.RequestID;
    UPDATE Requests SET
        Total=@Total
        Where ID=@ID
    --PRINT 'Total is '+STR(@TOTAL)
    FETCH NEXT FROM cur INTO @ID,@DESCRIPTION
END
CLOSE cur;
DEALLOCATE cur;

*/










/*
DECLARE @COUNTER INT=1;
DECLARE @SUM INT=0;

WHILE @Counter<=90
BEGIN
    IF @COUNTER%2!=0
        BEGIN;
        SET @COUNTER+=1;
        CONTINUE;
        END;
    ELSE
        BEGIN;
        SET @SUM+=@COUNTER; 
        SET @COUNTER+=1;
        END;
END
PRINT 'The sum is'+STR(@SUM)
RETURN
*/



/*
DECLARE @NAME VARCHAR(30)='Greg'+' '+'Doud';
DECLARE @COLOR VARCHAR(30)='red';
IF @COLOR = 'red'
    BEGIN
    PRINT 'The color is red';
    END;
ELSE
    PRINT 'the color is not red';
DECLARE @COUNTER INT = 0;
WHILE @COUNTER<20
BEGIN
    IF @COUNTER = 7
        BREAK
    PRINT 'The value of counter is'+STR(@COUNTER)
    SET @COUNTER+=1
END;
*/
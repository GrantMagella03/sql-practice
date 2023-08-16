CREATE OR ALTER PROCEDURE ListRequestsForUser
    @USERNAME VARCHAR(30)=NULL
AS
BEGIN
    IF @USERNAME IS NULL
    BEGIN
        PRINT '@USERNAME Cannot be null';
        RETURN -1;
    END
    SELECT * FROM Users U
    JOIN Requests R ON U.ID=R.UserID
    WHERE U.Username = @USERNAME
    RETURN 0
END
GO
EXEC ListRequestsForUser @USERNAME='TestUser'
SELECT * FROM Products

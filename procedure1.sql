CREATE OR ALTER PROCEDURE ListAllUsers

AS
BEGIN
    SELECT ID, Username, CONCAT(Firstname, ' ',Lastname) AS 'Name' FROM Users;
END;
GO
EXEC ListAllUsers
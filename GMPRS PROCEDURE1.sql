CREATE OR ALTER PROCEDURE AddProduct
    @PartNbr VARCHAR(30)=NULL,
    @Name VARCHAR(30)=NULL,
    @Price DECIMAL(11,2)=NULL,
    @Unit VARCHAR(30)=NULL,
    @PhotoPath VARCHAR(255)=NULL,
    @VendorName VARCHAR(50)=NULL,
    @VendorID INT=NULL
AS
BEGIN
    IF @PartNbr IS NULL OR @Name IS NULL OR @Unit IS NULL OR @VendorName IS NULL
    BEGIN
        RETURN -1
        --we would also want to check these values to make sure they are valid
    END
    IF @Price is NULL
        SET @Price = 10
    SET @VENDORID = (SELECT ID FROM Vendors WHERE Name LIKE @VendorName+'%')--this works for now but we should validate input data
    IF @UNIT IS NULL
        INSERT Products (PartNbr,Name,Price,PhotoPath,VendorID) VALUES (@PartNbr,@Name,@Price,@PhotoPath,@VendorID)
    ELSE
    BEGIN
        INSERT Products (PartNbr,Name,Price,PhotoPath,Unit,VendorID) VALUES (@PartNbr,@Name,@Price,@Unit,@PhotoPath,@VendorID)
    END
    RETURN 0;
END
GO
EXEC AddProduct @PartNBR='BICPENBASICSINGLE', @NAME='Single Bic Pen', @price=0.45, @Vendorname='BIC';
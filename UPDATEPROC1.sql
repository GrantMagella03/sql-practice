CREATE OR ALTER PROCEDURE UpdateP
    @InputID INT=NULL,
    @PartNbr VARCHAR(30)=NULL,
    @Name VARCHAR(30)=NULL,
    @Price DECIMAL(10,2)=NULL,
    @PhotoPath VARCHAR(255)=NULL,
    @Unit VARCHAR(30)=NULL,
    @VendorID INT=NULL
AS
BEGIN
IF @InputID IS NOT NULL
BEGIN
    If @PartNbr IS NOT NULL
    BEGIN
        UPDATE Products SET PartNbr=@PartNbr WHERE ID=@InputID; 
    END
    IF @Name IS NOT NULL
    BEGIN
        UPDATE Products SET Name=@Name WHERE ID=@InputID;
    END
    IF @Price IS NOT NULL
    BEGIN
        UPDATE Products SET Price=@Price WHERE ID=@InputID;
    END
    IF @PhotoPath IS NOT NULL
    BEGIN
        IF @PhotoPath = 'NULL'
            UPDATE Products SET Photopath=NULL WHERE ID=@InputID;
        ELSE
            UPDATE Products SET PhotoPath=@PhotoPath WHERE ID=@InputID;
    END
    IF @Unit IS NOT NULL
    BEGIN
        UPDATE Products SET Unit=@Unit WHERE ID=@InputID;
    END
    IF @VendorID IS NOT NULL
    BEGIN
        UPDATE Products SET VendorID=@VendorID WHERE ID=@InputID;
    END
    IF @PartNbr IS NULL AND @Name IS NULL AND @Price IS NULL AND @PhotoPath IS NULL AND @Unit IS NULL AND @VendorID IS NULL
    Begin
    Return -1
    END
END
ELSE RETURN -1
return 0
END
GO
EXEC UpdateP @InputID=5, @Name = 'Pen 10 Pack';
Select * From Products
-- Query to create SQL function.
CREATE FUNCTION GetUserDetails (@id INT)
RETURNS NVARCHAR(100)
AS
BEGIN
    DECLARE @user_name NVARCHAR(100);

    SELECT @user_name = CONCAT(user_name, ' (', user_email, ')')
    FROM dbo.users
    WHERE id = @id;

    RETURN @user_name;
END;

SELECT dbo.GetUserDetails(6) AS UserDetails;

-- Query to delete the SQL function.
DROP FUNCTION IF EXISTS GetUserDetails;

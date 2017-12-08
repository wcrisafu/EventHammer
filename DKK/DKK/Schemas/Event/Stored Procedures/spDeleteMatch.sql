﻿CREATE PROCEDURE [Event].[spDeleteMatch]
	@MatchId INT
AS
BEGIN
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
	
	BEGIN TRY

		BEGIN TRANSACTION;

			DELETE FROM mc
			FROM [Event].[MatchCompetitor] mc
			WHERE mc.MatchId = @MatchId

			DELETE FROM m
			FROM [Event].[Match] m
			WHERE m.MatchId = @MatchId

	END TRY
	BEGIN CATCH
			
		SELECT ERROR_NUMBER() AS ErrorNumber
				,ERROR_SEVERITY() AS ErrorSeverity
				,ERROR_STATE() AS ErrorState
				,ERROR_PROCEDURE() AS ErrorProcedure
				,ERROR_LINE() AS ErrorLine
				,ERROR_MESSAGE() AS ErrorMessage;

		IF @@TRANCOUNT > 0  
			ROLLBACK TRANSACTION;  

		THROW;

	END CATCH;

	WHILE @@TRANCOUNT > 0
		COMMIT;
END;
GO
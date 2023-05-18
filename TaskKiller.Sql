USE master;
GO

DECLARE @SQLQ VARCHAR(MAX) = '';

IF OBJECT_ID('tempdb..#tempSP_WHO') IS NOT NULL
BEGIN
    DROP TABLE #tempSP_WHO;
END;

CREATE TABLE #tempSP_WHO (
    spid INT,
    ecid INT,
    status VARCHAR(100),
    loginame VARCHAR(100),
    hostname VARCHAR(100),
    blk INT,
    dbname VARCHAR(100),
    cmd VARCHAR(100),
    request_id INT
);

INSERT INTO #tempSP_WHO
EXEC sp_who;

SELECT *
FROM #tempSP_WHO
WHERE dbname LIKE '%Testing_Final_New%';

SELECT @SQLQ = @SQLQ + '  KILL ' + CAST(spid AS VARCHAR)
FROM #tempSP_WHO
WHERE [status] = 'sleeping' AND dbname LIKE '%Testing_Final_New%';

PRINT @SQLQ;

EXEC (@SQLQ);

DROP TABLE #tempSP_WHO;
GO

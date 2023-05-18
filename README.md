# Kill Sleeping Sessions Script

This script identifies and terminates the sleeping sessions associated with a specific database in SQL Server. It uses the `sp_who` system stored procedure to retrieve information about the currently running sessions and filters the results based on the provided database name.

## Usage

1. Execute the script in SQL Server Management Studio or any other SQL query tool.
2. Modify the script variable `@SQLQ` if needed.
3. Ensure that you have the necessary permissions to kill sessions.

## Description

1. The script creates a temporary table `#tempSP_WHO` to store the output of the `sp_who` stored procedure.
2. It inserts the result of `sp_who` into the `#tempSP_WHO` table.
3. The script selects rows from `#tempSP_WHO` where the database name matches the specified database name, and the status is 'sleeping'.
4. It constructs a dynamic SQL query `@SQLQ` to generate the `KILL` statements for the identified sleeping sessions.
5. The script prints the `@SQLQ` statement.
6. It executes the `@SQLQ` statement to kill the sleeping sessions.
7. Finally, the script drops the `#tempSP_WHO` table.

**Note:** Please exercise caution when using this script, as it terminates sessions. Make sure to specify the correct database name and review the sleeping sessions before executing the script.

## License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT).

-----------------BEGIN: Script to be run at Publisher ''-----------------
use [ReportServer] --<DO NOT CHANGE ON YOURS>

exec sp_addsubscription @publication = N'pub_test', --<DO NOT CHANGE ON YOURS>
						@subscriber = N'TESTServer', --<CHANGE ON YOURS TO THE SUBSCRIPTION SERVER'S NAME> 
						@destination_db = N'ReportServerTempDB', --<CHANGE ON YOURS TO THE NAME OF THE SUBSCRIBING DATABASE> 
						@subscription_type = N'Push', --<DO NOT CHANGE ON YOURS>
						@sync_type = N'initialize with backup', --<CHANGE ON YOURS TO WHAT MINE SAYS HERE>
						@backupdevicetype = N'disk',  --<ADD THIS LINE TO YOURS
						@backupdevicename = N'c:\test.bak', --<CHANGE ON YOURS TO THE FULL PATH TO THE BACKUP
															 -- FILE WE CREATED EARLIER BY BACKING UP OUR PUBLISHING DATABASE>
						@article = N'all', --<DO NOT CHANGE ON YOURS>
						@update_mode = N'read only', --<DO NOT CHANGE ON YOURS>
						@subscriber_type = 0

--DO NOT CHANGE ANYTHING BELOW THIS LINE EXCEPT IF I INDICATE SO						
exec sp_addpushsubscription_agent @publication = N'pub_test', --<DO NOT CHANGE ON YOURS>
								  @subscriber = N'CLMIS06', --<DO NOT CHANGE ON YOURS>
								  @subscriber_db = N'ReportServerTempDB', --<DO NOT CHANGE ON YOURS>
								  @job_login = N'testdomain\sadat', --<CHANGE THIS TO MATCH THE DOMAIN USER ACCOUNT WE DESIGNATED FOR replicatipn 
								  @job_password = N'null', --<CHAGE null TO THE DOMIAN USER ACCOUNT'S ACTUAL PASSWORD> 
								  @subscriber_security_mode = 0,
								  @subscriber_login = N'test', --<CHANGE TO TO THE ACTUAL SQL SERVER ACCONT USERNAME>
								  @subscriber_password = N'null', --<CHANGE null TO THE ACTUAL PASSWORD OF THE SQL SERVER ACCOUNT>   
								  --<DO NOT CHANGE ANYTHING BELOW THIS LINE
								  @frequency_type = 64, 
								  @frequency_interval = 0, 
								  @frequency_relative_interval = 0, 
								  @frequency_recurrence_factor = 0, 
								  @frequency_subday = 0, 
								  @frequency_subday_interval = 0, 
								  @active_start_time_of_day = 0, 
								  @active_end_time_of_day = 235959, 
								  @active_start_date = 20140621, 
								  @active_end_date = 99991231, 
								  @enabled_for_syncmgr = N'False', 
								  @dts_package_location = N'Distributor'
GO
-----------------END: Script to be run at Publisher 'CLMIS06'-----------------


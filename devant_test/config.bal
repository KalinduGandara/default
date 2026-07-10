import ballerina/os;

configurable string mongo = ?;

configurable string sftp_host = os:getEnv("CHOREO_FTP_SFTP_HOST");
configurable string sftp_username = os:getEnv("CHOREO_FTP_SFTP_USERNAME");
configurable string sftp_password = os:getEnv("CHOREO_FTP_SFTP_PASSWORD");

import ballerina/ftp;
import ballerinax/mongodb;

final mongodb:Client mongodbClient = check new (connection = mongo);
final ftp:Client ftp = check new ({
    protocol: "sftp",
    host: sftp_host,
    port: 21,
    auth: {
        credentials: {
            username: sftp_username,
            password: sftp_password
        }
    }
});

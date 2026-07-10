import ballerina/ftp;
import ballerina/http;

listener http:Listener httpDefaultListener = http:getDefaultListener();

service /mongo on httpDefaultListener {
    resource function get user() returns json|error {
        do {
            string[] stringResult = check mongodbClient->listDatabaseNames();

            return stringResult;
        } on fail error err {
            // handle error
            return error("unhandled error", err);
        }
    }

}

listener http:Listener httpDefaultListener1 = http:getDefaultListener();

service /sql on httpDefaultListener1 {
    resource function get user() returns json|error {
        do {
            string var1 = "hello";
            return var1;
        } on fail error err {
            // handle error
            return error("unhandled error", err);
        }
    }

}

listener http:Listener httpDefaultListener2 = http:getDefaultListener();

service /sftp on httpDefaultListener2 {
    resource function get user() returns FileEntry[]|error {
        ftp:FileInfo[] fileInfoList = check ftp->list("/");
        FileEntry[] fileEntries = from ftp:FileInfo fileInfo in fileInfoList
            select {
                name: fileInfo.name,
                path: fileInfo.path,
                isFolder: fileInfo.isFolder,
                isFile: fileInfo.isFile,
                size: fileInfo.size,
                lastModifiedTimestamp: fileInfo.lastModifiedTimestamp,
                extension: fileInfo.extension
            };
        return fileEntries;
    }

}

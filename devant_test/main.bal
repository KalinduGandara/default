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

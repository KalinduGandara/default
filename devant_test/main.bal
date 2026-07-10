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
            string var1 = temp1;
            return var1;
        } on fail error err {
            // handle error
            return error("unhandled error", err);
        }
    }

}

listener http:Listener httpDefaultListener2 = http:getDefaultListener();


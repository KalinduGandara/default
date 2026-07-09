import ballerinax/mongodb;

final mongodb:Client mongodbClient = check new (connection = mongo);

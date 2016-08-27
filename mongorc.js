db = db.getSiblingDB("test")
var host = db.serverStatus().host;
var prompt = function() { return db+"@"+host+"> "; }

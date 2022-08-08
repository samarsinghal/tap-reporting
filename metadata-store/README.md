CREATE TABLE workload (
	namespace VARCHAR ( 100 ) ,
	name VARCHAR ( 100 ) ,
	source VARCHAR ( 500 ) ,
	supplychian VARCHAR ( 100) ,
	ready VARCHAR ( 50 ),
        reason VARCHAR ( 500 ),
	project_Id VARCHAR ( 100 ),
	scaned_Repository VARCHAR ( 100 ),
	scaned_Image VARCHAR ( 100 ),
	image_Digest VARCHAR ( 100 )
);


CREATE TABLE IF NOT EXISTS "workload_vulnerabilities" (
    "image_Digest" TEXT,
    "list_ID" INT,
    "list_CVEID" TEXT,
    "list_URL" TEXT,
    "list_Description" TEXT,
    "list_CNA" TEXT,
    "list_Ratings_MethodTypeID" INT,
    "list_Ratings_Score" NUMERIC(2, 1),
    "list_Ratings_Vector" TEXT,
    "list_Ratings_Severity" TEXT,
    "list_Packages_ID" INT,
    "list_Packages_Name" TEXT,
    "list_Packages_Version" TEXT,
    "list_Packages_PackageManager" TEXT,
    "list_Packages_Homepage" INT,
    "list_Packages_Sources" INT,
    "list_Packages_Images" INT,
    "list_Packages_Vulnerabilities" INT,
    "list_References" INT
);
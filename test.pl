use DBI;
use strict;
use CGI;

my $cgi = CGI->new();
my $driver   = "SQLite";
my $database = "testdb.db";
my $dsn = "DBI:$driver:dbappt_time:$database";
my $userid = "";
my $password = "";
my $dbh = DBI->connect($dsn, $userid, $password, { RaiseError => 1 }) or die $DBI::errstr;
print "connected to db";



sub CreateTable {
    my $stmt = qq(CREATE TABLE APPTS
   (ID INT PRIMARY KEY     NOT NULL,
      appt_time           DATETIME    NOT NULL,
      description       CHAR(50)););

    my $rv = $dbh->do($stmt);
    if($rv < 0) {
       print $DBI::errstr;
    } else {
       print "Table created successfully\n";
    }

}





sub InsertTest {
    my $stmt = qq(INSERT INTO APPTS (ID,appt_time,description)
               VALUES (3, '2018-05-11 11:15:20', 'test'));
    my $rv = $dbh->do($stmt) or die $DBI::errstr;

    $stmt = qq(INSERT INTO APPTS (ID,appt_time,description)
                   VALUES (4, '2018-05-12 11:15:20', 'test2'));
    $rv = $dbh->do($stmt) or die $DBI::errstr;


    print "Records created successfully\n";
}













my $stmt = qq(SELECT * from APPTS;);
my $sth = $dbh->prepare( $stmt );
my $rv = $sth->execute() or die $DBI::errstr;

if($rv < 0) {
   print $DBI::errstr;
}


while(my @row = $sth->fetchrow_array()) {
      print "ID = ". $row[0] . "\n";
      print "appt_time = ". $row[1] ."\n";
      print "description = ". $row[2] ."\n";
}
print "Operation done successfully\n";


$dbh->disconnect();


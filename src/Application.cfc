
component {
  this.name = 'LuceeStarter';

  this.ormEnabled = true;
  this.ormSettings.dbcreate = 'dropcreate';

  this.dataSource = {
	  class: 'org.gjt.mm.mysql.Driver',
    connectionString: 'jdbc:mysql://192.168.99.100:3306/lucee_starter?useUnicode=true&characterEncoding=UTF-8&useLegacyDatetimeCode=true',
    username: 'root',
    password: "encrypted:adf7434941275ebb8c14975839455526ccb988170923e39b"
  };

}

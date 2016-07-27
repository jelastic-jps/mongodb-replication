[![MongoDB Database Replication](images/mongodb-logo.png)](../../../mongodb-replication)
## MongoDB Database Replication

The JPS package deploys MongoDB Cluster with preconfigured replication that initially contains 2 database containers. The package provides the solution for solving performance problems, DB backups support, gives ability to alleviate system failures. It enables data from one database server (the master) to be replicated to another (the slave).

### Highlights
This package is designed to solve a number of different problems with performance, the primary database downtime (e.g. due to hardware failure or connection interruption).<br />
It enables data from one database server (the master) to be replicated to to another (the slave).
This primary (the master) database will process all the incoming write operations, storing the information about them within its oplog, where they can be accessed and replicated by every secondary (the slave) replica member for being applied to their data sets. In such a way, all of the servers will represent the same content and ensure its availability.<br />

###Environment Topology

![MongoDB Database Replication Topology](https://docs.google.com/drawings/d/1aO-l2iaL8NOb2xruqyvaHLdDPudjtYoXqEH7ir8xrs4/pub?w=277&h=97)

### Specifics

Layer              |     Server    | Number of CTs <br/> by default | Cloudlets per CT <br/> (reserved/dynamic) | Options
----------------- | --------------| :-----------------------------------------: | :-------------------------------------------------------: | :-----:
DB                  |    MongoDB (NoSQL)   |       2                                             |           1 / 16                                                       | -

* DB - Database 
* CT - Container

**MongoDB Database**: 3.2.1

### Deployment

In order to get this solution instantly deployed, click the "Get It Hosted Now" button, specify your email address within the widget, choose one of the [Jelastic Public Cloud providers](https://jelastic.cloud) and press Install.

[![GET IT HOSTED](https://raw.githubusercontent.com/jelastic-jps/jpswiki/master/images/getithosted.png)](https://jelastic.com/install-application/?manifest=https%3A%2F%2Fgithub.com%2Fjelastic-jps%2Fmongodb-replication%2Fraw%2Fmaster%2Fmanifest.jps)

To deploy this package to Jelastic Private Cloud, import [this JPS manifest](../../raw/master/manifest.jps) within your dashboard ([detailed instruction](https://docs.jelastic.com/environment-export-import#import)).

More information about Jelastic JPS package and about installation widget for your website can be found in the [Jelastic JPS Application Package](https://github.com/jelastic-jps/jpswiki/wiki/Jelastic-JPS-Application-Package) reference.


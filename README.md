## Setting up local Seedco Docker

Clone this repository and clone app repository inside
```
git clone git@github.com:mmorgansky/seedcoDocker.git
cd seedcoDocker
git clone git@github.com:SeedcoEBO/SeedcoEBO.git app
```
___
You will need to download jasperreports-server-cp-5.6.1-bin and place it in the .docker directory.
##@todo:
    use Dockerfile to automatically download jasperreports
___
Replace both properties in crmeb-parent/pom.xml with the following:
 ```
<properties>
       <jndipattern>crmeb/#{ejbName}/local</jndipattern>
       <db.connectionstring>db</db.connectionstring>
       <db.reportsconnectionstring>db</db.reportsconnectionstring>
       <db.port>5432</db.port>
       <db.username>postgres</db.username>
       <db.password>R00tForSeedcoThisIs!</db.password>
       <db.name>ebo</db.name>
       <db.maxpool>20</db.maxpool>
       <db.minpool>10</db.minpool>
       <jboss.home>${project.basedir}/../Deploy</jboss.home>
       <debug.setting>false</debug.setting>
       <seedco.dir>${project.basedir}/../Seedco/ebo/crm</seedco.dir>
       <eb.dir>${project.basedir}/../build_temp/ebo/crmeb.ear</eb.dir>
       <outputdir>${project.basedir}/../build_temp/ebo/</outputdir>
       <profile.id>ebo</profile.id>
       <seedco.files.dir>ebo</seedco.files.dir>
       <unpack.types>ejb,war</unpack.types>
       <dbtype>${multi_db}</dbtype>
       <unpack>true</unpack>
</properties>

for ebo replace the following portion:

		<seedco.dir>${project.basedir}/../Seedco/ebo/crm</seedco.dir>
        <eb.dir>${project.basedir}/../build_temp/ebo/crmeb.ear</eb.dir>
        <outputdir>${project.basedir}/../build_temp/ebo/</outputdir>
        <profile.id>ebo</profile.id>
        <seedco.files.dir>ebo</seedco.files.dir>

```
___
 Download Eclipse and set up as per instructions in application read me, including Java, and Maven Builds instructions
___
Get a copy of database from a non production database and restore into database docker, you will need ebo, and may need other databases such as jasper, jasper6 training, and others as well.
place the dumps in .docker/postgres/share, they will then be accessible in the home directory of docker
```
docker exec -it seedcodocker_db_1 bash
su - postgres
createuser seedco
su - postgres
psql
grant all privileges on database ebo to seedco;
\q
psql dump <db> < <dbfile>
```
https://www.postgresql.org/docs/9.5/static/backup-dump.html
launch docker: `docker-compose up`
go into database docker: `docker exec -it seedcodocker_db_1 bash`
___
When ebodev local install is ran in eclipse, it will move ear file to Deploy/crmeb.ear, which is mirrored into the docker's jboss deploy directory. Access via http://localhost:8080/crmeb/home.seam
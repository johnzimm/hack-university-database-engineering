#!/bin/bash

exit 1

sudo su - postgres
psql
CREATE USER vagrant with CREATEUSER;
CREATE database vagrant;
ALTER ROLE vagrant WITH PASSWORD 'vagrant';
\q
exit
psql < /vagrant/data/buildCrimeDataRaw.sql

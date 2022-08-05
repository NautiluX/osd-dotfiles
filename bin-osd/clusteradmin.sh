#!/bin/bash

ocm create idp --type=htpasswd --name=htpasswd --username=admin --cluster=$CLUSTERID

oc adm groups new cluster-admins admin --as backplane-cluster-admin
oc create clusterrolebinding --clusterrole=cluster-admin --group=cluster-admins osd-cluster-admin --as backplane-cluster-admin

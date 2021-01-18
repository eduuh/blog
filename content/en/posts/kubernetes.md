---
title: "Getting Started with Kubernetes"
description: "Kubernetes is a container orchestration application developed by
Google. It provides a unified API that can be used to manage the deployment and
upgrades of containerized applications, batch jobs and databases."
date: 2021-01-13T06:00:31Z
draft: true
hideToc: false
enableToc: true
author: eduuh
authorEmoji: 🤖
tags:
- linux
categories:
- Productivity
series:
- workspace
---

Kubernetes provides a layer of abstraction and isolation to applications from
the underlying hardware by deploying them in containers. Kubernetes uses a
**declarative** approach to deploying applications. As a user , you write the
application requirement *such as networking, ports, memory, and replication* in
manifest. Kubernetes then reads this mainifest and decides where to place the
nodes that run your application in the cluster.

Kubernetes is also know as **K8s** which replaces 8 characters between the K
and the S. Because of its excelent orchestration and routing capabilites.
Kubernetes is an enterprice grade platform for building microservices
applications. Kubernetes decides the placement of microservices. It has inbuild
features to support service descovery. Using the service discovery features of
kubernetes, **micoservices** can talk without knowing each other's physical
location.

Behind the scene kubernetes is always working to keep the cluster in the
desired state maintaing required replica coaunts and monitoring service health
by taking actions like replacing nodes with new ones and providing a holistic
view fo the cluster to the administrator.

### The Architecture

The overall architecture of Kubernetes is composed of three parts: 

1. **The cluster**
2. **The master**
3. **The node**

#### Cluster

The cluster forms the infrastructure component of kubernetes and it is
responsible for hosting the kubernetes platform. *Most of the cloud vendors
offers managed kubernetes cluster that are ready to host your application with
just a few clicks, however, you can set up a cluster on-premises as well, which
is a much more complex activity.

- clusters are collections of computing hosts, storage, and network resources
     that kubernetes can use deploy and manage your application.

#### Master

The master component of kubernetes is responsible for allocation workloads to
nodes and managing the cluster state so that the cluster always remains in the
desired state. For a **kubernetes cluster**, the disired state means
infrastructure and application requirements such as which application the user
want to run on a cluster, which container that application should use, and
which network and disk resources the user want to make available to the
application.

- Kubernetes master makes up the control plane of kubernetes. It is made up of
    several components, such as 
     1. **Api server**
     2. **A scheduler**
     3. **A controller Manager**
     4. **A Cluster configuration storage** which is implenmented with etcd.
       - A consistent and highly available key value store that store
           kubernetes cluster data.

####### > image here


At a high level, the master schedules the **pods** and handles cluster events,
such as health check. The master can be deployed on multiple nodes to make the
cluster highly available. All interaction with the master take place through
the **kubernetes REST API**, which makes it easy to build custom tooling for
mainagin kubernetes clusters. Users can use the **kubectl** tool, a **Rest
cli** command line interface client, to send a manifest with the desired
changes to the Api Server.


The nodes on the other hand, run the actual workloads on containers. 

### Rest Api

Any interction of tools or developers with Kubernetes takes place through the
Kubernetes Api, the **kube-apiserver**. Interact with the Api using the command
line interface (CLI) called **kubectl**, which is a simple client build for
simplifying interaction with the **kubernetes API.** the Api stores the state
data in the cluster state store. The **etcd** cluster. The API is stateless, so
it can be scaled out on demand.

### ETCD

**Etcd** is a realiable, distributed persitent data store that is used by the
api server to store and configuration. The etcd cluster store is
distrubuted. The cluster store is the single source of truth for the cluster.

### Contoller Manager.

The controller manager, **kube-controller-manager**, is the management engine
of kubernetes.It is a deemon that is made up of multiple managers that control
replication, pods services, endpoints .The manager watch their repective
resources through the Kubernetes Api and try to direct the cluster to thet
desired state in case of any inconsistency.

The cloud variant of the controller manager, cloud-replication, pods services,
endpoints and so on. The manager watch 

kubectl get pods

> more notes here

### Namespaces

Kubernetes allow you to segregate your deployments into different namespaces,
which act as virtual clusters within the same physical cluster. Like
programming namespaces, kubernetes namespaces also provides a scope boundary
that allow you to have unique resource names within the namespaces.


You can create an isolation boundary withion a set of application on a cluster
using namespaces. A namespace is a virtual cluster, and it can communicate with
another namespace using only public interfaces. Nodes and persistent volumes
are not part of namespaces. Kubernetes can shedules pods from different
namespaces to use the same set of resources.

Namespaces is a virtual cluster should only be used if you have the proper use
for them like segregating resources among different users, or applying
different access controls. If you have different versioons of the same
resources, then you should always use labels to separaet them.

By default, all resource are created in the default namespace. If you
don't specify the name of namespace in the specification of a Kubernetes
object, it get created in the default namespace.


### starting a simple pod with **kubectl run**

# GloBI Archive

[![standard-readme compliant](https://img.shields.io/badge/standard--readme-OK-green.svg?style=flat-square)](https://github.com/RichardLitt/standard-readme)

An archive of species interaction datasets produced by [Elton](https://github.com/globalbioticinteractions/elton) and stored in places like the [Internet Archive](https://archive.org). 

<a href="http://globalbioticinteractions.org/">
  <img src="http://www.globalbioticinteractions.org/assets/globi.svg" height="120">
</a>

## Table of Contents

- [Install](#install)
- [Usage](#usage)
- [Building](#building)
- [Contribute](#contribute)
- [License](#license)

## Install

1. install [git](https://git-scm.com/)
1. install [git-annex](https://git-annex.branchable.com)  

### Building

* Clone this repository
* Get all files by running ```git annex get```
* Stay up-to-date by syncing git annex repo use ```git annex sync``` and getting new files ```git annex get``` every once in a while.

## Usage

### Use With Elton
You can use this archive in combination with [Elton](https://github.com/globalbioticinteractions/elton) if you'd like.

For instance, you can print all taxonomic names without any needs for an internet connection by pointing Elton to your local archive (or cache) dir:

```sh
java -jar elton.jar names --cache-dir=[your archive dir]/datasets --offline
```


### Standalone
If you'd like to write your own parsers and/or get to the raw data, you can poke around the archive directories. The directories are grouped as follows:

```
  datasets/[some org]/[some name]/
     access.tsv (contains where the resource were retrieved from and when)
     [resources with sha256 filenames] 
```

for instance, the archive directory associated with https://github.com/globalbioticinteractions/template-dataset looks like

```
  datasets/globalbioticinteractions/template-dataset/
    access.tsv
    c1b37add5ee5f30916f19811c59c2960e3b68ecf1a3846afe1776014c4c96271
    631d3777cf83e1abea848b59a6589c470cf0c7d0fd99682c4c104481ad9a543f
    1cc8eff62af0e6bb3e7771666e2e4109f351b7dfc6fc1dc8314e5671a8eecb80
```

According to access.tsv, 631d3777cf83e1abea848b59a6589c470cf0c7d0fd99682c4c104481ad9a543f was first retrieved from https://zenodo.org/record/207958/files/globalbioticinteractions/template-dataset-0.0.2.zip at 2017-09-18T17:59:36Z .

### Updating the Archive
If you'd like to update the archive itself and copy/upload updated resources into the [Internet Archive](https://archive.org), you can do the following: 

1. get push credentials to this repository
1. get credentials to internet archive (or any other remote)
1. copy config template ```cp .archive.env.template .archive.env``` and add your creds 
1. add internet-archive remote using ```git annex initremote internet-archive type=S3 host=s3.us.archive.org bucket=globalbioticinteractions x-archive-meta-mediatype=datasets x-archive-meta-language=eng x-archive-meta-title="Global Biotic Interactions: Source Datasets"```
1. enabled internet-archive remote using ```git annex enableremote internet-archive```
1. run an elton update (for details see https://github.com/globalbioticinteractions/elton)
1. copy elton datasets into archives and sync using ```./update.sh [elton dataset dir] [archive repo root dir]```

### Make your own archive
If you'd like to keep your own copy of GloBI interaction datasets, you can take the previous section as inspiration and use your own git-annex supported archiving mechanism like: Amazon S3, a thumbdrive, webdav or any other [supported remote](https://git-annex.branchable.com/special_remotes/). 

## Contribute

Feel free to join in. All welcome. Open an [issue](https://github.com/globalbioticinteractions/archive/issues)!

## License

[GPL](LICENSE)

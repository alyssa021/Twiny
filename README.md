# Twiny

A CLI Application that checks for duplicate files in the directory.
It uses md5sum hash to check duplicacy.

## Installation
```bash
$ sudo make install
$ sudo make remove # to uninstall
```

## Usage
Consider a folder with five files.

_first_, _third_ and _fourth_ with same content

_second_ and _fifth_ with unique content

```bash
$ twiny # Inside ^ dir
eb260e9ae827821beceeed4104f0ad89 - first
eb260e9ae827821beceeed4104f0ad89 - fourth
eb260e9ae827821beceeed4104f0ad89 - third

```

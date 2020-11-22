#!/bin/bash
/usr/bin/kubectl config current-context | grep -oP "gke_.*_.*_\K(.*)|.+"

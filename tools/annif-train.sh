#!/bin/bash

# set environment variable for host IP
export DOCKER_HOST=ssh://root@`doctl compute droplet list --format "Name,PublicIPv4" | grep docker-host | sed 's/[a-zA-Z<>/ :-]//g'`

echo 'Training backends...'

# Load vocabularies
time docker exec -u root:root annif_bash_1 annif loadvoc rula-tfidf-en Annif-corpora/vocab/lcsh/lcsh.ttl

# Train individual backends in sequence
time docker exec -u root:root annif_bash_1 annif train rula-tfidf-en Annif-corpora/training/rula.tsv.gz
time docker exec -u root:root annif_bash_1 annif train rula-omikuji-parabel-en Annif-corpora/training/rula.tsv.gz
time docker exec -u root:root annif_bash_1 annif train rula-maui-en Annif-corpora/fulltext/rula/validate/
time docker exec -u root:root annif_bash_1 annif train rula-triple-ensemble-en Annif-corpora/training/rula.tsv.gz

# unset environment variable for host IP
unset DOCKER_HOST
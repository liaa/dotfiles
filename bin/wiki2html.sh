#!/bin/bash

env HUGO_baseURL="file:///home/${USER}/vimwiki/_site/" \
    hugo --themesDir ~/vimwiki/themes \
    --config ~/vimwiki/config.toml \
    --contentDir ~/vimwiki/content \
    -d ~/vimwiki/_site --quiet > /dev/null

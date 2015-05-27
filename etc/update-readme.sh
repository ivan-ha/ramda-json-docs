#!/usr/bin/env bash

cat latest.json | R \
  'project <[ name sig category ]>' \
  'map evolve sig: (-> it && "`#it`"), name: -> "[`#it`](http://ramdajs.com/docs/##it)"' \
  | md-table \
  | R -i raw -s 'join \\n' 'create-map-entry \table' \
  | tmpl etc/README.tmpl.md > README.md
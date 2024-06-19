#!/bin/bash
fecha=$(date)
git add *
git commit -m "$fecha"
git push

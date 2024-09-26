#!/bin/bash

REPO_URL="https://github.com/joaomarceloalencar/devops.git"
REPO_DIR="devops"
TARGET_DIR="$HOME/todolist_postgres"

git clone $REPO_URL

echo "Copiando arquivos para $TARGET_DIR..."
mkdir -p $TARGET_DIR
cp -R $REPO_DIR/Laboratorios/02_Docker/todolist_postgres/* $TARGET_DIR

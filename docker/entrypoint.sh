#!/bin/sh
cd /app || true
composer install -n
exec bash

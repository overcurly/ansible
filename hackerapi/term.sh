#!/usr/bin/env bash
function handle_sigkill(){
echo 'SIGKILL received'
function handle_sigterm()
echo 'SIGTERM received'
trap handle_sigterm SIGTERM
trap handle_sigkill SIGKILL
while true; do
sleep 1;
done

@echo off
title Installing...
if exist primitive-cloud-server del /q primitive-cloud-server
git clone https://github.com/SheepTester/primitive-cloud-server.git
cd..
cd nodejs2
set dir=%cd%
cd..
cd server
xcopy /i /s "%dir%" "primitive-cloud-server"
cd primitive-cloud-server
npm.cmd install
cd..
start-server
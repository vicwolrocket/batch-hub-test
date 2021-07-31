@echo off
if exist primitive-cloud-server del /q primitive-cloud-server
git clone https://github.com/SheepTester/primitive-cloud-server.git
cd..
cd nodejs2
set 1=%cd%
cd..
cd server
xcopy /i /s "%1%" "primitive-cloud-server"
cd primitive-cloud-server
npm install
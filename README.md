# healthclock
定时锁屏程序

REM  ++++++++++++++++++++++++++++++++++++++++ 

REM               定时锁屏程序
REM                            by fcghao 2015.12.3  
REM  ++++++++++++++++++++++++++++++++++++++++
REM 功能描述：
REM  开机后每隔一个小时锁屏一次的功能，
REM	强制锁屏1分钟（可自定义）
REM	九点半以后的每次锁屏之后产生一个提醒框（可自定义时间）
REM	当弹出对话框的时候要叉掉之后 程序才可以继续执行  否则程序暂停不计数，不锁屏。

REM 安装：  双击后，把本文件要放在win7 启动 文件夹下面 开机自启动 
REM C:\Users\Administrator\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup

REM 取消： 方法一 除去 启动文件夹下的该文件，重启电脑
REM        方法二  cmd中执行 taskkill /im:wscript.exe /f /t 可以除去今天的提醒  但是开机还有，要手动启动中去掉
REM 自定义  请修改该处内容   ++++++     自定义时间可以修改此处      +++++++++++++++


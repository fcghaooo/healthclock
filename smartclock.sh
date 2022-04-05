#!/bin/sh


#  crontab -e 来编辑自定义自己的任务
#  *　　*　　*　　*　　*　　command
#  分　 时　 日　 月　 周　 命令
#每一小时重启
#  * */1 * * * sh /Users/abc/Documents/smartclock.sh

#  */5 * * * * sh /Users/abc/Documents/smartclock.sh


say hello
'/System/Library/CoreServices/Menu Extras/User.menu/Contents/Resources/CGSession' -suspend > a
say fcg

# 用户

## who

作用：用于查看当前登入主机的用户终端信息

## last

last 命令用于查看所有系统的登录记录，格式为“last [参数]”。
使用 last 命令可以查看本机的登录记录。但是，由于这些信息都是以日志文件的形式保存在系统中，因此黑客可以很容易地对内容进行篡改。千万不要单纯以该命令的输出信息而判断系统有无被恶意入侵！

## 权限相关

另外，很多图书或培训机构的老师会讲到，Linux 系统中的管理员就是 root。这其实是错
误的，Linux 系统的管理员之所以是 root，并不是因为它的名字叫 root，而是因为该用户的身
份号码即 UID（User IDentification）的数值为 0。在 Linux 系统中，UID 就相当于我们的身份
证号码一样具有唯一性，因此可通过用户的 UID 值来判断用户身份。在 RHEL 7 系统中，用
户身份有下面这些。
¾ 管理员 UID 为 0：系统的管理员用户。
¾ 系统用户 UID 为 1～999： Linux 系统为了避免因某个服务程序出现漏洞而被黑客提
权至整台服务器，默认服务程序会有独立的系统用户负责运行，进而有效控制被破坏
范围。
¾ 普通用户 UID 从 1000 开始：是由管理员创建的用于日常工作的用户。
需要注意的是，UID 是不能冲突的，而且管理员创建的普通用户的 UID 默认是从 1000
开始的（即使前面有闲置的号码）。
为了方便管理属于同一组的用户，Linux 系统中还引入了用户组的概念。通过使用用
户组号码（GID，Group IDentification），我们可以把多个用户加入到同一个组中，从而方
便为组中的用户统一规划权限或指定任务。假设有一个公司中有多个部门，每个部门中又
有很多员工。如果只想让员工访问本部门内的资源，则可以针对部门而非具体的员工来设
置权限。例如，可以通过对技术部门设置权限，使得只有技术部门的员工可以访问公司的
数据库信息等。
另外，在 Linux 系统中创建每个用户时，将自动创建一个与其同名的基本用户组，而且
这个基本用户组只有该用户一个人。如果该用户以后被归纳入其他用户组，则这个其他用户
组称之为扩展用户组。一个用户只有一个基本用户组，但是可以有多个扩展用户组，从而满
足日常的工作需要。

## useradd

```bash
useradd [option] username
```

- `-d`：指定用户的家目录，默认为 `/home/username`
- `-e`：账户的到期时间，格式为 YYYY-MM-DD
- `-u`：指定用户的默认 UID
- `-g`：指定一个初始的用户基本组（必须已存在）
- `-G`：指定一个或多个扩展用户组
- `-N`：不创建与用户同名的用户基本组
- `-s`：指定该用户的默认 Shell。若指定 Shell 为 `/sbin/nologin` 代表该用户不能登陆到系统中

## groupadd

```bash
groupadd [options] groupname
```

## usermod

-c 填写用户账户的备注信息
-d -m 参数-m 与参数-d 连用，可重新指定用户的家目录并自动把旧的数据转移过去
-e 账户的到期时间，格式为 YYYY-MM-DD 
-g 变更所属用户组
-G 变更扩展用户组
-L 锁定用户禁止其登录系统
-U 解锁用户，允许其登录系统
-s 变更默认终端
-u 修改用户的 UID

```bash
usermod username [options]
```

## passwd

全称：password

作用：用于修改用户密码、过期时间、认证信息等。

```bash
passwd [options] [username]
```

-l 锁定用户，禁止其登录
-u 解除锁定，允许用户登录
--stdin 允许通过标准输入修改用户密码，如echo "NewPassWord" | passwd --stdin Username 
-d 使该用户可用空密码登录系统
-e 强制用户在下次登录时修改密码
-S 显示用户的密码是否被锁定，以及密码所采用的加密算法名称

## userdel

```bash
userdel [option] username
```

-f 强制删除用户
-r 同时删除用户及用户家目录


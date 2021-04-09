
## 兩台電腦透過 croc 工具來傳送檔案 (簡單, 加密, 快速)

croc is a tool that allows any two computers to simply and securely transfer files and folders.

[Croc office github](https://github.com/schollz/croc)

[兩台電腦透過 croc 工具來傳送檔案](https://blog.wu-boy.com/2021/02/share-files-between-two-computer-using-croc-tool/)

### Install

Download [the latest release for your system](https://github.com/schollz/croc/releases/latest), or install a release from the command-line:

    $ curl https://getcroc.schollz.com | bash

### Usage

To send a file, simply do:

    $ croc send [file(s)-or-folder]
    Sending 'file-or-folder' (X MB)
    Code is: code-phrase
    Then to receive the file (or folder) on another computer, you can just do

    $ croc code-phrase
    
The code phrase is used to establish password-authenticated key agreement (PAKE) which generates a secret key for the sender and recipient to use for end-to-end encryption.

There are a number of configurable options (see --help). A set of options (like custom relay, ports, and code phrase) can be set using --remember.


### Self-host relay

The relay is needed to staple the parallel incoming and outgoing connections. By default, croc uses a public relay but you can also run your own relay:

    $ croc relay
    
By default it uses TCP ports 9009-9013. Make sure to open those up. You can customized the ports (e.g. croc relay --ports 1111,1112), but you must have a minimum of 2 ports for the relay. The first port is for communication and the subsequent ports are used for the multiplexed data transfer.

You can send files using your relay by entering --relay to change the relay that you are using if you want to custom host your own.

    $ croc --relay "myrelay.example.com:9009" send [filename]
    
Note, when sending, you only need to include the first port (the communication port). The subsequent ports for data transfer will be transmitted back to the user from the relay.


###   systemctl的方法后台运行croc.

#### 配置 croc.service ( /etc/systemd/system/croc.service )

    [Unit]
    Description=Croc
    Documentation=https://github.com/schollz/croc
    After=network.target network-online.target nss-lookup.target mysql.service mariadb.service mysqld.service
    
    [Service]
    Type=simple
    StandardError=journal
    ExecStart=/usr/local/bin/croc relay
    ExecReload=/bin/kill -HUP \$MAINPID
    ExecStop=/usr/local/bin/croc
    LimitNOFILE=51200
    Restart=on-failure
    RestartSec=1s
    
    [Install]
    WantedBy=multi-user.target



#### 启用, 启动 croc:

    ##加载服务文件
    systemctl daemon-reload
  
    systemctl enable | disable  croc
    
    systemctl start croc
    
    systemctl restart | stop | disable  croc
      
  
  

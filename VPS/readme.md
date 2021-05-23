

### VPS ipv6-only  connect ti ipv4

In Debian10 (ubuntu 20) 

    apt install resolvconf

nano /etc/resolv.conf, add following
 
    nameserver 2001:67c:2b0::4
    nameserver 2001:67c:2b0::6
    
免费的 DNS64+NAT64 提供者有：

    http://www.trex.fi/2011/dns64.html
      2001:67c:2b0::4
      2001:67c:2b0::6
    https://go6lab.si/current-IPv6-tests/nat64dns64-public-test/
      2001:67c:27e4:15::6411
      2001:67c:27e4::64
      
disable update DNS

    resolvconf --disable-updates
    


      

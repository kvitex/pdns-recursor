# Docker pdns-recursor
PowerDNS recursive server docker image.

### Running container:
```
docker run -d -p 53:53/udp -p 53:53/tcp --name pdns-recursor kvitex/pdns-recursor
```

By default it will accept only queries from RFC 1918 ip addresses(10.0.0.0/8, 192.168.0.0/16 and etc.)

 
### Configuration example

You can set various options by adding command parameters:

```
sudo docker run -d -p 53:53/udp -p 53:53/tcp --name pdns-recursor kvitex/pdns-recursor\
 --forward-zones-recurse=my.domain.org=10.10.0.1\;192.168.1.1,my1.domain.org=10.10.0.1;192.168.1.1\
 --allow-from=10.0.0.0/8,192.168.0.0/16\
 --dont-query=127.0.0.0/8
```
In this example you tell recursor to forward all queries for my.domain.org 
and my1.domain.org to servers 10.10.0.1 and 192.168.1.1 and send it with reqursive bit.\
You can provide more then one sever for domain separated by semicolon("\;" is used for escape).\
And you can provide several domains to forward separated by comma.\
By setting "--allow-from" you tell recusor to  serve clients queries only from 10.0.0.0/8  and 192.168.0.0/16 networks.\
And "--dont-query=127.0.0.0/8" means that recursor will never send queries to 127.0.0.0/8.

For more configuration options see [PowerDNS recusor settings](https://docs.powerdns.com/recursor/settings.html#).

Or you can just mount you config file:

```
docker run -d -p 53:53/udp -p 53:53/tcp -v /etc/pdns/recursor.conf:/etc/pdns/recursor.conf \
  --name pdns-recursor kvitex/pdns-recursor
```




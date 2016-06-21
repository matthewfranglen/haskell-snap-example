Haskell SNAP Example
====================

Ridiculously simple example of a SNAP webserver in Haskell.

Synopsis
--------

```bash
git clone https://github.com/matthewfranglen/haskell-snap-example haskell-snap-example
cd haskell-snap-example
stack setup
stack build
stack exec haskell-snap-example
```

You can then [view the website](http://localhost:8000/).
The first view will be slow. After that it will be quick.

Results
-------

The slow first request is slow:

```bash
➜ time curl http://localhost:8000/ >/dev/null
curl http://localhost:8000/ > /dev/null  0.00s user 0.00s system 0% cpu 4.668 total
```

The next 50,000 requests added together are faster:

```bash
➜ ab -c 5 -n 50000 http://localhost:8000/
This is ApacheBench, Version 2.3 <$Revision: 1706008 $>
Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
Licensed to The Apache Software Foundation, http://www.apache.org/

...

Server Software:        Snap/0.9.5.1
Server Hostname:        localhost
Server Port:            8000

Document Path:          /
Document Length:        9 bytes

Concurrency Level:      5
Time taken for tests:   4.062 seconds
Complete requests:      50000
Failed requests:        0
Total transferred:      5300000 bytes
HTML transferred:       450000 bytes
Requests per second:    12310.05 [#/sec] (mean)
Time per request:       0.406 [ms] (mean)
Time per request:       0.081 [ms] (mean, across all concurrent requests)
Transfer rate:          1274.28 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   0.0      0       0
Processing:     0    0   0.3      0      24
Waiting:        0    0   0.3      0      24
Total:          0    0   0.3      0      24

Percentage of the requests served within a certain time (ms)
  50%      0
  66%      0
  75%      0
  80%      0
  90%      0
  95%      0
  98%      0
  99%      1
 100%     24 (longest request)
```

These test results are invalid in lots of ways (e.g. the requests were made on the machine under test). Such is life.

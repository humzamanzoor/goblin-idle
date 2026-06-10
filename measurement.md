---
name: System utility benchmarks
author: Captain Planet
description: Runs CPU benchmarks using the cryptsetup utility.
active-channels:
  - RAPL/$this-package-0=sut_cpu CPU package power via RAPL
  - RAPL/$this-core=sut_core CPU core power via RAPL
  - SP3-eaac7c3a4ae9ea11a4305e8f994a5d01/out1=odroid2 Odroid2 SUT device
  - SP3-9648672541e9ea1184d25e8f994a5d01/out1=switch1 Linksys 16-port Ethernet switch 1
  - SP3-9648672541e9ea1184d25e8f994a5d01/out2=sw1tch2 Linksys 16-port Ethernet switch 2
  - SP3-3a08929c0deaea11a5a061e7994a5d01/out1=wifi1 Asus wifi access point 1
  - SP3-3a08929c0deaea11a5a061e7994a5d01/out2=wifi2 Asus wifi access point 2
  - SP3-527c26c547e9ea118bca5e8f994a5d01/out1=wifi3 Asus wifi access point 3
active-resources:
  - $all|memory/memory-free=free_ram Free RAM memory
  - $all|memory/memory-used=used_ram Used RAM memory
resource-filters:
  - memory-used
  - memory-free
  - memory-cached
  - memory-buffered
  - if_octets
  - disk_octets
  - cpu-user
  - cpu-system
  - cpu-idle
  - counter
initialization-strategy:
  - IncludeAllFree
sections:
  - intro
  - another
collector:
  - $all=ACTIVE,HTTP,RAPL
script: 
  - algorithm3.sh
runs: 4
timeout: 600
report-modes:
  - Technical Report
  - High-Level Report
report-palette:
  - #0b84a5
  - #f6c85f
  - #6f4e7c
  - #9b5de5
  - #ff6b6b
  - #3ac569
  - #ffa600
visible-sections:
  - 0,1,2,3,4
  - 0,1
expanded-sections:
  - 0,1,2
  - 0,1
---

The purpose of this example is to demonstrate how to measure the
resource consumption of the AES XTS and SHA256 algorithms provided by
the Linux kernel and the [cryptsetup tool](https://en.wikipedia.org/wiki/Linux_Unified_Key_Setup).

This example also demonstrates the use of report document templates.
The part of this document after the front-matter will be used as the
document template for the project

The front matter of the Markdown file contains special fields for session
metadata. The `name` is the name of the session and `author` is the author
of the session. This text here is the `description`. It's first parsed
as Markdown, then rendered as HTML. HTML code can also be passed through
to the final report. There are some limitations, e.g. linked images will
not be automatically embedded like the built-in ones. However, the agent
can extract local files from the links and copy them to the session log
directory.


---

## Summary

[BOXPLOT]

[SUMMARYTABLE:boxplot-1]

---

## Overview of the runs

[SCATTERPLOT]

---

## Hardware configuration

![](config.png)

[NODEDATA]

### Controller

Controller is the PC running the PowerGoblin instance and connected to
the physical meters.

Please read the PowerGoblin manual for setting up the PowerGoblin instance
properly. Here we assume the name server is configured to associate the
hostname `controller.lan` with this machine.

Preparations:

```shell
$ wget https://tech.utugit.fi/soft/visiiri/powergoblin/powergoblin.jar
$ java --enable-native-access=ALL-UNNAMED -jar powergoblin.jar
```

Please start the controller first.

### SUT

SUT is the system running the benchmarks.
The script assumes that `collectd` and `cryptsetup` have been installed.

Please read the PowerGoblin manual for setting up collectd properly.

Preparations:

```shell
$ wget https://tech.utugit.fi/soft/visiiri/powergoblin/powergoblin-agent.jar
$ java -jar powergoblin-agent.jar sut http://controller.lan:8080
```

---

## Performing the measurement

1. Set up all the meters
2. Configure all the software on the nodes
3. Start PowerGoblin on the controller PC
4. Start PowerGoblin agent on the SUT
5. Launch the PowerGoblin UI (http://controller.lan:8080)
6. Perform the meter calibration (the 'Calibrate' button inside the 'sut' unit in the 'Nodes' tab)
7. Start the measurement (the 'Measure' button inside the 'sut' unit in the 'Nodes' tab)

---

## Demonstration of the Markdown features

### Test 1

Example table:

|Foo      |Bar     |
|---------|--------|
|Something|here    |
|Something|here too|

### Test 2

Example list

* one
* two
* three

### Test 3

This file can be found [here](measurement.md).

#### Test 3.1

**This is bold**, *this is written in italics*.
~~This has strike through~~.

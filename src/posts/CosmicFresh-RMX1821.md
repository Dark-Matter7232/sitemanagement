---
title: CosmicFresh-RMX1821 Kernel
description: Custom kernel for RMX1821.
date: 2022-05-11
tags: linux, RMX1821
Image: CosmicFresh.jpg
---

<center> 
<img src="../img/CosmicFresh.png" style="border: 0px">
</center>

<center> <strong>CosmicFresh kernel for RMX1821 devices running A11 and above</strong> </center>

<details>
<summary>CONTENTS</summary>

- [Features](#features)
- [Changelog](#changelog)
- [Flashing instructions](#instructions)
- [Downlod links](#downloads)
- [Source code](#sources)

</details>

## / Features / <a name="features"></a>
Supports Realme 3/3i devices  
Debug cruft nuked to reduce overall overhead  
Using zram backported from mainline:
  
- Backported zram deduplication to reduce mem usage  
- Backported zsmalloc memory allocator from mainline  
- Zram now writebacks to offload idle pages to `EMMC`  

Uses Sultan's Simple LMK  
Touchscreen driver optimizations  
Fingerprint driver optimizations  
Scheduler optimizations  
Power usage optimizations  
Memory management optimizations  
Uses SRandom for better perf   
Westwood as the default TCP network congestion control  
mmap/mremap improvements backported from mainline  
Dropped mtk input booster in favour of `CIB`    
CGROUP and FREEZER_V2 backported from mainline  
`FUSE_SHORTCIRCUIT` ported over from `oplus` for better io perf  
vDSO 32 patches to improve 32-bit performance  
GPU driver improvements backported from `GS101`  
Use 100hz ticker rate  
Jump_label patchset ported from mainline  
Affined important services to Big cluster.  
<details>
<summary>And more</summary>

Disabled `SECCOMP` to imrpove syscall speed  
Nuked SElinux auditiing  

</details> 

## / Changelog / <a name="changelog"></a>

<details>
<summary>R2-Const:</summary>

- Nuked stupid app blocker
- Optimized the scheduler
- Disabled mali gpu debugging
- Nuked oppo input debug crap
- Reduce active power drain
- io & fs perf improvements
- Network stack improvements
- Reduced cpu freq scaling latency
- Tamed mtk logging

</details> 

<details>
<summary>R1-Const:</summary>
<p><ul>
<li> Initial build </li>
</ul></p>
</details> 

### Flashing instructions <a name="instructions"></a>

* Reboot to recovery
* Flash the kernel
* Enjoy

### Downloads <a name="downloads"></a>

* **CosmicFresh-RMX1821-R2-Const** - [Download](https://github.com/Dark-Matter7232/CosmicFresh-RMX1821/releases/download/R2-Const/CosmicFresh-RMX1821-R2-Const.zip)

### Sources <a name="sources"></a>

* **Kernel source** - [Click here](https://github.com/Dark-Matter7232/CosmicFresh-RMX1821)

<p id="lastUpdated-css">Updated on <span id="lastUpdated"></span></p>

<hr>
<script src="https://utteranc.es/client.js"
        repo="Dark-Matter7232/Dark-Matter7232.github.io"
        issue-term="pathname"
        theme="github-dark-orange"
        crossorigin="anonymous"
        async>
</script>

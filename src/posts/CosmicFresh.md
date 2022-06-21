---
title: CosmicFresh Kernel
description: Custom kernel for M21.
date: 2022-03-29
tags: linux, M21
Image: CosmicFresh.jpg
---

<center> 
<img src="../img/CosmicFresh.png" style="border: 0px">
</center>

<center> <strong>CosmicFresh kernel for M21 devices running OneUI 3.1</strong> </center>

<details>
<summary>CONTENTS</summary>

- [Features](#features)
- [Changelog](#changelog)
- [Flashing instructions](#instructions)
- [Downlod links](#downloads)
- [Source code](#sources)

</details>

## / Features / <a name="features"></a>
Supports M21 (2020) devices  
Samsung debug cruft nuked to reduce overall overhead  
Using zswap + vbswap to replace zram:
  
- Dropped Samsung hacks riddled zram
- Backported zsmalloc memory allocator from `v5.17`
- Backported zswap changes from mainline
- Samsung zswap hacks forwardported

Latest SElinux subsystem backported from mainline  
mmap/mremap backported from mainline for perf boost  
vmalloc backported from mainline to improve memory allocation performance   
tlb backports from mainline  
Latest G2D drivers backported from `GS101`  
Kernel arm64 routines backported from `linux-next`  
Kernel libs backported from mainline  
Latest Wi-Fi/BT driver stack from Samsung  
GPU driver improvements backported from `GS101`  
Hrtimer backported from mainline  
CGROUP and FREEZER_V2 backported from mainline  
`FUSE_SHORTCIRCUIT` ported over from `oplus` for better io perf  
Updated ARM GPU drivers stack   
<details>
<summary>And more</summary>

Uses Sultan's Simple LMK  
VLAs nuked in their entirety  
Use 300hz ticker rate  
Network stack improvements   
LSE atomic enabled  
vDSO 32 patches to improve 32-bit performance  
Uses arter97's RapidGC as f2fs GC  
Optimized freq table for the SOC  
Touchscreen driver optimizations for lower power usage and latency  
Fingerprint driver optimizations for lower latency  
Uses SRandom for better perf(but very unsafe)  
Westwood as the default TCP network congestion control  
Modules inlined for an overall lighter kernel  
Built with Clang 12 and ThinLTO, DCE and -03 optimizations  
Power usage optimizations  
Memory management optimizations  
Affined important services to Big cluster.  

</details> 

## / Changelog / <a name="changelog"></a>

<details>
<summary>FINAL-HOTFIX-Const:</summary>

- Fix thermal issues
- Fix `kswapd` allocation failures  
- Fix performance regression caused by `rcu` fuckup  
- Fix slow internet speed issue  
- Reduce system latency  
- Fixes to zswap  
- Reduce logspam  
- Optimize `/proc` node  
- Revert changes to EMS `overutil ratios`  
- Properly affine gpu to Big cluster  
- Patches from OSRC A12 kernel
- Reduce power usage

</details> 

<details>
<summary>FINAL-Const:</summary>
<p><ul>
<li> Final feature complete release </li>
</ul></p>
</details> 

### Flashing instructions <a name="instructions"></a>

* Flash ```Disable-userspace-slmk``` module using magisk manager
* Reboot to recovery
* Flash the kernel
* Flash null vbmeta (Just needs to be done once)
    - Flash in ap block in odin
    - Wipe data from recovery
* Enjoy

### Downloads <a name="downloads"></a>

* **CosmicFresh-FINAL-HOTFIX-Const** - [Download](https://github.com/Dark-Matter7232/Cosmic-fresh/releases/download/FINAL-HOTFIX-Const/CosmicFresh-FINAL-HOTFIX-Const.zip)
* **Disable-userspace-slmk** - [Download](https://github.com/Dark-Matter7232/Cosmic-fresh/releases/download/R4-Const/Disable-userspace-slmk.zip)
* **Null-vbmeta** - [Download](https://github.com/Dark-Matter7232/Cosmic-fresh/releases/download/FINAL-Const/vbmeta.tar)

### Sources <a name="sources"></a>

* **Kernel source** - [Click here](https://github.com/Dark-Matter7232/Cosmic-fresh)

<p id="lastUpdated-css">Updated on <span id="lastUpdated"></span></p>

<hr>
<script src="https://utteranc.es/client.js"
        repo="Dark-Matter7232/Dark-Matter7232.github.io"
        issue-term="pathname"
        theme="github-dark-orange"
        crossorigin="anonymous"
        async>
</script>

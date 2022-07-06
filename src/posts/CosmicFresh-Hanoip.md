---
title: CosmicFresh-Hanoip Kernel
description: Custom kernel for Hanoip.
date: 2022-07-01
tags: linux, Hanoip, G60
Image: CosmicFresh.jpg
---

<center> 
<img src="../img/CosmicFresh.png" style="border: 0px">
</center>

<center> <strong>A CAF rebased kernel for Moto G40 Fusion / G60</strong> </center>

<details>
<summary>CONTENTS</summary>

- [Features](#features)
- [Changelog](#changelog)
- [Notice](#notice)
- [Flashing instructions](#instructions)
- [Downlod links](#downloads)
- [Source code](#sources)
- [Thanks to](#credits)

</details>

## / Features / <a name="features"></a>
- PureCAF base `v4.14.206 with LA.UM.9.1-11900-SMxxx0.0`    
- Latest `upstream-f2fs-stable-linux-4.14.y` merged  
- `QCACLD-3.0` + Audio-kernel + Data-kernel  
- Sultan's SimpleLMK as the default lmk.  
- Selectively picked Sultan's patches  
- Power usage optimizations  
- Memory management optimizations  
- Network stack optimizations  
- Scheduler optimizations  
- Optimized CPU freq table and energy model for improved battery life  
- RMNET extensions ported for improved network perf  
- UFS fixes ported from google  
- Latest exfat driver merged  
- Compiled with GCC 13 with DCE enabled  

<details>
<summary>And more</summary>

- FUSE patches backported from mainline  
- eBPF patches backported from mainline  
- Latest CGROUP backported from mainline  
- vDSO 32 patches to improve 32-bit performance  
- Nuked debug cruft to reduce overhead kernel wide  
- Affined important services to Big cluster  
- Nuked useless wakelocks to improve idle drain  
- Support for KCAL  

</details> 

## / Changelog / <a name="changelog"></a>

<summary>R2:</summary>

- Switch to SimpleLMK  
- Drop MGLRU  
- Drop A12 binder backport  
- Re-enable EDL mode  
- Optimize Network stack  
- Fix active drain issue  
- Drop CGROUP backports  
- Optimize memory management  

<details>
<summary>R1:</summary>
<p><ul>
<li> Initial build </li>
</ul></p>
</details> 

### / Notice / <a name="notice"></a>
- This kernel is an interactivity focused one, which  
  implies that I am ready to sacrifice some throughput  
  for improved latency.
- This kernel is not meant to be customized by the user.
- Check your fingerprint sensor version before flashing the kernel.  
    - Device info hw app -> Fingerprint: if it shows FPC then flash FPC,  
    - if it shows something else then flash CPO.
- Flash correct build according to your fp sensor and ram size.

### / Flashing instructions / <a name="instructions"></a>

* Reboot to recovery
* Flash the the correct kernel build
* Enjoy

### / Downloads / <a name="downloads"></a>

* **CosmicFresh-R2-FPC-6GB** - [Download](https://github.com/Dark-Matter7232/CosmicFresh-Hanoip/releases/download/R2/CosmicFresh-R2-FPC-6GB.zip)
* **CosmicFresh-R2-FPC-4GB** - [Download](https://github.com/Dark-Matter7232/CosmicFresh-Hanoip/releases/download/R2/CosmicFresh-R2-FPC-4GB.zip)
* **CosmicFresh-R2-CPO-6GB** - [Download](https://github.com/Dark-Matter7232/CosmicFresh-Hanoip/releases/download/R2/CosmicFresh-R2-CPO-6GB.zip)
* **CosmicFresh-R2-CPO-4GB** - [Download](https://github.com/Dark-Matter7232/CosmicFresh-Hanoip/releases/download/R2/CosmicFresh-R2-CPO-4GB.zip)

### / Sources / <a name="sources"></a>

**Kernel source** - [Click here](https://github.com/Dark-Matter7232/CosmicFresh-Hanoip)

<hr>

### / Thanks to / <a name="credits"></a>
* KenHV  
* Kerneltoast  
* realJohnGalt  
* Mochi-Mochi  
* Kdrag0n  
* Panchajanya1999  
* cyberknight777 and some other wonderful people.  

<p id="lastUpdated-css">Updated on <span id="lastUpdated"></span></p>

<hr>
<script src="https://utteranc.es/client.js"
        repo="Dark-Matter7232/Dark-Matter7232.github.io"
        issue-term="pathname"
        theme="github-dark-orange"
        crossorigin="anonymous"
        async>
</script>

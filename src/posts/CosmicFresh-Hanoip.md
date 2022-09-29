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
- Using zswap + vbswap to replace zram:  
  - Backported z3fold memory allocator  
  - Backported zswap changes from mainline  
  - Samsung zswap hacks forwardported  
- MGLRU Backported from mainline  
  TL;DR:  

  > According to Google’s fleetwide profiling, multi-generational LRU yields an “overall 40% decrease in kswapd [the kernel daemon that manages virtual memory] CPU usage,” an “85% decrease in the number of low-memory kills at the 75th percentile,” and an “18% decrease in app launch times at the 50th percentile.”

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

<summary>R5:</summary>

- Drop zram in favour of zswap + vbswap combo  
- Drop SCHED_RR changes  
- Rice the walt scheduler  
- Drop Msm perf driver  
- Switch to Efficient freqs calculated using pancha's method  
- Drop Damon  
- Switch back to Sultan's SimpleLMK  
- Reduce unnecessary usage of pm_qos  
- Bring back backported smem/s2mp/rpmsg drivers  
- Switch to tcp bbr+fq_codel  
- Merge RedHat's cfq tunings to improve io perf  
- Use step_wise as the thermal governor instead of moto userspace  
- Merge zswap + z3fold backports from mainline  
- Merge CGROUP backports  
- Reduce idle/active drain  
- Much faster resume from suspend  

<details>
<summary>R4:</summary>

- Complete rebase and rebuild  
- Bring back mglru  
- Backport Amazon's Data Access MONitor  
- Enable Damon's proactive reclaim  
- Multithreaded kswapd and affined it to little cluster  
- Create 6 kswapd threads <a href="#fuckme">[1]</a>    
- Enable zram deduplication for additional ram savings  
- Drop oplus mm hacks  
- LZ4 decompression speed improvements  
- Improvements to video recording bitrate  
- Drop RMNET extensions as it affected active drain  
- Drop ram variants  
- Drop a lot of changes that regressed the kernel  
- Drop efficient freqs for now  
- Drop backported smem/s2mp/rpmsg drivers  
- Drop SimpleLMK  
- Drop `FUSE_PASSTHROUGH` for now  
- Selectively pick sultan's changes to kswapd  
- Pick sultan's fixes to vmpressure  
  [1]: <a name="fuckme"></a>  

> We have already affined kswapd’s kthreads to the little cluster and since our little cluster has 6 cores, I thought it would be better for each core to have its own thread.

</details> 

<details>
<summary>R3A:</summary>

- Fix an increase in active drain  
- Linearize power drain   

</details> 

<details>
<summary>R3:</summary>

- mmap/mremap backported from mainline  
- vmalloc backported from mainline  
- tlb backported from mainline  
- Timer optimizations  
- Removed RTB(interrupt) logging  
- jump_label patches from upstream  
- Fixed a regression that hurt power usage  
- rwsem backported from upstream  
- Latest arm routines  
- loop driver patches from upstream  
- futex and mutex backports  
- Selinux backports  
- smem/s2mp/rpmsg drivers backported from 5.4  
- Fixed a major source of idle drain  
- Fixed single tap to wake up in stock rom  
- Improved syscall speed  
- Improved graphics performance  
- Improved system power usage  
- Improved overall system fluidity  

</details> 

<details>
<summary>R2:</summary>

- Switch to SimpleLMK  
- Drop MGLRU  
- Drop A12 binder backport  
- Re-enable EDL mode  
- Optimize Network stack  
- Fix active drain issue  
- Drop CGROUP backports  
- Optimize memory management  

</details> 

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
- Flash correct build according to your fp sensor.

### / Flashing instructions / <a name="instructions"></a>

* Reboot to recovery
* Flash the the correct kernel build
* Enjoy

### / Downloads / <a name="downloads"></a>

* **CosmicFresh-R5-FPC** - [Download](https://github.com/Dark-Matter7232/CosmicFresh-Hanoip/releases/download/R5/CosmicFresh-R5-FPC.zip)
* **CosmicFresh-R5-CPO** - [Download](https://github.com/Dark-Matter7232/CosmicFresh-Hanoip/releases/download/R5/CosmicFresh-R5-CPO.zip)

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
* xNombre  
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

---
title: The Cosmic Staff Kernel For M31
description: The Cosmic Staff kernel for M31, for personal use.
date: 2021-07-13
tags: kernel, thecosmicstaff, m31
Image: cosmic.jpg
---
## TheCosmicStaff Kernel For M31

<center>
<img src="https://raw.githubusercontent.com/Dark-Matter7232/Dark-Matter7232.github.io/v2/img/cosmic.jpg">
</center>

## Features

* Introduce Dynamic SchedTune Boost
* Introduce SchedTuneAssist
* Introduce CPUSetsAssist
* ThinLTO
* Sultan's Simple Low Memory Killer
* BBR Tcp congenstion algorithm
* fq_codal network scheduler(qdisc)
* Enable powerefficient workqueues OOTB
* Add PowerSuspend Driver
* Built with Dead code elimination enabled
* Enabled BLK cgroup IO throttling
* Silence unwanted logging
* Enabled Gentle Fair Sleepers
* Affine important userspace components to arm Big cores
* Introduce Srandom
* Sched imrpovements
* UFS IO improvement
* Grahpics Perf improvement
* Power Efficiency improvement
* Optimized Console FrameBuffer
* 100HZ timer
* Boeffla Wakelock blocker
* ARM64 targeted optimizations
* IO_STAT disabled out of the box
* Kill unwated google services
* Disable Audit treewide
* Make use of cacheline alignment
* Make workqueue high priority
* Tweak cpuidle governor for better battery life
* 3x faster integer sqrt
* Enable Write Back Caching
* Enable I/O throttling
* disable crc checks (30% IO speed improvement)
* set dirty ratio to 40%
* add NEON accelerated XOR implementation

### Changelog

R1:

* Introduce SchedTune Assist (500% improvement in User experience at minimal cost of battery life)
* Introduce Srandom (5 times faster than urandom)
* Introduce Dynamic SchedTune Boost
* Introduce CPUSetsAssist
* Stub out debug prints by default (Graphics perf improvement)
* Reserve caches for small, high-frequency memory allocations (Reduce latency)
* Use power efficient workingqueues for drm (Battery life improvement)
* Use power efficient workingqueues for block (Battery life improvement)
* ThinLTO (perf improvement)
* Introduce Sultan's Simple Low Memory Killer
* BBR Tcp congenstion algorithm
* fq_codal network scheduler(qdisc)
* Enable powerefficient workqueues OOTB
* Add PowerSuspend Driver (almost eliminate idle battery drain)
* Built with Dead code elimination enabled
* Enabled BLK cgroup IO throttling
* Silence unwanted logging
* Enabled Gentle Fair Sleepers
* Affine hwcomposer to big CPUs (lowered jitter)
* Affine surfaceflinger to big CPUs (smoother ui experience)
* Affine Wi-Fi components to big CPUs (lowered latency)
* Affine ubound workqueues to little CPUs (lowered power consumption)
* Perform PID map reads on the little CPU cluster (lowered power consumption)
* Run nocb kthreads on little CPUs (lowered power consumptio)
* Free dead tasks asynchronously in finish_task_switch() (reduce resource wastage)
* Affine Samsung's HyPer HAL to the big CPU cluster (quicker system boosting)
* Hide magisk mounts for IsolatedService (Prevent magisk detection)
* Updates to 
* Drop top-app level to 3
* Improvements to boeffla Wakelock blocker
* Add support for Gentle_fair_sleepers
* Improvements to rcu
* Improvements to zram module
* Slightly faster booting
* Add state notifier driver (works in conjuction with PowerSuspend)
* Enable per-process reclaim
* Upstream to 4.14.140
* Disable Selinux auditing (lowered overhead)
* Resolve sched_feat() at compile time to improve code optimization  (Perf improvement) 
* Upstream to Linux 4.14.124 
* only force UX tasks to big cores (Power saving) 
* Disable UFS debugging (IO perf improvement) 
* Use SCHED_RR in place of SCHED_FIFO for all users (UX improvement) 
* Change default SCHED_RR timeslice from 100 ms to 1 jiffy (Lowered latency) 
* Make zsmalloc copy rather than mapping pages (Memory perf improvement) 
* Disable Selinux audit 
* Don't dynamically allocate single-use structs (Reduce overhead) 
* Avoid dynamic memory allocation for small write buffers (Reduce overhead) 
* Avoid dynamically allocating memory in getxattr (Perf improvement) 
* Schedule workers on CPU0 or 0-5 by default (Power saving) 
* Fix memory leak for uncached firmware requests 
* Speed up cache entry creation (Reduce overhead) 
* Avoid dynamic allocations in sel_write_access (Perf improvement) 
* Avoid dynamic memory allocation for INITCONTEXTLEN buffers (Reduce overhead) 
* Use kmem_cache pool for struct dma_buf_attachment, dmabuf allocations, struct sync_file, sdcardfs_file_info, cgrp_cset_link, kernfs_open_node/file, async_entry (Reduce overhead) 
* Always compile core debugfs driver for Android kernels 
* Avoid allocating small buffers for map keys and values (Reduce overhead) 
* Start killing wakelocks after one minute of idle (Power saving) 
* Expedite garbage collection if idle (Power saving) 
* Add a timeout to wakelocks globally 
* Reduce QoS boosting from Samsung hacks (Power saving) 
* Disable full refcount validation (Perf improvement) 
* Micro-optimize PID map reads for arm64 while retaining output format (Help with games like genshin impact) 
* Stop kswapd early when nothing's waiting for it to free pages 
* Don't stop kswapd on a per-node basis when there are no waiters 
* Move frequently used functions to headers and declare them inline (Reduce overhead) 
* Don't hog RCU read lock while optimistically spinning 
* Use interruptible wait for genirq, media v4l (Reduce latency) 
* Increase watermark scale factor 
* Update LZ4 components 
* Reduce latency while processing atomic ioctls (Reduce display rendering latency) 

<hr>

### Flashing intstrcutions

* Flash ```Disable-userspace-slmk``` module using magisk manager
* Reboot to recovery
* Flash the kernel
* Enjoy

### Downlods

* **TheCosmicStaff-R1-M31** - [Download](https://github.com/Dark-Matter7232/The-Cosmic-Staff/releases/download/R1-M31/CosmicStaff-ONEUI-R1-M31.zip)
* **Disable-userspace-slmk** - [Download](https://github.com/Dark-Matter7232/The-Cosmic-Staff/releases/download/R1-M31/Disable-userspace-slmk.zip)

### Sources

* **Kernel source** - [Click here](https://github.com/Dark-Matter7232/The-Cosmic-Staff)

#### Note

__I built it for my personal use only, my goals were to achieve better efficiency and not performance__

<hr>
<script src="https://utteranc.es/client.js"
        repo="Dark-Matter7232/Dark-Matter7232.github.io"
        issue-term="pathname"
        theme="github-dark-orange"
        crossorigin="anonymous"
        async>
</script>

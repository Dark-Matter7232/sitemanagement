---
title: The Cosmic Staff Kernel
description: The Cosmic Staff kernel for M21, for personal use.
date: 2021-07-13
tags: kernel, thecosmicstaff, m21
Image: cosmic.jpg
---
## TheCosmicStaff Kernel For M21

<center>
<img src="https://raw.githubusercontent.com/Dark-Matter7232/Dark-Matter7232.github.io/v2/img/cosmic.jpg">
</center>

<details>
<summary>CONTENTS</summary>

- [Features](#features)
- [Changelog](#changelog)
- [Flashing intstrcutions](#instructions)
- [Downlod links](#downloads)
- [Source code](#sources)
- [Final Note](#notes)

</details>



## Features <a name="features"></a>

<details>

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

</details>

### Changelog <a name="changelog"></a>

<details>

R6:

* Introduce CPUSetsAssist
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

<details>
<summary>R5-noboost:</summary>
<p><ul>
<li> Merge ```boost``` and ```noboost``` into one </li>
<li> Bring in some fixes to samsung drivers </li>
<li> Add support for Dynamic SchedTune Boost </li>
<li> Add support for dynamic prefer_idle </li>
<li> Stub out debug prints by default (Graphics perf improvement) </li>
<li> Reserve caches for small, high-frequency memory allocations (Reduce latency) </li>
<li> Use power efficient workingqueues for drm (Battery life improvement) </li>
<li> Use power efficient workingqueues for block (Battery life improvement) </li>
<li> Minimize number of tasks to load balance </li>
<li> Add Srandom (5 times faster than urandom) </li>
<li> Resolve sched_feat() at compile time to improve code optimization  (Perf improvement) </li>
<li> Upstream to Linux 4.14.124 </li>
<li> only force UX tasks to big cores (Power saving) </li>
<li> Disable UFS debugging (IO perf improvement) </li>
<li> Use SCHED_RR in place of SCHED_FIFO for all users (UX improvement) </li>
<li> Change default SCHED_RR timeslice from 100 ms to 1 jiffy (Lowered latency) </li>
<li> Make zsmalloc copy rather than mapping pages (Memory perf improvement) </li>
<li> Disable Selinux audit </li>
<li> Don't dynamically allocate single-use structs (Reduce overhead) </li>
<li> Avoid dynamic memory allocation for small write buffers (Reduce overhead) </li>
<li> Avoid dynamically allocating memory in getxattr (Perf improvement) </li>
<li> Schedule workers on CPU0 or 0-5 by default (Power saving) </li>
<li> Fix memory leak for uncached firmware requests </li>
<li> Speed up cache entry creation (Reduce overhead) </li>
<li> Avoid dynamic allocations in sel_write_access (Perf improvement) </li>
<li> Avoid dynamic memory allocation for INITCONTEXTLEN buffers (Reduce overhead) </li>
<li> Use kmem_cache pool for struct dma_buf_attachment, dmabuf allocations, struct sync_file, sdcardfs_file_info, cgrp_cset_link, kernfs_open_node/file, async_entry (Reduce overhead) </li>
<li> Always compile core debugfs driver for Android kernels </li>
<li> Avoid allocating small buffers for map keys and values (Reduce overhead) </li>
<li> Start killing wakelocks after one minute of idle (Power saving) </li>
<li> Expedite garbage collection if idle (Power saving) </li>
<li> Add a timeout to wakelocks globally </li>
<li> Reduce QoS boosting from Samsung hacks (Power saving) </li>
<li> Disable full refcount validation (Perf improvement) </li>
<li> Micro-optimize PID map reads for arm64 while retaining output format (Help with games like genshin impact) </li>
<li> Stop kswapd early when nothing's waiting for it to free pages </li>
<li> Don't stop kswapd on a per-node basis when there are no waiters </li>
<li> Move frequently used functions to headers and declare them inline (Reduce overhead) </li>
<li> Don't hog RCU read lock while optimistically spinning </li>
<li> Use interruptible wait for genirq, media v4l (Reduce latency) </li>
<li> Increase watermark scale factor </li>
<li> Update LZ4 components </li>
<li> Reduce latency while processing atomic ioctls (Reduce display rendering latency) </li>
<li> Drop top-app level to 2 </li>
</ul></p>
</details>

<details>
<summary>R4-noboost:</summary>
<p><ul>
<li> Introduce SchedTune Assist (500% improvement in User experience at minimal cost of battery life) </li>
<li> Increase the time a task is considered cache-hot (Performance gain) </li>
<li> Queue requests on their origin CPU (20%-40% gain in some scenarios) </li>
<li> Do not give sleepers 50% more runtime </li>
<li> Do not wake idle CPUs to queue same-origin requests (noticeable battery life improvement) </li>
<li> Do not use IPIs for remote wakeups if idle </li>
<li> Allow aggressive remote task interruptions </li>
<li> Do not collect I/O statistics </li>
<li> Don't allow userspace to impose restrictions on CPU idle levels (No more random performance drops) </li>
<li> Implement optimised checksum routine (Peformance gain) </li>
<li> Network Stack optimizations </li>
<li> Don't hog RCU read lock while optimistically spinning </li>
<li> Speed up ioctl by omitting debug names (overall graphics performance boost) </li>
<li> optimized memcpy (Performance gain) </li>
<li> optimized memmove (Performance gain) </li>
<li> optimized memset (Performance gain) </li>
<li> Enable BPF JIT (Faster settings activities launch) </li>
<li> Update default wakelock block list (Better battery life) </li>
<li> Enable wireguard (add wireguard support for those who might need it) </li>
</ul></p>
</details>

<details>
<summary>R4-boost:</summary>
<p><ul>
<li> Don't allow userspace to impose restrictions on CPU idle levels (No more random performance drops) </li>
<li> Implement optimised checksum routine (Peformance gain) </li>
<li> Network Stack optimizations </li>
<li> Don't hog RCU read lock while optimistically spinning </li>
<li> Speed up ioctl by omitting debug names (overall graphics performance boost) </li>
<li> optimized memcpy (Performance gain) </li>
<li> optimized memmove (Performance gain) </li>
<li> optimized memset (Performance gain) </li>
<li> Enable BPF JIT (Faster settings activities launch) </li>
<li> Update default wakelock block list (Better battery life) </li>
<li> update boost freq (less heating) </li>
<li> Change default SCHED_RR timeslice from 100 ms to 1 jiffy </li>
<li> Use SCHED_RR in place of SCHED_FIFO for all users (lowered latency) </li>
<li> Micro-optimize PID map reads for arm64 while retaining output format (Should help with certain big games) </li>
<li> Free dead tasks asynchronously in finish_task_switch() (Performance gain) </li>
<li> Avoid allocating small buffers for map keys and values </li>
<li> Avoid dynamic memory allocation for small write buffers (avoid overhead) </li>
<li> Reduce latency while processing atomic ioctls (lowered latency) </li>
<li> Enable wireguard (add wireguard support for those who might need it) </li>
</ul></p>
</details>

<details>
<summary>R3:</summary>
<p><ul>
<li> drop Schedtune assist </li>
<li> drop dsboost </li>
<li> revert undervolting </li>
<li> set timer 300hz </li>
<li> Boost DDR bus for a short amount of time when zygote forks (faster app launches) </li>
<li> Use -O3 optimization (slight performance improvement) </li>
<li> branch optimization in free slowpath </li>
<li> Align file struct to 8 bytes </li>
<li> disable crc checks (30% IO speed improvement) </li>
<li> optimize modulo operation </li>
<li> set initial TCP window size to 64K (speed improvement) </li>
<li> use power efficient workingqueues </li>
<li> add NEON accelerated XOR implementation </li>
<li> set dirty ratio to 40% </li>
<li> Increase vmstat interval </li>
<li> swap pages one at a time (help with extreme memory pressure scenarios) </li>
</ul></p>
</details>

<details>
<summary>R2:</summary>  
<p><ul>
<li> Fix error "There's an internal problem with your system"  </li>
<li> Enable Write Back Caching (improve flash storage lifespan)  </li>
<li> Don't fail on wakeup (do not let userspace abuse alarmtimers)  </li>
<li> Reduce the opportunity for sleepers to preempt (reduce jitter)  </li>
<li> Enable I/O throttling (reduce latency)  </li>
<li> Introduce SchedTune Assist (faster app launches and power efficiency)  </li>
<li> Introduce DSBoost driver(smoother experience and lowered jank)  </li>
<li> Introduce devfreq boost driver (butter smooth UI experience, no frame-drops)  </li>
<li> Optimized Console FrameBuffer for upto 70% increase in Performance  </li>
<li> Boost DDR bus upon running an atomic ioctl (prevent any and all framedrops)  </li>
<li> increase limit on sched-tune boost groups  </li>
<li> Undervolt the whole soc (lowered power usage)  </li>
<li> Process new forks before processing their parent (improve app launch speed)  </li>
<li> apply boost before frames are updated  </li>
<li> enable westwood (lowered network latency and better speeds)  </li>
<li> Prefer to reclaim inode and dentry cache over pagecache  </li>
<li> Increase ratelimit pages value (reduce overhead)  </li>
</ul></p>
</details>

<details>
<summary>R1:</summary>
<p><ul>
<li> Tweak cpuidle governor to enter deep C state faster(better battery life) </li>
<li> set frequency of kernel interrupt to 100hz(noticeable battery life improvement) </li>
<li> Add boeffla Wakelock blocker </li>
<li> Disable debugging in binder(lowered latency) </li>
<li> Improve 3x faster integer sqrt </li>
<li> disable IO_STAT completely(IO speed improvement) </li>
<li> ARM64 targeted optimizations </li>
<li> Make workqueue high priority(Decrease delays under pressure) </li>
<li> cacheline alignment(Performance benefit) </li>
<li> Don't let google crap run in the background(batter battery life) </li>
<li> Make zsmalloc copy rather than mapping pages(performance improvement) </li>
<li> Disable audit </li>
<li> Disable auditing for selinux </li>
</ul></p>
</details>  

</details>

<hr>

### Flashing intstrcutions <a name="instructions"></a>

* Flash ```Disable-userspace-slmk``` module using magisk manager
* Reboot to recovery
* Flash the kernel
* Enjoy

### Downlods <a name="downloads"></a>

* **TheCosmicStaff-R6-M21** - [Download](https://github.com/Dark-Matter7232/The-Cosmic-Staff/releases/download/R6/CosmicStaff-ONEUI-R6-M21.zip)
* **Disable-userspace-slmk** - [Download](https://github.com/Dark-Matter7232/The-Cosmic-Staff/releases/download/R6/Disable-userspace-slmk.zip)

### Sources <a name="sources"></a>

* **Kernel source** - [Click here](https://github.com/Dark-Matter7232/The-Cosmic-Staff)

#### Note <a name="notes"></a>

__I built it for my personal use only, my goals were to achieve better efficiency and not performance__

<p id="lastUpdated-css">Updated on <span id="lastUpdated"></span></p>

<hr>
<script src="https://utteranc.es/client.js"
        repo="Dark-Matter7232/Dark-Matter7232.github.io"
        issue-term="pathname"
        theme="github-dark-orange"
        crossorigin="anonymous"
        async>
</script>

warning: in the working copy of 'GEN/Locks.html', LF will be replaced by CRLF the next time Git touches it
[1mdiff --git a/GEN/Locks.html b/GEN/Locks.html[m
[1mindex bd91206..43e1712 100644[m
[1m--- a/GEN/Locks.html[m
[1m+++ b/GEN/Locks.html[m
[36m@@ -21,7 +21,7 @@[m
         <li>A <strong>read lock</strong> can be acquired by multiple threads at the same time if the write lock is not held by another thread, allowing concurrent read actions.</li>[m
     </ul></div>[m
     <div class="intro">[m
[31m-        <p>With <code>synchronized</code>, the JVM acquires and releases a monitor automatically around a block. With the Locking API, the program calls <code>lock()</code> and <code>unlock()</code> itself. That costs a little discipline, since every <code>lock()</code> must be paired with an <code>unlock()</code> in a <code>finally</code> block, but in return the program can try for a lock without blocking, give up after a timeout, be interrupted while waiting, choose fair ordering, keep several wait conditions, and let readers share access.</p>[m
[32m+[m[32m        <p>With <code>synchronized</code>, the JVM acquires and releases a monitor automatically around a block. With the Locking API, the program calls <code>lock()</code> and <code>unlock()</code> itself. That costs a little discipline, since every <code>lock()</code> must be paired with an <code>unlock()</code> in a <code>finally</code> block, but in return the program can try for a lock without blocking, give up after a timeout, be interrupted while waiting, choose fair ordering, keep several wait conditions and let readers share access.</p>[m
     </div>[m
 [m
     <div class="section cmp">[m
[36m@@ -49,7 +49,7 @@[m
         <p class="minor-heading"><strong>Pros</strong></p>[m
     </div>[m
     <div class="intro"><ul>[m
[31m-        <li><strong>More Control</strong><br>Try-locking, timeouts, and interruptible waits let a thread back off instead of blocking forever.</li>[m
[32m+[m[32m        <li><strong>More Control</strong><br>Try-locking, timeouts and interruptible waits let a thread back off instead of blocking forever.</li>[m
         <li><strong>Higher Read Throughput</strong><br>Read-write and stamped locks let many readers work in parallel when writes are rare.</li>[m
         <li><strong>Fairness</strong><br>A fair lock prevents threads from being starved by newcomers that keep grabbing the lock first.</li>[m
         <li><strong>Multiple Conditions</strong><br>Separate conditions wake only the threads that care, instead of <code>notifyAll()</code> waking everyone.</li>[m
[36m@@ -66,7 +66,7 @@[m
 [m
     <div class="subheading">Best Practices</div>[m
     <div class="intro"><ul>[m
[31m-        <li>Always call <code>lock()</code> just before <code>try</code>, and <code>unlock()</code> in the matching <code>finally</code>.</li>[m
[32m+[m[32m        <li>Always call <code>lock()</code> just before <code>try</code> and <code>unlock()</code> in the matching <code>finally</code>.</li>[m
         <li>Keep the locked section short; never do slow I/O or call unknown code while holding a lock.</li>[m
         <li>Acquire multiple locks in the same global order everywhere, or use <code>tryLock</code> with a timeout, to avoid deadlocks.</li>[m
         <li>Prefer <code>synchronized</code> for simple mutual exclusion; reach for the Locking API when you need one of its extra features.</li>[m
[36m@@ -233,7 +233,7 @@[m
         </div>[m
         <div class="method-entry" id="lock-2">[m
             <div id="tab-lock-2" class="api-sig"><span class="code-keyword">boolean</span> tryLock()</div>[m
[31m-            <p class="api-desc">Acquires the lock only if it is free at the moment of the call, and returns immediately: <code>true</code> if the lock was acquired, <code>false</code> otherwise. On a fair <code>ReentrantLock</code> this call still barges ahead of waiting threads.</p>[m
[32m+[m[32m            <p class="api-desc">Acquires the lock only if it is free at the moment of the call and returns immediately: <code>true</code> if the lock was acquired, <code>false</code> otherwise. On a fair <code>ReentrantLock</code> this call still barges ahead of waiting threads.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">if</span> (lock.tryLock()) { <span class="code-comment">Returns at once: true if the lock was acquired</span>[m
     <span class="code-keyword">try</span> {[m
         refreshCache();[m
[36m@@ -450,7 +450,7 @@[m [mrw.writeLock().unlock();</code></pre></div>[m
         </div>[m
         <div class="method-entry" id="stampedlock-1">[m
             <div id="tab-stampedlock-1" class="api-sig"><span class="code-keyword">long</span> readLock()</div>[m
[31m-            <p class="api-desc">Acquires a shared read lock, waiting while a writer holds the lock, and returns a stamp for releasing it.</p>[m
[32m+[m[32m            <p class="api-desc">Acquires a shared read lock, waiting while a writer holds the lock and returns a stamp for releasing it.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">long</span> stamp = lock.readLock(); <span class="code-comment">Shared with other readers</span>[m
 <span class="code-keyword">try</span> {[m
     <span class="code-keyword">return</span> <span class="code-class">Math</span>.hypot(x, y);[m
[36m@@ -626,7 +626,7 @@[m [mlock.lock();[m
         </div>[m
         <div class="method-entry" id="condition-4">[m
             <div id="tab-condition-4" class="api-sig"><span class="code-keyword">void</span> awaitUninterruptibly()</div>[m
[31m-            <p class="api-desc">Waits until signalled, ignoring interrupts. If the thread is interrupted while waiting, it keeps waiting, and its interrupt status is still set when the method returns.</p>[m
[32m+[m[32m            <p class="api-desc">Waits until signalled, ignoring interrupts. If the thread is interrupted while waiting, it keeps waiting and its interrupt status is still set when the method returns.</p>[m
             <div class="code-block"><pre><code>lock.lock();[m
 <span class="code-keyword">try</span> {[m
     <span class="code-keyword">while</span> (!shutdownComplete) {[m
[36m@@ -703,14 +703,14 @@[m [mlock.lock();[m
     <div class="subheading">Java Multithreading, Concurrency and Locking APIs — Complete Reference Guide</div>[m
     <div class="intro">[m
         <p>Core Java | Java Memory Model | Thread APIs | Locks | Synchronizers | Executors | Atomics | Concurrent Collections | CompletableFuture | Virtual Threads | Advanced Concurrency</p>[m
[31m-        <p>This guide covers the Java SE concurrency ecosystem, including the important classes, interfaces, methods, locking mechanisms, and practical Java code examples.</p>[m
[31m-        <p><strong>Version coverage:</strong> Java 8 through Java 27, with examples primarily compatible with Java 21+. Features introduced in later releases, and preview APIs, are identified separately. The official Java 27 documentation is used for the latest API reference.</p>[m
[32m+[m[32m        <p>This guide covers the Java SE concurrency ecosystem, including the important classes, interfaces, methods, locking mechanisms and practical Java code examples.</p>[m
[32m+[m[32m        <p><strong>Version coverage:</strong> Java 8 through Java 27, with examples primarily compatible with Java 21+. Features introduced in later releases and preview APIs, are identified separately. The official Java 27 documentation is used for the latest API reference.</p>[m
     </div>[m
 [m
     <div class="subheading">1. Complete Java concurrency API map</div>[m
     <div class="gw-card gw-vflow" style="gap:12px">[m
         <p class="gw-label" style="margin:0">Java Concurrency Ecosystem</p>[m
[31m-        <div class="gw-api"><p><strong>Java Multithreading and Concurrency</strong></p><p class="d">Thread management, synchronization, task execution, and memory visibility</p></div>[m
[32m+[m[32m        <div class="gw-api"><p><strong>Java Multithreading and Concurrency</strong></p><p class="d">Thread management, synchronization, task execution and memory visibility</p></div>[m
         <div class="gw-cols2">[m
             <div class="gw-api"><p class="n">Thread fundamentals</p><p class="d">Thread, Runnable, Callable, ThreadFactory, ThreadLocal</p></div>[m
             <div class="gw-api"><p class="n">Intrinsic locking</p><p class="d">synchronized, volatile, wait, notify, notifyAll</p></div>[m
[36m@@ -758,7 +758,7 @@[m [mlock.lock();[m
             </tbody>[m
         </table></div>[m
         <p class="minor-heading"><strong>2.1 The Java Memory Model (JMM)</strong></p>[m
[31m-        <p>The Java Memory Model defines when writes performed by one thread are guaranteed to become visible to another thread, and which reorderings are allowed.</p>[m
[32m+[m[32m        <p>The Java Memory Model defines when writes performed by one thread are guaranteed to become visible to another thread and which reorderings are allowed.</p>[m
         <p>The central concept is <strong>happens-before</strong>.</p>[m
         <p>Important happens-before relationships include:</p>[m
         <ul>[m
[36m@@ -789,7 +789,7 @@[m [mlock.lock();[m
         </div>[m
     </div>[m
     <div class="intro">[m
[31m-        <p><code>count++</code> conceptually involves reading the current value, computing a new value, and writing it back. Multiple threads can overwrite one another&rsquo;s updates.</p>[m
[32m+[m[32m        <p><code>count++</code> conceptually involves reading the current value, computing a new value and writing it back. Multiple threads can overwrite one another&rsquo;s updates.</p>[m
     </div>[m
     <div class="gw-card gw-vflow">[m
         <p class="gw-label" style="margin:0">Lost update: two threads increment the same counter</p>[m
[36m@@ -814,7 +814,7 @@[m [mlock.lock();[m
         </div>[m
     </div>[m
     <div class="intro">[m
[31m-        <p>Later sections cover when atomic variables are sufficient, and when multiple related state changes require a lock.</p>[m
[32m+[m[32m        <p>Later sections cover when atomic variables are sufficient and when multiple related state changes require a lock.</p>[m
     </div>[m
 [m
     <div class="subheading">3. <code>java.lang.Thread</code> — Complete API reference</div>[m
[36m@@ -835,7 +835,7 @@[m [mlock.lock();[m
         </select>[m
         <div class="method-entry" id="g3-0">[m
             <div id="tab-g3-0" class="api-sig"><span class="code-class">Thread</span>(<span class="code-class">Runnable</span> task)</div>[m
[31m-            <p class="api-desc">Creates a new platform thread that will run the given <code>Runnable</code> once started; the thread sits in the <code>NEW</code> state and does nothing until you call <code>start()</code>. The constructor never blocks, gives the thread an auto-generated name such as <code>Thread-0</code>, and inherits daemon status and priority from the creating thread. It is the classic way to spawn a thread, but modern code usually prefers <code>Thread.ofPlatform()</code> or an <code>ExecutorService</code> for better naming and lifecycle control.</p>[m
[32m+[m[32m            <p class="api-desc">Creates a new platform thread that will run the given <code>Runnable</code> once started; the thread sits in the <code>NEW</code> state and does nothing until you call <code>start()</code>. The constructor never blocks, gives the thread an auto-generated name such as <code>Thread-0</code> and inherits daemon status and priority from the creating thread. It is the classic way to spawn a thread, but modern code usually prefers <code>Thread.ofPlatform()</code> or an <code>ExecutorService</code> for better naming and lifecycle control.</p>[m
             <div class="code-block"><pre><code><span class="code-class">Runnable</span> task = () -&gt; <span class="code-class">System</span>.out.println(<span class="code-string">"Working on "</span> +[m
         <span class="code-class">Thread</span>.currentThread().getName());[m
 <span class="code-class">Thread</span> worker = <span class="code-keyword">new</span> <span class="code-class">Thread</span>(task); <span class="code-comment">Created in the NEW state, not running yet</span>[m
[36m@@ -844,7 +844,7 @@[m [mworker.join(); <span class="code-comment">Wait for it to finish</span></code></p[m
         </div>[m
         <div class="method-entry" id="g3-1">[m
             <div id="tab-g3-1" class="api-sig"><span class="code-class">Thread</span>(<span class="code-class">Runnable</span> task, <span class="code-class">String</span> name)</div>[m
[31m-            <p class="api-desc">Creates a platform thread with an explicit name, which then appears in thread dumps, log lines, profilers and uncaught exception messages instead of a generic <code>Thread-N</code>. Like the single-argument constructor it returns an unstarted thread in the <code>NEW</code> state, and it throws <code>NullPointerException</code> if the name is <code>null</code>. Naming every thread makes production debugging far easier; when you need many numbered threads, use <code>Thread.ofPlatform().name(prefix, start)</code> instead.</p>[m
[32m+[m[32m            <p class="api-desc">Creates a platform thread with an explicit name, which then appears in thread dumps, log lines, profilers and uncaught exception messages instead of a generic <code>Thread-N</code>. Like the single-argument constructor it returns an unstarted thread in the <code>NEW</code> state and it throws <code>NullPointerException</code> if the name is <code>null</code>. Naming every thread makes production debugging far easier; when you need many numbered threads, use <code>Thread.ofPlatform().name(prefix, start)</code> instead.</p>[m
             <div class="code-block"><pre><code><span class="code-class">Thread</span> worker = <span class="code-keyword">new</span> <span class="code-class">Thread</span>(() -&gt; {[m
     <span class="code-class">String</span> name = <span class="code-class">Thread</span>.currentThread().getName();[m
     <span class="code-class">System</span>.out.println(name + <span class="code-string">" processing orders"</span>); <span class="code-comment">order-worker processing</span>[m
[36m@@ -866,7 +866,7 @@[m [msecond.join();</code></pre></div>[m
         </div>[m
         <div class="method-entry" id="g3-3">[m
             <div id="tab-g3-3" class="api-sig"><span class="code-keyword">static</span> <span class="code-class">Builder</span>.<span class="code-class">OfVirtual</span> ofVirtual()</div>[m
[31m-            <p class="api-desc">Returns a <code>Thread.Builder.OfVirtual</code> for creating virtual threads, lightweight threads that the JVM schedules onto a small pool of carrier platform threads. You can set a name or numbered prefix, an uncaught exception handler and whether thread-locals are inherited; virtual threads are always daemon with normal priority. Final since Java 21, they suit blocking, I/O-heavy work with thousands or millions of threads; never pool them, and before Java 24 avoid long blocking inside <code>synchronized</code>, which pins the carrier.</p>[m
[32m+[m[32m            <p class="api-desc">Returns a <code>Thread.Builder.OfVirtual</code> for creating virtual threads, lightweight threads that the JVM schedules onto a small pool of carrier platform threads. You can set a name or numbered prefix, an uncaught exception handler and whether thread-locals are inherited; virtual threads are always daemon with normal priority. Final since Java 21, they suit blocking, I/O-heavy work with thousands or millions of threads; never pool them and before Java 24 avoid long blocking inside <code>synchronized</code>, which pins the carrier.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> builder = <span class="code-class">Thread</span>.ofVirtual().name(<span class="code-string">"vt-"</span>, <span class="code-number">0</span>); <span class="code-comment">vt-0, vt-1, ...</span>[m
 <span class="code-class">List</span>&lt;<span class="code-class">Thread</span>&gt; threads = <span class="code-keyword">new</span> <span class="code-class">ArrayList</span>&lt;&gt;();[m
 <span class="code-keyword">for</span> (<span class="code-keyword">int</span> i = <span class="code-number">0</span>; i &lt; <span class="code-number">10_000</span>; i++) {[m
[36m@@ -877,7 +877,7 @@[m [msecond.join();</code></pre></div>[m
         </div>[m
         <div class="method-entry" id="g3-4">[m
             <div id="tab-g3-4" class="api-sig"><span class="code-keyword">static</span> <span class="code-class">Thread</span> startVirtualThread(<span class="code-class">Runnable</span> task)</div>[m
[31m-            <p class="api-desc">Creates a virtual thread for the task, starts it immediately and returns it; it is shorthand for <code>Thread.ofVirtual().start(task)</code>. The call does not block, the thread has an empty name, and because virtual threads are daemon the JVM will not wait for it at shutdown, so <code>join()</code> it when the work matters. It throws <code>NullPointerException</code> for a null task. Use it for quick one-off work; for names, many tasks or results, prefer a builder or <code>Executors.newVirtualThreadPerTaskExecutor()</code>.</p>[m
[32m+[m[32m            <p class="api-desc">Creates a virtual thread for the task, starts it immediately and returns it; it is shorthand for <code>Thread.ofVirtual().start(task)</code>. The call does not block, the thread has an empty name and because virtual threads are daemon the JVM will not wait for it at shutdown, so <code>join()</code> it when the work matters. It throws <code>NullPointerException</code> for a null task. Use it for quick one-off work; for names, many tasks or results, prefer a builder or <code>Executors.newVirtualThreadPerTaskExecutor()</code>.</p>[m
             <div class="code-block"><pre><code><span class="code-class">Thread</span> vt = <span class="code-class">Thread</span>.startVirtualThread(() -&gt; {[m
     <span class="code-class">System</span>.out.println(<span class="code-class">Thread</span>.currentThread().isVirtual()); <span class="code-comment">true</span>[m
 });[m
[36m@@ -896,7 +896,7 @@[m [mt2.join();</code></pre></div>[m
         </div>[m
         <div class="method-entry" id="g3-6">[m
             <div id="tab-g3-6" class="api-sig"><span class="code-class">Thread</span> unstarted(<span class="code-class">Runnable</span> task)</div>[m
[31m-            <p class="api-desc">Creates a new thread from the builder&rsquo;s settings without starting it; the returned thread is in the <code>NEW</code> state and runs only after you call <code>start()</code>. This lets you register the thread, publish a reference or finish setup before it executes, avoiding a race with the running task. It never blocks and throws <code>NullPointerException</code> for a null task. Remember that an unstarted thread does nothing, and that calling <code>start()</code> twice throws <code>IllegalThreadStateException</code>.</p>[m
[32m+[m[32m            <p class="api-desc">Creates a new thread from the builder&rsquo;s settings without starting it; the returned thread is in the <code>NEW</code> state and runs only after you call <code>start()</code>. This lets you register the thread, publish a reference or finish setup before it executes, avoiding a race with the running task. It never blocks and throws <code>NullPointerException</code> for a null task. Remember that an unstarted thread does nothing and that calling <code>start()</code> twice throws <code>IllegalThreadStateException</code>.</p>[m
             <div class="code-block"><pre><code><span class="code-class">Map</span>&lt;<span class="code-class">String</span>, <span class="code-class">Thread</span>&gt; registry = <span class="code-keyword">new</span> <span class="code-class">ConcurrentHashMap</span>&lt;&gt;();[m
 <span class="code-class">Thread</span> t = <span class="code-class">Thread</span>.ofVirtual().name(<span class="code-string">"loader"</span>).unstarted(task);[m
 <span class="code-class">System</span>.out.println(t.getState()); <span class="code-comment">NEW: created but not running</span>[m
[36m@@ -907,7 +907,7 @@[m [mt.join();[m
         </div>[m
         <div class="method-entry" id="g3-7">[m
             <div id="tab-g3-7" class="api-sig"><span class="code-class">ThreadFactory</span> factory()</div>[m
[31m-            <p class="api-desc">Returns a <code>ThreadFactory</code> that creates threads with the builder&rsquo;s current settings, so builder configuration plugs into any API that expects a factory, such as <code>Executors</code> or <code>ThreadPoolExecutor</code>. The factory is safe for concurrent use, creates unstarted threads that the executor then starts, and keeps advancing a numbered name across calls. Pair <code>Thread.ofVirtual().factory()</code> with <code>Executors.newThreadPerTaskExecutor()</code> to get named virtual threads instead of the default unnamed ones.</p>[m
[32m+[m[32m            <p class="api-desc">Returns a <code>ThreadFactory</code> that creates threads with the builder&rsquo;s current settings, so builder configuration plugs into any API that expects a factory, such as <code>Executors</code> or <code>ThreadPoolExecutor</code>. The factory is safe for concurrent use, creates unstarted threads that the executor then starts and keeps advancing a numbered name across calls. Pair <code>Thread.ofVirtual().factory()</code> with <code>Executors.newThreadPerTaskExecutor()</code> to get named virtual threads instead of the default unnamed ones.</p>[m
             <div class="code-block"><pre><code><span class="code-class">ThreadFactory</span> factory = <span class="code-class">Thread</span>.ofPlatform().name(<span class="code-string">"pool-"</span>, <span class="code-number">0</span>).factory();[m
 <span class="code-keyword">try</span> (<span class="code-class">ExecutorService</span> pool = <span class="code-class">Executors</span>.newFixedThreadPool(<span class="code-number">4</span>, factory)) {[m
     pool.submit(() -&gt; <span class="code-class">System</span>.out.println(<span class="code-class">Thread</span>.currentThread().getName()));[m
[36m@@ -979,7 +979,7 @@[m [mt.join();[m
         </div>[m
         <div class="method-entry" id="g4-1">[m
             <div id="tab-g4-1" class="api-sig"><span class="code-keyword">void</span> run()</div>[m
[31m-            <p class="api-desc">Executes the thread&rsquo;s task: by default it calls the <code>Runnable</code> passed to the constructor, or does nothing if there is none, and a <code>Thread</code> subclass may override it. Calling <code>run()</code> directly is just an ordinary method call on the current thread, so no new thread is created and nothing runs concurrently. The JVM itself calls <code>run()</code> on the new thread after <code>start()</code>. Prefer passing a <code>Runnable</code> over subclassing <code>Thread</code>, which keeps the task separate from the thread.</p>[m
[32m+[m[32m            <p class="api-desc">Executes the thread&rsquo;s task: by default it calls the <code>Runnable</code> passed to the constructor, or does nothing if there is none and a <code>Thread</code> subclass may override it. Calling <code>run()</code> directly is just an ordinary method call on the current thread, so no new thread is created and nothing runs concurrently. The JVM itself calls <code>run()</code> on the new thread after <code>start()</code>. Prefer passing a <code>Runnable</code> over subclassing <code>Thread</code>, which keeps the task separate from the thread.</p>[m
             <div class="code-block"><pre><code><span class="code-class">Thread</span> t = <span class="code-keyword">new</span> <span class="code-class">Thread</span>(() -&gt; <span class="code-class">System</span>.out.println([m
         <span class="code-string">"Running on "</span> + <span class="code-class">Thread</span>.currentThread().getName()), <span class="code-string">"worker"</span>);[m
 t.run(); <span class="code-comment">Running on main: plain method call, no new thread</span>[m
[36m@@ -1012,7 +1012,7 @@[m [mt.join(<span class="code-number">2_000</span>); <span class="code-comment">Waits[m
         </div>[m
         <div class="method-entry" id="g4-4">[m
             <div id="tab-g4-4" class="api-sig"><span class="code-keyword">void</span> join(<span class="code-keyword">long</span> millis, <span class="code-keyword">int</span> nanos) <span class="code-keyword">throws</span> <span class="code-class">InterruptedException</span></div>[m
[31m-            <p class="api-desc">Waits at most <code>millis</code> milliseconds plus <code>nanos</code> nanoseconds (0 to 999999) for the thread to terminate; both zero means wait forever. Like <code>join(long)</code> it returns <code>void</code>, so call <code>isAlive()</code> afterwards to see whether the thread finished. It throws <code>IllegalArgumentException</code> for a negative <code>millis</code> or out-of-range <code>nanos</code>, and <code>InterruptedException</code> if interrupted. The JDK rounds any non-zero <code>nanos</code> up to a whole extra millisecond, so this overload is rarely useful; <code>join(Duration)</code> is clearer.</p>[m
[32m+[m[32m            <p class="api-desc">Waits at most <code>millis</code> milliseconds plus <code>nanos</code> nanoseconds (0 to 999999) for the thread to terminate; both zero means wait forever. Like <code>join(long)</code> it returns <code>void</code>, so call <code>isAlive()</code> afterwards to see whether the thread finished. It throws <code>IllegalArgumentException</code> for a negative <code>millis</code> or out-of-range <code>nanos</code> and <code>InterruptedException</code> if interrupted. The JDK rounds any non-zero <code>nanos</code> up to a whole extra millisecond, so this overload is rarely useful; <code>join(Duration)</code> is clearer.</p>[m
             <div class="code-block"><pre><code><span class="code-class">Thread</span> t = <span class="code-class">Thread</span>.ofPlatform().start(task);[m
 t.join(<span class="code-number">1_000</span>, <span class="code-number">500_000</span>); <span class="code-comment">Waits at most about 1.0005 seconds</span>[m
 <span class="code-keyword">if</span> (t.isAlive()) {[m
[36m@@ -1035,7 +1035,7 @@[m [mt.join(<span class="code-number">1_000</span>, <span class="code-number">500_000[m
         </div>[m
         <div class="method-entry" id="g4-6">[m
             <div id="tab-g4-6" class="api-sig"><span class="code-keyword">boolean</span> isAlive()</div>[m
[31m-            <p class="api-desc">Returns <code>true</code> if the thread has been started and has not yet terminated, and <code>false</code> both before <code>start()</code> and after the thread ends. It never blocks, but the answer can be stale the moment it returns, so use it for monitoring, logging or after a timed <code>join()</code>, not for coordination. Do not busy-poll <code>isAlive()</code> to wait for completion; use <code>join()</code> or a higher-level synchronizer such as <code>CountDownLatch</code> instead.</p>[m
[32m+[m[32m            <p class="api-desc">Returns <code>true</code> if the thread has been started and has not yet terminated and <code>false</code> both before <code>start()</code> and after the thread ends. It never blocks, but the answer can be stale the moment it returns, so use it for monitoring, logging or after a timed <code>join()</code>, not for coordination. Do not busy-poll <code>isAlive()</code> to wait for completion; use <code>join()</code> or a higher-level synchronizer such as <code>CountDownLatch</code> instead.</p>[m
             <div class="code-block"><pre><code><span class="code-class">Thread</span> t = <span class="code-keyword">new</span> <span class="code-class">Thread</span>(task);[m
 <span class="code-class">System</span>.out.println(t.isAlive()); <span class="code-comment">false: not started yet</span>[m
 t.start();[m
[36m@@ -1059,7 +1059,7 @@[m [mt.join();[m
         <div class="method-entry" id="g4-8">[m
             <div id="tab-g4-8" class="api-sig"><span class="code-class">String</span> getName()[m
 <span class="code-keyword">void</span> setName(<span class="code-class">String</span> name)</div>[m
[31m-            <p class="api-desc"><code>getName()</code> returns the thread&rsquo;s name and <code>setName()</code> changes it; names appear in thread dumps, logs, profilers and uncaught exception messages. Platform threads default to names like <code>Thread-0</code>, while virtual threads have an empty name unless one is set. Neither method blocks, and <code>setName()</code> throws <code>NullPointerException</code> for <code>null</code>. Names need not be unique; set them at creation through a constructor or builder where possible, since renaming pooled threads can confuse diagnostics.</p>[m
[32m+[m[32m            <p class="api-desc"><code>getName()</code> returns the thread&rsquo;s name and <code>setName()</code> changes it; names appear in thread dumps, logs, profilers and uncaught exception messages. Platform threads default to names like <code>Thread-0</code>, while virtual threads have an empty name unless one is set. Neither method blocks and <code>setName()</code> throws <code>NullPointerException</code> for <code>null</code>. Names need not be unique; set them at creation through a constructor or builder where possible, since renaming pooled threads can confuse diagnostics.</p>[m
             <div class="code-block"><pre><code><span class="code-class">Thread</span> t = <span class="code-keyword">new</span> <span class="code-class">Thread</span>(task);[m
 <span class="code-class">System</span>.out.println(t.getName()); <span class="code-comment">e.g. Thread-3: generated default</span>[m
 t.setName(<span class="code-string">"payment-worker"</span>); <span class="code-comment">Shows up in dumps and logs</span>[m
[36m@@ -1078,7 +1078,7 @@[m [mowners.put(me, <span class="code-string">"request-42"</span>); <span class="code[m
         </div>[m
         <div class="method-entry" id="g4-10">[m
             <div id="tab-g4-10" class="api-sig"><span class="code-keyword">long</span> getId()</div>[m
[31m-            <p class="api-desc">Returns the same identifier as <code>threadId()</code>, but because the method is not final, a subclass could override it to return something else. It has been deprecated since Java 19 (not for removal), and new code should call <code>threadId()</code> instead. It never blocks and throws nothing; for ordinary threads the two methods return the same value, so replacing it is a safe mechanical change that removes the deprecation warning.</p>[m
[32m+[m[32m            <p class="api-desc">Returns the same identifier as <code>threadId()</code>, but because the method is not final, a subclass could override it to return something else. It has been deprecated since Java 19 (not for removal) and new code should call <code>threadId()</code> instead. It never blocks and throws nothing; for ordinary threads the two methods return the same value, so replacing it is a safe mechanical change that removes the deprecation warning.</p>[m
             <div class="code-block"><pre><code><span class="code-class">Thread</span> current = <span class="code-class">Thread</span>.currentThread();[m
 <span class="code-keyword">long</span> oldId = current.getId(); <span class="code-comment">Deprecated since Java 19</span>[m
 <span class="code-keyword">long</span> newId = current.threadId(); <span class="code-comment">Preferred replacement</span>[m
[36m@@ -1086,7 +1086,7 @@[m [mowners.put(me, <span class="code-string">"request-42"</span>); <span class="code[m
         </div>[m
         <div class="method-entry" id="g4-11">[m
             <div id="tab-g4-11" class="api-sig"><span class="code-keyword">static</span> <span class="code-class">Thread</span> currentThread()</div>[m
[31m-            <p class="api-desc">Returns the <code>Thread</code> object for the thread executing the call, which may be a platform or a virtual thread, and never returns <code>null</code> or blocks. Use it to read the current name or id, check or restore the interrupt status, or log where code runs. Inside a virtual thread it returns the virtual thread, not its carrier. In a thread pool the same <code>Thread</code> serves many tasks, so do not assume one thread per request.</p>[m
[32m+[m[32m            <p class="api-desc">Returns the <code>Thread</code> object for the thread executing the call, which may be a platform or a virtual thread and never returns <code>null</code> or blocks. Use it to read the current name or id, check or restore the interrupt status, or log where code runs. Inside a virtual thread it returns the virtual thread, not its carrier. In a thread pool the same <code>Thread</code> serves many tasks, so do not assume one thread per request.</p>[m
             <div class="code-block"><pre><code><span class="code-class">Thread</span> current = <span class="code-class">Thread</span>.currentThread();[m
 <span class="code-class">System</span>.out.println(<span class="code-string">"Running on "</span> + current.getName()); <span class="code-comment">Running on main</span>[m
 <span class="code-class">System</span>.out.println(<span class="code-string">"Virtual? "</span> + current.isVirtual()); <span class="code-comment">Virtual? false</span>[m
[36m@@ -1111,7 +1111,7 @@[m [mowners.put(me, <span class="code-string">"request-42"</span>); <span class="code[m
         <div class="method-entry" id="g4-13">[m
             <div id="tab-g4-13" class="api-sig"><span class="code-keyword">boolean</span> isDaemon()[m
 <span class="code-keyword">void</span> setDaemon(<span class="code-keyword">boolean</span> on)</div>[m
[31m-            <p class="api-desc"><code>isDaemon()</code> reports whether a thread is a daemon and <code>setDaemon()</code> marks it as daemon or user; the JVM exits once only daemon threads remain, abandoning them mid-work. <code>setDaemon()</code> must be called before <code>start()</code> or it throws <code>IllegalThreadStateException</code>, and <code>setDaemon(false)</code> on a virtual thread throws <code>IllegalArgumentException</code> because virtual threads are always daemon. New threads inherit the creator&rsquo;s status. Use daemons for background housekeeping, never for work that must finish, such as writing files.</p>[m
[32m+[m[32m            <p class="api-desc"><code>isDaemon()</code> reports whether a thread is a daemon and <code>setDaemon()</code> marks it as daemon or user; the JVM exits once only daemon threads remain, abandoning them mid-work. <code>setDaemon()</code> must be called before <code>start()</code> or it throws <code>IllegalThreadStateException</code> and <code>setDaemon(false)</code> on a virtual thread throws <code>IllegalArgumentException</code> because virtual threads are always daemon. New threads inherit the creator&rsquo;s status. Use daemons for background housekeeping, never for work that must finish, such as writing files.</p>[m
             <div class="code-block"><pre><code><span class="code-class">Thread</span> t = <span class="code-keyword">new</span> <span class="code-class">Thread</span>(() -&gt; {[m
     <span class="code-keyword">while</span> (<span class="code-keyword">true</span>) cleanupCache(); <span class="code-comment">Background housekeeping</span>[m
 });[m
[36m@@ -1123,7 +1123,7 @@[m [mt.start(); <span class="code-comment">The JVM may exit without waiting for t</sp[m
         <div class="method-entry" id="g4-14">[m
             <div id="tab-g4-14" class="api-sig"><span class="code-keyword">int</span> getPriority()[m
 <span class="code-keyword">void</span> setPriority(<span class="code-keyword">int</span> newPriority)</div>[m
[31m-            <p class="api-desc"><code>getPriority()</code> returns the thread&rsquo;s priority and <code>setPriority()</code> changes it within <code>Thread.MIN_PRIORITY</code> (1) to <code>Thread.MAX_PRIORITY</code> (10), with <code>NORM_PRIORITY</code> (5) as the usual default. Values outside that range throw <code>IllegalArgumentException</code>, and the value is capped at the thread group&rsquo;s maximum. Priority is only a hint that many operating systems largely ignore, so never rely on it for correctness. Virtual threads always have <code>NORM_PRIORITY</code>, and <code>setPriority()</code> has no effect on them.</p>[m
[32m+[m[32m            <p class="api-desc"><code>getPriority()</code> returns the thread&rsquo;s priority and <code>setPriority()</code> changes it within <code>Thread.MIN_PRIORITY</code> (1) to <code>Thread.MAX_PRIORITY</code> (10), with <code>NORM_PRIORITY</code> (5) as the usual default. Values outside that range throw <code>IllegalArgumentException</code> and the value is capped at the thread group&rsquo;s maximum. Priority is only a hint that many operating systems largely ignore, so never rely on it for correctness. Virtual threads always have <code>NORM_PRIORITY</code> and <code>setPriority()</code> has no effect on them.</p>[m
             <div class="code-block"><pre><code><span class="code-class">Thread</span> t = <span class="code-keyword">new</span> <span class="code-class">Thread</span>(task);[m
 <span class="code-class">System</span>.out.println(t.getPriority()); <span class="code-comment">5: inherited NORM_PRIORITY</span>[m
 t.setPriority(<span class="code-class">Thread</span>.MAX_PRIORITY); <span class="code-comment">A hint only; the OS may ignore it</span>[m
[36m@@ -1144,7 +1144,7 @@[m [mvt.join();[m
         </div>[m
         <div class="method-entry" id="g4-16">[m
             <div id="tab-g4-16" class="api-sig"><span class="code-keyword">static</span> <span class="code-keyword">int</span> activeCount()</div>[m
[31m-            <p class="api-desc">Returns an estimate of the number of live platform threads in the current thread&rsquo;s group and its subgroups; virtual threads are never counted. The value is approximate because threads start and stop while it is computed, and the call does not block. It is intended for debugging, mainly to size the array passed to <code>enumerate()</code>; for real monitoring use <code>ThreadMXBean</code> from <code>ManagementFactory</code>, which reports JVM-wide counts.</p>[m
[32m+[m[32m            <p class="api-desc">Returns an estimate of the number of live platform threads in the current thread&rsquo;s group and its subgroups; virtual threads are never counted. The value is approximate because threads start and stop while it is computed and the call does not block. It is intended for debugging, mainly to size the array passed to <code>enumerate()</code>; for real monitoring use <code>ThreadMXBean</code> from <code>ManagementFactory</code>, which reports JVM-wide counts.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">int</span> before = <span class="code-class">Thread</span>.activeCount(); <span class="code-comment">e.g. 1: just main in its group</span>[m
 <span class="code-keyword">for</span> (<span class="code-keyword">int</span> i = <span class="code-number">0</span>; i &lt; <span class="code-number">3</span>; i++) {[m
     <span class="code-class">Thread</span>.ofPlatform().start(task);[m
[36m@@ -1154,7 +1154,7 @@[m [mvt.join();[m
         </div>[m
         <div class="method-entry" id="g4-17">[m
             <div id="tab-g4-17" class="api-sig"><span class="code-keyword">static</span> <span class="code-keyword">int</span> enumerate(<span class="code-class">Thread</span>[] tarray)</div>[m
[31m-            <p class="api-desc">Copies every live platform thread in the current thread&rsquo;s group and its subgroups into the array and returns how many were copied; virtual threads are not included. If the array is too small, the extra threads are silently dropped, so size it with some slack above <code>activeCount()</code>. It does not block, and the result is only a snapshot. It is meant for debugging; prefer <code>getAllStackTraces()</code> or <code>ThreadMXBean</code> for serious diagnostics.</p>[m
[32m+[m[32m            <p class="api-desc">Copies every live platform thread in the current thread&rsquo;s group and its subgroups into the array and returns how many were copied; virtual threads are not included. If the array is too small, the extra threads are silently dropped, so size it with some slack above <code>activeCount()</code>. It does not block and the result is only a snapshot. It is meant for debugging; prefer <code>getAllStackTraces()</code> or <code>ThreadMXBean</code> for serious diagnostics.</p>[m
             <div class="code-block"><pre><code><span class="code-class">Thread</span>[] threads = <span class="code-keyword">new</span> <span class="code-class">Thread</span>[<span class="code-class">Thread</span>.activeCount() + <span class="code-number">10</span>]; <span class="code-comment">Slack for growth</span>[m
 <span class="code-keyword">int</span> count = <span class="code-class">Thread</span>.enumerate(threads); <span class="code-comment">Number actually copied</span>[m
 <span class="code-keyword">for</span> (<span class="code-keyword">int</span> i = <span class="code-number">0</span>; i &lt; count; i++) {[m
[36m@@ -1175,7 +1175,7 @@[m [mworker.join();[m
         </div>[m
         <div class="method-entry" id="g4-19">[m
             <div id="tab-g4-19" class="api-sig"><span class="code-keyword">static</span> <span class="code-class">Map</span>&lt;<span class="code-class">Thread</span>, <span class="code-class">StackTraceElement</span>[]&gt; getAllStackTraces()</div>[m
[31m-            <p class="api-desc">Returns a map from every live platform thread to its stack trace, giving you a programmatic thread dump. Virtual threads are not included; dump those with <code>jcmd &lt;pid&gt; Thread.dump_to_file</code>. Capturing all stacks can briefly pause threads and is relatively expensive, and the map is a snapshot in which some arrays may be empty. Use it for watchdogs or diagnostic endpoints, never on a hot path.</p>[m
[32m+[m[32m            <p class="api-desc">Returns a map from every live platform thread to its stack trace, giving you a programmatic thread dump. Virtual threads are not included; dump those with <code>jcmd &lt;pid&gt; Thread.dump_to_file</code>. Capturing all stacks can briefly pause threads and is relatively expensive and the map is a snapshot in which some arrays may be empty. Use it for watchdogs or diagnostic endpoints, never on a hot path.</p>[m
             <div class="code-block"><pre><code><span class="code-class">Map</span>&lt;<span class="code-class">Thread</span>, <span class="code-class">StackTraceElement</span>[]&gt; all = <span class="code-class">Thread</span>.getAllStackTraces();[m
 <span class="code-keyword">for</span> (<span class="code-keyword">var</span> entry : all.entrySet()) {[m
     <span class="code-class">Thread</span> t = entry.getKey();[m
[36m@@ -1186,7 +1186,7 @@[m [mworker.join();[m
         </div>[m
         <div class="method-entry" id="g4-20">[m
             <div id="tab-g4-20" class="api-sig"><span class="code-keyword">static</span> <span class="code-keyword">void</span> dumpStack()</div>[m
[31m-            <p class="api-desc">Prints the current thread&rsquo;s stack trace to <code>System.err</code>, exactly like <code>new Exception("Stack trace").printStackTrace()</code>. It never blocks, throws nothing, and only ever reports the calling thread. Use it as a quick debugging aid to see how execution reached a particular point; in production code, log a <code>Throwable</code> through your logging framework instead so the output is captured, leveled and searchable.</p>[m
[32m+[m[32m            <p class="api-desc">Prints the current thread&rsquo;s stack trace to <code>System.err</code>, exactly like <code>new Exception("Stack trace").printStackTrace()</code>. It never blocks, throws nothing and only ever reports the calling thread. Use it as a quick debugging aid to see how execution reached a particular point; in production code, log a <code>Throwable</code> through your logging framework instead so the output is captured, leveled and searchable.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">void</span> handle(<span class="code-class">String</span> state) {[m
     <span class="code-keyword">if</span> (!state.equals(<span class="code-string">"READY"</span>)) {[m
         <span class="code-class">System</span>.out.println(<span class="code-string">"Unexpected state "</span> + state);[m
[36m@@ -1236,7 +1236,7 @@[m [mworker.join();[m
     </div>[m
     <div class="intro">[m
         <p>The intermediate state is timing-dependent.</p>[m
[31m-        <p class="minor-heading"><strong>3.4 Sleep, yield, and spin-wait APIs</strong></p>[m
[32m+[m[32m        <p class="minor-heading"><strong>3.4 Sleep, yield and spin-wait APIs</strong></p>[m
     </div>[m
     <div class="method-picker">[m
         <select aria-label="Thread sleep, yield and spin-wait methods" hidden>[m
[36m@@ -1248,7 +1248,7 @@[m [mworker.join();[m
         </select>[m
         <div class="method-entry" id="g6-0">[m
             <div id="tab-g6-0" class="api-sig"><span class="code-keyword">static</span> <span class="code-keyword">void</span> sleep(<span class="code-keyword">long</span> millis) <span class="code-keyword">throws</span> <span class="code-class">InterruptedException</span></div>[m
[31m-            <p class="api-desc">Pauses the current thread for at least approximately the given number of milliseconds, subject to OS timer precision and scheduling. The thread keeps every lock and monitor it holds while sleeping, unlike <code>wait()</code>. It throws <code>InterruptedException</code> if interrupted before or during the sleep, clearing the interrupt status, and <code>IllegalArgumentException</code> for a negative value. A sleeping virtual thread releases its carrier, so sleeping is cheap there; never use sleep to coordinate threads.</p>[m
[32m+[m[32m            <p class="api-desc">Pauses the current thread for at least approximately the given number of milliseconds, subject to OS timer precision and scheduling. The thread keeps every lock and monitor it holds while sleeping, unlike <code>wait()</code>. It throws <code>InterruptedException</code> if interrupted before or during the sleep, clearing the interrupt status and <code>IllegalArgumentException</code> for a negative value. A sleeping virtual thread releases its carrier, so sleeping is cheap there; never use sleep to coordinate threads.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">while</span> (!<span class="code-class">Thread</span>.currentThread().isInterrupted()) {[m
     pollQueue();[m
     <span class="code-keyword">try</span> {[m
[36m@@ -1260,7 +1260,7 @@[m [mworker.join();[m
         </div>[m
         <div class="method-entry" id="g6-1">[m
             <div id="tab-g6-1" class="api-sig"><span class="code-keyword">static</span> <span class="code-keyword">void</span> sleep(<span class="code-keyword">long</span> millis, <span class="code-keyword">int</span> nanos) <span class="code-keyword">throws</span> <span class="code-class">InterruptedException</span></div>[m
[31m-            <p class="api-desc">Pauses the current thread for the given milliseconds plus nanoseconds (0 to 999999), at least approximately. Real precision depends on the OS timer, so sub-millisecond sleeps usually last longer than requested. It throws <code>IllegalArgumentException</code> for a negative <code>millis</code> or out-of-range <code>nanos</code> and <code>InterruptedException</code> if interrupted, and like every sleep it keeps held locks. Prefer <code>sleep(Duration)</code> for readability, and use <code>LockSupport.parkNanos()</code> or spinning only when you truly need very short waits.</p>[m
[32m+[m[32m            <p class="api-desc">Pauses the current thread for the given milliseconds plus nanoseconds (0 to 999999), at least approximately. Real precision depends on the OS timer, so sub-millisecond sleeps usually last longer than requested. It throws <code>IllegalArgumentException</code> for a negative <code>millis</code> or out-of-range <code>nanos</code> and <code>InterruptedException</code> if interrupted and like every sleep it keeps held locks. Prefer <code>sleep(Duration)</code> for readability and use <code>LockSupport.parkNanos()</code> or spinning only when you truly need very short waits.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">long</span> start = <span class="code-class">System</span>.nanoTime();[m
 <span class="code-keyword">try</span> {[m
     <span class="code-class">Thread</span>.sleep(<span class="code-number">0</span>, <span class="code-number">500_000</span>); <span class="code-comment">Requests 0.5 ms</span>[m
[36m@@ -1272,7 +1272,7 @@[m [mworker.join();[m
         </div>[m
         <div class="method-entry" id="g6-2">[m
             <div id="tab-g6-2" class="api-sig"><span class="code-keyword">static</span> <span class="code-keyword">void</span> sleep(<span class="code-class">Duration</span> duration) <span class="code-keyword">throws</span> <span class="code-class">InterruptedException</span></div>[m
[31m-            <p class="api-desc">Pauses the current thread for the given <code>Duration</code>, which reads more clearly than raw millisecond counts and avoids unit mistakes. Added in Java 19, it behaves like the other sleeps: it keeps held locks, throws <code>InterruptedException</code> if interrupted, and returns immediately for a zero or negative duration. It is the preferred form in modern code, especially in retry and backoff logic where delays are computed.</p>[m
[32m+[m[32m            <p class="api-desc">Pauses the current thread for the given <code>Duration</code>, which reads more clearly than raw millisecond counts and avoids unit mistakes. Added in Java 19, it behaves like the other sleeps: it keeps held locks, throws <code>InterruptedException</code> if interrupted and returns immediately for a zero or negative duration. It is the preferred form in modern code, especially in retry and backoff logic where delays are computed.</p>[m
             <div class="code-block"><pre><code><span class="code-class">Duration</span> delay = <span class="code-class">Duration</span>.ofMillis(<span class="code-number">100</span>);[m
 <span class="code-keyword">for</span> (<span class="code-keyword">int</span> attempt = <span class="code-number">1</span>; attempt &lt;= <span class="code-number">3</span>; attempt++) {[m
     <span class="code-keyword">if</span> (tryConnect()) <span class="code-keyword">break</span>;[m
[36m@@ -1283,7 +1283,7 @@[m [mworker.join();[m
         </div>[m
         <div class="method-entry" id="g6-3">[m
             <div id="tab-g6-3" class="api-sig"><span class="code-keyword">static</span> <span class="code-keyword">void</span> <span class="code-keyword">yield</span>()</div>[m
[31m-            <p class="api-desc">Hints to the scheduler that the current thread is willing to give up its processor so other runnable threads may run. The scheduler is free to ignore the hint, the call does not block, and it releases no locks; on a virtual thread it may let another virtual thread use the carrier. It is rarely useful in application code: never rely on it for correctness or as a substitute for synchronization, and prefer <code>onSpinWait()</code> in spin loops.</p>[m
[32m+[m[32m            <p class="api-desc">Hints to the scheduler that the current thread is willing to give up its processor so other runnable threads may run. The scheduler is free to ignore the hint, the call does not block and it releases no locks; on a virtual thread it may let another virtual thread use the carrier. It is rarely useful in application code: never rely on it for correctness or as a substitute for synchronization and prefer <code>onSpinWait()</code> in spin loops.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">for</span> (<span class="code-keyword">int</span> i = <span class="code-number">0</span>; i &lt; <span class="code-number">1_000_000</span>; i++) {[m
     process(i);[m
     <span class="code-keyword">if</span> (i % <span class="code-number">10_000</span> == <span class="code-number">0</span>) {[m
[36m@@ -1294,7 +1294,7 @@[m [mworker.join();[m
         </div>[m
         <div class="method-entry" id="g6-4">[m
             <div id="tab-g6-4" class="api-sig"><span class="code-keyword">static</span> <span class="code-keyword">void</span> onSpinWait()</div>[m
[31m-            <p class="api-desc">Tells the runtime the caller is in a busy-wait loop, letting the JVM emit a CPU hint such as the x86 <code>PAUSE</code> instruction, which saves power and helps a sibling hyperthread. It returns immediately, does not block or yield, and has no semantic effect. Added in Java 9, it belongs only in very short spin loops in low-latency code; for any wait that may last longer than microseconds, use <code>LockSupport.park()</code>, a <code>CountDownLatch</code> or a lock instead.</p>[m
[32m+[m[32m            <p class="api-desc">Tells the runtime the caller is in a busy-wait loop, letting the JVM emit a CPU hint such as the x86 <code>PAUSE</code> instruction, which saves power and helps a sibling hyperthread. It returns immediately, does not block or yield and has no semantic effect. Added in Java 9, it belongs only in very short spin loops in low-latency code; for any wait that may last longer than microseconds, use <code>LockSupport.park()</code>, a <code>CountDownLatch</code> or a lock instead.</p>[m
             <div class="code-block"><pre><code><span class="code-class">AtomicBoolean</span> ready = <span class="code-keyword">new</span> <span class="code-class">AtomicBoolean</span>(<span class="code-keyword">false</span>);[m
 <span class="code-class">Thread</span>.ofPlatform().start(() -&gt; ready.set(<span class="code-keyword">true</span>));[m
 <span class="code-keyword">int</span> spins = <span class="code-number">0</span>;[m
[36m@@ -1339,7 +1339,7 @@[m [mworker.join();[m
         </select>[m
         <div class="method-entry" id="g7-0">[m
             <div id="tab-g7-0" class="api-sig"><span class="code-keyword">void</span> interrupt()</div>[m
[31m-            <p class="api-desc">Requests interruption of the target thread by setting its interrupt flag; it never stops the thread forcibly and returns immediately. If the thread is blocked in <code>sleep()</code>, <code>wait()</code>, <code>join()</code> or a similar call, that call throws <code>InterruptedException</code> and clears the flag; interruptible NIO channels are closed and a <code>Selector</code> wakes up. Cancellation is cooperative: the target must check the flag or handle the exception, and code that silently swallows <code>InterruptedException</code> breaks it.</p>[m
[32m+[m[32m            <p class="api-desc">Requests interruption of the target thread by setting its interrupt flag; it never stops the thread forcibly and returns immediately. If the thread is blocked in <code>sleep()</code>, <code>wait()</code>, <code>join()</code> or a similar call, that call throws <code>InterruptedException</code> and clears the flag; interruptible NIO channels are closed and a <code>Selector</code> wakes up. Cancellation is cooperative: the target must check the flag or handle the exception and code that silently swallows <code>InterruptedException</code> breaks it.</p>[m
             <div class="code-block"><pre><code><span class="code-class">Thread</span> worker = <span class="code-class">Thread</span>.ofPlatform().start(() -&gt; {[m
     <span class="code-keyword">try</span> {[m
         <span class="code-class">Thread</span>.sleep(<span class="code-number">10_000</span>); <span class="code-comment">Long blocking call</span>[m
[36m@@ -1366,7 +1366,7 @@[m [mworker.join();</code></pre></div>[m
         </div>[m
         <div class="method-entry" id="g7-2">[m
             <div id="tab-g7-2" class="api-sig"><span class="code-keyword">static</span> <span class="code-keyword">boolean</span> interrupted()</div>[m
[31m-            <p class="api-desc">Static method that tests whether the current thread is interrupted and clears the flag in the same step, so an immediate second call returns <code>false</code>. It never blocks and always applies to the calling thread, even if you invoke it through another <code>Thread</code> reference. Use it when you are about to handle the interruption yourself, typically by throwing <code>InterruptedException</code>; to merely check, use <code>isInterrupted()</code>, and if you swallow an interrupt, restore it with <code>interrupt()</code>.</p>[m
[32m+[m[32m            <p class="api-desc">Static method that tests whether the current thread is interrupted and clears the flag in the same step, so an immediate second call returns <code>false</code>. It never blocks and always applies to the calling thread, even if you invoke it through another <code>Thread</code> reference. Use it when you are about to handle the interruption yourself, typically by throwing <code>InterruptedException</code>; to merely check, use <code>isInterrupted()</code> and if you swallow an interrupt, restore it with <code>interrupt()</code>.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">void</span> copyAll(<span class="code-class">List</span>&lt;<span class="code-class">String</span>&gt; files) <span class="code-keyword">throws</span> <span class="code-class">InterruptedException</span> {[m
     <span class="code-keyword">for</span> (<span class="code-class">String</span> file : files) {[m
         <span class="code-keyword">if</span> (<span class="code-class">Thread</span>.interrupted()) { <span class="code-comment">Checks AND clears the flag</span>[m
[36m@@ -1422,8 +1422,8 @@[m [mworker.join();</code></pre>[m
             <li><code>setDefaultUncaughtExceptionHandler()</code></li>[m
             <li><code>getDefaultUncaughtExceptionHandler()</code></li>[m
         </ul>[m
[31m-        <p>Also available are context class-loader methods such as <code>getContextClassLoader()</code> and <code>setContextClassLoader()</code>, and the older <code>ThreadGroup</code> API.</p>[m
[31m-        <p>Legacy <code>stop()</code>, <code>suspend()</code>, and <code>resume()</code> are unsafe or obsolete and must not be used for application coordination.</p>[m
[32m+[m[32m        <p>Also available are context class-loader methods such as <code>getContextClassLoader()</code> and <code>setContextClassLoader()</code> and the older <code>ThreadGroup</code> API.</p>[m
[32m+[m[32m        <p>Legacy <code>stop()</code>, <code>suspend()</code> and <code>resume()</code> are unsafe or obsolete and must not be used for application coordination.</p>[m
     </div>[m
 [m
     <div class="subheading">4. Intrinsic locking: <code>synchronized</code>, <code>wait()</code>, <code>notify()</code></div>[m
[36m@@ -1496,7 +1496,7 @@[m [mworker.join();</code></pre>[m
         </select>[m
         <div class="method-entry" id="g8-0">[m
             <div id="tab-g8-0" class="api-sig"><span class="code-keyword">void</span> wait() <span class="code-keyword">throws</span> <span class="code-class">InterruptedException</span></div>[m
[31m-            <p class="api-desc">Releases the object&rsquo;s monitor and blocks until another thread calls <code>notify()</code> or <code>notifyAll()</code> on it or the thread is interrupted, then reacquires the monitor before returning. It must be called while holding that monitor, otherwise it throws <code>IllegalMonitorStateException</code>, and it throws <code>InterruptedException</code> on interrupt. Spurious wakeups can happen, so always call it in a <code>while</code> loop that re-checks the condition. For new code, <code>Condition</code> or <code>java.util.concurrent</code> utilities are usually simpler and safer.</p>[m
[32m+[m[32m            <p class="api-desc">Releases the object&rsquo;s monitor and blocks until another thread calls <code>notify()</code> or <code>notifyAll()</code> on it or the thread is interrupted, then reacquires the monitor before returning. It must be called while holding that monitor, otherwise it throws <code>IllegalMonitorStateException</code> and it throws <code>InterruptedException</code> on interrupt. Spurious wakeups can happen, so always call it in a <code>while</code> loop that re-checks the condition. For new code, <code>Condition</code> or <code>java.util.concurrent</code> utilities are usually simpler and safer.</p>[m
             <div class="code-block"><pre><code><span class="code-class">String</span> take() <span class="code-keyword">throws</span> <span class="code-class">InterruptedException</span> {[m
     synchronized (lock) {[m
         <span class="code-keyword">while</span> (message == <span class="code-keyword">null</span>) { <span class="code-comment">Loop guards against spurious wakeups</span>[m
[36m@@ -1510,7 +1510,7 @@[m [mworker.join();</code></pre>[m
         </div>[m
         <div class="method-entry" id="g8-1">[m
             <div id="tab-g8-1" class="api-sig"><span class="code-keyword">void</span> wait(<span class="code-keyword">long</span> timeoutMillis) <span class="code-keyword">throws</span> <span class="code-class">InterruptedException</span></div>[m
[31m-            <p class="api-desc">Like <code>wait()</code>, but returns after at most <code>timeoutMillis</code> milliseconds even if nobody notifies; a timeout of <code>0</code> means wait forever. It releases the monitor while waiting and reacquires it before returning, and since it returns <code>void</code> you must re-check the condition and the clock to tell a timeout from a notification. It throws <code>IllegalMonitorStateException</code> without the monitor, <code>IllegalArgumentException</code> for a negative timeout and <code>InterruptedException</code> on interrupt. Use it in a loop that tracks a deadline.</p>[m
[32m+[m[32m            <p class="api-desc">Like <code>wait()</code>, but returns after at most <code>timeoutMillis</code> milliseconds even if nobody notifies; a timeout of <code>0</code> means wait forever. It releases the monitor while waiting and reacquires it before returning and since it returns <code>void</code> you must re-check the condition and the clock to tell a timeout from a notification. It throws <code>IllegalMonitorStateException</code> without the monitor, <code>IllegalArgumentException</code> for a negative timeout and <code>InterruptedException</code> on interrupt. Use it in a loop that tracks a deadline.</p>[m
             <div class="code-block"><pre><code>synchronized (lock) {[m
     <span class="code-keyword">long</span> deadline = <span class="code-class">System</span>.currentTimeMillis() + <span class="code-number">1_000</span>;[m
     <span class="code-keyword">while</span> (!ready) {[m
[36m@@ -1523,7 +1523,7 @@[m [mworker.join();</code></pre>[m
         </div>[m
         <div class="method-entry" id="g8-2">[m
             <div id="tab-g8-2" class="api-sig"><span class="code-keyword">void</span> wait(<span class="code-keyword">long</span> timeoutMillis, <span class="code-keyword">int</span> nanos) <span class="code-keyword">throws</span> <span class="code-class">InterruptedException</span></div>[m
[31m-            <p class="api-desc">Like <code>wait(long)</code>, with an extra <code>nanos</code> argument from 0 to 999999 for a finer timeout; both zero means wait forever. The same rules apply: hold the monitor, call it inside a condition loop, and expect <code>IllegalMonitorStateException</code>, <code>IllegalArgumentException</code> for out-of-range values and <code>InterruptedException</code>. In the JDK any non-zero <code>nanos</code> simply rounds the timeout up by one millisecond, so this overload adds little over <code>wait(long)</code>.</p>[m
[32m+[m[32m            <p class="api-desc">Like <code>wait(long)</code>, with an extra <code>nanos</code> argument from 0 to 999999 for a finer timeout; both zero means wait forever. The same rules apply: hold the monitor, call it inside a condition loop and expect <code>IllegalMonitorStateException</code>, <code>IllegalArgumentException</code> for out-of-range values and <code>InterruptedException</code>. In the JDK any non-zero <code>nanos</code> simply rounds the timeout up by one millisecond, so this overload adds little over <code>wait(long)</code>.</p>[m
             <div class="code-block"><pre><code>synchronized (lock) {[m
     <span class="code-keyword">while</span> (!ready) {[m
         lock.wait(<span class="code-number">100</span>, <span class="code-number">500_000</span>); <span class="code-comment">At most about 100.5 ms per wait</span>[m
[36m@@ -1534,7 +1534,7 @@[m [mworker.join();</code></pre>[m
         </div>[m
         <div class="method-entry" id="g8-3">[m
             <div id="tab-g8-3" class="api-sig"><span class="code-keyword">void</span> notify()</div>[m
[31m-            <p class="api-desc">Wakes one thread waiting on this object&rsquo;s monitor, chosen arbitrarily; the woken thread cannot proceed until the notifier leaves the <code>synchronized</code> block and it reacquires the monitor. It must be called while holding the monitor or it throws <code>IllegalMonitorStateException</code>, and it does nothing if no thread is waiting, because notifications are not remembered. Use it only when all waiters wait for the same condition and any one can handle it; otherwise prefer <code>notifyAll()</code> to avoid lost wakeups.</p>[m
[32m+[m[32m            <p class="api-desc">Wakes one thread waiting on this object&rsquo;s monitor, chosen arbitrarily; the woken thread cannot proceed until the notifier leaves the <code>synchronized</code> block and it reacquires the monitor. It must be called while holding the monitor or it throws <code>IllegalMonitorStateException</code> and it does nothing if no thread is waiting, because notifications are not remembered. Use it only when all waiters wait for the same condition and any one can handle it; otherwise prefer <code>notifyAll()</code> to avoid lost wakeups.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">void</span> put(<span class="code-class">String</span> m) {[m
     synchronized (lock) {[m
         message = m; <span class="code-comment">Change the shared state first</span>[m
[36m@@ -1544,7 +1544,7 @@[m [mworker.join();</code></pre>[m
         </div>[m
         <div class="method-entry" id="g8-4">[m
             <div id="tab-g8-4" class="api-sig"><span class="code-keyword">void</span> notifyAll()</div>[m
[31m-            <p class="api-desc">Wakes every thread waiting on this object&rsquo;s monitor; they then reacquire it one at a time, and each must re-check its condition in its <code>while</code> loop. It must be called while holding the monitor or it throws <code>IllegalMonitorStateException</code>, and has no effect if nobody is waiting. It is the safe default when threads wait for different conditions on one monitor, at the cost of extra wakeups; for several conditions, a <code>ReentrantLock</code> with separate <code>Condition</code> objects is more efficient.</p>[m
[32m+[m[32m            <p class="api-desc">Wakes every thread waiting on this object&rsquo;s monitor; they then reacquire it one at a time and each must re-check its condition in its <code>while</code> loop. It must be called while holding the monitor or it throws <code>IllegalMonitorStateException</code> and has no effect if nobody is waiting. It is the safe default when threads wait for different conditions on one monitor, at the cost of extra wakeups; for several conditions, a <code>ReentrantLock</code> with separate <code>Condition</code> objects is more efficient.</p>[m
             <div class="code-block"><pre><code>synchronized <span class="code-keyword">void</span> shutdown() {[m
     closed = <span class="code-keyword">true</span>;[m
     notifyAll(); <span class="code-comment">Every waiter wakes and re-checks its condition</span>[m
[36m@@ -1614,7 +1614,7 @@[m [mproducer.start();</code></pre>[m
         </div>[m
     </div>[m
     <div class="intro">[m
[31m-        <p><strong>Always test the waiting condition in a </strong><code>while</code><strong> loop</strong>, not an <code>if</code> statement. Java permits spurious wakeups, and another thread may change the condition before the awakened thread reacquires the monitor.</p>[m
[32m+[m[32m        <p><strong>Always test the waiting condition in a </strong><code>while</code><strong> loop</strong>, not an <code>if</code> statement. Java permits spurious wakeups and another thread may change the condition before the awakened thread reacquires the monitor.</p>[m
         <p>Prefer <code>BlockingQueue</code> for ordinary producer-consumer implementations.</p>[m
         <p class="minor-heading"><strong>4.5 <code>volatile</code> keyword</strong></p>[m
     </div>[m
[36m@@ -1650,12 +1650,12 @@[m [mproducer.start();</code></pre>[m
     </div>[m
     <div class="intro">[m
         <p><code>volatile</code> does not turn compound operations into atomic operations.</p>[m
[31m-        <p>Use <code>volatile</code> for simple state flags, <code>AtomicInteger</code> for independent atomic updates, and locking for coordinated updates to multiple fields.</p>[m
[32m+[m[32m        <p>Use <code>volatile</code> for simple state flags, <code>AtomicInteger</code> for independent atomic updates and locking for coordinated updates to multiple fields.</p>[m
     </div>[m
 [m
     <div class="subheading">5. Explicit locking — <code>java.util.concurrent.locks</code></div>[m
     <div class="intro">[m
[31m-        <p>This package contains the principal explicit-locking framework: <code>Lock</code>, <code>Condition</code>, <code>ReadWriteLock</code>, <code>ReentrantLock</code>, <code>ReentrantReadWriteLock</code>, <code>StampedLock</code>, and low-level synchronizer components.</p>[m
[32m+[m[32m        <p>This package contains the principal explicit-locking framework: <code>Lock</code>, <code>Condition</code>, <code>ReadWriteLock</code>, <code>ReentrantLock</code>, <code>ReentrantReadWriteLock</code>, <code>StampedLock</code> and low-level synchronizer components.</p>[m
         <p class="minor-heading"><strong>5.1 <code>Lock</code> interface API reference</strong></p>[m
     </div>[m
     <div class="method-picker">[m
[36m@@ -1809,7 +1809,7 @@[m [mlock.lock();[m
         </div>[m
         <div class="method-entry" id="g10-1">[m
             <div id="tab-g10-1" class="api-sig"><span class="code-keyword">boolean</span> isHeldByCurrentThread()</div>[m
[31m-            <p class="api-desc">Returns <code>true</code> if the calling thread holds this lock, and never blocks. Unlike <code>isLocked()</code>, the answer is reliable for the caller, which makes it ideal for assertions and guard checks in helper methods that must only run under the lock. It is the <code>ReentrantLock</code> counterpart of <code>Thread.holdsLock(obj)</code> for intrinsic monitors.</p>[m
[32m+[m[32m            <p class="api-desc">Returns <code>true</code> if the calling thread holds this lock and never blocks. Unlike <code>isLocked()</code>, the answer is reliable for the caller, which makes it ideal for assertions and guard checks in helper methods that must only run under the lock. It is the <code>ReentrantLock</code> counterpart of <code>Thread.holdsLock(obj)</code> for intrinsic monitors.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">private</span> <span class="code-keyword">void</span> updateIndex(<span class="code-class">String</span> key) {[m
     <span class="code-keyword">if</span> (!lock.isHeldByCurrentThread()) { <span class="code-comment">Fail fast on a missing lock</span>[m
         <span class="code-keyword">throw</span> <span class="code-keyword">new</span> <span class="code-class">IllegalStateException</span>(<span class="code-string">"Caller must hold the lock"</span>);[m
[36m@@ -1819,7 +1819,7 @@[m [mlock.lock();[m
         </div>[m
         <div class="method-entry" id="g10-2">[m
             <div id="tab-g10-2" class="api-sig"><span class="code-keyword">int</span> getHoldCount()</div>[m
[31m-            <p class="api-desc">Returns how many times the current thread has acquired this lock without releasing it, or <code>0</code> if it does not hold it. It does not block. Because <code>ReentrantLock</code> is reentrant, every <code>lock()</code> must be matched by an <code>unlock()</code>, and the lock is only freed when this count returns to zero. It is mostly used for testing and debugging, for example to assert that a method is not entered with the lock already held.</p>[m
[32m+[m[32m            <p class="api-desc">Returns how many times the current thread has acquired this lock without releasing it, or <code>0</code> if it does not hold it. It does not block. Because <code>ReentrantLock</code> is reentrant, every <code>lock()</code> must be matched by an <code>unlock()</code> and the lock is only freed when this count returns to zero. It is mostly used for testing and debugging, for example to assert that a method is not entered with the lock already held.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> lock = <span class="code-keyword">new</span> <span class="code-class">ReentrantLock</span>();[m
 lock.lock();[m
 lock.lock(); <span class="code-comment">Reentrant: the same thread acquires again</span>[m
[36m@@ -1831,7 +1831,7 @@[m [mlock.unlock();[m
         </div>[m
         <div class="method-entry" id="g10-3">[m
             <div id="tab-g10-3" class="api-sig"><span class="code-keyword">boolean</span> isFair()</div>[m
[31m-            <p class="api-desc">Returns <code>true</code> if the lock was created with <code>new ReentrantLock(true)</code>, meaning waiting threads are granted the lock roughly in arrival order. The default is non-fair, which allows barging and gives much higher throughput. Fair locks prevent starvation but are slower under contention, and the untimed <code>tryLock()</code> ignores fairness. The setting is fixed at construction and cannot be changed later.</p>[m
[32m+[m[32m            <p class="api-desc">Returns <code>true</code> if the lock was created with <code>new ReentrantLock(true)</code>, meaning waiting threads are granted the lock roughly in arrival order. The default is non-fair, which allows barging and gives much higher throughput. Fair locks prevent starvation but are slower under contention and the untimed <code>tryLock()</code> ignores fairness. The setting is fixed at construction and cannot be changed later.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> fairLock = <span class="code-keyword">new</span> <span class="code-class">ReentrantLock</span>(<span class="code-keyword">true</span>); <span class="code-comment">Longest waiter goes first</span>[m
 <span class="code-keyword">var</span> fastLock = <span class="code-keyword">new</span> <span class="code-class">ReentrantLock</span>(); <span class="code-comment">Default: non-fair, higher throughput</span>[m
 <span class="code-class">System</span>.out.println(fairLock.isFair()); <span class="code-comment">true</span>[m
[36m@@ -1852,7 +1852,7 @@[m [mlock.unlock();[m
         </div>[m
         <div class="method-entry" id="g10-5">[m
             <div id="tab-g10-5" class="api-sig"><span class="code-keyword">boolean</span> hasQueuedThread(<span class="code-class">Thread</span> thread)</div>[m
[31m-            <p class="api-desc">Returns <code>true</code> if the given thread may be waiting to acquire this lock, and never blocks. As with the other queue queries, the result is only a snapshot because the thread can cancel or acquire right afterwards. It throws <code>NullPointerException</code> if the thread is <code>null</code>. It is useful in tests and diagnostics to confirm that a worker has actually reached the lock before the test proceeds.</p>[m
[32m+[m[32m            <p class="api-desc">Returns <code>true</code> if the given thread may be waiting to acquire this lock and never blocks. As with the other queue queries, the result is only a snapshot because the thread can cancel or acquire right afterwards. It throws <code>NullPointerException</code> if the thread is <code>null</code>. It is useful in tests and diagnostics to confirm that a worker has actually reached the lock before the test proceeds.</p>[m
             <div class="code-block"><pre><code>lock.lock(); <span class="code-comment">Main thread holds the lock</span>[m
 <span class="code-keyword">var</span> worker = <span class="code-class">Thread</span>.ofPlatform().start(() -&gt; {[m
     lock.lock();[m
[36m@@ -1864,7 +1864,7 @@[m [mlock.unlock(); <span class="code-comment">Lets the worker proceed</span></code><[m
         </div>[m
         <div class="method-entry" id="g10-6">[m
             <div id="tab-g10-6" class="api-sig"><span class="code-keyword">int</span> getQueueLength()</div>[m
[31m-            <p class="api-desc">Returns an estimate of the number of threads waiting to acquire this lock. It does not block, and the value is only approximate because threads join and leave the queue while it is being counted. It is intended for monitoring, such as exporting a contention gauge, not for synchronization decisions. Threads waiting on a <code>Condition</code> are not counted here; see <code>getWaitQueueLength(Condition)</code>.</p>[m
[32m+[m[32m            <p class="api-desc">Returns an estimate of the number of threads waiting to acquire this lock. It does not block and the value is only approximate because threads join and leave the queue while it is being counted. It is intended for monitoring, such as exporting a contention gauge, not for synchronization decisions. Threads waiting on a <code>Condition</code> are not counted here; see <code>getWaitQueueLength(Condition)</code>.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> monitor = <span class="code-class">Executors</span>.newSingleThreadScheduledExecutor();[m
 monitor.scheduleAtFixedRate(() -&gt; {[m
     <span class="code-keyword">int</span> waiting = lock.getQueueLength(); <span class="code-comment">Estimate, not exact</span>[m
[36m@@ -1886,7 +1886,7 @@[m [mmonitor.scheduleAtFixedRate(() -&gt; {[m
         </div>[m
         <div class="method-entry" id="g10-8">[m
             <div id="tab-g10-8" class="api-sig"><span class="code-keyword">int</span> getWaitQueueLength(<span class="code-class">Condition</span> condition)</div>[m
[31m-            <p class="api-desc">Returns an estimate of the number of threads waiting on the given <code>Condition</code> of this lock. The caller must hold the lock, or <code>IllegalMonitorStateException</code> is thrown, and a condition from another lock causes <code>IllegalArgumentException</code>. The value is approximate because timeouts and interrupts may change it while it is computed, so use it for monitoring and debugging, not for synchronization control.</p>[m
[32m+[m[32m            <p class="api-desc">Returns an estimate of the number of threads waiting on the given <code>Condition</code> of this lock. The caller must hold the lock, or <code>IllegalMonitorStateException</code> is thrown and a condition from another lock causes <code>IllegalArgumentException</code>. The value is approximate because timeouts and interrupts may change it while it is computed, so use it for monitoring and debugging, not for synchronization control.</p>[m
             <div class="code-block"><pre><code>lock.lock();[m
 <span class="code-keyword">try</span> {[m
     <span class="code-keyword">int</span> idle = lock.getWaitQueueLength(notEmpty); <span class="code-comment">Consumers waiting</span>[m
[36m@@ -1942,7 +1942,7 @@[m [mmonitor.scheduleAtFixedRate(() -&gt; {[m
         </select>[m
         <div class="method-entry" id="g11-0">[m
             <div id="tab-g11-0" class="api-sig"><span class="code-keyword">void</span> await() <span class="code-keyword">throws</span> <span class="code-class">InterruptedException</span></div>[m
[31m-            <p class="api-desc">Atomically releases the associated lock and suspends the current thread until it is signalled, interrupted, or wakes spuriously, then reacquires the lock before returning. It throws <code>InterruptedException</code> if interrupted, and <code>IllegalMonitorStateException</code> if the lock is not held. Because spurious wakeups are allowed, always call it in a <code>while</code> loop that rechecks the condition, never in a plain <code>if</code>.</p>[m
[32m+[m[32m            <p class="api-desc">Atomically releases the associated lock and suspends the current thread until it is signalled, interrupted, or wakes spuriously, then reacquires the lock before returning. It throws <code>InterruptedException</code> if interrupted and <code>IllegalMonitorStateException</code> if the lock is not held. Because spurious wakeups are allowed, always call it in a <code>while</code> loop that rechecks the condition, never in a plain <code>if</code>.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">public</span> <span class="code-class">T</span> take() <span class="code-keyword">throws</span> <span class="code-class">InterruptedException</span> {[m
     lock.lock();[m
     <span class="code-keyword">try</span> {[m
[36m@@ -1957,7 +1957,7 @@[m [mmonitor.scheduleAtFixedRate(() -&gt; {[m
         </div>[m
         <div class="method-entry" id="g11-1">[m
             <div id="tab-g11-1" class="api-sig"><span class="code-keyword">void</span> awaitUninterruptibly()</div>[m
[31m-            <p class="api-desc">Releases the lock and waits until signalled or a spurious wakeup occurs, but keeps waiting if the thread is interrupted; the interrupt status is still set when the method returns. It throws no <code>InterruptedException</code>. Use it only when the wait must not be abandoned, such as finishing a shutdown handshake, and check the interrupt status afterwards to propagate cancellation. Like <code>await()</code>, call it in a loop that rechecks the condition.</p>[m
[32m+[m[32m            <p class="api-desc">Releases the lock and waits until signalled or a spurious wakeup occurs, but keeps waiting if the thread is interrupted; the interrupt status is still set when the method returns. It throws no <code>InterruptedException</code>. Use it only when the wait must not be abandoned, such as finishing a shutdown handshake and check the interrupt status afterwards to propagate cancellation. Like <code>await()</code>, call it in a loop that rechecks the condition.</p>[m
             <div class="code-block"><pre><code>lock.lock();[m
 <span class="code-keyword">try</span> {[m
     <span class="code-keyword">while</span> (!flushed) {[m
[36m@@ -1987,7 +1987,7 @@[m [mlock.lock();[m
         </div>[m
         <div class="method-entry" id="g11-3">[m
             <div id="tab-g11-3" class="api-sig"><span class="code-keyword">boolean</span> await(<span class="code-keyword">long</span> time, <span class="code-class">TimeUnit</span> unit) <span class="code-keyword">throws</span> <span class="code-class">InterruptedException</span></div>[m
[31m-            <p class="api-desc">Releases the lock and waits until signalled, interrupted, or the given time elapses, then reacquires the lock before returning. It returns <code>false</code> if the waiting time detectably elapsed and <code>true</code> otherwise, and throws <code>InterruptedException</code> if interrupted. It behaves like <code>awaitNanos(unit.toNanos(time)) &gt; 0</code>, but because it does not return the remaining time, prefer <code>awaitNanos()</code> when looping toward a fixed overall deadline.</p>[m
[32m+[m[32m            <p class="api-desc">Releases the lock and waits until signalled, interrupted, or the given time elapses, then reacquires the lock before returning. It returns <code>false</code> if the waiting time detectably elapsed and <code>true</code> otherwise and throws <code>InterruptedException</code> if interrupted. It behaves like <code>awaitNanos(unit.toNanos(time)) &gt; 0</code>, but because it does not return the remaining time, prefer <code>awaitNanos()</code> when looping toward a fixed overall deadline.</p>[m
             <div class="code-block"><pre><code>lock.lock();[m
 <span class="code-keyword">try</span> {[m
     <span class="code-keyword">while</span> (!ready) {[m
[36m@@ -2001,7 +2001,7 @@[m [mlock.lock();[m
         </div>[m
         <div class="method-entry" id="g11-4">[m
             <div id="tab-g11-4" class="api-sig"><span class="code-keyword">boolean</span> awaitUntil(<span class="code-class">Date</span> deadline) <span class="code-keyword">throws</span> <span class="code-class">InterruptedException</span></div>[m
[31m-            <p class="api-desc">Releases the lock and waits until signalled, interrupted, or the absolute <code>Date</code> deadline passes, then reacquires the lock. It returns <code>false</code> if the deadline has passed on return and <code>true</code> otherwise, and throws <code>InterruptedException</code> if interrupted. An absolute deadline is convenient in a loop because spurious wakeups do not extend the total wait. It follows the wall clock, so system clock changes affect it, while <code>awaitNanos()</code> does not.</p>[m
[32m+[m[32m            <p class="api-desc">Releases the lock and waits until signalled, interrupted, or the absolute <code>Date</code> deadline passes, then reacquires the lock. It returns <code>false</code> if the deadline has passed on return and <code>true</code> otherwise and throws <code>InterruptedException</code> if interrupted. An absolute deadline is convenient in a loop because spurious wakeups do not extend the total wait. It follows the wall clock, so system clock changes affect it, while <code>awaitNanos()</code> does not.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> deadline = <span class="code-keyword">new</span> <span class="code-class">Date</span>(<span class="code-class">System</span>.currentTimeMillis() + <span class="code-number">10_000</span>); <span class="code-comment">10 s from now</span>[m
 lock.lock();[m
 <span class="code-keyword">try</span> {[m
[36m@@ -2017,7 +2017,7 @@[m [mlock.lock();[m
         </div>[m
         <div class="method-entry" id="g11-5">[m
             <div id="tab-g11-5" class="api-sig"><span class="code-keyword">void</span> signal()</div>[m
[31m-            <p class="api-desc">Wakes one thread waiting on this condition, if any; the woken thread must still reacquire the lock before returning from <code>await()</code>, so it runs only after the signaller unlocks. It does not block, and the JDK implementation throws <code>IllegalMonitorStateException</code> if the caller does not hold the lock. Use it when any single waiter can handle the change, such as one new queue item, and prefer <code>signalAll()</code> when waiters wait for different predicates.</p>[m
[32m+[m[32m            <p class="api-desc">Wakes one thread waiting on this condition, if any; the woken thread must still reacquire the lock before returning from <code>await()</code>, so it runs only after the signaller unlocks. It does not block and the JDK implementation throws <code>IllegalMonitorStateException</code> if the caller does not hold the lock. Use it when any single waiter can handle the change, such as one new queue item and prefer <code>signalAll()</code> when waiters wait for different predicates.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">public</span> <span class="code-keyword">void</span> put(<span class="code-class">T</span> item) {[m
     lock.lock();[m
     <span class="code-keyword">try</span> {[m
[36m@@ -2137,7 +2137,7 @@[m [mlock.lock();[m
         </div>[m
     </div>[m
     <div class="intro">[m
[31m-        <p>Additional methods include <code>getReadLockCount()</code>, <code>getReadHoldCount()</code>, <code>getWriteHoldCount()</code>, <code>isWriteLocked()</code>, <code>isWriteLockedByCurrentThread()</code>, <code>hasQueuedThreads()</code>, and <code>getQueueLength()</code>.</p>[m
[32m+[m[32m        <p>Additional methods include <code>getReadLockCount()</code>, <code>getReadHoldCount()</code>, <code>getWriteHoldCount()</code>, <code>isWriteLocked()</code>, <code>isWriteLockedByCurrentThread()</code>, <code>hasQueuedThreads()</code> and <code>getQueueLength()</code>.</p>[m
         <p>Lock downgrading (write lock to read lock) is supported with the correct acquisition order. Direct read-to-write lock upgrading is generally unsupported and can deadlock.</p>[m
         <p class="minor-heading"><strong>5.6 <code>StampedLock</code></strong></p>[m
         <p><code>StampedLock</code> supports three access modes.</p>[m
[36m@@ -2198,7 +2198,7 @@[m [mlock.lock();[m
     </div>[m
     <div class="intro">[m
         <p>The optimistic read takes a tentative snapshot and verifies that no conflicting write invalidated it.</p>[m
[31m-        <p><code>StampedLock</code> is <strong>not reentrant</strong>, and optimistic reads require care with mutable object graphs. It should not be treated as a drop-in replacement for <code>ReentrantReadWriteLock</code>.</p>[m
[32m+[m[32m        <p><code>StampedLock</code> is <strong>not reentrant</strong> and optimistic reads require care with mutable object graphs. It should not be treated as a drop-in replacement for <code>ReentrantReadWriteLock</code>.</p>[m
         <p class="minor-heading"><strong>5.7 Lock comparison</strong></p>[m
         <div class="gpt-table-wrap"><table class="gpt-table">[m
             <thead><tr><th>Capability</th><th><code>synchronized</code></th><th><code>ReentrantLock</code></th><th><code>ReadWriteLock</code></th><th><code>StampedLock</code></th></tr></thead>[m
[36m@@ -2229,7 +2229,7 @@[m [mlock.lock();[m
         </select>[m
         <div class="method-entry" id="g14-0">[m
             <div id="tab-g14-0" class="api-sig"><span class="code-keyword">static</span> <span class="code-keyword">void</span> park()</div>[m
[31m-            <p class="api-desc">Disables the current thread for scheduling unless its permit is available, in which case it consumes the permit and returns at once. Otherwise it blocks until another thread calls <code>unpark()</code> on it, the thread is interrupted, or it returns spuriously. It throws nothing and does not clear the interrupt status, so callers must recheck their condition in a loop. It is the low-level primitive behind <code>ReentrantLock</code> and other synchronizers, and application code rarely needs it.</p>[m
[32m+[m[32m            <p class="api-desc">Disables the current thread for scheduling unless its permit is available, in which case it consumes the permit and returns at once. Otherwise it blocks until another thread calls <code>unpark()</code> on it, the thread is interrupted, or it returns spuriously. It throws nothing and does not clear the interrupt status, so callers must recheck their condition in a loop. It is the low-level primitive behind <code>ReentrantLock</code> and other synchronizers and application code rarely needs it.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> ready = <span class="code-keyword">new</span> <span class="code-class">AtomicBoolean</span>(<span class="code-keyword">false</span>);[m
 <span class="code-keyword">var</span> waiter = <span class="code-class">Thread</span>.ofPlatform().start(() -&gt; {[m
     <span class="code-keyword">while</span> (!ready.get()) {[m
[36m@@ -2243,7 +2243,7 @@[m [mready.set(<span class="code-keyword">true</span>);[m
         </div>[m
         <div class="method-entry" id="g14-1">[m
             <div id="tab-g14-1" class="api-sig"><span class="code-keyword">static</span> <span class="code-keyword">void</span> park(<span class="code-class">Object</span> blocker)</div>[m
[31m-            <p class="api-desc">Behaves exactly like <code>park()</code> but records the given blocker object for the duration of the wait, so thread dumps, <code>jstack</code> and <code>LockSupport.getBlocker()</code> show what the thread is parked on. It blocks until unparked, interrupted or a spurious wakeup, and throws nothing. Prefer this form over the no-argument version in any custom synchronizer, with <code>this</code> as the conventional blocker. The blocker is cleared when the method returns.</p>[m
[32m+[m[32m            <p class="api-desc">Behaves exactly like <code>park()</code> but records the given blocker object for the duration of the wait, so thread dumps, <code>jstack</code> and <code>LockSupport.getBlocker()</code> show what the thread is parked on. It blocks until unparked, interrupted or a spurious wakeup and throws nothing. Prefer this form over the no-argument version in any custom synchronizer, with <code>this</code> as the conventional blocker. The blocker is cleared when the method returns.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">public</span> <span class="code-keyword">class</span> <span class="code-class">SimpleLatch</span> {[m
     <span class="code-keyword">private</span> volatile <span class="code-keyword">boolean</span> open;[m
     <span class="code-keyword">private</span> volatile <span class="code-class">Thread</span> waiter;[m
[36m@@ -2268,7 +2268,7 @@[m [mready.set(<span class="code-keyword">true</span>);[m
         </div>[m
         <div class="method-entry" id="g14-3">[m
             <div id="tab-g14-3" class="api-sig"><span class="code-keyword">static</span> <span class="code-keyword">void</span> parkNanos(<span class="code-class">Object</span> blocker, <span class="code-keyword">long</span> nanos)</div>[m
[31m-            <p class="api-desc">Same as <code>parkNanos(long)</code> but records a blocker object while parked, so thread dumps and monitoring tools can show what the thread is waiting for. It returns after the timeout, on <code>unpark()</code>, on interrupt, or spuriously, and throws nothing. This is the form JDK synchronizers use for timed waits such as <code>tryLock(long, TimeUnit)</code>, so prefer it over the blocker-less version in your own code.</p>[m
[32m+[m[32m            <p class="api-desc">Same as <code>parkNanos(long)</code> but records a blocker object while parked, so thread dumps and monitoring tools can show what the thread is waiting for. It returns after the timeout, on <code>unpark()</code>, on interrupt, or spuriously and throws nothing. This is the form JDK synchronizers use for timed waits such as <code>tryLock(long, TimeUnit)</code>, so prefer it over the blocker-less version in your own code.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">public</span> <span class="code-keyword">boolean</span> awaitOpen(<span class="code-keyword">long</span> timeout, <span class="code-class">TimeUnit</span> unit) {[m
     <span class="code-keyword">long</span> deadline = <span class="code-class">System</span>.nanoTime() + unit.toNanos(timeout);[m
     <span class="code-keyword">while</span> (!open) {[m
[36m@@ -2290,7 +2290,7 @@[m [mready.set(<span class="code-keyword">true</span>);[m
         </div>[m
         <div class="method-entry" id="g14-5">[m
             <div id="tab-g14-5" class="api-sig"><span class="code-keyword">static</span> <span class="code-keyword">void</span> parkUntil(<span class="code-class">Object</span> blocker, <span class="code-keyword">long</span> deadline)</div>[m
[31m-            <p class="api-desc">Same as <code>parkUntil(long)</code> but records a blocker object while parked, which appears in thread dumps and is returned by <code>LockSupport.getBlocker()</code>. It blocks until the absolute epoch-millisecond deadline, an <code>unpark()</code>, an interrupt or a spurious return, and throws nothing. Use it in custom synchronizers that wait for a wall-clock deadline, such as a scheduled release time, and recheck the condition after every return.</p>[m
[32m+[m[32m            <p class="api-desc">Same as <code>parkUntil(long)</code> but records a blocker object while parked, which appears in thread dumps and is returned by <code>LockSupport.getBlocker()</code>. It blocks until the absolute epoch-millisecond deadline, an <code>unpark()</code>, an interrupt or a spurious return and throws nothing. Use it in custom synchronizers that wait for a wall-clock deadline, such as a scheduled release time and recheck the condition after every return.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">public</span> <span class="code-keyword">void</span> awaitRelease(<span class="code-keyword">long</span> releaseAtMillis) {[m
     <span class="code-keyword">while</span> (!released &amp;&amp; <span class="code-class">System</span>.currentTimeMillis() &lt; releaseAtMillis) {[m
         <span class="code-class">LockSupport</span>.parkUntil(<span class="code-keyword">this</span>, releaseAtMillis); <span class="code-comment">Blocker is this</span>[m
[36m@@ -2300,7 +2300,7 @@[m [mready.set(<span class="code-keyword">true</span>);[m
         </div>[m
         <div class="method-entry" id="g14-6">[m
             <div id="tab-g14-6" class="api-sig"><span class="code-keyword">static</span> <span class="code-keyword">void</span> unpark(<span class="code-class">Thread</span> thread)</div>[m
[31m-            <p class="api-desc">Makes the permit of the given thread available: if the thread is parked it unblocks, otherwise its next <code>park()</code> returns immediately. Permits do not accumulate, so several <code>unpark()</code> calls before one <code>park()</code> still grant only one. It never blocks, ignores a <code>null</code> thread, and is not guaranteed to have any effect on a thread that has not started. Unlike <code>notify()</code>, it needs no lock and can be called before the target parks without losing the wakeup.</p>[m
[32m+[m[32m            <p class="api-desc">Makes the permit of the given thread available: if the thread is parked it unblocks, otherwise its next <code>park()</code> returns immediately. Permits do not accumulate, so several <code>unpark()</code> calls before one <code>park()</code> still grant only one. It never blocks, ignores a <code>null</code> thread and is not guaranteed to have any effect on a thread that has not started. Unlike <code>notify()</code>, it needs no lock and can be called before the target parks without losing the wakeup.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> worker = <span class="code-class">Thread</span>.ofPlatform().start(() -&gt; {[m
     <span class="code-class">LockSupport</span>.park(); <span class="code-comment">Returns at once if the permit was given early</span>[m
     <span class="code-class">System</span>.out.println(<span class="code-string">"Worker woke up"</span>);[m
[36m@@ -2310,7 +2310,7 @@[m [mready.set(<span class="code-keyword">true</span>);[m
         </div>[m
         <div class="method-entry" id="g14-7">[m
             <div id="tab-g14-7" class="api-sig"><span class="code-keyword">static</span> <span class="code-class">Object</span> getBlocker(<span class="code-class">Thread</span> t)</div>[m
[31m-            <p class="api-desc">Returns the blocker object passed to the most recent <code>park(Object)</code> style call of a thread that has not yet unblocked, or <code>null</code> if it is not parked with a blocker. It never blocks, and throws <code>NullPointerException</code> if the thread is <code>null</code>. The value is a snapshot that may be stale at once, so use it only for monitoring and diagnostics, for example to report which synchronizer a stuck worker is waiting on.</p>[m
[32m+[m[32m            <p class="api-desc">Returns the blocker object passed to the most recent <code>park(Object)</code> style call of a thread that has not yet unblocked, or <code>null</code> if it is not parked with a blocker. It never blocks and throws <code>NullPointerException</code> if the thread is <code>null</code>. The value is a snapshot that may be stale at once, so use it only for monitoring and diagnostics, for example to report which synchronizer a stuck worker is waiting on.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> lock = <span class="code-keyword">new</span> <span class="code-class">ReentrantLock</span>();[m
 lock.lock();[m
 <span class="code-keyword">var</span> worker = <span class="code-class">Thread</span>.ofPlatform().start(lock::lock); <span class="code-comment">Blocks on the lock</span>[m
[36m@@ -2338,7 +2338,7 @@[m [mlock.lock();[m
         </div>[m
     </div>[m
     <div class="intro">[m
[31m-        <p>An <code>unpark()</code> before <code>park()</code> can supply a permit for a subsequent park. At most one permit is retained, and <code>park()</code> can also return spuriously or because of interruption. Real synchronizers must check an independently maintained condition.</p>[m
[32m+[m[32m        <p>An <code>unpark()</code> before <code>park()</code> can supply a permit for a subsequent park. At most one permit is retained and <code>park()</code> can also return spuriously or because of interruption. Real synchronizers must check an independently maintained condition.</p>[m
     </div>[m
 [m
     <div class="subheading">6. Synchronizers — <code>java.util.concurrent</code></div>[m
[36m@@ -2346,7 +2346,7 @@[m [mlock.lock();[m
         <p>Synchronizers coordinate multiple threads without requiring you to implement low-level monitor logic.</p>[m
         <p class="minor-heading"><strong>6.1 <code>Semaphore</code></strong></p>[m
         <p>A semaphore controls concurrent access using a number of permits.</p>[m
[31m-        <p>Typical applications include connection limits, concurrent API-call limits, and limited-resource pools.</p>[m
[32m+[m[32m        <p>Typical applications include connection limits, concurrent API-call limits and limited-resource pools.</p>[m
     </div>[m
     <div class="method-picker">[m
         <select aria-label="Semaphore class in java.util.concurrent" hidden>[m
[36m@@ -2365,7 +2365,7 @@[m [mlock.lock();[m
         </select>[m
         <div class="method-entry" id="g15-0">[m
             <div id="tab-g15-0" class="api-sig"><span class="code-keyword">void</span> acquire() <span class="code-keyword">throws</span> <span class="code-class">InterruptedException</span></div>[m
[31m-            <p class="api-desc">Takes one permit, blocking until one is available, and reduces the available count by one. It throws <code>InterruptedException</code> if the thread is interrupted before or while waiting, in which case no permit is taken. Use it to cap concurrent access to a resource, such as at most three simultaneous remote calls. Permits are not tied to threads, so always pair it with <code>release()</code> in a <code>finally</code> block entered only after a successful acquire.</p>[m
[32m+[m[32m            <p class="api-desc">Takes one permit, blocking until one is available and reduces the available count by one. It throws <code>InterruptedException</code> if the thread is interrupted before or while waiting, in which case no permit is taken. Use it to cap concurrent access to a resource, such as at most three simultaneous remote calls. Permits are not tied to threads, so always pair it with <code>release()</code> in a <code>finally</code> block entered only after a successful acquire.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">public</span> <span class="code-keyword">class</span> <span class="code-class">RateLimitedClient</span> {[m
     <span class="code-keyword">private</span> <span class="code-class">Semaphore</span> <span class="code-keyword">permits</span> = <span class="code-keyword">new</span> <span class="code-class">Semaphore</span>(<span class="code-number">3</span>); <span class="code-comment">At most 3 calls at once</span>[m
 [m
[36m@@ -2381,7 +2381,7 @@[m [mlock.lock();[m
         </div>[m
         <div class="method-entry" id="g15-1">[m
             <div id="tab-g15-1" class="api-sig"><span class="code-keyword">void</span> acquire(<span class="code-keyword">int</span> <span class="code-keyword">permits</span>) <span class="code-keyword">throws</span> <span class="code-class">InterruptedException</span></div>[m
[31m-            <p class="api-desc">Takes the given number of permits atomically, blocking until that many are available at once, so a large request is never half-filled. It throws <code>InterruptedException</code> if interrupted while waiting, and <code>IllegalArgumentException</code> if the number is negative. Use it to weight work by cost, such as megabytes of buffer space. Pitfall: on a non-fair semaphore a large request can starve while small ones keep succeeding, and it must be released with the same count.</p>[m
[32m+[m[32m            <p class="api-desc">Takes the given number of permits atomically, blocking until that many are available at once, so a large request is never half-filled. It throws <code>InterruptedException</code> if interrupted while waiting and <code>IllegalArgumentException</code> if the number is negative. Use it to weight work by cost, such as megabytes of buffer space. Pitfall: on a non-fair semaphore a large request can starve while small ones keep succeeding and it must be released with the same count.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> memoryBudget = <span class="code-keyword">new</span> <span class="code-class">Semaphore</span>(<span class="code-number">64</span>); <span class="code-comment">64 MB of buffer space</span>[m
 <span class="code-keyword">int</span> needed = sizeInMb(file);[m
 memoryBudget.acquire(needed); <span class="code-comment">Waits until all are free together</span>[m
[36m@@ -2393,7 +2393,7 @@[m [mmemoryBudget.acquire(needed); <span class="code-comment">Waits until all are fre[m
         </div>[m
         <div class="method-entry" id="g15-2">[m
             <div id="tab-g15-2" class="api-sig"><span class="code-keyword">void</span> acquireUninterruptibly()</div>[m
[31m-            <p class="api-desc">Takes one permit, blocking until one is available, and keeps waiting even if the thread is interrupted; the interrupt status remains set after it returns. It throws no checked exception. Use it only where giving up is not an option, such as cleanup paths that must eventually proceed. Pitfall: a thread blocked here cannot be cancelled, so if permits are never released it hangs forever; <code>acquire()</code> or a timed <code>tryAcquire()</code> is usually safer.</p>[m
[32m+[m[32m            <p class="api-desc">Takes one permit, blocking until one is available and keeps waiting even if the thread is interrupted; the interrupt status remains set after it returns. It throws no checked exception. Use it only where giving up is not an option, such as cleanup paths that must eventually proceed. Pitfall: a thread blocked here cannot be cancelled, so if permits are never released it hangs forever; <code>acquire()</code> or a timed <code>tryAcquire()</code> is usually safer.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">permits</span>.acquireUninterruptibly(); <span class="code-comment">Not cancellable by interrupt</span>[m
 <span class="code-keyword">try</span> {[m
     flushPendingWrites();[m
[36m@@ -2419,7 +2419,7 @@[m [mmemoryBudget.acquire(needed); <span class="code-comment">Waits until all are fre[m
         </div>[m
         <div class="method-entry" id="g15-4">[m
             <div id="tab-g15-4" class="api-sig"><span class="code-keyword">boolean</span> tryAcquire(<span class="code-keyword">long</span> timeout, <span class="code-class">TimeUnit</span> unit) <span class="code-keyword">throws</span> <span class="code-class">InterruptedException</span></div>[m
[31m-            <p class="api-desc">Waits up to the given time for a permit and returns <code>true</code> if one was taken or <code>false</code> if the timeout elapsed. It throws <code>InterruptedException</code> if interrupted while waiting. Use it to bound how long callers queue for a scarce resource, such as a pooled connection, and fail with a clear error instead of hanging. Unlike <code>tryAcquire()</code>, it respects the fairness setting, and <code>tryAcquire(int, long, TimeUnit)</code> takes several permits.</p>[m
[32m+[m[32m            <p class="api-desc">Waits up to the given time for a permit and returns <code>true</code> if one was taken or <code>false</code> if the timeout elapsed. It throws <code>InterruptedException</code> if interrupted while waiting. Use it to bound how long callers queue for a scarce resource, such as a pooled connection and fail with a clear error instead of hanging. Unlike <code>tryAcquire()</code>, it respects the fairness setting and <code>tryAcquire(int, long, TimeUnit)</code> takes several permits.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">if</span> (!<span class="code-keyword">permits</span>.tryAcquire(<span class="code-number">200</span>, <span class="code-class">TimeUnit</span>.MILLISECONDS)) { <span class="code-comment">Waits up to 200 ms</span>[m
     <span class="code-keyword">throw</span> <span class="code-keyword">new</span> <span class="code-class">IllegalStateException</span>(<span class="code-string">"No connection free after 200 ms"</span>);[m
 }[m
[36m@@ -2431,7 +2431,7 @@[m [mmemoryBudget.acquire(needed); <span class="code-comment">Waits until all are fre[m
         </div>[m
         <div class="method-entry" id="g15-5">[m
             <div id="tab-g15-5" class="api-sig"><span class="code-keyword">void</span> release()</div>[m
[31m-            <p class="api-desc">Returns one permit to the semaphore, increasing the available count and waking a waiting thread if one can now proceed. It never blocks. Permits are not owned, so any thread may release, even one that never acquired, and a stray extra <code>release()</code> silently raises the limit above its initial value. A semaphore created with zero permits can therefore act as a one-way signal from a producer to a waiting consumer.</p>[m
[32m+[m[32m            <p class="api-desc">Returns one permit to the semaphore, increasing the available count and waking a waiting thread if one can now proceed. It never blocks. Permits are not owned, so any thread may release, even one that never acquired and a stray extra <code>release()</code> silently raises the limit above its initial value. A semaphore created with zero permits can therefore act as a one-way signal from a producer to a waiting consumer.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> dataReady = <span class="code-keyword">new</span> <span class="code-class">Semaphore</span>(<span class="code-number">0</span>); <span class="code-comment">Starts with no permits</span>[m
 <span class="code-class">Thread</span>.ofPlatform().start(() -&gt; {[m
     loadData();[m
[36m@@ -2442,7 +2442,7 @@[m [mdataReady.acquire(); <span class="code-comment">Blocks until the loader releases[m
         </div>[m
         <div class="method-entry" id="g15-6">[m
             <div id="tab-g15-6" class="api-sig"><span class="code-keyword">void</span> release(<span class="code-keyword">int</span> <span class="code-keyword">permits</span>)</div>[m
[31m-            <p class="api-desc">Returns the given number of permits at once, increasing the available count and waking as many waiting threads as can now proceed. It never blocks, and throws <code>IllegalArgumentException</code> if the number is negative. Release the same count that was taken with <code>acquire(int)</code>. It can also start a batch, for example a coordinator releasing N permits so that N waiting workers start together.</p>[m
[32m+[m[32m            <p class="api-desc">Returns the given number of permits at once, increasing the available count and waking as many waiting threads as can now proceed. It never blocks and throws <code>IllegalArgumentException</code> if the number is negative. Release the same count that was taken with <code>acquire(int)</code>. It can also start a batch, for example a coordinator releasing N permits so that N waiting workers start together.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">int</span> batch = <span class="code-number">4</span>;[m
 <span class="code-keyword">var</span> gate = <span class="code-keyword">new</span> <span class="code-class">Semaphore</span>(<span class="code-number">0</span>);[m
 <span class="code-keyword">for</span> (<span class="code-keyword">int</span> i = <span class="code-number">0</span>; i &lt; batch; i++) {[m
[36m@@ -2464,7 +2464,7 @@[m [mpool.release(<span class="code-number">3</span>);[m
         </div>[m
         <div class="method-entry" id="g15-8">[m
             <div id="tab-g15-8" class="api-sig"><span class="code-keyword">int</span> drainPermits()</div>[m
[31m-            <p class="api-desc">Atomically takes all permits that are immediately available, returns how many were taken, and leaves zero available; it never blocks. If the count was negative it is raised to zero and the negative amount is returned. Use it to pause a resource, such as stopping new work during maintenance, then restore the permits later with <code>release(int)</code>. Threads already waiting are not woken or failed; they keep waiting.</p>[m
[32m+[m[32m            <p class="api-desc">Atomically takes all permits that are immediately available, returns how many were taken and leaves zero available; it never blocks. If the count was negative it is raised to zero and the negative amount is returned. Use it to pause a resource, such as stopping new work during maintenance, then restore the permits later with <code>release(int)</code>. Threads already waiting are not woken or failed; they keep waiting.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">int</span> taken = <span class="code-keyword">permits</span>.drainPermits(); <span class="code-comment">Block new work, returns e.g. 5</span>[m
 <span class="code-keyword">try</span> {[m
     runMaintenance();[m
[36m@@ -2484,7 +2484,7 @@[m [mmonitor.scheduleAtFixedRate(() -&gt; {[m
         </div>[m
         <div class="method-entry" id="g15-10">[m
             <div id="tab-g15-10" class="api-sig"><span class="code-keyword">int</span> getQueueLength()</div>[m
[31m-            <p class="api-desc">Returns an estimate of the number of threads waiting to acquire permits. It does not block, and the value is approximate because threads enter and leave the queue while it is counted. Use it for metrics, such as a gauge of how many callers are throttled, not for synchronization decisions. Threads calling the untimed <code>tryAcquire()</code> never queue, so they are not counted.</p>[m
[32m+[m[32m            <p class="api-desc">Returns an estimate of the number of threads waiting to acquire permits. It does not block and the value is approximate because threads enter and leave the queue while it is counted. Use it for metrics, such as a gauge of how many callers are throttled, not for synchronization decisions. Threads calling the untimed <code>tryAcquire()</code> never queue, so they are not counted.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> <span class="code-keyword">permits</span> = <span class="code-keyword">new</span> <span class="code-class">Semaphore</span>(<span class="code-number">2</span>);[m
 <span class="code-keyword">for</span> (<span class="code-keyword">int</span> i = <span class="code-number">0</span>; i &lt; <span class="code-number">5</span>; i++) {[m
     <span class="code-class">Thread</span>.startVirtualThread(<span class="code-keyword">permits</span>::acquireUninterruptibly); <span class="code-comment">Never freed</span>[m
[36m@@ -2538,7 +2538,7 @@[m [mmonitor.scheduleAtFixedRate(() -&gt; {[m
         </select>[m
         <div class="method-entry" id="g16-0">[m
             <div id="tab-g16-0" class="api-sig"><span class="code-class">CountDownLatch</span>(<span class="code-keyword">int</span> count)</div>[m
[31m-            <p class="api-desc">Creates a latch that opens once <code>countDown()</code> has been called the given number of times, after which every <code>await()</code> returns immediately. It throws <code>IllegalArgumentException</code> if the count is negative, and a count of zero creates an already open latch. Use it for one-shot coordination, such as waiting until N services have started. The count cannot be reset or increased, so use <code>CyclicBarrier</code> or <code>Phaser</code> for repeated rounds.</p>[m
[32m+[m[32m            <p class="api-desc">Creates a latch that opens once <code>countDown()</code> has been called the given number of times, after which every <code>await()</code> returns immediately. It throws <code>IllegalArgumentException</code> if the count is negative and a count of zero creates an already open latch. Use it for one-shot coordination, such as waiting until N services have started. The count cannot be reset or increased, so use <code>CyclicBarrier</code> or <code>Phaser</code> for repeated rounds.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> ready = <span class="code-keyword">new</span> <span class="code-class">CountDownLatch</span>(<span class="code-number">3</span>); <span class="code-comment">Opens after three countDown() calls</span>[m
 <span class="code-keyword">for</span> (<span class="code-class">String</span> name : <span class="code-class">List</span>.of(<span class="code-string">"db"</span>, <span class="code-string">"cache"</span>, <span class="code-string">"queue"</span>)) {[m
     <span class="code-class">Thread</span>.ofPlatform().start(() -&gt; {[m
[36m@@ -2550,7 +2550,7 @@[m [mready.await(); <span class="code-comment">Main thread waits for all three</span>[m
         </div>[m
         <div class="method-entry" id="g16-1">[m
             <div id="tab-g16-1" class="api-sig"><span class="code-keyword">void</span> countDown()</div>[m
[31m-            <p class="api-desc">Decrements the count by one and, when it reaches zero, releases all threads waiting in <code>await()</code>. It never blocks, never throws, and does nothing if the count is already zero. Call it in a <code>finally</code> block so a failing task still counts down, otherwise the waiting thread hangs forever. Any thread can call it, and a single thread may call it several times.</p>[m
[32m+[m[32m            <p class="api-desc">Decrements the count by one and, when it reaches zero, releases all threads waiting in <code>await()</code>. It never blocks, never throws and does nothing if the count is already zero. Call it in a <code>finally</code> block so a failing task still counts down, otherwise the waiting thread hangs forever. Any thread can call it and a single thread may call it several times.</p>[m
             <div class="code-block"><pre><code>executor.submit(() -&gt; {[m
     <span class="code-keyword">try</span> {[m
         loadConfiguration();[m
[36m@@ -2563,7 +2563,7 @@[m [mready.await(); <span class="code-comment">Main thread waits for all three</span>[m
         </div>[m
         <div class="method-entry" id="g16-2">[m
             <div id="tab-g16-2" class="api-sig"><span class="code-keyword">void</span> await() <span class="code-keyword">throws</span> <span class="code-class">InterruptedException</span></div>[m
[31m-            <p class="api-desc">Blocks the current thread until the count reaches zero, and returns immediately if it already is zero. It throws <code>InterruptedException</code> if the thread is interrupted while waiting. Any number of threads can wait on the same latch, and all are released together. Pitfall: if some task never counts down, for example because it threw before reaching <code>countDown()</code>, this waits forever, so prefer <code>await(long, TimeUnit)</code> in production code.</p>[m
[32m+[m[32m            <p class="api-desc">Blocks the current thread until the count reaches zero and returns immediately if it already is zero. It throws <code>InterruptedException</code> if the thread is interrupted while waiting. Any number of threads can wait on the same latch and all are released together. Pitfall: if some task never counts down, for example because it threw before reaching <code>countDown()</code>, this waits forever, so prefer <code>await(long, TimeUnit)</code> in production code.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> done = <span class="code-keyword">new</span> <span class="code-class">CountDownLatch</span>(tasks.size());[m
 <span class="code-keyword">for</span> (<span class="code-class">Runnable</span> task : tasks) {[m
     executor.submit(() -&gt; {[m
[36m@@ -2586,7 +2586,7 @@[m [mservices.forEach(s -&gt; executor.submit(() -&gt; {[m
         </div>[m
         <div class="method-entry" id="g16-4">[m
             <div id="tab-g16-4" class="api-sig"><span class="code-keyword">long</span> getCount()</div>[m
[31m-            <p class="api-desc">Returns the current count, without blocking or changing it. The value is a snapshot that may decrease right after it is read, so use it for progress reporting, logging and testing, not for coordination; use <code>await()</code> to wait for zero. Once the latch is open it always returns zero, and it never goes back up.</p>[m
[32m+[m[32m            <p class="api-desc">Returns the current count, without blocking or changing it. The value is a snapshot that may decrease right after it is read, so use it for progress reporting, logging and testing, not for coordination; use <code>await()</code> to wait for zero. Once the latch is open it always returns zero and it never goes back up.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> pending = <span class="code-keyword">new</span> <span class="code-class">CountDownLatch</span>(files.size());[m
 files.forEach(f -&gt; executor.submit(() -&gt; {[m
     <span class="code-keyword">try</span> { upload(f); } <span class="code-keyword">finally</span> { pending.countDown(); }[m
[36m@@ -2634,7 +2634,7 @@[m [mfiles.forEach(f -&gt; executor.submit(() -&gt; {[m
         </select>[m
         <div class="method-entry" id="g17-0">[m
             <div id="tab-g17-0" class="api-sig"><span class="code-keyword">int</span> await() <span class="code-keyword">throws</span> <span class="code-class">InterruptedException</span>, <span class="code-class">BrokenBarrierException</span></div>[m
[31m-            <p class="api-desc">Waits until all parties have called <code>await()</code> on this barrier and returns the arrival index of the current thread, where <code>getParties() - 1</code> means first to arrive and <code>0</code> means last. The last thread to arrive runs the optional barrier action before everyone is released, and the barrier then resets for the next round. It throws <code>InterruptedException</code> if interrupted and <code>BrokenBarrierException</code> if another party was interrupted or timed out, or the barrier was reset.</p>[m
[32m+[m[32m            <p class="api-desc">Waits until all parties have called <code>await()</code> on this barrier and returns the arrival index of the current thread, where <code>getParties() - 1</code> means first to arrive and <code>0</code> means last. The last thread to arrive runs the optional barrier action before everyone is released and the barrier then resets for the next round. It throws <code>InterruptedException</code> if interrupted and <code>BrokenBarrierException</code> if another party was interrupted or timed out, or the barrier was reset.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> barrier = <span class="code-keyword">new</span> <span class="code-class">CyclicBarrier</span>(<span class="code-number">3</span>, () -&gt; <span class="code-class">System</span>.out.println(<span class="code-string">"Step done"</span>));[m
 <span class="code-class">Runnable</span> worker = () -&gt; {[m
     <span class="code-keyword">try</span> {[m
[36m@@ -2676,7 +2676,7 @@[m [mcoordinator.scheduleAtFixedRate(() -&gt; {[m
         </div>[m
         <div class="method-entry" id="g17-3">[m
             <div id="tab-g17-3" class="api-sig"><span class="code-keyword">int</span> getNumberWaiting()</div>[m
[31m-            <p class="api-desc">Returns the number of parties currently blocked in <code>await()</code> on this barrier, without blocking. The value is a snapshot that changes as parties arrive or are released, and it drops back to zero when a round completes. It is mainly useful for debugging and progress logging, for example to see how many workers have reached a checkpoint while one straggler is still running.</p>[m
[32m+[m[32m            <p class="api-desc">Returns the number of parties currently blocked in <code>await()</code> on this barrier, without blocking. The value is a snapshot that changes as parties arrive or are released and it drops back to zero when a round completes. It is mainly useful for debugging and progress logging, for example to see how many workers have reached a checkpoint while one straggler is still running.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> barrier = <span class="code-keyword">new</span> <span class="code-class">CyclicBarrier</span>(<span class="code-number">3</span>);[m
 <span class="code-class">Thread</span>.startVirtualThread(() -&gt; awaitQuietly(barrier));[m
 <span class="code-class">Thread</span>.startVirtualThread(() -&gt; awaitQuietly(barrier));[m
[36m@@ -2685,7 +2685,7 @@[m [mcoordinator.scheduleAtFixedRate(() -&gt; {[m
         </div>[m
         <div class="method-entry" id="g17-4">[m
             <div id="tab-g17-4" class="api-sig"><span class="code-keyword">int</span> getParties()</div>[m
[31m-            <p class="api-desc">Returns the number of parties required to trip the barrier, as passed to the constructor. It never blocks, and the value never changes for the life of the barrier. Combine it with <code>getNumberWaiting()</code> to report progress, or use it to start exactly one worker per party so the thread count always matches the barrier.</p>[m
[32m+[m[32m            <p class="api-desc">Returns the number of parties required to trip the barrier, as passed to the constructor. It never blocks and the value never changes for the life of the barrier. Combine it with <code>getNumberWaiting()</code> to report progress, or use it to start exactly one worker per party so the thread count always matches the barrier.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> barrier = <span class="code-keyword">new</span> <span class="code-class">CyclicBarrier</span>(<span class="code-number">3</span>, () -&gt; <span class="code-class">System</span>.out.println(<span class="code-string">"Merged"</span>));[m
 <span class="code-class">System</span>.out.println(barrier.getParties()); <span class="code-comment">3</span>[m
 <span class="code-keyword">for</span> (<span class="code-keyword">int</span> i = <span class="code-number">0</span>; i &lt; barrier.getParties(); i++) { <span class="code-comment">One worker per party</span>[m
[36m@@ -2763,7 +2763,7 @@[m [mphaser.arriveAndAwaitAdvance(); <span class="code-comment">Main waits for all th[m
         </div>[m
         <div class="method-entry" id="g18-1">[m
             <div id="tab-g18-1" class="api-sig"><span class="code-keyword">int</span> bulkRegister(<span class="code-keyword">int</span> parties)</div>[m
[31m-            <p class="api-desc">Adds the given number of unarrived parties in one atomic step and returns the arrival phase number, or a negative value if the phaser has terminated. It is cheaper and less racy than calling <code>register()</code> in a loop, and like it may wait while an <code>onAdvance()</code> is in progress. Calling <code>bulkRegister(0)</code> simply returns the current phase. Throws <code>IllegalArgumentException</code> for a negative count and <code>IllegalStateException</code> if the 65535-party limit would be exceeded.</p>[m
[32m+[m[32m            <p class="api-desc">Adds the given number of unarrived parties in one atomic step and returns the arrival phase number, or a negative value if the phaser has terminated. It is cheaper and less racy than calling <code>register()</code> in a loop and like it may wait while an <code>onAdvance()</code> is in progress. Calling <code>bulkRegister(0)</code> simply returns the current phase. Throws <code>IllegalArgumentException</code> for a negative count and <code>IllegalStateException</code> if the 65535-party limit would be exceeded.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">int</span> workers = <span class="code-number">5</span>;[m
 <span class="code-class">Phaser</span> phaser = <span class="code-keyword">new</span> <span class="code-class">Phaser</span>(<span class="code-number">1</span>); <span class="code-comment">Main thread</span>[m
 phaser.bulkRegister(workers); <span class="code-comment">Five more parties in one call</span>[m
[36m@@ -2779,7 +2779,7 @@[m [mphaser.arriveAndAwaitAdvance(); <span class="code-comment">Returns once all five[m
         </div>[m
         <div class="method-entry" id="g18-2">[m
             <div id="tab-g18-2" class="api-sig"><span class="code-keyword">int</span> arrive()</div>[m
[31m-            <p class="api-desc">Records that the calling party has reached the current phase and returns immediately with the arrival phase number, without waiting for the other parties. If it is the last arrival, the phaser advances and runs <code>onAdvance()</code> in the calling thread. Use it for producers or coordinators that signal progress but do not need to wait. Pitfall: arriving when no parties are unarrived throws <code>IllegalStateException</code>, and a negative return value means the phaser has terminated.</p>[m
[32m+[m[32m            <p class="api-desc">Records that the calling party has reached the current phase and returns immediately with the arrival phase number, without waiting for the other parties. If it is the last arrival, the phaser advances and runs <code>onAdvance()</code> in the calling thread. Use it for producers or coordinators that signal progress but do not need to wait. Pitfall: arriving when no parties are unarrived throws <code>IllegalStateException</code> and a negative return value means the phaser has terminated.</p>[m
             <div class="code-block"><pre><code><span class="code-class">Phaser</span> phaser = <span class="code-keyword">new</span> <span class="code-class">Phaser</span>(<span class="code-number">2</span>); <span class="code-comment">A producer and a consumer</span>[m
 <span class="code-class">Thread</span>.ofPlatform().start(() -&gt; {[m
     <span class="code-class">System</span>.out.println(<span class="code-string">"Batch written"</span>);[m
[36m@@ -2820,7 +2820,7 @@[m [mphaser.arriveAndDeregister(); <span class="code-comment">Main leaves too: zero p[m
         </div>[m
         <div class="method-entry" id="g18-5">[m
             <div id="tab-g18-5" class="api-sig"><span class="code-keyword">int</span> awaitAdvance(<span class="code-keyword">int</span> phase)</div>[m
[31m-            <p class="api-desc">Blocks until the phaser moves past the given phase number and then returns the next phase; it returns immediately if the current phase already differs from the argument or the phaser has terminated. It is usually paired with <code>arrive()</code> so a party can do other work between arriving and waiting, and the caller does not even need to be registered. The wait cannot be interrupted. Pitfall: a stale phase number returns at once, so always pass the value that <code>arrive()</code> returned.</p>[m
[32m+[m[32m            <p class="api-desc">Blocks until the phaser moves past the given phase number and then returns the next phase; it returns immediately if the current phase already differs from the argument or the phaser has terminated. It is usually paired with <code>arrive()</code> so a party can do other work between arriving and waiting and the caller does not even need to be registered. The wait cannot be interrupted. Pitfall: a stale phase number returns at once, so always pass the value that <code>arrive()</code> returned.</p>[m
             <div class="code-block"><pre><code><span class="code-class">Phaser</span> phaser = <span class="code-keyword">new</span> <span class="code-class">Phaser</span>(<span class="code-number">2</span>);[m
 <span class="code-class">Thread</span>.ofPlatform().start(() -&gt; {[m
     <span class="code-class">System</span>.out.println(<span class="code-string">"Loading cache"</span>);[m
[36m@@ -2834,7 +2834,7 @@[m [mphaser.awaitAdvance(phase); <span class="code-comment">Blocks until phase 0 is c[m
         <div class="method-entry" id="g18-6">[m
             <div id="tab-g18-6" class="api-sig"><span class="code-keyword">int</span> awaitAdvanceInterruptibly(<span class="code-keyword">int</span> phase) <span class="code-keyword">throws</span> <span class="code-class">InterruptedException</span>[m
 <span class="code-keyword">int</span> awaitAdvanceInterruptibly(<span class="code-keyword">int</span> phase, <span class="code-keyword">long</span> timeout, <span class="code-class">TimeUnit</span> unit) <span class="code-keyword">throws</span> <span class="code-class">InterruptedException</span>, <span class="code-class">TimeoutException</span></div>[m
[31m-            <p class="api-desc">Waits like <code>awaitAdvance(phase)</code> but throws <code>InterruptedException</code> if the waiting thread is interrupted, and the timed overload also throws <code>TimeoutException</code> if the phase has not advanced in time. It returns the next phase number, or a negative value if the phaser has terminated. Use it in cancellable tasks or wherever a missing party must not hang the caller forever. Note that a timeout does not arrive or deregister anyone, so the phase stays open.</p>[m
[32m+[m[32m            <p class="api-desc">Waits like <code>awaitAdvance(phase)</code> but throws <code>InterruptedException</code> if the waiting thread is interrupted and the timed overload also throws <code>TimeoutException</code> if the phase has not advanced in time. It returns the next phase number, or a negative value if the phaser has terminated. Use it in cancellable tasks or wherever a missing party must not hang the caller forever. Note that a timeout does not arrive or deregister anyone, so the phase stays open.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">int</span> phase = phaser.arrive(); <span class="code-comment">Arrive, then wait with a deadline</span>[m
 <span class="code-keyword">try</span> {[m
     phaser.awaitAdvanceInterruptibly(phase, <span class="code-number">5</span>, <span class="code-class">TimeUnit</span>.SECONDS);[m
[36m@@ -2847,7 +2847,7 @@[m [mphaser.awaitAdvance(phase); <span class="code-comment">Blocks until phase 0 is c[m
         </div>[m
         <div class="method-entry" id="g18-7">[m
             <div id="tab-g18-7" class="api-sig"><span class="code-keyword">int</span> getPhase()</div>[m
[31m-            <p class="api-desc">Returns the current phase number, which starts at 0, increments each time all parties arrive and wraps to 0 after <code>Integer.MAX_VALUE</code>. Once the phaser terminates the value is negative, and the final phase can be recovered with <code>getPhase() + Integer.MIN_VALUE</code>. It never blocks, so it is handy for logging and loop control, but in concurrent code the value may change right after you read it.</p>[m
[32m+[m[32m            <p class="api-desc">Returns the current phase number, which starts at 0, increments each time all parties arrive and wraps to 0 after <code>Integer.MAX_VALUE</code>. Once the phaser terminates the value is negative and the final phase can be recovered with <code>getPhase() + Integer.MIN_VALUE</code>. It never blocks, so it is handy for logging and loop control, but in concurrent code the value may change right after you read it.</p>[m
             <div class="code-block"><pre><code><span class="code-class">Phaser</span> phaser = <span class="code-keyword">new</span> <span class="code-class">Phaser</span>(<span class="code-number">1</span>);[m
 <span class="code-class">System</span>.out.println(phaser.getPhase()); <span class="code-comment">0</span>[m
 phaser.arriveAndAwaitAdvance(); <span class="code-comment">Only one party, advances at once</span>[m
[36m@@ -2878,7 +2878,7 @@[m [mphaser.arrive(); <span class="code-comment">Last arrival: the phase advances</sp[m
         </div>[m
         <div class="method-entry" id="g18-10">[m
             <div id="tab-g18-10" class="api-sig"><span class="code-keyword">int</span> getUnarrivedParties()</div>[m
[31m-            <p class="api-desc">Returns the number of registered parties that have not yet arrived at the current phase, which equals <code>getRegisteredParties()</code> minus <code>getArrivedParties()</code>. It never blocks and is useful for progress bars or for logging which phase is still waiting on stragglers. Like the other counters it is only a snapshot, and its value is meaningless once the phaser has terminated.</p>[m
[32m+[m[32m            <p class="api-desc">Returns the number of registered parties that have not yet arrived at the current phase, which equals <code>getRegisteredParties()</code> minus <code>getArrivedParties()</code>. It never blocks and is useful for progress bars or for logging which phase is still waiting on stragglers. Like the other counters it is only a snapshot and its value is meaningless once the phaser has terminated.</p>[m
             <div class="code-block"><pre><code><span class="code-class">Phaser</span> phaser = <span class="code-keyword">new</span> <span class="code-class">Phaser</span>(<span class="code-number">4</span>);[m
 phaser.arrive();[m
 <span class="code-keyword">int</span> waiting = phaser.getUnarrivedParties();[m
[36m@@ -2887,7 +2887,7 @@[m [mphaser.arrive();[m
         </div>[m
         <div class="method-entry" id="g18-11">[m
             <div id="tab-g18-11" class="api-sig"><span class="code-keyword">void</span> forceTermination()</div>[m
[31m-            <p class="api-desc">Forces the phaser into the terminated state immediately, regardless of how many parties are registered or still unarrived. Threads waiting in <code>awaitAdvance()</code> or <code>arriveAndAwaitAdvance()</code> are released with a negative phase number, and later synchronization calls return at once. Use it to abort a multi-phase computation after an error; it has no effect on an already terminated phaser. In a tiered set of phasers, the whole tree is terminated.</p>[m
[32m+[m[32m            <p class="api-desc">Forces the phaser into the terminated state immediately, regardless of how many parties are registered or still unarrived. Threads waiting in <code>awaitAdvance()</code> or <code>arriveAndAwaitAdvance()</code> are released with a negative phase number and later synchronization calls return at once. Use it to abort a multi-phase computation after an error; it has no effect on an already terminated phaser. In a tiered set of phasers, the whole tree is terminated.</p>[m
             <div class="code-block"><pre><code><span class="code-class">Phaser</span> phaser = <span class="code-keyword">new</span> <span class="code-class">Phaser</span>(<span class="code-number">2</span>);[m
 <span class="code-class">Thread</span> waiter = <span class="code-class">Thread</span>.ofPlatform().start(() -&gt; {[m
     <span class="code-keyword">int</span> phase = phaser.arriveAndAwaitAdvance(); <span class="code-comment">Blocks: one party missing</span>[m
[36m@@ -3035,7 +3035,7 @@[m [mexecutor.execute(() -&gt; <span class="code-class">System</span>.out.println(<sp[m
         </select>[m
         <div class="method-entry" id="g20-0">[m
             <div id="tab-g20-0" class="api-sig"><span class="code-keyword">void</span> execute(<span class="code-class">Runnable</span> command)</div>[m
[31m-            <p class="api-desc">Inherited from <code>Executor</code>, it hands the task to the executor to run at some point and returns nothing, so you cannot wait for it or obtain a result. It does not block beyond queueing the task. Throws <code>RejectedExecutionException</code> if the task cannot be accepted, for example after <code>shutdown()</code>, and <code>NullPointerException</code> for a null task. Pitfall: an exception thrown by the task goes to the worker thread&rsquo;s uncaught exception handler, whereas <code>submit()</code> captures it in the <code>Future</code>.</p>[m
[32m+[m[32m            <p class="api-desc">Inherited from <code>Executor</code>, it hands the task to the executor to run at some point and returns nothing, so you cannot wait for it or obtain a result. It does not block beyond queueing the task. Throws <code>RejectedExecutionException</code> if the task cannot be accepted, for example after <code>shutdown()</code> and <code>NullPointerException</code> for a null task. Pitfall: an exception thrown by the task goes to the worker thread&rsquo;s uncaught exception handler, whereas <code>submit()</code> captures it in the <code>Future</code>.</p>[m
             <div class="code-block"><pre><code><span class="code-class">ExecutorService</span> executor = <span class="code-class">Executors</span>.newFixedThreadPool(<span class="code-number">2</span>);[m
 executor.execute(() -&gt; <span class="code-class">System</span>.out.println(<span class="code-string">"Fire and forget"</span>)); <span class="code-comment">No Future</span>[m
 executor.execute(() -&gt; {[m
[36m@@ -3099,7 +3099,7 @@[m [mexecutor.shutdown();[m
         </div>[m
         <div class="method-entry" id="g20-5">[m
             <div id="tab-g20-5" class="api-sig">&lt;<span class="code-class">T</span>&gt; <span class="code-class">List</span>&lt;<span class="code-class">Future</span>&lt;<span class="code-class">T</span>&gt;&gt; invokeAll(<span class="code-class">Collection</span>&lt;? <span class="code-keyword">extends</span> <span class="code-class">Callable</span>&lt;<span class="code-class">T</span>&gt;&gt; tasks, <span class="code-keyword">long</span> timeout, <span class="code-class">TimeUnit</span> unit) <span class="code-keyword">throws</span> <span class="code-class">InterruptedException</span></div>[m
[31m-            <p class="api-desc">Works like <code>invokeAll(tasks)</code> but waits at most the given time, and any task that has not finished when the timeout expires is cancelled. It returns the full list of futures in input order, all of them done, so check each one&rsquo;s state before reading it to avoid a <code>CancellationException</code>. Throws <code>InterruptedException</code> if interrupted while waiting. Use it for scatter-gather calls with a latency budget, such as querying several services and keeping only the timely answers.</p>[m
[32m+[m[32m            <p class="api-desc">Works like <code>invokeAll(tasks)</code> but waits at most the given time and any task that has not finished when the timeout expires is cancelled. It returns the full list of futures in input order, all of them done, so check each one&rsquo;s state before reading it to avoid a <code>CancellationException</code>. Throws <code>InterruptedException</code> if interrupted while waiting. Use it for scatter-gather calls with a latency budget, such as querying several services and keeping only the timely answers.</p>[m
             <div class="code-block"><pre><code><span class="code-class">List</span>&lt;<span class="code-class">Callable</span>&lt;<span class="code-class">String</span>&gt;&gt; tasks = <span class="code-class">List</span>.of(() -&gt; fastCall(), () -&gt; slowCall());[m
 <span class="code-keyword">var</span> futures = executor.invokeAll(tasks, <span class="code-number">2</span>, <span class="code-class">TimeUnit</span>.SECONDS);[m
 <span class="code-keyword">for</span> (<span class="code-class">Future</span>&lt;<span class="code-class">String</span>&gt; f : futures) {[m
[36m@@ -3112,7 +3112,7 @@[m [mexecutor.shutdown();[m
         </div>[m
         <div class="method-entry" id="g20-6">[m
             <div id="tab-g20-6" class="api-sig">&lt;<span class="code-class">T</span>&gt; <span class="code-class">T</span> invokeAny(<span class="code-class">Collection</span>&lt;? <span class="code-keyword">extends</span> <span class="code-class">Callable</span>&lt;<span class="code-class">T</span>&gt;&gt; tasks) <span class="code-keyword">throws</span> <span class="code-class">InterruptedException</span>, <span class="code-class">ExecutionException</span></div>[m
[31m-            <p class="api-desc">Submits all tasks, blocks until one of them completes successfully, returns that result and cancels the rest. Failing tasks are ignored as long as another succeeds; if every task fails it throws <code>ExecutionException</code>, and it throws <code>InterruptedException</code> if the caller is interrupted. Use it for redundant requests, such as querying several mirrors and taking the first answer. Pitfall: losing tasks are only interrupted, so they must respond to interruption to really stop.</p>[m
[32m+[m[32m            <p class="api-desc">Submits all tasks, blocks until one of them completes successfully, returns that result and cancels the rest. Failing tasks are ignored as long as another succeeds; if every task fails it throws <code>ExecutionException</code> and it throws <code>InterruptedException</code> if the caller is interrupted. Use it for redundant requests, such as querying several mirrors and taking the first answer. Pitfall: losing tasks are only interrupted, so they must respond to interruption to really stop.</p>[m
             <div class="code-block"><pre><code><span class="code-class">List</span>&lt;<span class="code-class">Callable</span>&lt;<span class="code-class">String</span>&gt;&gt; mirrors = <span class="code-class">List</span>.of([m
         () -&gt; download(<span class="code-string">"https://mirror-a.example/file"</span>),[m
         () -&gt; download(<span class="code-string">"https://mirror-b.example/file"</span>));[m
[36m@@ -3151,7 +3151,7 @@[m [mexecutor.awaitTermination(<span class="code-number">1</span>, <span class="code-[m
         </div>[m
         <div class="method-entry" id="g20-9">[m
             <div id="tab-g20-9" class="api-sig"><span class="code-class">List</span>&lt;<span class="code-class">Runnable</span>&gt; shutdownNow()</div>[m
[31m-            <p class="api-desc">Attempts an abrupt stop: it rejects new submissions, removes and returns the tasks that were queued but never started, and interrupts the threads running active tasks. It does not wait for running tasks to end, and there is no guarantee they stop, since a task that ignores interruption keeps going. Use it as a last resort after a graceful <code>shutdown()</code> times out, and log or persist the returned <code>List&lt;Runnable&gt;</code> so that work is not silently lost.</p>[m
[32m+[m[32m            <p class="api-desc">Attempts an abrupt stop: it rejects new submissions, removes and returns the tasks that were queued but never started and interrupts the threads running active tasks. It does not wait for running tasks to end and there is no guarantee they stop, since a task that ignores interruption keeps going. Use it as a last resort after a graceful <code>shutdown()</code> times out and log or persist the returned <code>List&lt;Runnable&gt;</code> so that work is not silently lost.</p>[m
             <div class="code-block"><pre><code>executor.submit(() -&gt; {[m
     <span class="code-keyword">while</span> (!<span class="code-class">Thread</span>.currentThread().isInterrupted()) {[m
         processNextItem(); <span class="code-comment">Loop checks the interrupt flag</span>[m
[36m@@ -3162,7 +3162,7 @@[m [mexecutor.awaitTermination(<span class="code-number">1</span>, <span class="code-[m
         </div>[m
         <div class="method-entry" id="g20-10">[m
             <div id="tab-g20-10" class="api-sig"><span class="code-keyword">boolean</span> awaitTermination(<span class="code-keyword">long</span> timeout, <span class="code-class">TimeUnit</span> unit) <span class="code-keyword">throws</span> <span class="code-class">InterruptedException</span></div>[m
[31m-            <p class="api-desc">Blocks until all tasks have completed after a shutdown request, the timeout elapses, or the current thread is interrupted, whichever comes first. Returns <code>true</code> if the executor terminated and <code>false</code> if the timeout elapsed, and throws <code>InterruptedException</code> if interrupted. It does not start a shutdown itself, so calling it without <code>shutdown()</code> just waits out the full timeout. The standard pattern is <code>shutdown()</code>, then <code>awaitTermination()</code>, then <code>shutdownNow()</code> as a fallback.</p>[m
[32m+[m[32m            <p class="api-desc">Blocks until all tasks have completed after a shutdown request, the timeout elapses, or the current thread is interrupted, whichever comes first. Returns <code>true</code> if the executor terminated and <code>false</code> if the timeout elapsed and throws <code>InterruptedException</code> if interrupted. It does not start a shutdown itself, so calling it without <code>shutdown()</code> just waits out the full timeout. The standard pattern is <code>shutdown()</code>, then <code>awaitTermination()</code>, then <code>shutdownNow()</code> as a fallback.</p>[m
             <div class="code-block"><pre><code>executor.shutdown(); <span class="code-comment">Stop taking new work</span>[m
 <span class="code-keyword">try</span> {[m
     <span class="code-keyword">if</span> (!executor.awaitTermination(<span class="code-number">30</span>, <span class="code-class">TimeUnit</span>.SECONDS)) {[m
[36m@@ -3196,7 +3196,7 @@[m [mexecutor.awaitTermination(<span class="code-number">5</span>, <span class="code-[m
         </div>[m
         <div class="method-entry" id="g20-13">[m
             <div id="tab-g20-13" class="api-sig"><span class="code-keyword">void</span> close()</div>[m
[31m-            <p class="api-desc">Added in Java 19 so an <code>ExecutorService</code> can be used in try-with-resources: it calls <code>shutdown()</code> and then waits, without a timeout, for all tasks to complete. If the waiting thread is interrupted, it calls <code>shutdownNow()</code>, keeps waiting for running tasks and restores the interrupt status before returning. It does nothing if the executor is already terminated. Pitfall: a task that never finishes makes <code>close()</code>, and therefore the try block, block forever.</p>[m
[32m+[m[32m            <p class="api-desc">Added in Java 19 so an <code>ExecutorService</code> can be used in try-with-resources: it calls <code>shutdown()</code> and then waits, without a timeout, for all tasks to complete. If the waiting thread is interrupted, it calls <code>shutdownNow()</code>, keeps waiting for running tasks and restores the interrupt status before returning. It does nothing if the executor is already terminated. Pitfall: a task that never finishes makes <code>close()</code> and therefore the try block, block forever.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">try</span> (<span class="code-class">ExecutorService</span> executor = <span class="code-class">Executors</span>.newFixedThreadPool(<span class="code-number">4</span>)) { <span class="code-comment">Java 19+</span>[m
     <span class="code-class">Future</span>&lt;<span class="code-class">Integer</span>&gt; a = executor.submit(() -&gt; <span class="code-number">20</span>);[m
     <span class="code-class">Future</span>&lt;<span class="code-class">Integer</span>&gt; b = executor.submit(() -&gt; <span class="code-number">22</span>);[m
[36m@@ -3246,7 +3246,7 @@[m [mexecutor.awaitTermination(<span class="code-number">5</span>, <span class="code-[m
         </select>[m
         <div class="method-entry" id="g22-0">[m
             <div id="tab-g22-0" class="api-sig"><span class="code-keyword">static</span> <span class="code-class">ExecutorService</span> newSingleThreadExecutor()</div>[m
[31m-            <p class="api-desc">Creates an executor with a single worker thread and an unbounded queue, so tasks run one at a time in submission order. If the worker dies because of a failure, a new thread replaces it for later tasks, and unlike <code>newFixedThreadPool(1)</code> the returned executor cannot be reconfigured to use more threads. Use it to serialize access to a resource without locks. Pitfall: the unbounded queue can grow without limit if producers outpace the worker.</p>[m
[32m+[m[32m            <p class="api-desc">Creates an executor with a single worker thread and an unbounded queue, so tasks run one at a time in submission order. If the worker dies because of a failure, a new thread replaces it for later tasks and unlike <code>newFixedThreadPool(1)</code> the returned executor cannot be reconfigured to use more threads. Use it to serialize access to a resource without locks. Pitfall: the unbounded queue can grow without limit if producers outpace the worker.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">try</span> (<span class="code-keyword">var</span> single = <span class="code-class">Executors</span>.newSingleThreadExecutor()) {[m
     <span class="code-keyword">for</span> (<span class="code-keyword">int</span> i = <span class="code-number">1</span>; i &lt;= <span class="code-number">3</span>; i++) {[m
         <span class="code-keyword">int</span> id = i;[m
[36m@@ -3304,7 +3304,7 @@[m [mscheduler.shutdown(); <span class="code-comment">Periodic Tick stops here</span>[m
         </div>[m
         <div class="method-entry" id="g22-5">[m
             <div id="tab-g22-5" class="api-sig"><span class="code-keyword">static</span> <span class="code-class">ScheduledExecutorService</span> newSingleThreadScheduledExecutor()</div>[m
[31m-            <p class="api-desc">Creates a scheduled executor with exactly one worker thread, so delayed and periodic tasks never run concurrently with each other. If that thread dies from a failure, a new one takes over for later tasks, and the returned executor cannot be reconfigured to add threads. Use it for lightweight housekeeping such as cache eviction or metrics flushing. Pitfall: one slow task delays every other scheduled task, because they all share the single thread.</p>[m
[32m+[m[32m            <p class="api-desc">Creates a scheduled executor with exactly one worker thread, so delayed and periodic tasks never run concurrently with each other. If that thread dies from a failure, a new one takes over for later tasks and the returned executor cannot be reconfigured to add threads. Use it for lightweight housekeeping such as cache eviction or metrics flushing. Pitfall: one slow task delays every other scheduled task, because they all share the single thread.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> scheduler = <span class="code-class">Executors</span>.newSingleThreadScheduledExecutor();[m
 <span class="code-class">Map</span>&lt;<span class="code-class">String</span>, <span class="code-class">String</span>&gt; cache = <span class="code-keyword">new</span> <span class="code-class">ConcurrentHashMap</span>&lt;&gt;();[m
 scheduler.scheduleWithFixedDelay(cache::clear, <span class="code-number">10</span>, <span class="code-number">10</span>, <span class="code-class">TimeUnit</span>.MINUTES);[m
[36m@@ -3335,7 +3335,7 @@[m [mscheduler.schedule(() -&gt; <span class="code-class">System</span>.out.println(<[m
         </div>[m
         <div class="method-entry" id="g22-8">[m
             <div id="tab-g22-8" class="api-sig"><span class="code-keyword">static</span> <span class="code-class">ExecutorService</span> unconfigurableExecutorService(<span class="code-class">ExecutorService</span> executor)</div>[m
[31m-            <p class="api-desc">Wraps an existing <code>ExecutorService</code> so that callers can use only the <code>ExecutorService</code> methods, and implementation-specific setters such as <code>setCorePoolSize()</code> on a <code>ThreadPoolExecutor</code> are no longer reachable by casting. Task submission and lifecycle calls like <code>shutdown()</code> are still forwarded to the underlying executor. Use it when exposing a shared pool to other components or libraries that must not resize or reconfigure it. Throws <code>NullPointerException</code> for a null argument.</p>[m
[32m+[m[32m            <p class="api-desc">Wraps an existing <code>ExecutorService</code> so that callers can use only the <code>ExecutorService</code> methods and implementation-specific setters such as <code>setCorePoolSize()</code> on a <code>ThreadPoolExecutor</code> are no longer reachable by casting. Task submission and lifecycle calls like <code>shutdown()</code> are still forwarded to the underlying executor. Use it when exposing a shared pool to other components or libraries that must not resize or reconfigure it. Throws <code>NullPointerException</code> for a null argument.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> pool = <span class="code-keyword">new</span> <span class="code-class">ThreadPoolExecutor</span>(<span class="code-number">4</span>, <span class="code-number">8</span>, <span class="code-number">60</span>, <span class="code-class">TimeUnit</span>.SECONDS,[m
         <span class="code-keyword">new</span> <span class="code-class">LinkedBlockingQueue</span>&lt;&gt;());[m
 <span class="code-class">ExecutorService</span> shared = <span class="code-class">Executors</span>.unconfigurableExecutorService(pool);[m
[36m@@ -3366,7 +3366,7 @@[m [mreadOnly.schedule(() -&gt; <span class="code-class">System</span>.out.println(<s[m
         </div>[m
         <div class="method-entry" id="g22-11">[m
             <div id="tab-g22-11" class="api-sig"><span class="code-keyword">static</span> <span class="code-class">ThreadFactory</span> privilegedThreadFactory()</div>[m
[31m-            <p class="api-desc">Returns a thread factory whose threads inherit the access control context and context class loader of the thread that called this method, which only mattered under a <code>SecurityManager</code>. It has been deprecated for removal since Java 17 along with the Security Manager, which is permanently disabled from Java 24. In new code use <code>defaultThreadFactory()</code> or a <code>Thread.Builder</code> factory, and set the context class loader explicitly if you need it.</p>[m
[32m+[m[32m            <p class="api-desc">Returns a thread factory whose threads inherit the access control context and context class loader of the thread that called this method, which only mattered under a <code>SecurityManager</code>. It has been deprecated for removal since Java 17 along with the Security Manager, which is permanently disabled from Java 24. In new code use <code>defaultThreadFactory()</code> or a <code>Thread.Builder</code> factory and set the context class loader explicitly if you need it.</p>[m
             <div class="code-block"><pre><code><span class="code-class">ThreadFactory</span> legacy = <span class="code-class">Executors</span>.privilegedThreadFactory(); <span class="code-comment">Deprecated</span>[m
 <span class="code-class">ClassLoader</span> loader = <span class="code-class">Thread</span>.currentThread().getContextClassLoader();[m
 <span class="code-class">ThreadFactory</span> modern = <span class="code-class">Thread</span>.ofPlatform().name(<span class="code-string">"app-"</span>, <span class="code-number">0</span>).factory();[m
[36m@@ -3477,7 +3477,7 @@[m [mreadOnly.schedule(() -&gt; <span class="code-class">System</span>.out.println(<s[m
         <div class="method-entry" id="g23-0">[m
             <div id="tab-g23-0" class="api-sig"><span class="code-keyword">int</span> getCorePoolSize()[m
 <span class="code-keyword">void</span> setCorePoolSize(<span class="code-keyword">int</span> corePoolSize)</div>[m
[31m-            <p class="api-desc"><code>getCorePoolSize()</code> returns the number of threads the pool keeps alive even when idle, and <code>setCorePoolSize()</code> changes it at runtime. Raising it starts new threads only as queued tasks need them, while lowering it lets surplus threads terminate when they next become idle. Since Java 9 the setter throws <code>IllegalArgumentException</code> if the value is negative or greater than the maximum pool size, so raise the maximum first when growing past it.</p>[m
[32m+[m[32m            <p class="api-desc"><code>getCorePoolSize()</code> returns the number of threads the pool keeps alive even when idle and <code>setCorePoolSize()</code> changes it at runtime. Raising it starts new threads only as queued tasks need them, while lowering it lets surplus threads terminate when they next become idle. Since Java 9 the setter throws <code>IllegalArgumentException</code> if the value is negative or greater than the maximum pool size, so raise the maximum first when growing past it.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> pool = <span class="code-keyword">new</span> <span class="code-class">ThreadPoolExecutor</span>(<span class="code-number">4</span>, <span class="code-number">8</span>, <span class="code-number">60</span>, <span class="code-class">TimeUnit</span>.SECONDS,[m
         <span class="code-keyword">new</span> <span class="code-class">LinkedBlockingQueue</span>&lt;&gt;());[m
 <span class="code-class">System</span>.out.println(pool.getCorePoolSize()); <span class="code-comment">4</span>[m
[36m@@ -3496,7 +3496,7 @@[m [mpool.setMaximumPoolSize(<span class="code-number">20</span>); <span class="code-[m
         </div>[m
         <div class="method-entry" id="g23-2">[m
             <div id="tab-g23-2" class="api-sig"><span class="code-keyword">int</span> getPoolSize()</div>[m
[31m-            <p class="api-desc">Returns the current number of threads in the pool, both busy and idle. It starts at zero, grows as tasks arrive (up to the core size, then up to the maximum when the queue is full), shrinks as idle non-core threads time out, and drops to zero after termination. It never blocks and is useful for capacity dashboards, especially next to <code>getActiveCount()</code> to see how many threads sit idle.</p>[m
[32m+[m[32m            <p class="api-desc">Returns the current number of threads in the pool, both busy and idle. It starts at zero, grows as tasks arrive (up to the core size, then up to the maximum when the queue is full), shrinks as idle non-core threads time out and drops to zero after termination. It never blocks and is useful for capacity dashboards, especially next to <code>getActiveCount()</code> to see how many threads sit idle.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> pool = <span class="code-keyword">new</span> <span class="code-class">ThreadPoolExecutor</span>(<span class="code-number">2</span>, <span class="code-number">4</span>, <span class="code-number">30</span>, <span class="code-class">TimeUnit</span>.SECONDS,[m
         <span class="code-keyword">new</span> <span class="code-class">LinkedBlockingQueue</span>&lt;&gt;());[m
 <span class="code-class">System</span>.out.println(pool.getPoolSize()); <span class="code-comment">0: threads start lazily</span>[m
[36m@@ -3507,7 +3507,7 @@[m [mpool.prestartAllCoreThreads();[m
         </div>[m
         <div class="method-entry" id="g23-3">[m
             <div id="tab-g23-3" class="api-sig"><span class="code-keyword">int</span> getActiveCount()</div>[m
[31m-            <p class="api-desc">Returns the approximate number of threads that are currently executing tasks, as opposed to idle threads waiting for work. The value is approximate because thread states change while it is computed, and computing it briefly takes the pool&rsquo;s main lock, so avoid calling it in a tight loop. It is mainly used for monitoring and load reports, for example showing utilization as active threads divided by <code>getPoolSize()</code>.</p>[m
[32m+[m[32m            <p class="api-desc">Returns the approximate number of threads that are currently executing tasks, as opposed to idle threads waiting for work. The value is approximate because thread states change while it is computed and computing it briefly takes the pool&rsquo;s main lock, so avoid calling it in a tight loop. It is mainly used for monitoring and load reports, for example showing utilization as active threads divided by <code>getPoolSize()</code>.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> monitor = <span class="code-class">Executors</span>.newSingleThreadScheduledExecutor();[m
 monitor.scheduleAtFixedRate(() -&gt; {[m
     <span class="code-keyword">int</span> active = pool.getActiveCount(); <span class="code-comment">Approximate snapshot</span>[m
[36m@@ -3528,7 +3528,7 @@[m [mmonitor.scheduleAtFixedRate(() -&gt; {[m
         </div>[m
         <div class="method-entry" id="g23-5">[m
             <div id="tab-g23-5" class="api-sig"><span class="code-keyword">long</span> getTaskCount()</div>[m
[31m-            <p class="api-desc">Returns the approximate total number of tasks that have ever been scheduled for execution, whether completed, running or still queued. The value is approximate because task and thread states change during the computation, and it never decreases. Subtracting <code>getCompletedTaskCount()</code> gives a rough backlog figure. It briefly takes the pool&rsquo;s main lock, so call it for periodic monitoring rather than on every submission.</p>[m
[32m+[m[32m            <p class="api-desc">Returns the approximate total number of tasks that have ever been scheduled for execution, whether completed, running or still queued. The value is approximate because task and thread states change during the computation and it never decreases. Subtracting <code>getCompletedTaskCount()</code> gives a rough backlog figure. It briefly takes the pool&rsquo;s main lock, so call it for periodic monitoring rather than on every submission.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">for</span> (<span class="code-keyword">int</span> i = <span class="code-number">0</span>; i &lt; <span class="code-number">50</span>; i++) pool.execute(() -&gt; sleepMillis(<span class="code-number">100</span>));[m
 <span class="code-keyword">long</span> total = pool.getTaskCount(); <span class="code-comment">Completed + running + queued</span>[m
 <span class="code-keyword">long</span> done = pool.getCompletedTaskCount();[m
[36m@@ -3553,7 +3553,7 @@[m [mmonitor.scheduleAtFixedRate(() -&gt; {[m
         <div class="method-entry" id="g23-8">[m
             <div id="tab-g23-8" class="api-sig"><span class="code-keyword">long</span> getKeepAliveTime(<span class="code-class">TimeUnit</span> unit)[m
 <span class="code-keyword">void</span> setKeepAliveTime(<span class="code-keyword">long</span> time, <span class="code-class">TimeUnit</span> unit)</div>[m
[31m-            <p class="api-desc">Gets or sets how long threads above the core size may stay idle before they are terminated, and <code>getKeepAliveTime(unit)</code> converts the value to the requested unit. A shorter time releases surplus threads sooner after a burst, while a longer one avoids recreating threads under bursty load; it applies to core threads only when <code>allowCoreThreadTimeOut(true)</code> is set. The setter throws <code>IllegalArgumentException</code> for a negative time, or for zero while core threads may time out.</p>[m
[32m+[m[32m            <p class="api-desc">Gets or sets how long threads above the core size may stay idle before they are terminated and <code>getKeepAliveTime(unit)</code> converts the value to the requested unit. A shorter time releases surplus threads sooner after a burst, while a longer one avoids recreating threads under bursty load; it applies to core threads only when <code>allowCoreThreadTimeOut(true)</code> is set. The setter throws <code>IllegalArgumentException</code> for a negative time, or for zero while core threads may time out.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> pool = <span class="code-keyword">new</span> <span class="code-class">ThreadPoolExecutor</span>(<span class="code-number">2</span>, <span class="code-number">10</span>, <span class="code-number">60</span>, <span class="code-class">TimeUnit</span>.SECONDS,[m
         <span class="code-keyword">new</span> <span class="code-class">SynchronousQueue</span>&lt;&gt;());[m
 pool.setKeepAliveTime(<span class="code-number">15</span>, <span class="code-class">TimeUnit</span>.SECONDS); <span class="code-comment">Shrink faster after bursts</span>[m
[36m@@ -3573,7 +3573,7 @@[m [mpool.execute(() -&gt; <span class="code-class">System</span>.out.println(<span c[m
         </div>[m
         <div class="method-entry" id="g23-10">[m
             <div id="tab-g23-10" class="api-sig"><span class="code-keyword">boolean</span> prestartCoreThread()</div>[m
[31m-            <p class="api-desc">Starts one core thread that waits idly for work, overriding the default policy of creating core threads only when tasks are executed. Returns <code>true</code> if a thread was started and <code>false</code> if all core threads were already running, and it does not block. Use it to remove thread-creation latency from the first request, or to start a worker when tasks were placed directly into the queue given to the constructor.</p>[m
[32m+[m[32m            <p class="api-desc">Starts one core thread that waits idly for work, overriding the default policy of creating core threads only when tasks are executed. Returns <code>true</code> if a thread was started and <code>false</code> if all core threads were already running and it does not block. Use it to remove thread-creation latency from the first request, or to start a worker when tasks were placed directly into the queue given to the constructor.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> pool = <span class="code-keyword">new</span> <span class="code-class">ThreadPoolExecutor</span>(<span class="code-number">2</span>, <span class="code-number">2</span>, <span class="code-number">0</span>, <span class="code-class">TimeUnit</span>.SECONDS,[m
         <span class="code-keyword">new</span> <span class="code-class">LinkedBlockingQueue</span>&lt;&gt;());[m
 <span class="code-class">System</span>.out.println(pool.prestartCoreThread()); <span class="code-comment">true: 1 of 2 started</span>[m
[36m@@ -3583,7 +3583,7 @@[m [mpool.execute(() -&gt; <span class="code-class">System</span>.out.println(<span c[m
         </div>[m
         <div class="method-entry" id="g23-11">[m
             <div id="tab-g23-11" class="api-sig"><span class="code-keyword">int</span> prestartAllCoreThreads()</div>[m
[31m-            <p class="api-desc">Starts every core thread that is not yet running, so each waits idly for work, and returns how many were started; it does not block. Use it during application startup to warm the pool before traffic arrives, or when a pre-filled work queue was passed to the constructor and its tasks need workers right away. Calling it again returns 0 unless core threads have since died or timed out.</p>[m
[32m+[m[32m            <p class="api-desc">Starts every core thread that is not yet running, so each waits idly for work and returns how many were started; it does not block. Use it during application startup to warm the pool before traffic arrives, or when a pre-filled work queue was passed to the constructor and its tasks need workers right away. Calling it again returns 0 unless core threads have since died or timed out.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> queue = <span class="code-keyword">new</span> <span class="code-class">LinkedBlockingQueue</span>&lt;<span class="code-class">Runnable</span>&gt;();[m
 queue.add(() -&gt; <span class="code-class">System</span>.out.println(<span class="code-string">"Pre-loaded task"</span>)); <span class="code-comment">Added directly</span>[m
 <span class="code-keyword">var</span> pool = <span class="code-keyword">new</span> <span class="code-class">ThreadPoolExecutor</span>(<span class="code-number">4</span>, <span class="code-number">4</span>, <span class="code-number">0</span>, <span class="code-class">TimeUnit</span>.SECONDS, queue);[m
[36m@@ -3613,7 +3613,7 @@[m [mpool.setRejectedExecutionHandler((task, executor) -&gt; {[m
         </div>[m
         <div class="method-entry" id="g23-14">[m
             <div id="tab-g23-14" class="api-sig"><span class="code-keyword">boolean</span> remove(<span class="code-class">Runnable</span> task)</div>[m
[31m-            <p class="api-desc">Removes the given task from the work queue if it has not started yet, so it will never run, and returns <code>true</code> if it was removed. Running or completed tasks are unaffected, and the call does not block. Pitfall: tasks passed to <code>submit()</code> are wrapped in a <code>FutureTask</code>, so <code>remove()</code> with your original <code>Runnable</code> will not find them. Use it with tasks passed to <code>execute()</code>, or cancel the <code>Future</code> and call <code>purge()</code> instead.</p>[m
[32m+[m[32m            <p class="api-desc">Removes the given task from the work queue if it has not started yet, so it will never run and returns <code>true</code> if it was removed. Running or completed tasks are unaffected and the call does not block. Pitfall: tasks passed to <code>submit()</code> are wrapped in a <code>FutureTask</code>, so <code>remove()</code> with your original <code>Runnable</code> will not find them. Use it with tasks passed to <code>execute()</code>, or cancel the <code>Future</code> and call <code>purge()</code> instead.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> pool = <span class="code-keyword">new</span> <span class="code-class">ThreadPoolExecutor</span>(<span class="code-number">1</span>, <span class="code-number">1</span>, <span class="code-number">0</span>, <span class="code-class">TimeUnit</span>.SECONDS,[m
         <span class="code-keyword">new</span> <span class="code-class">LinkedBlockingQueue</span>&lt;&gt;());[m
 pool.execute(() -&gt; sleepMillis(<span class="code-number">1_000</span>)); <span class="code-comment">Keeps the only thread busy</span>[m
[36m@@ -3634,7 +3634,7 @@[m [mpool.purge(); <span class="code-comment">Removes the cancelled entries now</span[m
         <div class="method-entry" id="g23-16">[m
             <div id="tab-g23-16" class="api-sig"><span class="code-keyword">void</span> beforeExecute(<span class="code-class">Thread</span> t, <span class="code-class">Runnable</span> r)[m
 <span class="code-keyword">void</span> afterExecute(<span class="code-class">Runnable</span> r, <span class="code-class">Throwable</span> t)</div>[m
[31m-            <p class="api-desc">Protected hooks you override in a <code>ThreadPoolExecutor</code> subclass: <code>beforeExecute()</code> runs in the worker thread just before each task, and <code>afterExecute()</code> runs right after it, receiving the <code>Throwable</code> that ended the task or <code>null</code>. Use them for logging, timing, metrics, or setting and clearing a <code>ThreadLocal</code> context. Pitfall: for tasks from <code>submit()</code> the exception is captured in the <code>Future</code>, so the <code>Throwable</code> is <code>null</code> and you must inspect the <code>Future</code> yourself.</p>[m
[32m+[m[32m            <p class="api-desc">Protected hooks you override in a <code>ThreadPoolExecutor</code> subclass: <code>beforeExecute()</code> runs in the worker thread just before each task and <code>afterExecute()</code> runs right after it, receiving the <code>Throwable</code> that ended the task or <code>null</code>. Use them for logging, timing, metrics, or setting and clearing a <code>ThreadLocal</code> context. Pitfall: for tasks from <code>submit()</code> the exception is captured in the <code>Future</code>, so the <code>Throwable</code> is <code>null</code> and you must inspect the <code>Future</code> yourself.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> queue = <span class="code-keyword">new</span> <span class="code-class">LinkedBlockingQueue</span>&lt;<span class="code-class">Runnable</span>&gt;();[m
 <span class="code-keyword">var</span> pool = <span class="code-keyword">new</span> <span class="code-class">ThreadPoolExecutor</span>(<span class="code-number">2</span>, <span class="code-number">4</span>, <span class="code-number">60</span>, <span class="code-class">TimeUnit</span>.SECONDS, queue) {[m
     <span class="code-annotation">@Override</span>[m
[36m@@ -3650,7 +3650,7 @@[m [mpool.purge(); <span class="code-comment">Removes the cancelled entries now</span[m
         </div>[m
         <div class="method-entry" id="g23-17">[m
             <div id="tab-g23-17" class="api-sig"><span class="code-keyword">void</span> terminated()</div>[m
[31m-            <p class="api-desc">A protected hook that a <code>ThreadPoolExecutor</code> subclass can override; it is called exactly once, by the last exiting thread, after a shutdown when all tasks have finished. It runs before <code>isTerminated()</code> becomes true and before <code>awaitTermination()</code> callers are released. Use it to release resources tied to the pool, flush metrics or signal shutdown completion to other components, and call <code>super.terminated()</code> so that nested subclasses keep working.</p>[m
[32m+[m[32m            <p class="api-desc">A protected hook that a <code>ThreadPoolExecutor</code> subclass can override; it is called exactly once, by the last exiting thread, after a shutdown when all tasks have finished. It runs before <code>isTerminated()</code> becomes true and before <code>awaitTermination()</code> callers are released. Use it to release resources tied to the pool, flush metrics or signal shutdown completion to other components and call <code>super.terminated()</code> so that nested subclasses keep working.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> queue = <span class="code-keyword">new</span> <span class="code-class">LinkedBlockingQueue</span>&lt;<span class="code-class">Runnable</span>&gt;();[m
 <span class="code-keyword">var</span> pool = <span class="code-keyword">new</span> <span class="code-class">ThreadPoolExecutor</span>(<span class="code-number">2</span>, <span class="code-number">4</span>, <span class="code-number">60</span>, <span class="code-class">TimeUnit</span>.SECONDS, queue) {[m
     <span class="code-annotation">@Override</span>[m
[36m@@ -3785,7 +3785,7 @@[m [mpoller.cancel(<span class="code-keyword">false</span>); <span class="code-commen[m
         </select>[m
         <div class="method-entry" id="g27-0">[m
             <div id="tab-g27-0" class="api-sig"><span class="code-class">V</span> get() <span class="code-keyword">throws</span> <span class="code-class">InterruptedException</span>, <span class="code-class">ExecutionException</span></div>[m
[31m-            <p class="api-desc">Blocks the calling thread until the task completes, then returns its result. If the task threw, the original exception is wrapped in an <code>ExecutionException</code> (unwrap it with <code>getCause()</code>); a cancelled task throws <code>CancellationException</code>, and interrupting the waiting thread throws <code>InterruptedException</code>. Call it only where you actually need the value, and prefer the timed overload in production code so a stuck task cannot hang the caller forever.</p>[m
[32m+[m[32m            <p class="api-desc">Blocks the calling thread until the task completes, then returns its result. If the task threw, the original exception is wrapped in an <code>ExecutionException</code> (unwrap it with <code>getCause()</code>); a cancelled task throws <code>CancellationException</code> and interrupting the waiting thread throws <code>InterruptedException</code>. Call it only where you actually need the value and prefer the timed overload in production code so a stuck task cannot hang the caller forever.</p>[m
             <div class="code-block"><pre><code><span class="code-class">ExecutorService</span> executor = <span class="code-class">Executors</span>.newFixedThreadPool(<span class="code-number">4</span>);[m
 <span class="code-class">Future</span>&lt;<span class="code-class">Integer</span>&gt; future = executor.submit(() -&gt; computeTotal());[m
 <span class="code-keyword">try</span> {[m
[36m@@ -3902,7 +3902,7 @@[m [mfuture.cancel(<span class="code-keyword">false</span>);[m
         </div>[m
     </div>[m
     <div class="intro">[m
[31m-        <p><code>future.get()</code> can throw <code>InterruptedException</code>, <code>ExecutionException</code>, or <code>CancellationException</code>, and the timed overload can also throw <code>TimeoutException</code>.</p>[m
[32m+[m[32m        <p><code>future.get()</code> can throw <code>InterruptedException</code>, <code>ExecutionException</code>, or <code>CancellationException</code> and the timed overload can also throw <code>TimeoutException</code>.</p>[m
         <p class="minor-heading"><strong>9.2 <code>FutureTask&lt;V&gt;</code></strong></p>[m
         <p><code>FutureTask</code> implements <code>RunnableFuture</code>, allowing a computation to be executed as a <code>Runnable</code> while offering a <code>Future</code> result.</p>[m
     </div>[m
[36m@@ -3917,7 +3917,7 @@[m [mfuture.cancel(<span class="code-keyword">false</span>);[m
         </div>[m
     </div>[m
     <div class="intro">[m
[31m-        <p>Important APIs include <code>run()</code>, <code>get()</code>, <code>cancel()</code>, <code>isDone()</code>, <code>isCancelled()</code>, and protected extension methods such as <code>done()</code> and <code>setException()</code>.</p>[m
[32m+[m[32m        <p>Important APIs include <code>run()</code>, <code>get()</code>, <code>cancel()</code>, <code>isDone()</code>, <code>isCancelled()</code> and protected extension methods such as <code>done()</code> and <code>setException()</code>.</p>[m
         <p class="minor-heading"><strong>9.3 <code>ExecutorCompletionService&lt;V&gt;</code></strong></p>[m
         <p>Useful when you want to consume results <strong>in completion order</strong>, rather than submission order.</p>[m
     </div>[m
[36m@@ -3942,7 +3942,7 @@[m [mfuture.cancel(<span class="code-keyword">false</span>);[m
     </div>[m
     <div class="intro">[m
         <p>Relevant methods:</p>[m
[31m-        <p><code>submit(Callable)</code>, <code>submit(Runnable, result)</code>, <code>take()</code>, <code>poll()</code>, and <code>poll(timeout, unit)</code>.</p>[m
[32m+[m[32m        <p><code>submit(Callable)</code>, <code>submit(Runnable, result)</code>, <code>take()</code>, <code>poll()</code> and <code>poll(timeout, unit)</code>.</p>[m
         <p class="minor-heading"><strong>9.4 <code>CompletableFuture&lt;T&gt;</code> — API reference</strong></p>[m
         <p><code>CompletableFuture</code> combines <code>Future</code> with the <code>CompletionStage</code> composition interface.</p>[m
         <p class="minor-heading"><strong>Creation</strong></p>[m
[36m@@ -3967,7 +3967,7 @@[m [mfuture.cancel(<span class="code-keyword">false</span>);[m
         </div>[m
         <div class="method-entry" id="g28-1">[m
             <div id="tab-g28-1" class="api-sig"><span class="code-keyword">static</span> <span class="code-class">CompletableFuture</span>&lt;<span class="code-class">Void</span>&gt; runAsync(<span class="code-class">Runnable</span> runnable)</div>[m
[31m-            <p class="api-desc">Runs a <code>Runnable</code> asynchronously and returns a <code>CompletableFuture&lt;Void&gt;</code> that completes with <code>null</code> when the action finishes, or exceptionally if it throws. Like <code>supplyAsync</code>, it uses <code>ForkJoinPool.commonPool()</code> unless you pass an <code>Executor</code>, and it never blocks the caller. Use it for side effects such as audit logging or cache warming, but keep the returned future if you need to know when the action finished or whether it failed.</p>[m
[32m+[m[32m            <p class="api-desc">Runs a <code>Runnable</code> asynchronously and returns a <code>CompletableFuture&lt;Void&gt;</code> that completes with <code>null</code> when the action finishes, or exceptionally if it throws. Like <code>supplyAsync</code>, it uses <code>ForkJoinPool.commonPool()</code> unless you pass an <code>Executor</code> and it never blocks the caller. Use it for side effects such as audit logging or cache warming, but keep the returned future if you need to know when the action finished or whether it failed.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> auditPool = <span class="code-class">Executors</span>.newSingleThreadExecutor();[m
 <span class="code-class">CompletableFuture</span>&lt;<span class="code-class">Void</span>&gt; audit =[m
         <span class="code-class">CompletableFuture</span>.runAsync(() -&gt; writeAuditLog(event), auditPool);[m
[36m@@ -4018,7 +4018,7 @@[m [mstage.thenApply(<span class="code-class">String</span>::toUpperCase)[m
         </div>[m
         <div class="method-entry" id="g28-6">[m
             <div id="tab-g28-6" class="api-sig"><span class="code-class">CompletableFuture</span>()</div>[m
[31m-            <p class="api-desc">Creates an incomplete future that you complete yourself with <code>complete</code>, <code>completeExceptionally</code> or <code>cancel</code>; nothing runs until something completes it. It is the standard way to bridge callback-based or event-driven APIs into a <code>CompletableFuture</code> chain, and dependent stages registered earlier run in the thread that completes it. Pitfall: if no code path ever completes it, <code>join()</code> waits forever, so always wire up the error callback and consider <code>orTimeout</code>.</p>[m
[32m+[m[32m            <p class="api-desc">Creates an incomplete future that you complete yourself with <code>complete</code>, <code>completeExceptionally</code> or <code>cancel</code>; nothing runs until something completes it. It is the standard way to bridge callback-based or event-driven APIs into a <code>CompletableFuture</code> chain and dependent stages registered earlier run in the thread that completes it. Pitfall: if no code path ever completes it, <code>join()</code> waits forever, so always wire up the error callback and consider <code>orTimeout</code>.</p>[m
             <div class="code-block"><pre><code><span class="code-class">CompletableFuture</span>&lt;<span class="code-class">String</span>&gt; promise = <span class="code-keyword">new</span> <span class="code-class">CompletableFuture</span>&lt;&gt;();[m
 legacyClient.fetch(url, <span class="code-keyword">new</span> <span class="code-class">Callback</span>() {[m
     <span class="code-keyword">public</span> <span class="code-keyword">void</span> onSuccess(<span class="code-class">String</span> body) { promise.complete(body); }[m
[36m@@ -4088,7 +4088,7 @@[m [msave.thenRun(() -&gt; metrics.increment(<span class="code-string">"orders.saved"[m
         </div>[m
         <div class="method-entry" id="g29-4">[m
             <div id="tab-g29-4" class="api-sig">&lt;<span class="code-class">U</span>&gt; <span class="code-class">CompletableFuture</span>&lt;<span class="code-class">U</span>&gt; thenCompose(<span class="code-class">Function</span>&lt;? <span class="code-keyword">super</span> <span class="code-class">T</span>, ? <span class="code-keyword">extends</span> <span class="code-class">CompletionStage</span>&lt;<span class="code-class">U</span>&gt;&gt; fn)</div>[m
[31m-            <p class="api-desc">Chains a dependent asynchronous operation: <code>fn</code> receives this stage&rsquo;s result and returns another <code>CompletionStage</code>, and the returned future completes with that inner stage&rsquo;s outcome. It is the <code>flatMap</code> of futures and avoids the nested <code>CompletableFuture&lt;CompletableFuture&lt;U&gt;&gt;</code> that <code>thenApply</code> would produce. Use it whenever the next step is itself async and needs the previous result; a failure in either stage fails the result.</p>[m
[32m+[m[32m            <p class="api-desc">Chains a dependent asynchronous operation: <code>fn</code> receives this stage&rsquo;s result and returns another <code>CompletionStage</code> and the returned future completes with that inner stage&rsquo;s outcome. It is the <code>flatMap</code> of futures and avoids the nested <code>CompletableFuture&lt;CompletableFuture&lt;U&gt;&gt;</code> that <code>thenApply</code> would produce. Use it whenever the next step is itself async and needs the previous result; a failure in either stage fails the result.</p>[m
             <div class="code-block"><pre><code><span class="code-class">CompletableFuture</span>&lt;<span class="code-class">User</span>&gt; userFuture =[m
         <span class="code-class">CompletableFuture</span>.supplyAsync(() -&gt; loadUser(<span class="code-number">42</span>), executor);[m
 <span class="code-class">CompletableFuture</span>&lt;<span class="code-class">Order</span>&gt; latest = userFuture[m
[36m@@ -4116,7 +4116,7 @@[m [mpage.join();</code></pre></div>[m
         </div>[m
         <div class="method-entry" id="g29-7">[m
             <div id="tab-g29-7" class="api-sig"><span class="code-class">CompletableFuture</span>&lt;<span class="code-class">Void</span>&gt; runAfterBoth(<span class="code-class">CompletionStage</span>&lt;?&gt; other, <span class="code-class">Runnable</span> action)</div>[m
[31m-            <p class="api-desc">Runs a <code>Runnable</code> once both this stage and <code>other</code> complete normally, ignoring both results, and returns a <code>CompletableFuture&lt;Void&gt;</code>. If either stage fails, the action is skipped and the returned stage fails. Use it to trigger a follow-up that depends only on two tasks having finished, such as publishing an event after two writes; for many futures use <code>allOf(...).thenRun(...)</code>.</p>[m
[32m+[m[32m            <p class="api-desc">Runs a <code>Runnable</code> once both this stage and <code>other</code> complete normally, ignoring both results and returns a <code>CompletableFuture&lt;Void&gt;</code>. If either stage fails, the action is skipped and the returned stage fails. Use it to trigger a follow-up that depends only on two tasks having finished, such as publishing an event after two writes; for many futures use <code>allOf(...).thenRun(...)</code>.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> saveOrder = <span class="code-class">CompletableFuture</span>.runAsync(() -&gt; orderRepo.save(o), executor);[m
 <span class="code-keyword">var</span> saveAudit = <span class="code-class">CompletableFuture</span>.runAsync(() -&gt; auditRepo.save(a), executor);[m
 saveOrder.runAfterBoth(saveAudit, () -&gt; events.publish(<span class="code-string">"order.created"</span>))[m
[36m@@ -4124,7 +4124,7 @@[m [msaveOrder.runAfterBoth(saveAudit, () -&gt; events.publish(<span class="code-stri[m
         </div>[m
         <div class="method-entry" id="g29-8">[m
             <div id="tab-g29-8" class="api-sig">&lt;<span class="code-class">U</span>&gt; <span class="code-class">CompletableFuture</span>&lt;<span class="code-class">U</span>&gt; applyToEither(<span class="code-class">CompletionStage</span>&lt;? <span class="code-keyword">extends</span> <span class="code-class">T</span>&gt; other, <span class="code-class">Function</span>&lt;? <span class="code-keyword">super</span> <span class="code-class">T</span>, <span class="code-class">U</span>&gt; fn)</div>[m
[31m-            <p class="api-desc">Returns a new stage that applies <code>fn</code> to the result of whichever of this stage or <code>other</code> completes first; the slower stage keeps running and is not cancelled. Both stages must share a result type, which makes it a natural fit for racing a primary against a replica. Pitfall: the spec gives no guarantee when one input fails, and in practice a fast failure wins the race and fails the result, so add <code>exceptionally</code> to each input if errors should not count.</p>[m
[32m+[m[32m            <p class="api-desc">Returns a new stage that applies <code>fn</code> to the result of whichever of this stage or <code>other</code> completes first; the slower stage keeps running and is not cancelled. Both stages must share a result type, which makes it a natural fit for racing a primary against a replica. Pitfall: the spec gives no guarantee when one input fails and in practice a fast failure wins the race and fails the result, so add <code>exceptionally</code> to each input if errors should not count.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> primary = <span class="code-class">CompletableFuture</span>.supplyAsync(() -&gt; query(primaryDb), executor);[m
 <span class="code-keyword">var</span> replica = <span class="code-class">CompletableFuture</span>.supplyAsync(() -&gt; query(replicaDb), executor);[m
 <span class="code-class">CompletableFuture</span>&lt;<span class="code-class">Integer</span>&gt; rows = primary[m
[36m@@ -4141,7 +4141,7 @@[m [mcache.acceptEither(remote, value -&gt; <span class="code-class">System</span>.ou[m
         </div>[m
         <div class="method-entry" id="g29-10">[m
             <div id="tab-g29-10" class="api-sig"><span class="code-class">CompletableFuture</span>&lt;<span class="code-class">Void</span>&gt; runAfterEither(<span class="code-class">CompletionStage</span>&lt;?&gt; other, <span class="code-class">Runnable</span> action)</div>[m
[31m-            <p class="api-desc">Runs a <code>Runnable</code> once either this stage or <code>other</code> completes normally, ignoring both results, and returns a <code>CompletableFuture&lt;Void&gt;</code>. The action runs only once and the other stage keeps running; as with the other "either" methods, a fast failure may fail the returned stage instead of triggering the action. Use it for signals such as hiding a spinner as soon as one of two tasks is done.</p>[m
[32m+[m[32m            <p class="api-desc">Runs a <code>Runnable</code> once either this stage or <code>other</code> completes normally, ignoring both results and returns a <code>CompletableFuture&lt;Void&gt;</code>. The action runs only once and the other stage keeps running; as with the other "either" methods, a fast failure may fail the returned stage instead of triggering the action. Use it for signals such as hiding a spinner as soon as one of two tasks is done.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> taskA = <span class="code-class">CompletableFuture</span>.runAsync(() -&gt; warmCache(<span class="code-string">"eu"</span>), executor);[m
 <span class="code-keyword">var</span> taskB = <span class="code-class">CompletableFuture</span>.runAsync(() -&gt; warmCache(<span class="code-string">"us"</span>), executor);[m
 taskA.runAfterEither(taskB, () -&gt; <span class="code-class">System</span>.out.println(<span class="code-string">"One region is warm"</span>))[m
[36m@@ -4161,7 +4161,7 @@[m [mtaskA.runAfterEither(taskB, () -&gt; <span class="code-class">System</span>.out.[m
         </div>[m
         <div class="method-entry" id="g29-12">[m
             <div id="tab-g29-12" class="api-sig"><span class="code-keyword">static</span> <span class="code-class">CompletableFuture</span>&lt;<span class="code-class">Object</span>&gt; anyOf(<span class="code-class">CompletableFuture</span>&lt;?&gt;... cfs)</div>[m
[31m-            <p class="api-desc">Returns a <code>CompletableFuture&lt;Object&gt;</code> that completes as soon as any one of the given futures completes, with that future&rsquo;s result or exception. The result type is <code>Object</code>, so you must cast it, and the remaining futures keep running and are not cancelled. Unlike <code>applyToEither</code>, it accepts any number of futures of any type; with no arguments it never completes.</p>[m
[32m+[m[32m            <p class="api-desc">Returns a <code>CompletableFuture&lt;Object&gt;</code> that completes as soon as any one of the given futures completes, with that future&rsquo;s result or exception. The result type is <code>Object</code>, so you must cast it and the remaining futures keep running and are not cancelled. Unlike <code>applyToEither</code>, it accepts any number of futures of any type; with no arguments it never completes.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> mirrorA = <span class="code-class">CompletableFuture</span>.supplyAsync(() -&gt; download(urlA), executor);[m
 <span class="code-keyword">var</span> mirrorB = <span class="code-class">CompletableFuture</span>.supplyAsync(() -&gt; download(urlB), executor);[m
 <span class="code-class">CompletableFuture</span>&lt;<span class="code-class">Object</span>&gt; first = <span class="code-class">CompletableFuture</span>.anyOf(mirrorA, mirrorB);[m
[36m@@ -4215,7 +4215,7 @@[m [mtaskA.runAfterEither(taskB, () -&gt; <span class="code-class">System</span>.out.[m
         </div>[m
         <div class="method-entry" id="g30-3">[m
             <div id="tab-g30-3" class="api-sig">&lt;<span class="code-class">U</span>&gt; <span class="code-class">CompletableFuture</span>&lt;<span class="code-class">U</span>&gt; handle(<span class="code-class">BiFunction</span>&lt;? <span class="code-keyword">super</span> <span class="code-class">T</span>, <span class="code-class">Throwable</span>, ? <span class="code-keyword">extends</span> <span class="code-class">U</span>&gt; fn)</div>[m
[31m-            <p class="api-desc">Runs <code>fn</code> when this stage completes either way, passing <code>(result, null)</code> on success or <code>(null, exception)</code> on failure, and returns a new stage holding whatever <code>fn</code> returns. Unlike <code>exceptionally</code>, it sees both outcomes and can change the result type, which makes it ideal for mapping every outcome into one response object. The new stage completes normally unless <code>fn</code> itself throws; <code>handleAsync</code> runs <code>fn</code> in an executor.</p>[m
[32m+[m[32m            <p class="api-desc">Runs <code>fn</code> when this stage completes either way, passing <code>(result, null)</code> on success or <code>(null, exception)</code> on failure and returns a new stage holding whatever <code>fn</code> returns. Unlike <code>exceptionally</code>, it sees both outcomes and can change the result type, which makes it ideal for mapping every outcome into one response object. The new stage completes normally unless <code>fn</code> itself throws; <code>handleAsync</code> runs <code>fn</code> in an executor.</p>[m
             <div class="code-block"><pre><code><span class="code-class">CompletableFuture</span>&lt;<span class="code-class">Response</span>&gt; response = fetchPriceAsync(<span class="code-string">"ACME"</span>)[m
         .handle((price, ex) -&gt; {[m
             <span class="code-keyword">if</span> (ex != <span class="code-keyword">null</span>) <span class="code-keyword">return</span> <span class="code-class">Response</span>.error(ex.getMessage()); <span class="code-comment">Failure</span>[m
[36m@@ -4225,7 +4225,7 @@[m [mtaskA.runAfterEither(taskB, () -&gt; <span class="code-class">System</span>.out.[m
         </div>[m
         <div class="method-entry" id="g30-4">[m
             <div id="tab-g30-4" class="api-sig"><span class="code-class">CompletableFuture</span>&lt;<span class="code-class">T</span>&gt; whenComplete(<span class="code-class">BiConsumer</span>&lt;? <span class="code-keyword">super</span> <span class="code-class">T</span>, ? <span class="code-keyword">super</span> <span class="code-class">Throwable</span>&gt; action)</div>[m
[31m-            <p class="api-desc">Runs a <code>BiConsumer</code> with <code>(result, exception)</code> when this stage completes, for side effects only, and returns a stage with the same result or exception as this one. It cannot recover: if this stage failed, the returned stage still fails, and if <code>action</code> throws on a successful stage, the returned stage fails with that exception. Use it for logging, metrics or cleanup, and use <code>handle</code> or <code>exceptionally</code> to recover.</p>[m
[32m+[m[32m            <p class="api-desc">Runs a <code>BiConsumer</code> with <code>(result, exception)</code> when this stage completes, for side effects only and returns a stage with the same result or exception as this one. It cannot recover: if this stage failed, the returned stage still fails and if <code>action</code> throws on a successful stage, the returned stage fails with that exception. Use it for logging, metrics or cleanup and use <code>handle</code> or <code>exceptionally</code> to recover.</p>[m
             <div class="code-block"><pre><code><span class="code-class">CompletableFuture</span>&lt;<span class="code-class">Double</span>&gt; price = fetchPriceAsync(<span class="code-string">"ACME"</span>)[m
         .whenComplete((p, ex) -&gt; {[m
             <span class="code-keyword">if</span> (ex != <span class="code-keyword">null</span>) <span class="code-class">System</span>.out.println(<span class="code-string">"Failed: "</span> + ex);[m
[36m@@ -4235,7 +4235,7 @@[m [mtaskA.runAfterEither(taskB, () -&gt; <span class="code-class">System</span>.out.[m
         </div>[m
         <div class="method-entry" id="g30-5">[m
             <div id="tab-g30-5" class="api-sig"><span class="code-class">CompletableFuture</span>&lt;<span class="code-class">T</span>&gt; orTimeout(<span class="code-keyword">long</span> timeout, <span class="code-class">TimeUnit</span> unit)</div>[m
[31m-            <p class="api-desc">Makes this future complete exceptionally with <code>TimeoutException</code> if it has not completed within the given time, and returns this same future (Java 9+). It does not interrupt or stop the underlying work; it only completes the future, so downstream stages see the failure. The timeout fires on an internal scheduler thread, so non-async stages chained after it may run there; keep them light. Combine it with <code>exceptionally</code> to supply a fallback.</p>[m
[32m+[m[32m            <p class="api-desc">Makes this future complete exceptionally with <code>TimeoutException</code> if it has not completed within the given time and returns this same future (Java 9+). It does not interrupt or stop the underlying work; it only completes the future, so downstream stages see the failure. The timeout fires on an internal scheduler thread, so non-async stages chained after it may run there; keep them light. Combine it with <code>exceptionally</code> to supply a fallback.</p>[m
             <div class="code-block"><pre><code><span class="code-class">CompletableFuture</span>&lt;<span class="code-class">Double</span>&gt; price = fetchPriceAsync(<span class="code-string">"ACME"</span>)[m
         .orTimeout(<span class="code-number">2</span>, <span class="code-class">TimeUnit</span>.SECONDS) <span class="code-comment">TimeoutException after 2 s</span>[m
         .exceptionally(ex -&gt; {[m
[36m@@ -4246,7 +4246,7 @@[m [mtaskA.runAfterEither(taskB, () -&gt; <span class="code-class">System</span>.out.[m
         </div>[m
         <div class="method-entry" id="g30-6">[m
             <div id="tab-g30-6" class="api-sig"><span class="code-class">CompletableFuture</span>&lt;<span class="code-class">T</span>&gt; completeOnTimeout(<span class="code-class">T</span> value, <span class="code-keyword">long</span> timeout, <span class="code-class">TimeUnit</span> unit)</div>[m
[31m-            <p class="api-desc">If this future has not completed within the given time, completes it normally with the supplied fallback value, and returns this same future (Java 9+). Like <code>orTimeout</code>, it does not stop the underlying task, which keeps running and whose late result is ignored. Use it when a default is acceptable, such as showing cached or placeholder data instead of failing; failures that happen before the deadline still propagate as usual.</p>[m
[32m+[m[32m            <p class="api-desc">If this future has not completed within the given time, completes it normally with the supplied fallback value and returns this same future (Java 9+). Like <code>orTimeout</code>, it does not stop the underlying task, which keeps running and whose late result is ignored. Use it when a default is acceptable, such as showing cached or placeholder data instead of failing; failures that happen before the deadline still propagate as usual.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> fallback = <span class="code-class">List</span>.of(<span class="code-string">"bestsellers"</span>); <span class="code-comment">Shown if the service is slow</span>[m
 <span class="code-class">CompletableFuture</span>&lt;<span class="code-class">List</span>&lt;<span class="code-class">String</span>&gt;&gt; recs = fetchRecommendationsAsync(userId)[m
         .completeOnTimeout(fallback, <span class="code-number">300</span>, <span class="code-class">TimeUnit</span>.MILLISECONDS);[m
[36m@@ -4254,7 +4254,7 @@[m [mtaskA.runAfterEither(taskB, () -&gt; <span class="code-class">System</span>.out.[m
         </div>[m
     </div>[m
     <div class="intro">[m
[31m-        <p class="minor-heading"><strong>Completion, cancellation, and introspection</strong></p>[m
[32m+[m[32m        <p class="minor-heading"><strong>Completion, cancellation and introspection</strong></p>[m
     </div>[m
     <div class="method-picker">[m
         <select aria-label="CompletableFuture completion, cancellation and introspection" hidden>[m
[36m@@ -4277,7 +4277,7 @@[m [mtaskA.runAfterEither(taskB, () -&gt; <span class="code-class">System</span>.out.[m
         </select>[m
         <div class="method-entry" id="g31-0">[m
             <div id="tab-g31-0" class="api-sig"><span class="code-keyword">boolean</span> complete(<span class="code-class">T</span> value)</div>[m
[31m-            <p class="api-desc">Completes the future normally with the given value if it is not already complete, and returns <code>true</code> only if this call caused the transition. Waiting <code>get()</code> and <code>join()</code> callers wake up and pending dependent stages run, typically in the calling thread. Because only the first completion wins, it is safe to race several completers, such as a callback and a timeout; later calls simply return <code>false</code>.</p>[m
[32m+[m[32m            <p class="api-desc">Completes the future normally with the given value if it is not already complete and returns <code>true</code> only if this call caused the transition. Waiting <code>get()</code> and <code>join()</code> callers wake up and pending dependent stages run, typically in the calling thread. Because only the first completion wins, it is safe to race several completers, such as a callback and a timeout; later calls simply return <code>false</code>.</p>[m
             <div class="code-block"><pre><code><span class="code-class">CompletableFuture</span>&lt;<span class="code-class">String</span>&gt; promise = <span class="code-keyword">new</span> <span class="code-class">CompletableFuture</span>&lt;&gt;();[m
 promise.thenAccept(r -&gt; <span class="code-class">System</span>.out.println(<span class="code-string">"Got "</span> + r)); <span class="code-comment">Runs on complete()</span>[m
 <span class="code-keyword">boolean</span> first = promise.complete(<span class="code-string">"result"</span>); <span class="code-comment">Prints "Got result"</span>[m
[36m@@ -4286,7 +4286,7 @@[m [mpromise.thenAccept(r -&gt; <span class="code-class">System</span>.out.println(<s[m
         </div>[m
         <div class="method-entry" id="g31-1">[m
             <div id="tab-g31-1" class="api-sig"><span class="code-keyword">boolean</span> completeExceptionally(<span class="code-class">Throwable</span> ex)</div>[m
[31m-            <p class="api-desc">Completes the future with the given exception if it is not already complete, returning <code>true</code> only if this call caused the transition. Waiting <code>join()</code> calls then throw <code>CompletionException</code> and <code>get()</code> calls throw <code>ExecutionException</code>, both wrapping <code>ex</code>, and dependent stages see the failure. Use it to propagate errors from callback APIs, or to fail a promise when a deadline or validation check fails.</p>[m
[32m+[m[32m            <p class="api-desc">Completes the future with the given exception if it is not already complete, returning <code>true</code> only if this call caused the transition. Waiting <code>join()</code> calls then throw <code>CompletionException</code> and <code>get()</code> calls throw <code>ExecutionException</code>, both wrapping <code>ex</code> and dependent stages see the failure. Use it to propagate errors from callback APIs, or to fail a promise when a deadline or validation check fails.</p>[m
             <div class="code-block"><pre><code><span class="code-class">CompletableFuture</span>&lt;<span class="code-class">String</span>&gt; promise = <span class="code-keyword">new</span> <span class="code-class">CompletableFuture</span>&lt;&gt;();[m
 legacyClient.fetch(url, body -&gt; promise.complete(body),[m
         error -&gt; promise.completeExceptionally(error)); <span class="code-comment">Bridge the error path</span>[m
[36m@@ -4298,7 +4298,7 @@[m [mlegacyClient.fetch(url, body -&gt; promise.complete(body),[m
         </div>[m
         <div class="method-entry" id="g31-2">[m
             <div id="tab-g31-2" class="api-sig"><span class="code-keyword">boolean</span> cancel(<span class="code-keyword">boolean</span> mayInterruptIfRunning)</div>[m
[31m-            <p class="api-desc">Completes the future exceptionally with a <code>CancellationException</code> if it is not already complete, and returns <code>true</code> if it is now cancelled. Unlike <code>Future.cancel</code>, the <code>mayInterruptIfRunning</code> flag has no effect: the running task is never interrupted and keeps executing. <code>join()</code> and <code>get()</code> then throw <code>CancellationException</code>, and dependent stages fail with a <code>CompletionException</code> caused by it. To actually stop the work, have the task check a flag or cancel the underlying operation.</p>[m
[32m+[m[32m            <p class="api-desc">Completes the future exceptionally with a <code>CancellationException</code> if it is not already complete and returns <code>true</code> if it is now cancelled. Unlike <code>Future.cancel</code>, the <code>mayInterruptIfRunning</code> flag has no effect: the running task is never interrupted and keeps executing. <code>join()</code> and <code>get()</code> then throw <code>CancellationException</code> and dependent stages fail with a <code>CompletionException</code> caused by it. To actually stop the work, have the task check a flag or cancel the underlying operation.</p>[m
             <div class="code-block"><pre><code><span class="code-class">CompletableFuture</span>&lt;<span class="code-class">Report</span>&gt; report =[m
         <span class="code-class">CompletableFuture</span>.supplyAsync(() -&gt; buildReport(), executor);[m
 <span class="code-keyword">boolean</span> cancelled = report.cancel(<span class="code-keyword">true</span>); <span class="code-comment">Flag ignored, no interrupt</span>[m
[36m@@ -4307,7 +4307,7 @@[m [mreport.join(); <span class="code-comment">Throws CancellationException</span></c[m
         </div>[m
         <div class="method-entry" id="g31-3">[m
             <div id="tab-g31-3" class="api-sig"><span class="code-class">T</span> get() <span class="code-keyword">throws</span> <span class="code-class">InterruptedException</span>, <span class="code-class">ExecutionException</span></div>[m
[31m-            <p class="api-desc">Blocks until the future completes and returns its result, following the <code>Future</code> contract with checked exceptions: <code>ExecutionException</code> wrapping the failure cause, <code>InterruptedException</code> if the waiting thread is interrupted, and an unchecked <code>CancellationException</code> if cancelled. The timed overload <code>get(timeout, unit)</code> adds <code>TimeoutException</code>. Prefer <code>join()</code> inside lambdas and streams, and <code>get()</code> when you want the compiler to force interrupt handling.</p>[m
[32m+[m[32m            <p class="api-desc">Blocks until the future completes and returns its result, following the <code>Future</code> contract with checked exceptions: <code>ExecutionException</code> wrapping the failure cause, <code>InterruptedException</code> if the waiting thread is interrupted and an unchecked <code>CancellationException</code> if cancelled. The timed overload <code>get(timeout, unit)</code> adds <code>TimeoutException</code>. Prefer <code>join()</code> inside lambdas and streams and <code>get()</code> when you want the compiler to force interrupt handling.</p>[m
             <div class="code-block"><pre><code><span class="code-class">CompletableFuture</span>&lt;<span class="code-class">String</span>&gt; promise =[m
         <span class="code-class">CompletableFuture</span>.supplyAsync(() -&gt; fetchProfile(<span class="code-number">42</span>), executor);[m
 <span class="code-keyword">try</span> {[m
[36m@@ -4321,7 +4321,7 @@[m [mreport.join(); <span class="code-comment">Throws CancellationException</span></c[m
         </div>[m
         <div class="method-entry" id="g31-4">[m
             <div id="tab-g31-4" class="api-sig"><span class="code-class">T</span> join()</div>[m
[31m-            <p class="api-desc">Blocks until the future completes and returns its result, like <code>get()</code> but without checked exceptions. A failure is thrown as an unchecked <code>CompletionException</code> wrapping the cause and cancellation as <code>CancellationException</code>, and the wait is not interruptible. Its unchecked signature makes it convenient in streams and lambdas, such as collecting results after <code>allOf</code>; avoid calling it inside async callbacks, where blocking wastes pool threads.</p>[m
[32m+[m[32m            <p class="api-desc">Blocks until the future completes and returns its result, like <code>get()</code> but without checked exceptions. A failure is thrown as an unchecked <code>CompletionException</code> wrapping the cause and cancellation as <code>CancellationException</code> and the wait is not interruptible. Its unchecked signature makes it convenient in streams and lambdas, such as collecting results after <code>allOf</code>; avoid calling it inside async callbacks, where blocking wastes pool threads.</p>[m
             <div class="code-block"><pre><code><span class="code-class">List</span>&lt;<span class="code-class">CompletableFuture</span>&lt;<span class="code-class">Integer</span>&gt;&gt; futures = <span class="code-class">List</span>.of([m
         <span class="code-class">CompletableFuture</span>.supplyAsync(() -&gt; countUsers(), executor),[m
         <span class="code-class">CompletableFuture</span>.supplyAsync(() -&gt; countOrders(), executor));[m
[36m@@ -4342,7 +4342,7 @@[m [mstatus.join();[m
         <div class="method-entry" id="g31-6">[m
             <div id="tab-g31-6" class="api-sig"><span class="code-keyword">boolean</span> isDone()[m
 <span class="code-keyword">boolean</span> isCancelled()</div>[m
[31m-            <p class="api-desc"><code>isDone()</code> returns <code>true</code> once the future has completed in any way: normally, exceptionally or by cancellation. <code>isCancelled()</code> returns <code>true</code> only if it completed with a <code>CancellationException</code>, for example through <code>cancel()</code>. Both are non-blocking snapshots that can change right after you read them, so prefer callbacks such as <code>thenAccept</code> or <code>whenComplete</code> over polling, and use <code>state()</code> (Java 19+) for a single combined answer.</p>[m
[32m+[m[32m            <p class="api-desc"><code>isDone()</code> returns <code>true</code> once the future has completed in any way: normally, exceptionally or by cancellation. <code>isCancelled()</code> returns <code>true</code> only if it completed with a <code>CancellationException</code>, for example through <code>cancel()</code>. Both are non-blocking snapshots that can change right after you read them, so prefer callbacks such as <code>thenAccept</code> or <code>whenComplete</code> over polling and use <code>state()</code> (Java 19+) for a single combined answer.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> f = <span class="code-keyword">new</span> <span class="code-class">CompletableFuture</span>&lt;<span class="code-class">String</span>&gt;();[m
 <span class="code-class">System</span>.out.println(f.isDone() + <span class="code-string">" "</span> + f.isCancelled()); <span class="code-comment">false false</span>[m
 f.cancel(<span class="code-keyword">false</span>);[m
[36m@@ -4362,7 +4362,7 @@[m [mtask.exceptionally(ex -&gt; <span class="code-keyword">null</span>).join(); <spa[m
         </div>[m
         <div class="method-entry" id="g31-8">[m
             <div id="tab-g31-8" class="api-sig"><span class="code-keyword">int</span> getNumberOfDependents()</div>[m
[31m-            <p class="api-desc">Returns an estimate of how many stages, callbacks or blocked <code>join()</code> and <code>get()</code> waiters are currently registered on this future and waiting for it to complete. The count is approximate, can change at any moment, and drops to zero once the future completes and runs its dependents. It is meant for monitoring and debugging, such as spotting promises that many callers are stuck on, never for synchronization logic.</p>[m
[32m+[m[32m            <p class="api-desc">Returns an estimate of how many stages, callbacks or blocked <code>join()</code> and <code>get()</code> waiters are currently registered on this future and waiting for it to complete. The count is approximate, can change at any moment and drops to zero once the future completes and runs its dependents. It is meant for monitoring and debugging, such as spotting promises that many callers are stuck on, never for synchronization logic.</p>[m
             <div class="code-block"><pre><code><span class="code-class">CompletableFuture</span>&lt;<span class="code-class">String</span>&gt; promise = <span class="code-keyword">new</span> <span class="code-class">CompletableFuture</span>&lt;&gt;();[m
 promise.thenApply(<span class="code-class">String</span>::trim);[m
 promise.thenAccept(<span class="code-class">System</span>.out::println);[m
[36m@@ -4381,7 +4381,7 @@[m [mpromise.obtrudeValue(<span class="code-string">"fresh"</span>); <span class="cod[m
         </div>[m
         <div class="method-entry" id="g31-10">[m
             <div id="tab-g31-10" class="api-sig"><span class="code-keyword">void</span> obtrudeException(<span class="code-class">Throwable</span> ex)</div>[m
[31m-            <p class="api-desc">Forcibly makes the future exceptional with the given throwable, even if it has already completed, so later <code>join()</code> and <code>get()</code> calls throw; a <code>null</code> argument throws <code>NullPointerException</code>. As with <code>obtrudeValue</code>, stages that already ran keep their old outcome, which can leave observers inconsistent. Reserve it for advanced recovery, such as invalidating a shared future after detecting corrupted state, and prefer <code>completeExceptionally()</code> otherwise.</p>[m
[32m+[m[32m            <p class="api-desc">Forcibly makes the future exceptional with the given throwable, even if it has already completed, so later <code>join()</code> and <code>get()</code> calls throw; a <code>null</code> argument throws <code>NullPointerException</code>. As with <code>obtrudeValue</code>, stages that already ran keep their old outcome, which can leave observers inconsistent. Reserve it for advanced recovery, such as invalidating a shared future after detecting corrupted state and prefer <code>completeExceptionally()</code> otherwise.</p>[m
             <div class="code-block"><pre><code><span class="code-class">CompletableFuture</span>&lt;<span class="code-class">Config</span>&gt; config = <span class="code-class">CompletableFuture</span>.completedFuture(loaded);[m
 <span class="code-keyword">if</span> (!config.join().isValid()) {[m
     config.obtrudeException(<span class="code-keyword">new</span> <span class="code-class">IllegalStateException</span>(<span class="code-string">"Corrupt config"</span>));[m
[36m@@ -4563,7 +4563,7 @@[m [mthreads.forEach(<span class="code-class">Thread</span>::start);[m
         </div>[m
         <div class="method-entry" id="g34-1">[m
             <div id="tab-g34-1" class="api-sig"><span class="code-keyword">void</span> set(<span class="code-keyword">int</span> newValue)</div>[m
[31m-            <p class="api-desc">Writes the new value with volatile write semantics: it becomes visible to all threads at once, and any writes made before the <code>set()</code> are visible to a thread that later reads this value with <code>get()</code>. It returns nothing and never blocks. Use it for unconditional overwrites such as resetting a counter or publishing a new state; if the new value depends on the old one, use <code>updateAndGet()</code> or <code>compareAndSet()</code> instead, because <code>set(get() + 1)</code> loses updates under contention.</p>[m
[32m+[m[32m            <p class="api-desc">Writes the new value with volatile write semantics: it becomes visible to all threads at once and any writes made before the <code>set()</code> are visible to a thread that later reads this value with <code>get()</code>. It returns nothing and never blocks. Use it for unconditional overwrites such as resetting a counter or publishing a new state; if the new value depends on the old one, use <code>updateAndGet()</code> or <code>compareAndSet()</code> instead, because <code>set(get() + 1)</code> loses updates under contention.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> status = <span class="code-keyword">new</span> <span class="code-class">AtomicInteger</span>(<span class="code-number">0</span>); <span class="code-comment">0 = idle, 1 = running</span>[m
 status.set(<span class="code-number">1</span>); <span class="code-comment">Volatile write: visible to all threads at once</span>[m
 <span class="code-class">System</span>.out.println(status.get()); <span class="code-comment">1</span>[m
[36m@@ -4571,7 +4571,7 @@[m [mstatus.set(status.get() + <span class="code-number">1</span>); <span class="code[m
         </div>[m
         <div class="method-entry" id="g34-2">[m
             <div id="tab-g34-2" class="api-sig"><span class="code-keyword">void</span> lazySet(<span class="code-keyword">int</span> newValue)</div>[m
[31m-            <p class="api-desc">Writes the new value with release semantics only (the same as <code>setRelease()</code>), so earlier reads and writes cannot be reordered after it, but the store itself may become visible to other threads slightly later than a volatile <code>set()</code>. It never blocks and is cheaper than <code>set()</code> because it avoids a full fence. Use it when a value only needs to become visible eventually, such as clearing a slot after use, and never rely on it for immediate cross-thread signalling.</p>[m
[32m+[m[32m            <p class="api-desc">Writes the new value with release semantics only (the same as <code>setRelease()</code>), so earlier reads and writes cannot be reordered after it, but the store itself may become visible to other threads slightly later than a volatile <code>set()</code>. It never blocks and is cheaper than <code>set()</code> because it avoids a full fence. Use it when a value only needs to become visible eventually, such as clearing a slot after use and never rely on it for immediate cross-thread signalling.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> slot = <span class="code-keyword">new</span> <span class="code-class">AtomicInteger</span>(<span class="code-number">42</span>);[m
 <span class="code-keyword">int</span> taken = slot.get(); <span class="code-comment">Consume the value first</span>[m
 <span class="code-class">System</span>.out.println(<span class="code-string">"Processing "</span> + taken); <span class="code-comment">Processing 42</span>[m
[36m@@ -4589,7 +4589,7 @@[m [mrequests.addAndGet(<span class="code-number">42</span>); <span class="code-comme[m
         </div>[m
         <div class="method-entry" id="g34-4">[m
             <div id="tab-g34-4" class="api-sig"><span class="code-keyword">boolean</span> compareAndSet(<span class="code-keyword">int</span> expectedValue, <span class="code-keyword">int</span> newValue)</div>[m
[31m-            <p class="api-desc">Atomically sets the value to <code>newValue</code> only if it currently equals <code>expectedValue</code>, returning <code>true</code> on success or <code>false</code> if another thread changed it first. It has full volatile memory semantics, never blocks, and never fails spuriously, unlike <code>weakCompareAndSetPlain()</code>. This compare-and-swap (CAS) is the building block of lock-free code: use it in a retry loop that re-reads the value after a failure, or as a one-shot guard such as letting only the first thread start a service.</p>[m
[32m+[m[32m            <p class="api-desc">Atomically sets the value to <code>newValue</code> only if it currently equals <code>expectedValue</code>, returning <code>true</code> on success or <code>false</code> if another thread changed it first. It has full volatile memory semantics, never blocks and never fails spuriously, unlike <code>weakCompareAndSetPlain()</code>. This compare-and-swap (CAS) is the building block of lock-free code: use it in a retry loop that re-reads the value after a failure, or as a one-shot guard such as letting only the first thread start a service.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> state = <span class="code-keyword">new</span> <span class="code-class">AtomicInteger</span>(<span class="code-number">0</span>); <span class="code-comment">0 = new, 1 = started</span>[m
 <span class="code-keyword">if</span> (state.compareAndSet(<span class="code-number">0</span>, <span class="code-number">1</span>)) {[m
     <span class="code-class">System</span>.out.println(<span class="code-string">"Started"</span>); <span class="code-comment">Only one thread ever gets here</span>[m
[36m@@ -4599,7 +4599,7 @@[m [mrequests.addAndGet(<span class="code-number">42</span>); <span class="code-comme[m
         </div>[m
         <div class="method-entry" id="g34-5">[m
             <div id="tab-g34-5" class="api-sig"><span class="code-keyword">int</span> compareAndExchange(<span class="code-keyword">int</span> expectedValue, <span class="code-keyword">int</span> newValue)</div>[m
[31m-            <p class="api-desc">Atomically sets the value to <code>newValue</code> if it currently equals <code>expectedValue</code>, and returns the witness value, meaning the value actually found before the attempt. The exchange succeeded exactly when the returned value equals <code>expectedValue</code>. It has volatile memory semantics and never blocks. Prefer it over <code>compareAndSet()</code> in retry loops, because a failed attempt hands you the fresh current value directly, saving an extra <code>get()</code> call.</p>[m
[32m+[m[32m            <p class="api-desc">Atomically sets the value to <code>newValue</code> if it currently equals <code>expectedValue</code> and returns the witness value, meaning the value actually found before the attempt. The exchange succeeded exactly when the returned value equals <code>expectedValue</code>. It has volatile memory semantics and never blocks. Prefer it over <code>compareAndSet()</code> in retry loops, because a failed attempt hands you the fresh current value directly, saving an extra <code>get()</code> call.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> counter = <span class="code-keyword">new</span> <span class="code-class">AtomicInteger</span>(<span class="code-number">5</span>);[m
 <span class="code-keyword">int</span> current = counter.get();[m
 <span class="code-keyword">while</span> (<span class="code-keyword">true</span>) {[m
[36m@@ -4611,7 +4611,7 @@[m [mrequests.addAndGet(<span class="code-number">42</span>); <span class="code-comme[m
         </div>[m
         <div class="method-entry" id="g34-6">[m
             <div id="tab-g34-6" class="api-sig"><span class="code-keyword">boolean</span> weakCompareAndSetPlain(<span class="code-keyword">int</span> expectedValue, <span class="code-keyword">int</span> newValue)</div>[m
[31m-            <p class="api-desc">Attempts to set the value to <code>newValue</code> if it currently equals <code>expectedValue</code>, returning <code>true</code> on success, but it may fail spuriously even when the values match, and it uses plain memory semantics with no ordering or visibility guarantees for surrounding reads and writes. It never blocks. Always call it in a retry loop, and use it only in performance-critical code where ordering is provided elsewhere; for normal lock-free code use <code>compareAndSet()</code> or <code>weakCompareAndSetVolatile()</code>.</p>[m
[32m+[m[32m            <p class="api-desc">Attempts to set the value to <code>newValue</code> if it currently equals <code>expectedValue</code>, returning <code>true</code> on success, but it may fail spuriously even when the values match and it uses plain memory semantics with no ordering or visibility guarantees for surrounding reads and writes. It never blocks. Always call it in a retry loop and use it only in performance-critical code where ordering is provided elsewhere; for normal lock-free code use <code>compareAndSet()</code> or <code>weakCompareAndSetVolatile()</code>.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> counter = <span class="code-keyword">new</span> <span class="code-class">AtomicInteger</span>(<span class="code-number">7</span>);[m
 <span class="code-keyword">int</span> current = counter.get();[m
 <span class="code-keyword">while</span> (!counter.weakCompareAndSetPlain(current, current + <span class="code-number">1</span>)) {[m
[36m@@ -4621,7 +4621,7 @@[m [mrequests.addAndGet(<span class="code-number">42</span>); <span class="code-comme[m
         </div>[m
         <div class="method-entry" id="g34-7">[m
             <div id="tab-g34-7" class="api-sig"><span class="code-keyword">int</span> getAndIncrement()</div>[m
[31m-            <p class="api-desc">Atomically adds one to the value and returns the value it held before the increment, the atomic equivalent of <code>counter++</code>. It has volatile memory semantics, never blocks, and never loses an update under contention. Use it to hand out unique sequence numbers or ticket IDs starting from the initial value; on overflow it silently wraps from <code>Integer.MAX_VALUE</code> to <code>Integer.MIN_VALUE</code>, so prefer <code>AtomicLong</code> for long-lived ID generators.</p>[m
[32m+[m[32m            <p class="api-desc">Atomically adds one to the value and returns the value it held before the increment, the atomic equivalent of <code>counter++</code>. It has volatile memory semantics, never blocks and never loses an update under contention. Use it to hand out unique sequence numbers or ticket IDs starting from the initial value; on overflow it silently wraps from <code>Integer.MAX_VALUE</code> to <code>Integer.MIN_VALUE</code>, so prefer <code>AtomicLong</code> for long-lived ID generators.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> nextId = <span class="code-keyword">new</span> <span class="code-class">AtomicInteger</span>(<span class="code-number">1</span>);[m
 <span class="code-keyword">int</span> first = nextId.getAndIncrement(); <span class="code-comment">Returns 1, value is now 2</span>[m
 <span class="code-keyword">int</span> second = nextId.getAndIncrement(); <span class="code-comment">Returns 2, value is now 3</span>[m
[36m@@ -4684,7 +4684,7 @@[m [mtotal = bytesSent.addAndGet(<span class="code-number">500</span>); <span class="[m
         </div>[m
         <div class="method-entry" id="g34-13">[m
             <div id="tab-g34-13" class="api-sig"><span class="code-keyword">int</span> getAndUpdate(<span class="code-class">IntUnaryOperator</span> updateFunction)</div>[m
[31m-            <p class="api-desc">Atomically applies <code>updateFunction</code> to the current value, stores the result, and returns the value it held before the update. Internally it retries with compare-and-set, so under contention the function may be called several times and must be side-effect free and fast. It never blocks. Use it for arbitrary transformations that the fixed arithmetic methods cannot express, such as setting bit flags, when the previous value is what you need.</p>[m
[32m+[m[32m            <p class="api-desc">Atomically applies <code>updateFunction</code> to the current value, stores the result and returns the value it held before the update. Internally it retries with compare-and-set, so under contention the function may be called several times and must be side-effect free and fast. It never blocks. Use it for arbitrary transformations that the fixed arithmetic methods cannot express, such as setting bit flags, when the previous value is what you need.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> flags = <span class="code-keyword">new</span> <span class="code-class">AtomicInteger</span>(0b0001);[m
 <span class="code-keyword">int</span> before = flags.getAndUpdate(f -&gt; f | 0b0100); <span class="code-comment">Set bit 2 atomically</span>[m
 <span class="code-class">System</span>.out.println(<span class="code-class">Integer</span>.toBinaryString(before)); <span class="code-comment">1</span>[m
[36m@@ -4692,7 +4692,7 @@[m [mtotal = bytesSent.addAndGet(<span class="code-number">500</span>); <span class="[m
         </div>[m
         <div class="method-entry" id="g34-14">[m
             <div id="tab-g34-14" class="api-sig"><span class="code-keyword">int</span> updateAndGet(<span class="code-class">IntUnaryOperator</span> updateFunction)</div>[m
[31m-            <p class="api-desc">Atomically applies <code>updateFunction</code> to the current value, stores the result, and returns the updated value. It retries with compare-and-set under contention, so the function may run more than once and must be side-effect free. It never blocks. Use it for bounded or conditional updates, such as a counter capped at a maximum or a value that must never drop below zero, which would otherwise need a hand-written <code>compareAndSet()</code> loop.</p>[m
[32m+[m[32m            <p class="api-desc">Atomically applies <code>updateFunction</code> to the current value, stores the result and returns the updated value. It retries with compare-and-set under contention, so the function may run more than once and must be side-effect free. It never blocks. Use it for bounded or conditional updates, such as a counter capped at a maximum or a value that must never drop below zero, which would otherwise need a hand-written <code>compareAndSet()</code> loop.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> level = <span class="code-keyword">new</span> <span class="code-class">AtomicInteger</span>(<span class="code-number">99</span>);[m
 <span class="code-keyword">int</span> max = <span class="code-number">100</span>;[m
 <span class="code-keyword">int</span> a = level.updateAndGet(x -&gt; <span class="code-class">Math</span>.min(x + <span class="code-number">1</span>, max)); <span class="code-comment">100</span>[m
[36m@@ -4701,7 +4701,7 @@[m [mtotal = bytesSent.addAndGet(<span class="code-number">500</span>); <span class="[m
         </div>[m
         <div class="method-entry" id="g34-15">[m
             <div id="tab-g34-15" class="api-sig"><span class="code-keyword">int</span> getAndAccumulate(<span class="code-keyword">int</span> x, <span class="code-class">IntBinaryOperator</span> accumulatorFunction)</div>[m
[31m-            <p class="api-desc">Atomically combines the current value with <code>x</code> using <code>accumulatorFunction</code>, called with the current value first and <code>x</code> second, stores the result, and returns the value it held before. Like <code>getAndUpdate()</code>, it retries under contention, so the function must be side-effect free. It never blocks. Passing the input as <code>x</code> instead of capturing it in a lambda lets you reuse one method reference such as <code>Math::max</code>, which is handy for tracking peaks.</p>[m
[32m+[m[32m            <p class="api-desc">Atomically combines the current value with <code>x</code> using <code>accumulatorFunction</code>, called with the current value first and <code>x</code> second, stores the result and returns the value it held before. Like <code>getAndUpdate()</code>, it retries under contention, so the function must be side-effect free. It never blocks. Passing the input as <code>x</code> instead of capturing it in a lambda lets you reuse one method reference such as <code>Math::max</code>, which is handy for tracking peaks.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> peak = <span class="code-keyword">new</span> <span class="code-class">AtomicInteger</span>(<span class="code-number">10</span>);[m
 <span class="code-keyword">int</span> observed = <span class="code-number">25</span>;[m
 <span class="code-keyword">int</span> before = peak.getAndAccumulate(observed, <span class="code-class">Math</span>::max);[m
[36m@@ -4710,7 +4710,7 @@[m [mtotal = bytesSent.addAndGet(<span class="code-number">500</span>); <span class="[m
         </div>[m
         <div class="method-entry" id="g34-16">[m
             <div id="tab-g34-16" class="api-sig"><span class="code-keyword">int</span> accumulateAndGet(<span class="code-keyword">int</span> x, <span class="code-class">IntBinaryOperator</span> accumulatorFunction)</div>[m
[31m-            <p class="api-desc">Atomically combines the current value with <code>x</code> using <code>accumulatorFunction</code>, stores the result, and returns the updated value. The function receives the current value as its first argument and <code>x</code> as its second, may be re-applied under contention, and must be side-effect free. It never blocks. Use it for running maximums, minimums, or other combinations shared across threads, such as tracking the highest latency seen so far.</p>[m
[32m+[m[32m            <p class="api-desc">Atomically combines the current value with <code>x</code> using <code>accumulatorFunction</code>, stores the result and returns the updated value. The function receives the current value as its first argument and <code>x</code> as its second, may be re-applied under contention and must be side-effect free. It never blocks. Use it for running maximums, minimums, or other combinations shared across threads, such as tracking the highest latency seen so far.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> maxLatency = <span class="code-keyword">new</span> <span class="code-class">AtomicLong</span>();[m
 <span class="code-keyword">long</span>[] samples = {<span class="code-number">120</span>, <span class="code-number">340</span>, <span class="code-number">95</span>};[m
 <span class="code-keyword">for</span> (<span class="code-keyword">long</span> ms : samples) {[m
[36m@@ -4720,7 +4720,7 @@[m [mtotal = bytesSent.addAndGet(<span class="code-number">500</span>); <span class="[m
         </div>[m
     </div>[m
     <div class="intro">[m
[31m-        <p>Additional access variants include <code>getPlain()</code>, <code>setPlain()</code>, <code>getOpaque()</code>, <code>setOpaque()</code>, <code>getAcquire()</code>, <code>setRelease()</code>, <code>compareAndExchangeAcquire()</code>, <code>compareAndExchangeRelease()</code>, and weak CAS variants with different memory semantics.</p>[m
[32m+[m[32m        <p>Additional access variants include <code>getPlain()</code>, <code>setPlain()</code>, <code>getOpaque()</code>, <code>setOpaque()</code>, <code>getAcquire()</code>, <code>setRelease()</code>, <code>compareAndExchangeAcquire()</code>, <code>compareAndExchangeRelease()</code> and weak CAS variants with different memory semantics.</p>[m
         <p class="minor-heading"><strong>10.3 CAS example from scratch</strong></p>[m
         <p>CAS compares a value against an expected value and updates it only if the comparison succeeds.</p>[m
     </div>[m
[36m@@ -4816,7 +4816,7 @@[m [mtotal = bytesSent.addAndGet(<span class="code-number">500</span>); <span class="[m
                 <tr><td>Best suited for</td><td>Sequence numbers, state variables</td><td>Metrics and counters</td></tr>[m
             </tbody>[m
         </table></div>[m
[31m-        <p>Other <code>LongAdder</code> methods include <code>add(long)</code>, <code>decrement()</code>, <code>reset()</code>, and <code>sumThenReset()</code>.</p>[m
[32m+[m[32m        <p>Other <code>LongAdder</code> methods include <code>add(long)</code>, <code>decrement()</code>, <code>reset()</code> and <code>sumThenReset()</code>.</p>[m
         <p class="minor-heading"><strong>10.6 <code>LongAccumulator</code></strong></p>[m
     </div>[m
     <div class="section code-section">[m
[36m@@ -4886,7 +4886,7 @@[m [marray.compareAndSet(<span class="code-number">0</span>, <span class="code-number[m
     <div class="subheading">11. <code>VarHandle</code> — Advanced atomic and memory operations</div>[m
     <div class="intro">[m
         <p><code>java.lang.invoke.VarHandle</code> provides typed variable access with different ordering modes.</p>[m
[31m-        <p>It can operate on instance fields, static fields, and array elements without necessarily wrapping each value in an atomic class.</p>[m
[32m+[m[32m        <p>It can operate on instance fields, static fields and array elements without necessarily wrapping each value in an atomic class.</p>[m
         <p class="minor-heading"><strong>11.1 VarHandle method reference</strong></p>[m
         <div class="gpt-table-wrap"><table class="gpt-table">[m
             <thead><tr><th>Category</th><th>Important APIs</th></tr></thead>[m
[36m@@ -5058,7 +5058,7 @@[m [marray.compareAndSet(<span class="code-number">0</span>, <span class="code-number[m
         </select>[m
         <div class="method-entry" id="g40-0">[m
             <div id="tab-g40-0" class="api-sig"><span class="code-class">V</span> putIfAbsent(<span class="code-class">K</span> key, <span class="code-class">V</span> value)</div>[m
[31m-            <p class="api-desc">Atomically inserts the key with the given value only if the key has no mapping, and returns the existing value if one was present or <code>null</code> if the insert happened. The check and insert are one atomic step, unlike a separate <code>containsKey()</code> followed by <code>put()</code>, and it never blocks readers. The pitfall is that the value is always constructed even when it is discarded, so use <code>computeIfAbsent()</code> when creating it is expensive. Null keys and values are not allowed.</p>[m
[32m+[m[32m            <p class="api-desc">Atomically inserts the key with the given value only if the key has no mapping and returns the existing value if one was present or <code>null</code> if the insert happened. The check and insert are one atomic step, unlike a separate <code>containsKey()</code> followed by <code>put()</code> and it never blocks readers. The pitfall is that the value is always constructed even when it is discarded, so use <code>computeIfAbsent()</code> when creating it is expensive. Null keys and values are not allowed.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> sessions = <span class="code-keyword">new</span> <span class="code-class">ConcurrentHashMap</span>&lt;<span class="code-class">String</span>, <span class="code-class">String</span>&gt;();[m
 <span class="code-class">String</span> prev1 = sessions.putIfAbsent(<span class="code-string">"user-1"</span>, <span class="code-string">"session-A"</span>); <span class="code-comment">null: inserted</span>[m
 <span class="code-class">String</span> prev2 = sessions.putIfAbsent(<span class="code-string">"user-1"</span>, <span class="code-string">"session-B"</span>); <span class="code-comment">"session-A"</span>[m
[36m@@ -5067,7 +5067,7 @@[m [marray.compareAndSet(<span class="code-number">0</span>, <span class="code-number[m
         </div>[m
         <div class="method-entry" id="g40-1">[m
             <div id="tab-g40-1" class="api-sig"><span class="code-class">V</span> computeIfAbsent(<span class="code-class">K</span> key, <span class="code-class">Function</span>&lt;? <span class="code-keyword">super</span> <span class="code-class">K</span>, ? <span class="code-keyword">extends</span> <span class="code-class">V</span>&gt; mappingFunction)</div>[m
[31m-            <p class="api-desc">If the key has no mapping, atomically calls <code>mappingFunction</code> to create a value, stores it, and returns it; otherwise it returns the existing value without calling the function. The function runs at most once per absent key, and other updates to the same bin block while it runs, so it must be short and must never modify the map itself. It is the standard way to lazily create per-key objects such as caches, lists or counters; if the function returns <code>null</code>, nothing is stored.</p>[m
[32m+[m[32m            <p class="api-desc">If the key has no mapping, atomically calls <code>mappingFunction</code> to create a value, stores it and returns it; otherwise it returns the existing value without calling the function. The function runs at most once per absent key and other updates to the same bin block while it runs, so it must be short and must never modify the map itself. It is the standard way to lazily create per-key objects such as caches, lists or counters; if the function returns <code>null</code>, nothing is stored.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> counts = <span class="code-keyword">new</span> <span class="code-class">ConcurrentHashMap</span>&lt;<span class="code-class">String</span>, <span class="code-class">LongAdder</span>&gt;();[m
 <span class="code-keyword">for</span> (<span class="code-class">String</span> word : <span class="code-class">List</span>.of(<span class="code-string">"a"</span>, <span class="code-string">"b"</span>, <span class="code-string">"a"</span>)) {[m
     counts.computeIfAbsent(word, k -&gt; <span class="code-keyword">new</span> <span class="code-class">LongAdder</span>()).increment();[m
[36m@@ -5077,7 +5077,7 @@[m [marray.compareAndSet(<span class="code-number">0</span>, <span class="code-number[m
         </div>[m
         <div class="method-entry" id="g40-2">[m
             <div id="tab-g40-2" class="api-sig"><span class="code-class">V</span> computeIfPresent(<span class="code-class">K</span> key, <span class="code-class">BiFunction</span>&lt;? <span class="code-keyword">super</span> <span class="code-class">K</span>, ? <span class="code-keyword">super</span> <span class="code-class">V</span>, ? <span class="code-keyword">extends</span> <span class="code-class">V</span>&gt; remappingFunction)</div>[m
[31m-            <p class="api-desc">If the key is present, atomically calls <code>remappingFunction</code> with the key and current value, stores the result, and returns the new value; if the key is absent it does nothing and returns <code>null</code>. Returning <code>null</code> from the function removes the entry, which is a clean way to expire or delete items conditionally. Other updates to the same bin wait while the function runs, so keep it short and never touch the map from inside it.</p>[m
[32m+[m[32m            <p class="api-desc">If the key is present, atomically calls <code>remappingFunction</code> with the key and current value, stores the result and returns the new value; if the key is absent it does nothing and returns <code>null</code>. Returning <code>null</code> from the function removes the entry, which is a clean way to expire or delete items conditionally. Other updates to the same bin wait while the function runs, so keep it short and never touch the map from inside it.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> stock = <span class="code-keyword">new</span> <span class="code-class">ConcurrentHashMap</span>&lt;<span class="code-class">String</span>, <span class="code-class">Integer</span>&gt;(<span class="code-class">Map</span>.of(<span class="code-string">"apple"</span>, <span class="code-number">2</span>));[m
 <span class="code-class">BiFunction</span>&lt;<span class="code-class">String</span>, <span class="code-class">Integer</span>, <span class="code-class">Integer</span>&gt; takeOne = (k, v) -&gt; v &gt; <span class="code-number">1</span> ? v - <span class="code-number">1</span> : <span class="code-keyword">null</span>;[m
 stock.computeIfPresent(<span class="code-string">"apple"</span>, takeOne); <span class="code-comment">Returns 1</span>[m
[36m@@ -5087,7 +5087,7 @@[m [mstock.computeIfPresent(<span class="code-string">"pear"</span>, takeOne); <span[m
         </div>[m
         <div class="method-entry" id="g40-3">[m
             <div id="tab-g40-3" class="api-sig"><span class="code-class">V</span> compute(<span class="code-class">K</span> key, <span class="code-class">BiFunction</span>&lt;? <span class="code-keyword">super</span> <span class="code-class">K</span>, ? <span class="code-keyword">super</span> <span class="code-class">V</span>, ? <span class="code-keyword">extends</span> <span class="code-class">V</span>&gt; remappingFunction)</div>[m
[31m-            <p class="api-desc">Atomically computes a new value for the key from the key and its current value (<code>null</code> if absent), stores it, and returns it; returning <code>null</code> removes the mapping. It combines insert, update and delete in one read-modify-write step on a single entry, so no other thread can change that key in between. Other updates to the same bin block while the function runs, so keep it short and never modify the map from inside it. For simple counters, <code>merge()</code> is shorter.</p>[m
[32m+[m[32m            <p class="api-desc">Atomically computes a new value for the key from the key and its current value (<code>null</code> if absent), stores it and returns it; returning <code>null</code> removes the mapping. It combines insert, update and delete in one read-modify-write step on a single entry, so no other thread can change that key in between. Other updates to the same bin block while the function runs, so keep it short and never modify the map from inside it. For simple counters, <code>merge()</code> is shorter.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> hits = <span class="code-keyword">new</span> <span class="code-class">ConcurrentHashMap</span>&lt;<span class="code-class">String</span>, <span class="code-class">Integer</span>&gt;();[m
 <span class="code-keyword">for</span> (<span class="code-class">String</span> page : <span class="code-class">List</span>.of(<span class="code-string">"/home"</span>, <span class="code-string">"/about"</span>, <span class="code-string">"/home"</span>)) {[m
     hits.compute(page, (k, v) -&gt; v == <span class="code-keyword">null</span> ? <span class="code-number">1</span> : v + <span class="code-number">1</span>); <span class="code-comment">Insert or update</span>[m
[36m@@ -5097,7 +5097,7 @@[m [mstock.computeIfPresent(<span class="code-string">"pear"</span>, takeOne); <span[m
         </div>[m
         <div class="method-entry" id="g40-4">[m
             <div id="tab-g40-4" class="api-sig"><span class="code-class">V</span> merge(<span class="code-class">K</span> key, <span class="code-class">V</span> value, <span class="code-class">BiFunction</span>&lt;? <span class="code-keyword">super</span> <span class="code-class">V</span>, ? <span class="code-keyword">super</span> <span class="code-class">V</span>, ? <span class="code-keyword">extends</span> <span class="code-class">V</span>&gt; remappingFunction)</div>[m
[31m-            <p class="api-desc">If the key is absent, atomically stores the given value; if it is present, combines the old and given values with <code>remappingFunction</code> and stores the result. It returns the new value, and if the function returns <code>null</code> the mapping is removed. This is the shortest correct way to build concurrent counters, totals or concatenations without a separate get and put. Other updates to the same bin wait while the function runs, so keep it simple.</p>[m
[32m+[m[32m            <p class="api-desc">If the key is absent, atomically stores the given value; if it is present, combines the old and given values with <code>remappingFunction</code> and stores the result. It returns the new value and if the function returns <code>null</code> the mapping is removed. This is the shortest correct way to build concurrent counters, totals or concatenations without a separate get and put. Other updates to the same bin wait while the function runs, so keep it simple.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> totals = <span class="code-keyword">new</span> <span class="code-class">ConcurrentHashMap</span>&lt;<span class="code-class">String</span>, <span class="code-class">Integer</span>&gt;();[m
 totals.merge(<span class="code-string">"apples"</span>, <span class="code-number">3</span>, <span class="code-class">Integer</span>::sum); <span class="code-comment">Absent: stores 3</span>[m
 totals.merge(<span class="code-string">"apples"</span>, <span class="code-number">2</span>, <span class="code-class">Integer</span>::sum); <span class="code-comment">Present: 3 + 2 = 5</span>[m
[36m@@ -5107,7 +5107,7 @@[m [mtotals.merge(<span class="code-string">"pears"</span>, <span class="code-number"[m
         <div class="method-entry" id="g40-5">[m
             <div id="tab-g40-5" class="api-sig"><span class="code-keyword">boolean</span> replace(<span class="code-class">K</span> key, <span class="code-class">V</span> oldValue, <span class="code-class">V</span> newValue)[m
 <span class="code-class">V</span> replace(<span class="code-class">K</span> key, <span class="code-class">V</span> value)</div>[m
[31m-            <p class="api-desc">Atomically replaces the value for a key only if the key is already mapped, and returns the previous value, or <code>null</code> if the key was absent and nothing changed. Unlike <code>put()</code>, it never creates a new entry, which makes it safe for updating settings or records that must already exist. The three-argument overload <code>replace(key, oldValue, newValue)</code> adds a compare-and-set check on the current value and returns a <code>boolean</code>. Null keys and values are not allowed.</p>[m
[32m+[m[32m            <p class="api-desc">Atomically replaces the value for a key only if the key is already mapped and returns the previous value, or <code>null</code> if the key was absent and nothing changed. Unlike <code>put()</code>, it never creates a new entry, which makes it safe for updating settings or records that must already exist. The three-argument overload <code>replace(key, oldValue, newValue)</code> adds a compare-and-set check on the current value and returns a <code>boolean</code>. Null keys and values are not allowed.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> config = <span class="code-keyword">new</span> <span class="code-class">ConcurrentHashMap</span>&lt;<span class="code-class">String</span>, <span class="code-class">String</span>&gt;(<span class="code-class">Map</span>.of(<span class="code-string">"mode"</span>, <span class="code-string">"fast"</span>));[m
 <span class="code-class">String</span> old = config.replace(<span class="code-string">"mode"</span>, <span class="code-string">"safe"</span>); <span class="code-comment">"fast": key existed</span>[m
 <span class="code-class">String</span> none = config.replace(<span class="code-string">"timeout"</span>, <span class="code-string">"30s"</span>); <span class="code-comment">null: nothing added</span>[m
[36m@@ -5116,7 +5116,7 @@[m [mtotals.merge(<span class="code-string">"pears"</span>, <span class="code-number"[m
         </div>[m
         <div class="method-entry" id="g40-6">[m
             <div id="tab-g40-6" class="api-sig"><span class="code-keyword">boolean</span> replace(<span class="code-class">K</span> key, <span class="code-class">V</span> oldValue, <span class="code-class">V</span> newValue)</div>[m
[31m-            <p class="api-desc">Atomically replaces the value for a key only if it is currently mapped to <code>oldValue</code>, compared with <code>equals()</code>, and returns <code>true</code> if the swap happened. It is a compare-and-set on a single map entry, so a thread that read a value, computed a new one, and then calls this fails instead of overwriting a concurrent change. Use it in an optimistic retry loop over immutable values; in most cases <code>compute()</code> or <code>merge()</code> express the same update more simply.</p>[m
[32m+[m[32m            <p class="api-desc">Atomically replaces the value for a key only if it is currently mapped to <code>oldValue</code>, compared with <code>equals()</code> and returns <code>true</code> if the swap happened. It is a compare-and-set on a single map entry, so a thread that read a value, computed a new one and then calls this fails instead of overwriting a concurrent change. Use it in an optimistic retry loop over immutable values; in most cases <code>compute()</code> or <code>merge()</code> express the same update more simply.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> prices = <span class="code-keyword">new</span> <span class="code-class">ConcurrentHashMap</span>&lt;<span class="code-class">String</span>, <span class="code-class">Integer</span>&gt;(<span class="code-class">Map</span>.of(<span class="code-string">"book"</span>, <span class="code-number">10</span>));[m
 <span class="code-keyword">boolean</span> swapped;[m
 <span class="code-keyword">do</span> {[m
[36m@@ -5127,7 +5127,7 @@[m [mtotals.merge(<span class="code-string">"pears"</span>, <span class="code-number"[m
         </div>[m
         <div class="method-entry" id="g40-7">[m
             <div id="tab-g40-7" class="api-sig"><span class="code-keyword">boolean</span> remove(<span class="code-class">Object</span> key, <span class="code-class">Object</span> value)</div>[m
[31m-            <p class="api-desc">Atomically removes the entry for a key only if it is currently mapped to the given value, compared with <code>equals()</code>, and returns <code>true</code> if it was removed. This stops a thread from deleting an entry that another thread has meanwhile replaced, which a plain <code>remove(key)</code> would do. A typical use is releasing a lock, lease or session only while the caller still owns it. It returns <code>false</code> rather than throwing when the key is absent or mapped to another value.</p>[m
[32m+[m[32m            <p class="api-desc">Atomically removes the entry for a key only if it is currently mapped to the given value, compared with <code>equals()</code> and returns <code>true</code> if it was removed. This stops a thread from deleting an entry that another thread has meanwhile replaced, which a plain <code>remove(key)</code> would do. A typical use is releasing a lock, lease or session only while the caller still owns it. It returns <code>false</code> rather than throwing when the key is absent or mapped to another value.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> locks = <span class="code-keyword">new</span> <span class="code-class">ConcurrentHashMap</span>&lt;<span class="code-class">String</span>, <span class="code-class">String</span>&gt;();[m
 locks.put(<span class="code-string">"lock-1"</span>, <span class="code-string">"worker-A"</span>);[m
 <span class="code-keyword">boolean</span> wrong = locks.remove(<span class="code-string">"lock-1"</span>, <span class="code-string">"worker-B"</span>); <span class="code-comment">false: not the owner</span>[m
[36m@@ -5149,7 +5149,7 @@[m [mstock.forEach(<span class="code-number">1</span>, (item, qty) -&gt; qty == <span[m
         </div>[m
         <div class="method-entry" id="g40-9">[m
             <div id="tab-g40-9" class="api-sig">&lt;<span class="code-class">U</span>&gt; <span class="code-class">U</span> search(<span class="code-keyword">long</span> parallelismThreshold, <span class="code-class">BiFunction</span>&lt;? <span class="code-keyword">super</span> <span class="code-class">K</span>, ? <span class="code-keyword">super</span> <span class="code-class">V</span>, ? <span class="code-keyword">extends</span> <span class="code-class">U</span>&gt; searchFunction)</div>[m
[31m-            <p class="api-desc">Applies <code>searchFunction</code> to each mapping and returns the first non-null result it produces, or <code>null</code> if every call returns <code>null</code>; once a result is found, further processing is suppressed. With a <code>parallelismThreshold</code> below the map size it runs in parallel on the common <code>ForkJoinPool</code>, so when several entries match, which one is returned is not deterministic. Use it to find any matching entry quickly in a large map, and keep the function side-effect free.</p>[m
[32m+[m[32m            <p class="api-desc">Applies <code>searchFunction</code> to each mapping and returns the first non-null result it produces, or <code>null</code> if every call returns <code>null</code>; once a result is found, further processing is suppressed. With a <code>parallelismThreshold</code> below the map size it runs in parallel on the common <code>ForkJoinPool</code>, so when several entries match, which one is returned is not deterministic. Use it to find any matching entry quickly in a large map and keep the function side-effect free.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">public</span> <span class="code-keyword">record</span> <span class="code-class">User</span>(<span class="code-class">String</span> name, <span class="code-keyword">boolean</span> admin) {}[m
 [m
 <span class="code-keyword">var</span> users = <span class="code-keyword">new</span> <span class="code-class">ConcurrentHashMap</span>&lt;<span class="code-class">String</span>, <span class="code-class">User</span>&gt;();[m
[36m@@ -5172,7 +5172,7 @@[m [mcart.put(<span class="code-string">"plum"</span>, <span class="code-number">5</s[m
         </div>[m
         <div class="method-entry" id="g40-11">[m
             <div id="tab-g40-11" class="api-sig"><span class="code-keyword">long</span> mappingCount()</div>[m
[31m-            <p class="api-desc">Returns the number of mappings as a <code>long</code>, and should be used instead of <code>size()</code> because a <code>ConcurrentHashMap</code> may hold more than <code>Integer.MAX_VALUE</code> entries, where <code>size()</code> would cap the result. The value is only an estimate while other threads insert or remove concurrently, because it sums per-cell counters without locking. It never blocks. Use it for monitoring, metrics or sizing decisions, never to coordinate logic that needs an exact count.</p>[m
[32m+[m[32m            <p class="api-desc">Returns the number of mappings as a <code>long</code> and should be used instead of <code>size()</code> because a <code>ConcurrentHashMap</code> may hold more than <code>Integer.MAX_VALUE</code> entries, where <code>size()</code> would cap the result. The value is only an estimate while other threads insert or remove concurrently, because it sums per-cell counters without locking. It never blocks. Use it for monitoring, metrics or sizing decisions, never to coordinate logic that needs an exact count.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> cache = <span class="code-keyword">new</span> <span class="code-class">ConcurrentHashMap</span>&lt;<span class="code-class">Integer</span>, <span class="code-class">String</span>&gt;();[m
 <span class="code-keyword">for</span> (<span class="code-keyword">int</span> i = <span class="code-number">0</span>; i &lt; <span class="code-number">1_000</span>; i++) {[m
     cache.put(i, <span class="code-string">"value-"</span> + i);[m
[36m@@ -5182,7 +5182,7 @@[m [mcart.put(<span class="code-string">"plum"</span>, <span class="code-number">5</s[m
         </div>[m
         <div class="method-entry" id="g40-12">[m
             <div id="tab-g40-12" class="api-sig"><span class="code-keyword">static</span> &lt;<span class="code-class">K</span>&gt; <span class="code-class">KeySetView</span>&lt;<span class="code-class">K</span>,<span class="code-class">Boolean</span>&gt; newKeySet()</div>[m
[31m-            <p class="api-desc">Creates a new, empty, thread-safe <code>Set</code> backed by a <code>ConcurrentHashMap</code>, with <code>Boolean.TRUE</code> as the hidden value for every element. It has the same guarantees as the map: lock-free reads, atomic <code>add()</code> and <code>remove()</code>, and weakly consistent iteration that never throws <code>ConcurrentModificationException</code>. Use it as the concurrent counterpart of <code>HashSet</code>, for example to deduplicate work across threads, since <code>add()</code> returns <code>false</code> if the element was already present. Null elements are not allowed.</p>[m
[32m+[m[32m            <p class="api-desc">Creates a new, empty, thread-safe <code>Set</code> backed by a <code>ConcurrentHashMap</code>, with <code>Boolean.TRUE</code> as the hidden value for every element. It has the same guarantees as the map: lock-free reads, atomic <code>add()</code> and <code>remove()</code> and weakly consistent iteration that never throws <code>ConcurrentModificationException</code>. Use it as the concurrent counterpart of <code>HashSet</code>, for example to deduplicate work across threads, since <code>add()</code> returns <code>false</code> if the element was already present. Null elements are not allowed.</p>[m
             <div class="code-block"><pre><code><span class="code-class">Set</span>&lt;<span class="code-class">String</span>&gt; seen = <span class="code-class">ConcurrentHashMap</span>.newKeySet();[m
 <span class="code-keyword">for</span> (<span class="code-class">String</span> url : <span class="code-class">List</span>.of(<span class="code-string">"/a"</span>, <span class="code-string">"/b"</span>, <span class="code-string">"/a"</span>)) {[m
     <span class="code-keyword">if</span> (seen.add(url)) { <span class="code-comment">true only for the first thread to add it</span>[m
[36m@@ -5305,7 +5305,7 @@[m [msynchronized (values) {[m
         </select>[m
         <div class="method-entry" id="g42-0">[m
             <div id="tab-g42-0" class="api-sig"><span class="code-class">ForkJoinTask</span>&lt;<span class="code-class">V</span>&gt; fork()</div>[m
[31m-            <p class="api-desc">Arranges for the task to run asynchronously by pushing it onto the current worker&rsquo;s deque in its <code>ForkJoinPool</code>, or into the common pool when called from outside one, and returns the task itself immediately without blocking. An idle worker may steal it, or the forking thread may run it later. Fork a task only once until it completes, and always pair it with <code>join()</code>; the usual pattern forks one half, computes the other half directly, then joins the forked one.</p>[m
[32m+[m[32m            <p class="api-desc">Arranges for the task to run asynchronously by pushing it onto the current worker&rsquo;s deque in its <code>ForkJoinPool</code>, or into the common pool when called from outside one and returns the task itself immediately without blocking. An idle worker may steal it, or the forking thread may run it later. Fork a task only once until it completes and always pair it with <code>join()</code>; the usual pattern forks one half, computes the other half directly, then joins the forked one.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">protected</span> <span class="code-class">Long</span> compute() {[m
     <span class="code-keyword">if</span> (hi - lo &lt;= <span class="code-number">1_000</span>) <span class="code-keyword">return</span> <span class="code-class">Arrays</span>.stream(numbers, lo, hi).sum();[m
     <span class="code-keyword">int</span> mid = (lo + hi) &gt;&gt;&gt; <span class="code-number">1</span>;[m
[36m@@ -5317,7 +5317,7 @@[m [msynchronized (values) {[m
         </div>[m
         <div class="method-entry" id="g42-1">[m
             <div id="tab-g42-1" class="api-sig"><span class="code-class">V</span> join()</div>[m
[31m-            <p class="api-desc">Returns the result of the computation when it is done, waiting if necessary. Unlike <code>Future.get()</code>, it throws no checked exceptions: an exception from the task is rethrown unchecked, with checked ones wrapped in a <code>RuntimeException</code>, and a cancelled task throws <code>CancellationException</code>. Inside a pool, a joining worker does not simply sleep but helps by running other queued or stolen tasks. Join forked tasks in the reverse order of forking for best performance.</p>[m
[32m+[m[32m            <p class="api-desc">Returns the result of the computation when it is done, waiting if necessary. Unlike <code>Future.get()</code>, it throws no checked exceptions: an exception from the task is rethrown unchecked, with checked ones wrapped in a <code>RuntimeException</code> and a cancelled task throws <code>CancellationException</code>. Inside a pool, a joining worker does not simply sleep but helps by running other queued or stolen tasks. Join forked tasks in the reverse order of forking for best performance.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> left = <span class="code-keyword">new</span> <span class="code-class">SumTask</span>(numbers, <span class="code-number">0</span>, mid);[m
 <span class="code-keyword">var</span> right = <span class="code-keyword">new</span> <span class="code-class">SumTask</span>(numbers, mid, numbers.length);[m
 left.fork();[m
[36m@@ -5328,7 +5328,7 @@[m [mright.fork();[m
         </div>[m
         <div class="method-entry" id="g42-2">[m
             <div id="tab-g42-2" class="api-sig"><span class="code-class">V</span> invoke()</div>[m
[31m-            <p class="api-desc">Runs the task in the current thread, waits for it to finish, and returns its result, rethrowing any exception unchecked just like <code>join()</code>. It is equivalent to <code>fork()</code> followed by <code>join()</code> but cheaper, because it executes the task directly instead of queuing it. Use it to run a subtask inline or a top-level task; when called from an ordinary thread, the task runs in the caller and any subtasks it forks go to the common pool, while <code>pool.invoke(task)</code> targets a specific pool.</p>[m
[32m+[m[32m            <p class="api-desc">Runs the task in the current thread, waits for it to finish and returns its result, rethrowing any exception unchecked just like <code>join()</code>. It is equivalent to <code>fork()</code> followed by <code>join()</code> but cheaper, because it executes the task directly instead of queuing it. Use it to run a subtask inline or a top-level task; when called from an ordinary thread, the task runs in the caller and any subtasks it forks go to the common pool, while <code>pool.invoke(task)</code> targets a specific pool.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">long</span>[] numbers = <span class="code-class">LongStream</span>.rangeClosed(<span class="code-number">1</span>, <span class="code-number">1_000_000</span>).toArray();[m
 <span class="code-keyword">var</span> task = <span class="code-keyword">new</span> <span class="code-class">SumTask</span>(numbers, <span class="code-number">0</span>, numbers.length);[m
 <span class="code-keyword">long</span> total = task.invoke(); <span class="code-comment">Runs here; forked subtasks use the common pool</span>[m
[36m@@ -5351,7 +5351,7 @@[m [mright.fork();[m
         </div>[m
         <div class="method-entry" id="g42-4">[m
             <div id="tab-g42-4" class="api-sig"><span class="code-keyword">abstract</span> <span class="code-class">V</span> getRawResult()</div>[m
[31m-            <p class="api-desc">Returns the value that <code>join()</code> would return, but without waiting, without checking whether the task is done, and without rethrowing any exception. It returns <code>null</code> or a meaningless value if the task has not completed or completed abnormally. It is mainly an extension hook for subclasses and monitoring tools: <code>RecursiveTask</code> returns its stored result and <code>RecursiveAction</code> always returns <code>null</code>. In normal code prefer <code>join()</code>, or check <code>isCompletedNormally()</code> first.</p>[m
[32m+[m[32m            <p class="api-desc">Returns the value that <code>join()</code> would return, but without waiting, without checking whether the task is done and without rethrowing any exception. It returns <code>null</code> or a meaningless value if the task has not completed or completed abnormally. It is mainly an extension hook for subclasses and monitoring tools: <code>RecursiveTask</code> returns its stored result and <code>RecursiveAction</code> always returns <code>null</code>. In normal code prefer <code>join()</code>, or check <code>isCompletedNormally()</code> first.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> task = <span class="code-keyword">new</span> <span class="code-class">SumTask</span>(numbers, <span class="code-number">0</span>, numbers.length);[m
 <span class="code-class">System</span>.out.println(task.getRawResult()); <span class="code-comment">null: not run yet</span>[m
 <span class="code-class">ForkJoinPool</span>.commonPool().invoke(task);[m
[36m@@ -5362,7 +5362,7 @@[m [mright.fork();[m
         </div>[m
         <div class="method-entry" id="g42-5">[m
             <div id="tab-g42-5" class="api-sig"><span class="code-keyword">void</span> complete(<span class="code-class">V</span> value)</div>[m
[31m-            <p class="api-desc">Completes the task with the given value, as if <code>compute()</code> had returned it, so later <code>join()</code> and <code>invoke()</code> calls return that value and any waiting threads are released. If the task has not started yet, it will never run, and if it was already cancelled or failed, that outcome is kept. Use it to short-circuit work with a cached or default result, or to finish custom asynchronous tasks from another thread; the Javadoc discourages it in other situations.</p>[m
[32m+[m[32m            <p class="api-desc">Completes the task with the given value, as if <code>compute()</code> had returned it, so later <code>join()</code> and <code>invoke()</code> calls return that value and any waiting threads are released. If the task has not started yet, it will never run and if it was already cancelled or failed, that outcome is kept. Use it to short-circuit work with a cached or default result, or to finish custom asynchronous tasks from another thread; the Javadoc discourages it in other situations.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> task = <span class="code-keyword">new</span> <span class="code-class">SumTask</span>(numbers, <span class="code-number">0</span>, numbers.length);[m
 <span class="code-keyword">if</span> (numbers.length == <span class="code-number">0</span>) {[m
     task.complete(<span class="code-number">0L</span>); <span class="code-comment">Short-circuit: compute() will never run</span>[m
[36m@@ -5372,7 +5372,7 @@[m [mright.fork();[m
         </div>[m
         <div class="method-entry" id="g42-6">[m
             <div id="tab-g42-6" class="api-sig"><span class="code-keyword">void</span> completeExceptionally(<span class="code-class">Throwable</span> ex)</div>[m
[31m-            <p class="api-desc">Completes the task abnormally with the given exception, so <code>join()</code> and <code>invoke()</code> throw it, wrapping a checked exception in a <code>RuntimeException</code>, and <code>isCompletedAbnormally()</code> returns <code>true</code>. If the task has not started it will never run, and if it has already completed the call has no effect. Use it to fail a task from outside, for example on a timeout or a validation error detected by another thread, or to report errors from custom asynchronous tasks.</p>[m
[32m+[m[32m            <p class="api-desc">Completes the task abnormally with the given exception, so <code>join()</code> and <code>invoke()</code> throw it, wrapping a checked exception in a <code>RuntimeException</code> and <code>isCompletedAbnormally()</code> returns <code>true</code>. If the task has not started it will never run and if it has already completed the call has no effect. Use it to fail a task from outside, for example on a timeout or a validation error detected by another thread, or to report errors from custom asynchronous tasks.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> task = <span class="code-keyword">new</span> <span class="code-class">SumTask</span>(numbers, <span class="code-number">0</span>, numbers.length);[m
 task.completeExceptionally(<span class="code-keyword">new</span> <span class="code-class">IllegalStateException</span>(<span class="code-string">"Aborted"</span>));[m
 <span class="code-keyword">try</span> {[m
[36m@@ -5419,7 +5419,7 @@[m [mtasks.forEach(<span class="code-class">ForkJoinTask</span>::fork);[m
         </div>[m
         <div class="method-entry" id="g42-10">[m
             <div id="tab-g42-10" class="api-sig"><span class="code-keyword">boolean</span> isCompletedAbnormally()</div>[m
[31m-            <p class="api-desc">Returns <code>true</code> if the task threw an exception or was cancelled, and <code>false</code> while it is running or if it completed normally. It never blocks. Use it after <code>quietlyJoin()</code> or <code>isDone()</code> to detect a failure without triggering an exception from <code>join()</code>, then call <code>getException()</code> to see what went wrong, or <code>isCancelled()</code> to tell cancellation apart from a real error.</p>[m
[32m+[m[32m            <p class="api-desc">Returns <code>true</code> if the task threw an exception or was cancelled and <code>false</code> while it is running or if it completed normally. It never blocks. Use it after <code>quietlyJoin()</code> or <code>isDone()</code> to detect a failure without triggering an exception from <code>join()</code>, then call <code>getException()</code> to see what went wrong, or <code>isCancelled()</code> to tell cancellation apart from a real error.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> task = <span class="code-keyword">new</span> <span class="code-class">ParseTask</span>(input); <span class="code-comment">A task that may throw</span>[m
 task.fork();[m
 task.quietlyJoin(); <span class="code-comment">Waits but does not rethrow</span>[m
[36m@@ -5456,7 +5456,7 @@[m [mleft.fork();[m
             <div id="tab-g42-13" class="api-sig"><span class="code-keyword">static</span> <span class="code-class">ForkJoinTask</span>&lt;?&gt; adapt(<span class="code-class">Runnable</span> runnable)[m
 <span class="code-keyword">static</span> &lt;<span class="code-class">T</span>&gt; <span class="code-class">ForkJoinTask</span>&lt;<span class="code-class">T</span>&gt; adapt(<span class="code-class">Runnable</span> runnable, <span class="code-class">T</span> result)[m
 <span class="code-keyword">static</span> &lt;<span class="code-class">T</span>&gt; <span class="code-class">ForkJoinTask</span>&lt;<span class="code-class">T</span>&gt; adapt(<span class="code-class">Callable</span>&lt;? <span class="code-keyword">extends</span> <span class="code-class">T</span>&gt; callable)</div>[m
[31m-            <p class="api-desc">Wraps a <code>Runnable</code> or <code>Callable</code> in a <code>ForkJoinTask</code> so it can be submitted to a <code>ForkJoinPool</code>, combined with <code>invokeAll()</code>, or joined like any other fork/join task. <code>adapt(Runnable)</code> yields a task whose result is <code>null</code>, <code>adapt(Runnable, result)</code> returns the given fixed result, and <code>adapt(Callable)</code> returns the callable&rsquo;s value, wrapping checked exceptions in a <code>RuntimeException</code>. It bridges existing code; for divide-and-conquer work, subclass <code>RecursiveTask</code> or <code>RecursiveAction</code> instead.</p>[m
[32m+[m[32m            <p class="api-desc">Wraps a <code>Runnable</code> or <code>Callable</code> in a <code>ForkJoinTask</code> so it can be submitted to a <code>ForkJoinPool</code>, combined with <code>invokeAll()</code>, or joined like any other fork/join task. <code>adapt(Runnable)</code> yields a task whose result is <code>null</code>, <code>adapt(Runnable, result)</code> returns the given fixed result and <code>adapt(Callable)</code> returns the callable&rsquo;s value, wrapping checked exceptions in a <code>RuntimeException</code>. It bridges existing code; for divide-and-conquer work, subclass <code>RecursiveTask</code> or <code>RecursiveAction</code> instead.</p>[m
             <div class="code-block"><pre><code><span class="code-class">ForkJoinTask</span>&lt;<span class="code-class">String</span>&gt; fetch = <span class="code-class">ForkJoinTask</span>.adapt(() -&gt; <span class="code-string">"config loaded"</span>);[m
 <span class="code-class">ForkJoinTask</span>&lt;?&gt; log = <span class="code-class">ForkJoinTask</span>.adapt(() -&gt; <span class="code-class">System</span>.out.println(<span class="code-string">"Logging"</span>));[m
 <span class="code-class">ForkJoinTask</span>.invokeAll(fetch, log); <span class="code-comment">Runs both, waits for both</span>[m
[36m@@ -5533,7 +5533,7 @@[m [mleft.fork();[m
         </select>[m
         <div class="method-entry" id="g43-0">[m
             <div id="tab-g43-0" class="api-sig"><span class="code-keyword">static</span> <span class="code-class">ForkJoinPool</span> commonPool()</div>[m
[31m-            <p class="api-desc">Returns the shared, statically constructed <code>ForkJoinPool</code> used by parallel streams, by <code>CompletableFuture</code> async methods without an explicit executor, and by <code>fork()</code> called outside any pool. It never blocks or returns null, its workers are daemon threads, and <code>shutdown()</code> or <code>shutdownNow()</code> have no effect on it. Pitfall: long blocking tasks submitted here starve every parallel stream in the application, so give I/O work its own pool or virtual threads.</p>[m
[32m+[m[32m            <p class="api-desc">Returns the shared, statically constructed <code>ForkJoinPool</code> used by parallel streams, by <code>CompletableFuture</code> async methods without an explicit executor and by <code>fork()</code> called outside any pool. It never blocks or returns null, its workers are daemon threads and <code>shutdown()</code> or <code>shutdownNow()</code> have no effect on it. Pitfall: long blocking tasks submitted here starve every parallel stream in the application, so give I/O work its own pool or virtual threads.</p>[m
             <div class="code-block"><pre><code><span class="code-class">ForkJoinPool</span> pool = <span class="code-class">ForkJoinPool</span>.commonPool(); <span class="code-comment">Shared by the whole JVM</span>[m
 <span class="code-keyword">var</span> sum = pool.submit(() -&gt; <span class="code-class">IntStream</span>.range(<span class="code-number">0</span>, <span class="code-number">1_000</span>).sum());[m
 <span class="code-class">System</span>.out.println(sum.join()); <span class="code-comment">499500</span>[m
[36m@@ -5550,7 +5550,7 @@[m [mpool.shutdown(); <span class="code-comment">Ignored: the common pool cannot be s[m
         </div>[m
         <div class="method-entry" id="g43-2">[m
             <div id="tab-g43-2" class="api-sig"><span class="code-keyword">int</span> getParallelism()</div>[m
[31m-            <p class="api-desc">Returns the target parallelism of this pool, the number of worker threads it tries to keep actively running. It is the value given to the constructor, or <code>availableProcessors()</code> for the no-argument constructor, and since Java 19 it can be changed with <code>setParallelism(int)</code>. The call never blocks. Do not confuse it with <code>getPoolSize()</code>, which reports how many workers exist right now and can temporarily exceed the target while workers block.</p>[m
[32m+[m[32m            <p class="api-desc">Returns the target parallelism of this pool, the number of worker threads it tries to keep actively running. It is the value given to the constructor, or <code>availableProcessors()</code> for the no-argument constructor and since Java 19 it can be changed with <code>setParallelism(int)</code>. The call never blocks. Do not confuse it with <code>getPoolSize()</code>, which reports how many workers exist right now and can temporarily exceed the target while workers block.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> pool = <span class="code-keyword">new</span> <span class="code-class">ForkJoinPool</span>(<span class="code-number">4</span>); <span class="code-comment">Target parallelism of 4</span>[m
 <span class="code-class">System</span>.out.println(pool.getParallelism()); <span class="code-comment">4</span>[m
 <span class="code-keyword">var</span> defaultPool = <span class="code-keyword">new</span> <span class="code-class">ForkJoinPool</span>(); <span class="code-comment">Defaults to availableProcessors()</span>[m
[36m@@ -5560,7 +5560,7 @@[m [mdefaultPool.close();</code></pre></div>[m
         </div>[m
         <div class="method-entry" id="g43-3">[m
             <div id="tab-g43-3" class="api-sig"><span class="code-keyword">int</span> getPoolSize()</div>[m
[31m-            <p class="api-desc">Returns the number of worker threads that have started and not yet terminated, including idle workers waiting for work. It never blocks and is only a snapshot. Workers are created lazily, so a fresh pool reports 0, and idle workers exit after a keep-alive period (60 seconds by default), so the size shrinks again. Compare it with <code>getParallelism()</code>, the target, and <code>getActiveThreadCount()</code>, the workers that are currently busy.</p>[m
[32m+[m[32m            <p class="api-desc">Returns the number of worker threads that have started and not yet terminated, including idle workers waiting for work. It never blocks and is only a snapshot. Workers are created lazily, so a fresh pool reports 0 and idle workers exit after a keep-alive period (60 seconds by default), so the size shrinks again. Compare it with <code>getParallelism()</code>, the target and <code>getActiveThreadCount()</code>, the workers that are currently busy.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> pool = <span class="code-keyword">new</span> <span class="code-class">ForkJoinPool</span>(<span class="code-number">4</span>);[m
 <span class="code-class">System</span>.out.println(pool.getPoolSize()); <span class="code-comment">0: workers start lazily</span>[m
 <span class="code-keyword">for</span> (<span class="code-keyword">int</span> i = <span class="code-number">0</span>; i &lt; <span class="code-number">8</span>; i++) pool.submit(() -&gt; sleepQuietly(<span class="code-number">100</span>));[m
[36m@@ -5570,7 +5570,7 @@[m [mpool.awaitQuiescence(<span class="code-number">1</span>, <span class="code-class[m
         </div>[m
         <div class="method-entry" id="g43-4">[m
             <div id="tab-g43-4" class="api-sig"><span class="code-keyword">int</span> getActiveThreadCount()</div>[m
[31m-            <p class="api-desc">Returns an estimate of the number of worker threads currently stealing or executing tasks, as opposed to idle and parked. The value is approximate because workers change state constantly, and the call neither blocks nor locks the pool. Use it in dashboards to spot saturation: a count stuck at <code>getParallelism()</code> while queues keep growing means the pool is overloaded. It can briefly overestimate, so never base correctness decisions on it.</p>[m
[32m+[m[32m            <p class="api-desc">Returns an estimate of the number of worker threads currently stealing or executing tasks, as opposed to idle and parked. The value is approximate because workers change state constantly and the call neither blocks nor locks the pool. Use it in dashboards to spot saturation: a count stuck at <code>getParallelism()</code> while queues keep growing means the pool is overloaded. It can briefly overestimate, so never base correctness decisions on it.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> pool = <span class="code-keyword">new</span> <span class="code-class">ForkJoinPool</span>(<span class="code-number">4</span>);[m
 <span class="code-keyword">for</span> (<span class="code-keyword">int</span> i = <span class="code-number">0</span>; i &lt; <span class="code-number">20</span>; i++) pool.submit(() -&gt; crunchNumbers());[m
 <span class="code-keyword">int</span> active = pool.getActiveThreadCount(); <span class="code-comment">About 4 while busy</span>[m
[36m@@ -5579,7 +5579,7 @@[m [mpool.awaitQuiescence(<span class="code-number">1</span>, <span class="code-class[m
         </div>[m
         <div class="method-entry" id="g43-5">[m
             <div id="tab-g43-5" class="api-sig"><span class="code-keyword">int</span> getRunningThreadCount()</div>[m
[31m-            <p class="api-desc">Returns an estimate of the number of worker threads that are not blocked waiting to join tasks or for other managed synchronization. It is at most <code>getActiveThreadCount()</code>, and the gap between the two shows how many busy workers are waiting instead of computing. The call is non-blocking and approximate, and it overestimates when workers block in unmanaged calls such as plain I/O or <code>Thread.sleep</code>, because the pool cannot see those.</p>[m
[32m+[m[32m            <p class="api-desc">Returns an estimate of the number of worker threads that are not blocked waiting to join tasks or for other managed synchronization. It is at most <code>getActiveThreadCount()</code> and the gap between the two shows how many busy workers are waiting instead of computing. The call is non-blocking and approximate and it overestimates when workers block in unmanaged calls such as plain I/O or <code>Thread.sleep</code>, because the pool cannot see those.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">int</span> active = pool.getActiveThreadCount(); <span class="code-comment">Busy workers: 6</span>[m
 <span class="code-keyword">int</span> running = pool.getRunningThreadCount(); <span class="code-comment">Actually computing: 2</span>[m
 <span class="code-keyword">int</span> waiting = active - running; <span class="code-comment">4 blocked in join() or managedBlock</span>[m
[36m@@ -5587,7 +5587,7 @@[m [mpool.awaitQuiescence(<span class="code-number">1</span>, <span class="code-class[m
         </div>[m
         <div class="method-entry" id="g43-6">[m
             <div id="tab-g43-6" class="api-sig"><span class="code-keyword">long</span> getStealCount()</div>[m
[31m-            <p class="api-desc">Returns an estimate of the total number of completed tasks that were executed by a worker other than the thread that submitted or forked them, accumulated over the pool&rsquo;s lifetime. The call does not block, and it underestimates the real count while the pool is still busy. Use it to tune splitting thresholds: steals should be high enough to keep all workers busy, but a count close to the total number of tasks means tasks are too fine-grained.</p>[m
[32m+[m[32m            <p class="api-desc">Returns an estimate of the total number of completed tasks that were executed by a worker other than the thread that submitted or forked them, accumulated over the pool&rsquo;s lifetime. The call does not block and it underestimates the real count while the pool is still busy. Use it to tune splitting thresholds: steals should be high enough to keep all workers busy, but a count close to the total number of tasks means tasks are too fine-grained.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> pool = <span class="code-keyword">new</span> <span class="code-class">ForkJoinPool</span>(<span class="code-number">4</span>);[m
 <span class="code-keyword">long</span> sum = pool.invoke(<span class="code-keyword">new</span> <span class="code-class">SumTask</span>(numbers, <span class="code-number">0</span>, numbers.length));[m
 <span class="code-class">System</span>.out.println(<span class="code-string">"Sum: "</span> + sum);[m
[36m@@ -5613,7 +5613,7 @@[m [mpool.awaitQuiescence(<span class="code-number">1</span>, <span class="code-class[m
         </div>[m
         <div class="method-entry" id="g43-9">[m
             <div id="tab-g43-9" class="api-sig"><span class="code-keyword">boolean</span> getAsyncMode()</div>[m
[31m-            <p class="api-desc">Returns <code>true</code> if this pool uses local first-in-first-out scheduling for forked tasks that are never joined, and <code>false</code>, the default, for last-in-first-out stack-based processing. The mode is fixed by the <code>asyncMode</code> constructor argument and cannot change later; <code>Executors.newWorkStealingPool()</code> creates pools in async mode. FIFO suits event-style or message-passing tasks that are never joined, while LIFO is better for recursive divide-and-conquer work. The call is a simple non-blocking read.</p>[m
[32m+[m[32m            <p class="api-desc">Returns <code>true</code> if this pool uses local first-in-first-out scheduling for forked tasks that are never joined and <code>false</code>, the default, for last-in-first-out stack-based processing. The mode is fixed by the <code>asyncMode</code> constructor argument and cannot change later; <code>Executors.newWorkStealingPool()</code> creates pools in async mode. FIFO suits event-style or message-passing tasks that are never joined, while LIFO is better for recursive divide-and-conquer work. The call is a simple non-blocking read.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> recursive = <span class="code-keyword">new</span> <span class="code-class">ForkJoinPool</span>(); <span class="code-comment">Default LIFO mode</span>[m
 <span class="code-class">System</span>.out.println(recursive.getAsyncMode()); <span class="code-comment">false</span>[m
 <span class="code-keyword">var</span> events = <span class="code-keyword">new</span> <span class="code-class">ForkJoinPool</span>(<span class="code-number">4</span>,[m
[36m@@ -5631,7 +5631,7 @@[m [mpool.awaitQuiescence(<span class="code-number">10</span>, <span class="code-clas[m
         </div>[m
         <div class="method-entry" id="g43-11">[m
             <div id="tab-g43-11" class="api-sig"><span class="code-keyword">boolean</span> awaitQuiescence(<span class="code-keyword">long</span> timeout, <span class="code-class">TimeUnit</span> unit)</div>[m
[31m-            <p class="api-desc">Waits until the pool is quiescent or the timeout elapses, returning <code>true</code> if it became idle and <code>false</code> on timeout. Called from a task in this pool it behaves like <code>helpQuiesce()</code>, and from any other thread it also helps by running queued tasks while it waits. It does not throw <code>InterruptedException</code>. Unlike <code>awaitTermination</code>, it needs no prior <code>shutdown()</code>, which makes it ideal for waiting on fire-and-forget <code>execute()</code> tasks while keeping the pool alive.</p>[m
[32m+[m[32m            <p class="api-desc">Waits until the pool is quiescent or the timeout elapses, returning <code>true</code> if it became idle and <code>false</code> on timeout. Called from a task in this pool it behaves like <code>helpQuiesce()</code> and from any other thread it also helps by running queued tasks while it waits. It does not throw <code>InterruptedException</code>. Unlike <code>awaitTermination</code>, it needs no prior <code>shutdown()</code>, which makes it ideal for waiting on fire-and-forget <code>execute()</code> tasks while keeping the pool alive.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> pool = <span class="code-keyword">new</span> <span class="code-class">ForkJoinPool</span>(<span class="code-number">4</span>);[m
 <span class="code-keyword">for</span> (<span class="code-keyword">var</span> file : files) pool.execute(() -&gt; index(file));[m
 <span class="code-keyword">boolean</span> idle = pool.awaitQuiescence(<span class="code-number">30</span>, <span class="code-class">TimeUnit</span>.SECONDS); <span class="code-comment">false: timed out</span>[m
[36m@@ -5666,7 +5666,7 @@[m [mpool.execute(() -&gt; index(extraFile)); <span class="code-comment">Pool is stil[m
         </div>[m
     </div>[m
     <div class="intro">[m
[31m-        <p>Important APIs include <code>parallel()</code>, <code>sequential()</code>, <code>isParallel()</code>, <code>forEachOrdered()</code>, and <code>BaseStream.unordered()</code>.</p>[m
[32m+[m[32m        <p>Important APIs include <code>parallel()</code>, <code>sequential()</code>, <code>isParallel()</code>, <code>forEachOrdered()</code> and <code>BaseStream.unordered()</code>.</p>[m
         <p>Parallel streams are especially suitable for large, independent, CPU-intensive operations. They can perform poorly for small datasets, blocking workloads, or shared mutable state.</p>[m
     </div>[m
 [m
[36m@@ -5697,7 +5697,7 @@[m [msecond.join();[m
         </div>[m
         <div class="method-entry" id="g44-1">[m
             <div id="tab-g44-1" class="api-sig"><span class="code-keyword">static</span> <span class="code-class">Thread</span> startVirtualThread(<span class="code-class">Runnable</span> task)</div>[m
[31m-            <p class="api-desc">Creates a new unnamed virtual thread for the given <code>Runnable</code>, starts it immediately and returns the <code>Thread</code>. It is equivalent to <code>Thread.ofVirtual().start(task)</code> and is the shortest way to launch one virtual thread; the call does not block, and the returned thread can be joined, interrupted or inspected like any other. Use the builder instead when you need a name or an uncaught exception handler, and an executor when you manage many tasks or need their results.</p>[m
[32m+[m[32m            <p class="api-desc">Creates a new unnamed virtual thread for the given <code>Runnable</code>, starts it immediately and returns the <code>Thread</code>. It is equivalent to <code>Thread.ofVirtual().start(task)</code> and is the shortest way to launch one virtual thread; the call does not block and the returned thread can be joined, interrupted or inspected like any other. Use the builder instead when you need a name or an uncaught exception handler and an executor when you manage many tasks or need their results.</p>[m
             <div class="code-block"><pre><code><span class="code-class">Thread</span> vt = <span class="code-class">Thread</span>.startVirtualThread(() -&gt; {[m
     <span class="code-class">String</span> body = fetchPage(url); <span class="code-comment">Blocking I/O is cheap here</span>[m
     <span class="code-class">System</span>.out.println(<span class="code-string">"Fetched "</span> + body.length() + <span class="code-string">" chars"</span>);[m
[36m@@ -5707,7 +5707,7 @@[m [mvt.join(); <span class="code-comment">Wait for the virtual thread to finish</spa[m
         </div>[m
         <div class="method-entry" id="g44-2">[m
             <div id="tab-g44-2" class="api-sig"><span class="code-keyword">sealed</span> <span class="code-keyword">interface</span> <span class="code-class">Thread</span>.<span class="code-class">Builder</span>.<span class="code-class">OfVirtual</span> <span class="code-keyword">extends</span> <span class="code-class">Thread</span>.<span class="code-class">Builder</span></div>[m
[31m-            <p class="api-desc">The builder interface for virtual threads, obtained from <code>Thread.ofVirtual()</code>. Its <code>name(...)</code>, <code>inheritInheritableThreadLocals(boolean)</code> and <code>uncaughtExceptionHandler(...)</code> methods return the same builder for chaining, and <code>start</code>, <code>unstarted</code> and <code>factory()</code> produce threads. A builder is not thread-safe, but the <code>ThreadFactory</code> returned by <code>factory()</code> is, so use the factory to plug virtual threads into executors or libraries. With a counter name such as <code>name("vt-", 0)</code>, each new thread increments the counter.</p>[m
[32m+[m[32m            <p class="api-desc">The builder interface for virtual threads, obtained from <code>Thread.ofVirtual()</code>. Its <code>name(...)</code>, <code>inheritInheritableThreadLocals(boolean)</code> and <code>uncaughtExceptionHandler(...)</code> methods return the same builder for chaining and <code>start</code>, <code>unstarted</code> and <code>factory()</code> produce threads. A builder is not thread-safe, but the <code>ThreadFactory</code> returned by <code>factory()</code> is, so use the factory to plug virtual threads into executors or libraries. With a counter name such as <code>name("vt-", 0)</code>, each new thread increments the counter.</p>[m
             <div class="code-block"><pre><code><span class="code-class">Thread</span>.<span class="code-class">Builder</span>.<span class="code-class">OfVirtual</span> builder = <span class="code-class">Thread</span>.ofVirtual()[m
         .name(<span class="code-string">"vt-"</span>, <span class="code-number">0</span>) <span class="code-comment">vt-0, vt-1, ...</span>[m
         .uncaughtExceptionHandler((t, e) -&gt; log(t.getName(), e));[m
[36m@@ -5799,7 +5799,7 @@[m [mvt.join(); <span class="code-comment">Wait for the virtual thread to finish</spa[m
         <p><strong>JDK version detail:</strong> Java 24 improved synchronized-monitor behavior with virtual threads so that blocking on <code>synchronized</code> monitors no longer causes the same carrier-thread pinning behavior seen in earlier releases. Native code and other operations can still create pinning concerns.</p>[m
     </div>[m
 [m
[31m-    <div class="subheading">15. <code>ThreadLocal</code>, <code>InheritableThreadLocal</code>, and <code>ScopedValue</code></div>[m
[32m+[m[32m    <div class="subheading">15. <code>ThreadLocal</code>, <code>InheritableThreadLocal</code> and <code>ScopedValue</code></div>[m
     <div class="intro">[m
         <p class="minor-heading"><strong>15.1 <code>ThreadLocal&lt;T&gt;</code></strong></p>[m
         <p>Each thread has its own independently associated value.</p>[m
[36m@@ -5834,7 +5834,7 @@[m [mREQUEST_ID.remove(); <span class="code-comment">Always clean up when the work is[m
         </div>[m
         <div class="method-entry" id="g46-2">[m
             <div id="tab-g46-2" class="api-sig"><span class="code-keyword">void</span> remove()</div>[m
[31m-            <p class="api-desc">Removes the current thread&rsquo;s value of this thread-local variable, so the next <code>get()</code> in that thread runs <code>initialValue()</code> again instead of returning the old value. It never blocks, affects only the calling thread, and is harmless when no value is set. Calling it in a <code>finally</code> block is essential with thread pools and application servers, where threads outlive tasks: forgetting it leaks data between requests and can cause class loader memory leaks after a redeployment.</p>[m
[32m+[m[32m            <p class="api-desc">Removes the current thread&rsquo;s value of this thread-local variable, so the next <code>get()</code> in that thread runs <code>initialValue()</code> again instead of returning the old value. It never blocks, affects only the calling thread and is harmless when no value is set. Calling it in a <code>finally</code> block is essential with thread pools and application servers, where threads outlive tasks: forgetting it leaks data between requests and can cause class loader memory leaks after a redeployment.</p>[m
             <div class="code-block"><pre><code><span class="code-class">ExecutorService</span> pool = <span class="code-class">Executors</span>.newFixedThreadPool(<span class="code-number">4</span>);[m
 pool.submit(() -&gt; {[m
     REQUEST_ID.set(request.id());[m
[36m@@ -5856,7 +5856,7 @@[m [mpool.submit(() -&gt; {[m
         </div>[m
         <div class="method-entry" id="g46-4">[m
             <div id="tab-g46-4" class="api-sig"><span class="code-class">T</span> initialValue()</div>[m
[31m-            <p class="api-desc">A protected hook that returns the current thread&rsquo;s initial value. <code>get()</code> calls it at most once per thread, on the first read, and again only after <code>remove()</code>; it is never called if <code>set()</code> runs before the first <code>get()</code>. The default implementation returns <code>null</code>, so you override it in an anonymous subclass when the initial value needs more logic than a lambda comfortably holds. In modern code <code>withInitial(supplier)</code> is usually shorter and preferred.</p>[m
[32m+[m[32m            <p class="api-desc">A protected hook that returns the current thread&rsquo;s initial value. <code>get()</code> calls it at most once per thread, on the first read and again only after <code>remove()</code>; it is never called if <code>set()</code> runs before the first <code>get()</code>. The default implementation returns <code>null</code>, so you override it in an anonymous subclass when the initial value needs more logic than a lambda comfortably holds. In modern code <code>withInitial(supplier)</code> is usually shorter and preferred.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">static</span> <span class="code-class">ThreadLocal</span>&lt;<span class="code-class">List</span>&lt;<span class="code-class">String</span>&gt;&gt; BUFFER = <span class="code-keyword">new</span> <span class="code-class">ThreadLocal</span>&lt;&gt;() {[m
     <span class="code-annotation">@Override</span>[m
     <span class="code-keyword">protected</span> <span class="code-class">List</span>&lt;<span class="code-class">String</span>&gt; initialValue() {[m
[36m@@ -5928,7 +5928,7 @@[m [mBUFFER.get().add(<span class="code-string">"second"</span>); <span class="code-c[m
 [m
     <div class="subheading">16. Structured concurrency — Java 27 preview API</div>[m
     <div class="intro">[m
[31m-        <p><code>StructuredTaskScope</code> allows related concurrent operations to be managed as one logical operation, with coordinated cancellation, failure handling, and lifetime management.</p>[m
[32m+[m[32m        <p><code>StructuredTaskScope</code> allows related concurrent operations to be managed as one logical operation, with coordinated cancellation, failure handling and lifetime management.</p>[m
         <p><strong>Status:</strong> Still a preview API in Java 27. Enable preview features when compiling and running the example below.</p>[m
         <p class="minor-heading"><strong>16.1 Key APIs</strong></p>[m
     </div>[m
[36m@@ -5959,7 +5959,7 @@[m [mBUFFER.get().add(<span class="code-string">"second"</span>); <span class="code-c[m
         </div>[m
         <div class="method-entry" id="g47-1">[m
             <div id="tab-g47-1" class="api-sig"><span class="code-keyword">static</span> &lt;<span class="code-class">T</span>, <span class="code-class">R</span>&gt; <span class="code-class">StructuredTaskScope</span>&lt;<span class="code-class">T</span>, <span class="code-class">R</span>&gt; open(<span class="code-class">Joiner</span>&lt;? <span class="code-keyword">super</span> <span class="code-class">T</span>, ? <span class="code-keyword">extends</span> <span class="code-class">R</span>&gt; joiner)</div>[m
[31m-            <p class="api-desc">Opens a scope whose completion policy and result are defined by the given <code>Joiner</code>, so <code>join()</code> returns the joiner&rsquo;s result type instead of <code>null</code>. Built-in joiners include <code>anySuccessfulResultOrThrow()</code> (first success wins, the rest are cancelled), <code>allSuccessfulOrThrow()</code> (a stream of successful subtasks), <code>awaitAll()</code> and <code>allUntil(predicate)</code>, and you can implement <code>Joiner</code> yourself for custom policies. It is a Java 25 preview API that needs <code>--enable-preview</code>.</p>[m
[32m+[m[32m            <p class="api-desc">Opens a scope whose completion policy and result are defined by the given <code>Joiner</code>, so <code>join()</code> returns the joiner&rsquo;s result type instead of <code>null</code>. Built-in joiners include <code>anySuccessfulResultOrThrow()</code> (first success wins, the rest are cancelled), <code>allSuccessfulOrThrow()</code> (a stream of successful subtasks), <code>awaitAll()</code> and <code>allUntil(predicate)</code> and you can implement <code>Joiner</code> yourself for custom policies. It is a Java 25 preview API that needs <code>--enable-preview</code>.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> joiner = <span class="code-class">Joiner</span>.&lt;<span class="code-class">String</span>&gt;anySuccessfulResultOrThrow();[m
 <span class="code-keyword">try</span> (<span class="code-keyword">var</span> scope = <span class="code-class">StructuredTaskScope</span>.open(joiner)) {[m
     scope.fork(() -&gt; queryMirror(<span class="code-string">"eu.mirror.example"</span>));[m
[36m@@ -5970,7 +5970,7 @@[m [mBUFFER.get().add(<span class="code-string">"second"</span>); <span class="code-c[m
         </div>[m
         <div class="method-entry" id="g47-2">[m
             <div id="tab-g47-2" class="api-sig"><span class="code-keyword">static</span> &lt;<span class="code-class">T</span>, <span class="code-class">R</span>&gt; <span class="code-class">StructuredTaskScope</span>&lt;<span class="code-class">T</span>, <span class="code-class">R</span>&gt; open(<span class="code-class">Joiner</span>&lt;? <span class="code-keyword">super</span> <span class="code-class">T</span>, ? <span class="code-keyword">extends</span> <span class="code-class">R</span>&gt; joiner, <span class="code-class">UnaryOperator</span>&lt;<span class="code-class">Configuration</span>&gt; configOperator)</div>[m
[31m-            <p class="api-desc">Opens a scope with the given <code>Joiner</code> and a function that adjusts the default <code>Configuration</code>: <code>withTimeout(Duration)</code> sets a deadline, <code>withName(String)</code> names the scope for thread dumps, and <code>withThreadFactory(...)</code> replaces the virtual-thread factory. If the timeout expires before <code>join()</code> completes, the scope is cancelled, unfinished subtasks are interrupted, and <code>join()</code> throws <code>StructuredTaskScope.TimeoutException</code>. It is a Java 25 preview API that needs <code>--enable-preview</code>.</p>[m
[32m+[m[32m            <p class="api-desc">Opens a scope with the given <code>Joiner</code> and a function that adjusts the default <code>Configuration</code>: <code>withTimeout(Duration)</code> sets a deadline, <code>withName(String)</code> names the scope for thread dumps and <code>withThreadFactory(...)</code> replaces the virtual-thread factory. If the timeout expires before <code>join()</code> completes, the scope is cancelled, unfinished subtasks are interrupted and <code>join()</code> throws <code>StructuredTaskScope.TimeoutException</code>. It is a Java 25 preview API that needs <code>--enable-preview</code>.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> limit = <span class="code-class">Duration</span>.ofSeconds(<span class="code-number">2</span>);[m
 <span class="code-keyword">var</span> joiner = <span class="code-class">Joiner</span>.&lt;<span class="code-class">Object</span>&gt;awaitAll();[m
 <span class="code-keyword">try</span> (<span class="code-keyword">var</span> scope = <span class="code-class">StructuredTaskScope</span>.open(joiner,[m
[36m@@ -5984,7 +5984,7 @@[m [mBUFFER.get().add(<span class="code-string">"second"</span>); <span class="code-c[m
         </div>[m
         <div class="method-entry" id="g47-3">[m
             <div id="tab-g47-3" class="api-sig">&lt;<span class="code-class">U</span> <span class="code-keyword">extends</span> <span class="code-class">T</span>&gt; <span class="code-class">Subtask</span>&lt;<span class="code-class">U</span>&gt; fork(<span class="code-class">Callable</span>&lt;? <span class="code-keyword">extends</span> <span class="code-class">U</span>&gt; task)</div>[m
[31m-            <p class="api-desc">Starts a subtask that runs the given <code>Callable</code> in a new thread, a virtual thread by default, and immediately returns a <code>Subtask</code> handle without blocking. Its result or exception is available through the handle only after the owner calls <code>join()</code>. Only the owner may fork, and only before <code>join()</code>, otherwise it throws <code>WrongThreadException</code> or <code>IllegalStateException</code>; if the scope is already cancelled, the subtask is not run. It is a Java 25 preview API that needs <code>--enable-preview</code>.</p>[m
[32m+[m[32m            <p class="api-desc">Starts a subtask that runs the given <code>Callable</code> in a new thread, a virtual thread by default and immediately returns a <code>Subtask</code> handle without blocking. Its result or exception is available through the handle only after the owner calls <code>join()</code>. Only the owner may fork and only before <code>join()</code>, otherwise it throws <code>WrongThreadException</code> or <code>IllegalStateException</code>; if the scope is already cancelled, the subtask is not run. It is a Java 25 preview API that needs <code>--enable-preview</code>.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">try</span> (<span class="code-keyword">var</span> scope = <span class="code-class">StructuredTaskScope</span>.open()) {[m
     <span class="code-class">Subtask</span>&lt;<span class="code-class">Integer</span>&gt; balance = scope.fork(() -&gt; fetchBalance(accountId));[m
     <span class="code-class">Subtask</span>&lt;<span class="code-class">Integer</span>&gt; credit = scope.fork(() -&gt; fetchCreditLimit(accountId));[m
[36m@@ -5995,7 +5995,7 @@[m [mBUFFER.get().add(<span class="code-string">"second"</span>); <span class="code-c[m
         </div>[m
         <div class="method-entry" id="g47-4">[m
             <div id="tab-g47-4" class="api-sig">&lt;<span class="code-class">U</span> <span class="code-keyword">extends</span> <span class="code-class">T</span>&gt; <span class="code-class">Subtask</span>&lt;<span class="code-class">U</span>&gt; fork(<span class="code-class">Runnable</span> task)</div>[m
[31m-            <p class="api-desc">Starts a subtask that runs the given <code>Runnable</code>, for work that produces no value, and returns a <code>Subtask</code> whose <code>get()</code> yields <code>null</code> on success. Otherwise it behaves exactly like <code>fork(Callable)</code>: it does not block, runs in a new virtual thread by default, must be called by the owner before <code>join()</code>, and its failure is handled by the scope&rsquo;s joiner. Use it for side effects such as auditing or cache warming that must finish, or fail the scope, before the owner continues. It is a Java 25 preview API that needs <code>--enable-preview</code>.</p>[m
[32m+[m[32m            <p class="api-desc">Starts a subtask that runs the given <code>Runnable</code>, for work that produces no value and returns a <code>Subtask</code> whose <code>get()</code> yields <code>null</code> on success. Otherwise it behaves exactly like <code>fork(Callable)</code>: it does not block, runs in a new virtual thread by default, must be called by the owner before <code>join()</code> and its failure is handled by the scope&rsquo;s joiner. Use it for side effects such as auditing or cache warming that must finish, or fail the scope, before the owner continues. It is a Java 25 preview API that needs <code>--enable-preview</code>.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">try</span> (<span class="code-keyword">var</span> scope = <span class="code-class">StructuredTaskScope</span>.open()) {[m
     scope.fork(() -&gt; auditAccess(userId)); <span class="code-comment">Runnable: no result</span>[m
     scope.fork(() -&gt; warmCache(userId));[m
[36m@@ -6006,7 +6006,7 @@[m [mBUFFER.get().add(<span class="code-string">"second"</span>); <span class="code-c[m
         </div>[m
         <div class="method-entry" id="g47-5">[m
             <div id="tab-g47-5" class="api-sig"><span class="code-class">R</span> join() <span class="code-keyword">throws</span> <span class="code-class">InterruptedException</span></div>[m
[31m-            <p class="api-desc">Blocks the owner thread until the scope&rsquo;s <code>Joiner</code> decides the outcome, for example all subtasks finished, the first one succeeded, or one failed, and returns the joiner&rsquo;s result. It throws <code>InterruptedException</code> if the owner is interrupted, <code>FailedException</code> when the policy fails, <code>TimeoutException</code> if a configured timeout expires, and <code>WrongThreadException</code> or <code>IllegalStateException</code> when called by another thread or twice. Subtask handles may be queried only after it returns. It is a Java 25 preview API that needs <code>--enable-preview</code>.</p>[m
[32m+[m[32m            <p class="api-desc">Blocks the owner thread until the scope&rsquo;s <code>Joiner</code> decides the outcome, for example all subtasks finished, the first one succeeded, or one failed and returns the joiner&rsquo;s result. It throws <code>InterruptedException</code> if the owner is interrupted, <code>FailedException</code> when the policy fails, <code>TimeoutException</code> if a configured timeout expires and <code>WrongThreadException</code> or <code>IllegalStateException</code> when called by another thread or twice. Subtask handles may be queried only after it returns. It is a Java 25 preview API that needs <code>--enable-preview</code>.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> joiner = <span class="code-class">Joiner</span>.&lt;<span class="code-class">Price</span>&gt;allSuccessfulOrThrow();[m
 <span class="code-keyword">try</span> (<span class="code-keyword">var</span> scope = <span class="code-class">StructuredTaskScope</span>.open(joiner)) {[m
     <span class="code-keyword">for</span> (<span class="code-keyword">var</span> shop : shops) scope.fork(() -&gt; quote(shop));[m
[36m@@ -6019,7 +6019,7 @@[m [mBUFFER.get().add(<span class="code-string">"second"</span>); <span class="code-c[m
         </div>[m
         <div class="method-entry" id="g47-6">[m
             <div id="tab-g47-6" class="api-sig"><span class="code-keyword">void</span> close()</div>[m
[31m-            <p class="api-desc">Closes the scope: it cancels the scope if not already cancelled, interrupting any subtasks still running, then blocks until every subtask thread has terminated, so no thread outlives the block that created it. Only the owner may call it, normally through try-with-resources, otherwise it throws <code>WrongThreadException</code>; it throws <code>IllegalStateException</code> if the owner forked but never called <code>join()</code>, and <code>StructureViolationException</code> when scopes are closed out of nesting order. It is a Java 25 preview API that needs <code>--enable-preview</code>.</p>[m
[32m+[m[32m            <p class="api-desc">Closes the scope: it cancels the scope if not already cancelled, interrupting any subtasks still running, then blocks until every subtask thread has terminated, so no thread outlives the block that created it. Only the owner may call it, normally through try-with-resources, otherwise it throws <code>WrongThreadException</code>; it throws <code>IllegalStateException</code> if the owner forked but never called <code>join()</code> and <code>StructureViolationException</code> when scopes are closed out of nesting order. It is a Java 25 preview API that needs <code>--enable-preview</code>.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> joiner = <span class="code-class">Joiner</span>.&lt;<span class="code-class">String</span>&gt;anySuccessfulResultOrThrow();[m
 <span class="code-keyword">try</span> (<span class="code-keyword">var</span> scope = <span class="code-class">StructuredTaskScope</span>.open(joiner)) {[m
     scope.fork(() -&gt; slowLookup()); <span class="code-comment">Still running when join() returns</span>[m
[36m@@ -6030,7 +6030,7 @@[m [mBUFFER.get().add(<span class="code-string">"second"</span>); <span class="code-c[m
         </div>[m
         <div class="method-entry" id="g47-7">[m
             <div id="tab-g47-7" class="api-sig"><span class="code-keyword">void</span> cancel()</div>[m
[31m-            <p class="api-desc">Cancels the scope: no new subtasks are started, unfinished subtasks are interrupted, and a <code>join()</code> in progress returns early. It does not wait for subtask threads to finish, which <code>close()</code> still does, and cancelling twice has no extra effect. In the Java 25 preview, cancellation is usually triggered by the policy rather than called directly, when a <code>Joiner</code> returns <code>true</code> from <code>onFork</code> or <code>onComplete</code> or the configured timeout expires. It is a preview API that needs <code>--enable-preview</code>.</p>[m
[32m+[m[32m            <p class="api-desc">Cancels the scope: no new subtasks are started, unfinished subtasks are interrupted and a <code>join()</code> in progress returns early. It does not wait for subtask threads to finish, which <code>close()</code> still does and cancelling twice has no extra effect. In the Java 25 preview, cancellation is usually triggered by the policy rather than called directly, when a <code>Joiner</code> returns <code>true</code> from <code>onFork</code> or <code>onComplete</code> or the configured timeout expires. It is a preview API that needs <code>--enable-preview</code>.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">try</span> (<span class="code-keyword">var</span> scope = <span class="code-class">StructuredTaskScope</span>.open(<span class="code-class">Joiner</span>.awaitAll())) {[m
     scope.fork(() -&gt; crawl(siteA));[m
     scope.fork(() -&gt; crawl(siteB));[m
[36m@@ -6086,7 +6086,7 @@[m [mBUFFER.get().add(<span class="code-string">"second"</span>); <span class="code-c[m
             <li><code>anySuccessfulOrThrow()</code></li>[m
             <li><code>allUntil(predicate)</code></li>[m
         </ul>[m
[31m-        <p>Scope configuration includes <code>withName()</code>, <code>withThreadFactory()</code>, and <code>withTimeout(Duration)</code>.</p>[m
[32m+[m[32m        <p>Scope configuration includes <code>withName()</code>, <code>withThreadFactory()</code> and <code>withTimeout(Duration)</code>.</p>[m
         <p class="minor-heading"><strong>16.2 Complete example</strong></p>[m
     </div>[m
     <div class="section code-section">[m
[36m@@ -6271,7 +6271,7 @@[m [mBUFFER.get().add(<span class="code-string">"second"</span>); <span class="code-c[m
         </div>[m
         <div class="method-entry" id="g50-3">[m
             <div id="tab-g50-3" class="api-sig"><span class="code-keyword">boolean</span> tryAcquire(<span class="code-keyword">int</span> arg)</div>[m
[31m-            <p class="api-desc">The hook a subclass overrides to attempt exclusive acquisition: check the state, try to claim it, usually with <code>compareAndSetState</code>, record the owner, and return <code>true</code> on success or <code>false</code> to make the caller wait. AQS calls it from <code>acquire</code>, <code>acquireInterruptibly</code> and <code>tryAcquireNanos</code>, on the first attempt and each time a queued thread wakes, so it must be fast and must never block. The default implementation throws <code>UnsupportedOperationException</code>. For reentrancy, compare <code>getExclusiveOwnerThread()</code> and increment the state.</p>[m
[32m+[m[32m            <p class="api-desc">The hook a subclass overrides to attempt exclusive acquisition: check the state, try to claim it, usually with <code>compareAndSetState</code>, record the owner and return <code>true</code> on success or <code>false</code> to make the caller wait. AQS calls it from <code>acquire</code>, <code>acquireInterruptibly</code> and <code>tryAcquireNanos</code>, on the first attempt and each time a queued thread wakes, so it must be fast and must never block. The default implementation throws <code>UnsupportedOperationException</code>. For reentrancy, compare <code>getExclusiveOwnerThread()</code> and increment the state.</p>[m
             <div class="code-block"><pre><code><span class="code-annotation">@Override</span>[m
 <span class="code-keyword">protected</span> <span class="code-keyword">boolean</span> tryAcquire(<span class="code-keyword">int</span> acquires) {[m
     <span class="code-class">Thread</span> current = <span class="code-class">Thread</span>.currentThread();[m
[36m@@ -6287,7 +6287,7 @@[m [mBUFFER.get().add(<span class="code-string">"second"</span>); <span class="code-c[m
         </div>[m
         <div class="method-entry" id="g50-4">[m
             <div id="tab-g50-4" class="api-sig"><span class="code-keyword">boolean</span> tryRelease(<span class="code-keyword">int</span> arg)</div>[m
[31m-            <p class="api-desc">The hook a subclass overrides to release exclusive mode: update the state, clear the owner once fully released, and return <code>true</code> only when the synchronizer is completely free so a waiting thread may acquire. AQS calls it from <code>release(int)</code> and, when it returns <code>true</code>, unparks the next queued thread. It runs in the owning thread, so a plain <code>setState</code> is enough; throw <code>IllegalMonitorStateException</code> if the caller is not the owner. The default implementation throws <code>UnsupportedOperationException</code>.</p>[m
[32m+[m[32m            <p class="api-desc">The hook a subclass overrides to release exclusive mode: update the state, clear the owner once fully released and return <code>true</code> only when the synchronizer is completely free so a waiting thread may acquire. AQS calls it from <code>release(int)</code> and, when it returns <code>true</code>, unparks the next queued thread. It runs in the owning thread, so a plain <code>setState</code> is enough; throw <code>IllegalMonitorStateException</code> if the caller is not the owner. The default implementation throws <code>UnsupportedOperationException</code>.</p>[m
             <div class="code-block"><pre><code><span class="code-annotation">@Override</span>[m
 <span class="code-keyword">protected</span> <span class="code-keyword">boolean</span> tryRelease(<span class="code-keyword">int</span> releases) {[m
     <span class="code-keyword">if</span> (!isHeldExclusively()) <span class="code-keyword">throw</span> <span class="code-keyword">new</span> <span class="code-class">IllegalMonitorStateException</span>();[m
[36m@@ -6300,7 +6300,7 @@[m [mBUFFER.get().add(<span class="code-string">"second"</span>); <span class="code-c[m
         </div>[m
         <div class="method-entry" id="g50-5">[m
             <div id="tab-g50-5" class="api-sig"><span class="code-keyword">int</span> tryAcquireShared(<span class="code-keyword">int</span> arg)</div>[m
[31m-            <p class="api-desc">The hook a subclass overrides to attempt shared acquisition. Return a negative value on failure so the thread is queued, zero if it succeeded but no further shared acquire can, and a positive value if later shared acquirers may also succeed, which makes AQS propagate the wake-up to the next waiter. AQS calls it from <code>acquireShared</code> and its interruptible and timed variants, so it must not block. Latches, semaphores and read locks are built this way; the default throws <code>UnsupportedOperationException</code>.</p>[m
[32m+[m[32m            <p class="api-desc">The hook a subclass overrides to attempt shared acquisition. Return a negative value on failure so the thread is queued, zero if it succeeded but no further shared acquire can and a positive value if later shared acquirers may also succeed, which makes AQS propagate the wake-up to the next waiter. AQS calls it from <code>acquireShared</code> and its interruptible and timed variants, so it must not block. Latches, semaphores and read locks are built this way; the default throws <code>UnsupportedOperationException</code>.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">public</span> <span class="code-keyword">class</span> <span class="code-class">LatchSync</span> <span class="code-keyword">extends</span> <span class="code-class">AbstractQueuedSynchronizer</span> {[m
     <span class="code-keyword">public</span> <span class="code-class">LatchSync</span>(<span class="code-keyword">int</span> count) { setState(count); }[m
 [m
[36m@@ -6312,7 +6312,7 @@[m [mBUFFER.get().add(<span class="code-string">"second"</span>); <span class="code-c[m
         </div>[m
         <div class="method-entry" id="g50-6">[m
             <div id="tab-g50-6" class="api-sig"><span class="code-keyword">boolean</span> tryReleaseShared(<span class="code-keyword">int</span> arg)</div>[m
[31m-            <p class="api-desc">The hook a subclass overrides to release in shared mode: update the state, usually in a <code>compareAndSetState</code> retry loop because several threads can release at once, and return <code>true</code> if the release may let waiting acquirers succeed. AQS calls it from <code>releaseShared(int)</code> and, on <code>true</code>, wakes queued shared waiters. A latch returns <code>true</code> only when the count reaches zero, while a semaphore returns <code>true</code> after every release. The default implementation throws <code>UnsupportedOperationException</code>.</p>[m
[32m+[m[32m            <p class="api-desc">The hook a subclass overrides to release in shared mode: update the state, usually in a <code>compareAndSetState</code> retry loop because several threads can release at once and return <code>true</code> if the release may let waiting acquirers succeed. AQS calls it from <code>releaseShared(int)</code> and, on <code>true</code>, wakes queued shared waiters. A latch returns <code>true</code> only when the count reaches zero, while a semaphore returns <code>true</code> after every release. The default implementation throws <code>UnsupportedOperationException</code>.</p>[m
             <div class="code-block"><pre><code><span class="code-annotation">@Override</span>[m
 <span class="code-keyword">protected</span> <span class="code-keyword">boolean</span> tryReleaseShared(<span class="code-keyword">int</span> ignored) {[m
     <span class="code-keyword">while</span> (<span class="code-keyword">true</span>) {[m
[36m@@ -6335,7 +6335,7 @@[m [mBUFFER.get().add(<span class="code-string">"second"</span>); <span class="code-c[m
         </div>[m
         <div class="method-entry" id="g50-8">[m
             <div id="tab-g50-8" class="api-sig"><span class="code-keyword">void</span> acquireInterruptibly(<span class="code-keyword">int</span> arg) <span class="code-keyword">throws</span> <span class="code-class">InterruptedException</span></div>[m
[31m-            <p class="api-desc">Acquires in exclusive mode like <code>acquire</code>, but aborts on interruption: it checks the interrupt status first and while parked, and throws <code>InterruptedException</code> instead of waiting further. It is public final, calls the subclass&rsquo;s <code>tryAcquire</code>, and returns normally only when acquisition succeeded. Use it to implement <code>lockInterruptibly()</code> so blocked threads can be cancelled, for example during shutdown. After an <code>InterruptedException</code> the lock is not held, so do not call <code>release</code>.</p>[m
[32m+[m[32m            <p class="api-desc">Acquires in exclusive mode like <code>acquire</code>, but aborts on interruption: it checks the interrupt status first and while parked and throws <code>InterruptedException</code> instead of waiting further. It is public final, calls the subclass&rsquo;s <code>tryAcquire</code> and returns normally only when acquisition succeeded. Use it to implement <code>lockInterruptibly()</code> so blocked threads can be cancelled, for example during shutdown. After an <code>InterruptedException</code> the lock is not held, so do not call <code>release</code>.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">try</span> {[m
     sync.acquireInterruptibly(<span class="code-number">1</span>); <span class="code-comment">Throws if interrupted while queued</span>[m
     <span class="code-keyword">try</span> {[m
[36m@@ -6350,7 +6350,7 @@[m [mBUFFER.get().add(<span class="code-string">"second"</span>); <span class="code-c[m
         </div>[m
         <div class="method-entry" id="g50-9">[m
             <div id="tab-g50-9" class="api-sig"><span class="code-keyword">boolean</span> tryAcquireNanos(<span class="code-keyword">int</span> arg, <span class="code-keyword">long</span> nanosTimeout) <span class="code-keyword">throws</span> <span class="code-class">InterruptedException</span></div>[m
[31m-            <p class="api-desc">Attempts exclusive acquisition with a timeout: it calls <code>tryAcquire</code>, queues and parks the thread if needed, and gives up when the time runs out. It returns <code>true</code> if acquired and <code>false</code> on timeout, and throws <code>InterruptedException</code> if the thread is interrupted. It is public final and backs <code>ReentrantLock.tryLock(long, TimeUnit)</code>. A timeout of zero or less makes a single attempt without waiting. Release only when it returned <code>true</code>.</p>[m
[32m+[m[32m            <p class="api-desc">Attempts exclusive acquisition with a timeout: it calls <code>tryAcquire</code>, queues and parks the thread if needed and gives up when the time runs out. It returns <code>true</code> if acquired and <code>false</code> on timeout and throws <code>InterruptedException</code> if the thread is interrupted. It is public final and backs <code>ReentrantLock.tryLock(long, TimeUnit)</code>. A timeout of zero or less makes a single attempt without waiting. Release only when it returned <code>true</code>.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">long</span> timeout = <span class="code-class">TimeUnit</span>.MILLISECONDS.toNanos(<span class="code-number">500</span>);[m
 <span class="code-keyword">if</span> (sync.tryAcquireNanos(<span class="code-number">1</span>, timeout)) { <span class="code-comment">Waits at most 500 ms</span>[m
     <span class="code-keyword">try</span> {[m
[36m@@ -6364,7 +6364,7 @@[m [mBUFFER.get().add(<span class="code-string">"second"</span>); <span class="code-c[m
         </div>[m
         <div class="method-entry" id="g50-10">[m
             <div id="tab-g50-10" class="api-sig"><span class="code-keyword">boolean</span> release(<span class="code-keyword">int</span> arg)</div>[m
[31m-            <p class="api-desc">Releases in exclusive mode: it calls the subclass&rsquo;s <code>tryRelease</code> and, if that returns <code>true</code>, unparks the next thread in the wait queue so it can try to acquire. It returns whatever <code>tryRelease</code> returned, never blocks, and propagates exceptions from <code>tryRelease</code>, typically <code>IllegalMonitorStateException</code> when the caller is not the owner. It is public final and is what a lock&rsquo;s <code>unlock()</code> calls. Always call it in a <code>finally</code> block after a successful acquire.</p>[m
[32m+[m[32m            <p class="api-desc">Releases in exclusive mode: it calls the subclass&rsquo;s <code>tryRelease</code> and, if that returns <code>true</code>, unparks the next thread in the wait queue so it can try to acquire. It returns whatever <code>tryRelease</code> returned, never blocks and propagates exceptions from <code>tryRelease</code>, typically <code>IllegalMonitorStateException</code> when the caller is not the owner. It is public final and is what a lock&rsquo;s <code>unlock()</code> calls. Always call it in a <code>finally</code> block after a successful acquire.</p>[m
             <div class="code-block"><pre><code>sync.acquire(<span class="code-number">1</span>);[m
 <span class="code-keyword">try</span> {[m
     inventory.reserve(item); <span class="code-comment">Critical section</span>[m
[36m@@ -6375,7 +6375,7 @@[m [mBUFFER.get().add(<span class="code-string">"second"</span>); <span class="code-c[m
         </div>[m
         <div class="method-entry" id="g50-11">[m
             <div id="tab-g50-11" class="api-sig"><span class="code-keyword">void</span> acquireShared(<span class="code-keyword">int</span> arg)</div>[m
[31m-            <p class="api-desc">Acquires in shared mode, ignoring interrupts: it calls the subclass&rsquo;s <code>tryAcquireShared</code> and, while the result is negative, enqueues and parks the thread until a later attempt returns zero or more. Several threads can hold shared mode at once, and a positive result propagates the wake-up to other shared waiters. It is public final, returns nothing and may block indefinitely; use <code>acquireSharedInterruptibly</code> when waiting must be cancellable, as <code>CountDownLatch.await()</code> does.</p>[m
[32m+[m[32m            <p class="api-desc">Acquires in shared mode, ignoring interrupts: it calls the subclass&rsquo;s <code>tryAcquireShared</code> and, while the result is negative, enqueues and parks the thread until a later attempt returns zero or more. Several threads can hold shared mode at once and a positive result propagates the wake-up to other shared waiters. It is public final, returns nothing and may block indefinitely; use <code>acquireSharedInterruptibly</code> when waiting must be cancellable, as <code>CountDownLatch.await()</code> does.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">public</span> <span class="code-keyword">class</span> <span class="code-class">Latch</span> {[m
     <span class="code-class">Sync</span> sync; <span class="code-comment">Sync.tryAcquireShared returns 1 once the count is 0</span>[m
 [m
[36m@@ -6400,7 +6400,7 @@[m [mlatch.releaseShared(<span class="code-number">1</span>); <span class="code-comme[m
         </div>[m
         <div class="method-entry" id="g50-13">[m
             <div id="tab-g50-13" class="api-sig"><span class="code-keyword">boolean</span> hasQueuedThreads()</div>[m
[31m-            <p class="api-desc">Returns <code>true</code> if any threads may be waiting to acquire, in exclusive or shared mode. Because waits can be cancelled by interrupts or timeouts at any moment, <code>true</code> does not guarantee that a thread will ever acquire, and the queue can change right after the call. It is public final, non-blocking and much cheaper than <code>getQueueLength()</code>, so it suits quick contention checks in monitoring code. <code>ReentrantLock.hasQueuedThreads()</code> delegates to it.</p>[m
[32m+[m[32m            <p class="api-desc">Returns <code>true</code> if any threads may be waiting to acquire, in exclusive or shared mode. Because waits can be cancelled by interrupts or timeouts at any moment, <code>true</code> does not guarantee that a thread will ever acquire and the queue can change right after the call. It is public final, non-blocking and much cheaper than <code>getQueueLength()</code>, so it suits quick contention checks in monitoring code. <code>ReentrantLock.hasQueuedThreads()</code> delegates to it.</p>[m
             <div class="code-block"><pre><code>sync.acquire(<span class="code-number">1</span>);[m
 <span class="code-class">Thread</span> waiter = <span class="code-class">Thread</span>.ofVirtual().start(() -&gt; sync.acquire(<span class="code-number">1</span>));[m
 <span class="code-class">Thread</span>.sleep(<span class="code-number">100</span>); <span class="code-comment">Give the waiter time to queue</span>[m
[36m@@ -6411,7 +6411,7 @@[m [mwaiter.join();[m
         </div>[m
         <div class="method-entry" id="g50-14">[m
             <div id="tab-g50-14" class="api-sig"><span class="code-keyword">int</span> getQueueLength()</div>[m
[31m-            <p class="api-desc">Returns an estimate of the number of threads waiting to acquire, counted by traversing the wait queue. The value is approximate because threads join and leave the queue while it is counted, and although the call does not block, it takes time proportional to the queue length. It is public final and meant for monitoring, as in <code>ReentrantLock.getQueueLength()</code> or <code>Semaphore.getQueueLength()</code>, not for synchronization control. Use <code>hasQueuedThreads()</code> when you only need to know whether anyone is waiting.</p>[m
[32m+[m[32m            <p class="api-desc">Returns an estimate of the number of threads waiting to acquire, counted by traversing the wait queue. The value is approximate because threads join and leave the queue while it is counted and although the call does not block, it takes time proportional to the queue length. It is public final and meant for monitoring, as in <code>ReentrantLock.getQueueLength()</code> or <code>Semaphore.getQueueLength()</code>, not for synchronization control. Use <code>hasQueuedThreads()</code> when you only need to know whether anyone is waiting.</p>[m
             <div class="code-block"><pre><code>sync.acquire(<span class="code-number">1</span>); <span class="code-comment">Main thread holds the lock</span>[m
 <span class="code-keyword">for</span> (<span class="code-keyword">int</span> i = <span class="code-number">0</span>; i &lt; <span class="code-number">3</span>; i++) <span class="code-class">Thread</span>.ofVirtual().start(() -&gt; sync.acquire(<span class="code-number">1</span>));[m
 <span class="code-class">Thread</span>.sleep(<span class="code-number">100</span>); <span class="code-comment">Let the three threads queue up</span>[m
[36m@@ -6420,7 +6420,7 @@[m [msync.release(<span class="code-number">1</span>); <span class="code-comment">The[m
         </div>[m
         <div class="method-entry" id="g50-15">[m
             <div id="tab-g50-15" class="api-sig"><span class="code-class">Thread</span> getFirstQueuedThread()</div>[m
[31m-            <p class="api-desc">Returns the first, longest-waiting thread in the wait queue, or <code>null</code> if no thread is queued. It is public final, does not block, and normally runs in constant time, but may traverse the queue if other threads are changing it at that moment. Because that thread may acquire or give up immediately after the call, use the result only for diagnostics, such as logging which thread is next in line, or in heuristics together with <code>isQueued(thread)</code>.</p>[m
[32m+[m[32m            <p class="api-desc">Returns the first, longest-waiting thread in the wait queue, or <code>null</code> if no thread is queued. It is public final, does not block and normally runs in constant time, but may traverse the queue if other threads are changing it at that moment. Because that thread may acquire or give up immediately after the call, use the result only for diagnostics, such as logging which thread is next in line, or in heuristics together with <code>isQueued(thread)</code>.</p>[m
             <div class="code-block"><pre><code>sync.acquire(<span class="code-number">1</span>);[m
 <span class="code-class">Thread</span> first = <span class="code-class">Thread</span>.ofVirtual().name(<span class="code-string">"first"</span>).start(() -&gt; sync.acquire(<span class="code-number">1</span>));[m
 <span class="code-class">Thread</span>.sleep(<span class="code-number">50</span>);[m
[36m@@ -6570,7 +6570,7 @@[m [mpool.execute(() -&gt; <span class="code-class">System</span>.out.println(<span c[m
         </div>[m
         <div class="method-entry" id="g51-2">[m
             <div id="tab-g51-2" class="api-sig"><span class="code-keyword">final</span> <span class="code-keyword">class</span> <span class="code-class">SplittableRandom</span></div>[m
[31m-            <p class="api-desc">A fast, non-thread-safe generator of uniform pseudorandom values whose <code>split()</code> returns a new generator that shares no mutable state with its parent and produces a statistically independent sequence. It is designed for fork/join and parallel stream work, where each subtask splits off its own generator instead of sharing one. It never blocks and also offers streams such as <code>ints(n, origin, bound)</code>. Never use one instance from several threads, and never use it for security; for ordinary multithreaded code <code>ThreadLocalRandom</code> is simpler.</p>[m
[32m+[m[32m            <p class="api-desc">A fast, non-thread-safe generator of uniform pseudorandom values whose <code>split()</code> returns a new generator that shares no mutable state with its parent and produces a statistically independent sequence. It is designed for fork/join and parallel stream work, where each subtask splits off its own generator instead of sharing one. It never blocks and also offers streams such as <code>ints(n, origin, bound)</code>. Never use one instance from several threads and never use it for security; for ordinary multithreaded code <code>ThreadLocalRandom</code> is simpler.</p>[m
             <div class="code-block"><pre><code><span class="code-keyword">var</span> root = <span class="code-keyword">new</span> <span class="code-class">SplittableRandom</span>(<span class="code-number">42</span>); <span class="code-comment">Seeded: reproducible results</span>[m
 <span class="code-class">SplittableRandom</span> left = root.split(); <span class="code-comment">Independent child generator</span>[m
 <span class="code-class">SplittableRandom</span> right = root.split(); <span class="code-comment">Another child, no shared state</span>[m
[36m@@ -6601,7 +6601,7 @@[m [mpool.execute(() -&gt; <span class="code-class">System</span>.out.println(<span c[m
         </div>[m
         <div class="method-entry" id="g51-5">[m
             <div id="tab-g51-5" class="api-sig"><span class="code-keyword">class</span> <span class="code-class">ThreadGroup</span></div>[m
[31m-            <p class="api-desc">A legacy mechanism that groups threads into a tree, where every thread belongs to a group, by default its creator&rsquo;s. Since Java 19 it is heavily degraded: groups are never destroyed, the <code>stop</code>, <code>suspend</code> and <code>resume</code> methods no longer work, and all virtual threads share one special group. Methods such as <code>activeCount()</code> and <code>enumerate(Thread[])</code> see only platform threads and return estimates, so they are unreliable for monitoring. Prefer executors, thread factories and <code>ThreadMXBean</code> in new code.</p>[m
[32m+[m[32m            <p class="api-desc">A legacy mechanism that groups threads into a tree, where every thread belongs to a group, by default its creator&rsquo;s. Since Java 19 it is heavily degraded: groups are never destroyed, the <code>stop</code>, <code>suspend</code> and <code>resume</code> methods no longer work and all virtual threads share one special group. Methods such as <code>activeCount()</code> and <code>enumerate(Thread[])</code> see only platform threads and return estimates, so they are unreliable for monitoring. Prefer executors, thread factories and <code>ThreadMXBean</code> in new code.</p>[m
             <div class="code-block"><pre><code><span class="code-class">ThreadGroup</span> group = <span class="code-class">Thread</span>.currentThread().getThreadGroup();[m
 <span class="code-class">System</span>.out.println(group.getName()); <span class="code-comment">main</span>[m
 <span class="code-class">System</span>.out.println(group.activeCount()); <span class="code-comment">Estimate of live platform threads</span>[m
[36m@@ -6613,7 +6613,7 @@[m [mpool.execute(() -&gt; <span class="code-class">System</span>.out.println(<span c[m
         </div>[m
         <div class="method-entry" id="g51-6">[m
             <div id="tab-g51-6" class="api-sig"><span class="code-keyword">class</span> <span class="code-class">Timer</span></div>[m
[31m-            <p class="api-desc">A legacy scheduler that runs <code>TimerTask</code>s one after another on a single background thread, with <code>schedule</code> for one-shot or fixed-delay runs and <code>scheduleAtFixedRate</code> for fixed-rate runs. Scheduling never blocks, and <code>cancel()</code> stops the timer. Its weaknesses are serious: one slow task delays all others, an uncaught exception kills the thread so later scheduling throws <code>IllegalStateException</code>, and it depends on the system clock. Prefer <code>ScheduledExecutorService</code>, which uses a pool and survives task failures.</p>[m
[32m+[m[32m            <p class="api-desc">A legacy scheduler that runs <code>TimerTask</code>s one after another on a single background thread, with <code>schedule</code> for one-shot or fixed-delay runs and <code>scheduleAtFixedRate</code> for fixed-rate runs. Scheduling never blocks and <code>cancel()</code> stops the timer. Its weaknesses are serious: one slow task delays all others, an uncaught exception kills the thread so later scheduling throws <code>IllegalStateException</code> and it depends on the system clock. Prefer <code>ScheduledExecutorService</code>, which uses a pool and survives task failures.</p>[m
             <div class="code-block"><pre><code><span class="code-class">Timer</span> timer = <span class="code-keyword">new</span> <span class="code-class">Timer</span>(<span class="code-string">"reminders"</span>, <span class="code-keyword">true</span>); <span class="code-comment">Daemon thread, legacy API</span>[m
 timer.schedule(reminderTask, <span class="code-number">5_000</span>); <span class="code-comment">Once, after 5 seconds</span>[m
 timer.scheduleAtFixedRate(heartbeatTask, <span class="code-number">0</span>, <span class="code-number">1_000</span>); <span class="code-comment">Every second</span>[m
[36m@@ -6624,7 +6624,7 @@[m [mmodern.scheduleAtFixedRate(() -&gt; sendHeartbeat(), <span class="code-number">0[m
         </div>[m
         <div class="method-entry" id="g51-7">[m
             <div id="tab-g51-7" class="api-sig"><span class="code-keyword">abstract</span> <span class="code-keyword">class</span> <span class="code-class">TimerTask</span> <span class="code-keyword">implements</span> <span class="code-class">Runnable</span></div>[m
[31m-            <p class="api-desc">An abstract <code>Runnable</code> you subclass to define work for a <code>Timer</code> by implementing <code>run()</code>. It adds <code>cancel()</code>, which stops future executions and returns <code>true</code> if it prevented a scheduled run, and <code>scheduledExecutionTime()</code>, the planned time of the latest run, useful for skipping late executions. An instance can be scheduled only once; scheduling it again throws <code>IllegalStateException</code>. Catch exceptions inside <code>run()</code>, since an uncaught one kills the whole <code>Timer</code>. New code should use <code>ScheduledExecutorService</code>.</p>[m
[32m+[m[32m            <p class="api-desc">An abstract <code>Runnable</code> you subclass to define work for a <code>Timer</code> by implementing <code>run()</code>. It adds <code>cancel()</code>, which stops future executions and returns <code>true</code> if it prevented a scheduled run and <code>scheduledExecutionTime()</code>, the planned time of the latest run, useful for skipping late executions. An instance can be scheduled only once; scheduling it again throws <code>IllegalStateException</code>. Catch exceptions inside <code>run()</code>, since an uncaught one kills the whole <code>Timer</code>. New code should use <code>ScheduledExecutorService</code>.</p>[m
             <div class="code-block"><pre><code><span class="code-class">TimerTask</span> heartbeat = <span class="code-keyword">new</span> <span class="code-class">TimerTask</span>() {[m
     <span class="code-annotation">@Override</span>[m
     <span class="code-keyword">public</span> <span class="code-keyword">void</span> run() {[m
[36m@@ -6640,7 +6640,7 @@[m [mheartbeat.cancel(); <span class="code-comment">Later: stops future runs, returns[m
         </div>[m
         <div class="method-entry" id="g51-8">[m
             <div id="tab-g51-8" class="api-sig"><span class="code-keyword">interface</span> <span class="code-class">ThreadMXBean</span></div>[m
[31m-            <p class="api-desc">The management interface for the JVM&rsquo;s thread system, obtained with <code>ManagementFactory.getThreadMXBean()</code>. It reports live, peak, daemon and total started thread counts, per-thread CPU time, contention statistics and <code>ThreadInfo</code> snapshots, and <code>findDeadlockedThreads()</code> returns the IDs of threads deadlocked on monitors or ownable synchronizers, or <code>null</code> if there are none. Calls do not block application threads but some, such as full dumps, are expensive. It covers platform threads only; virtual threads are not included.</p>[m
[32m+[m[32m            <p class="api-desc">The management interface for the JVM&rsquo;s thread system, obtained with <code>ManagementFactory.getThreadMXBean()</code>. It reports live, peak, daemon and total started thread counts, per-thread CPU time, contention statistics and <code>ThreadInfo</code> snapshots and <code>findDeadlockedThreads()</code> returns the IDs of threads deadlocked on monitors or ownable synchronizers, or <code>null</code> if there are none. Calls do not block application threads but some, such as full dumps, are expensive. It covers platform threads only; virtual threads are not included.</p>[m
             <div class="code-block"><pre><code><span class="code-class">ThreadMXBean</span> bean = <span class="code-class">ManagementFactory</span>.getThreadMXBean();[m
 <span class="code-class">System</span>.out.println(<span class="code-string">"Live: "</span> + bean.getThreadCount()); <span class="code-comment">e.g. 23</span>[m
 <span class="code-class">System</span>.out.println(<span class="code-string">"Peak: "</span> + bean.getPeakThreadCount());[m
[36m@@ -6654,7 +6654,7 @@[m [mheartbeat.cancel(); <span class="code-comment">Later: stops future runs, returns[m
         </div>[m
         <div class="method-entry" id="g51-9">[m
             <div id="tab-g51-9" class="api-sig"><span class="code-keyword">class</span> <span class="code-class">ThreadInfo</span></div>[m
[31m-            <p class="api-desc">An immutable snapshot of one thread, returned by <code>ThreadMXBean.getThreadInfo(...)</code> and <code>dumpAllThreads(...)</code>, holding its name, ID, <code>Thread.State</code>, stack trace, the lock it is blocked on and that lock&rsquo;s owner, plus blocked and waited counts. <code>getThreadInfo(id)</code> returns <code>null</code> if the thread is not alive, and the stack trace is empty unless you request a depth. Held monitors and synchronizers are included only when asked for with the <code>lockedMonitors</code> and <code>lockedSynchronizers</code> flags. Use it for custom thread dumps or contention reports.</p>[m
[32m+[m[32m            <p class="api-desc">An immutable snapshot of one thread, returned by <code>ThreadMXBean.getThreadInfo(...)</code> and <code>dumpAllThreads(...)</code>, holding its name, ID, <code>Thread.State</code>, stack trace, the lock it is blocked on and that lock&rsquo;s owner, plus blocked and waited counts. <code>getThreadInfo(id)</code> returns <code>null</code> if the thread is not alive and the stack trace is empty unless you request a depth. Held monitors and synchronizers are included only when asked for with the <code>lockedMonitors</code> and <code>lockedSynchronizers</code> flags. Use it for custom thread dumps or contention reports.</p>[m
             <div class="code-block"><pre><code><span class="code-class">ThreadMXBean</span> bean = <span class="code-class">ManagementFactory</span>.getThreadMXBean();[m
 <span class="code-class">ThreadInfo</span> info = bean.getThreadInfo(worker.threadId(), <span class="code-number">10</span>); <span class="code-comment">10 frames</span>[m
 <span class="code-keyword">if</span> (info != <span class="code-keyword">null</span> &amp;&amp; info.getThreadState() == <span class="code-class">Thread</span>.<span class="code-class">State</span>.BLOCKED) {[m
[36m@@ -6667,7 +6667,7 @@[m [mheartbeat.cancel(); <span class="code-comment">Later: stops future runs, returns[m
         </div>[m
         <div class="method-entry" id="g51-10">[m
             <div id="tab-g51-10" class="api-sig"><span class="code-keyword">class</span> <span class="code-class">LockInfo</span></div>[m
[31m-            <p class="api-desc">Describes a lock by its class name and identity hash code. <code>ThreadInfo.getLockInfo()</code> returns one for the object a thread is blocked or waiting on, or <code>null</code> if it is not waiting, and <code>getLockedSynchronizers()</code> returns them for held ownable synchronizers such as a <code>ReentrantLock</code>&rsquo;s internal sync. It covers both intrinsic monitors and <code>java.util.concurrent</code> locks. Its <code>toString()</code> matches <code>ThreadInfo.getLockName()</code>, and the identity hash lets you match the same lock across several threads&rsquo; snapshots.</p>[m
[32m+[m[32m            <p class="api-desc">Describes a lock by its class name and identity hash code. <code>ThreadInfo.getLockInfo()</code> returns one for the object a thread is blocked or waiting on, or <code>null</code> if it is not waiting and <code>getLockedSynchronizers()</code> returns them for held ownable synchronizers such as a <code>ReentrantLock</code>&rsquo;s internal sync. It covers both intrinsic monitors and <code>java.util.concurrent</code> locks. Its <code>toString()</code> matches <code>ThreadInfo.getLockName()</code> and the identity hash lets you match the same lock across several threads&rsquo; snapshots.</p>[m
             <div class="code-block"><pre><code><span class="code-class">ThreadInfo</span> info = bean.getThreadInfo(threadId);[m
 <span class="code-class">LockInfo</span> lock = info.getLockInfo(); <span class="code-comment">null if the thread is not waiting</span>[m
 <span class="code-keyword">if</span> (lock != <span class="code-keyword">null</span>) {[m
[36m@@ -6705,7 +6705,7 @@[m [mheartbeat.cancel(); <span class="code-comment">Later: stops future runs, returns[m
         </div>[m
     </div>[m
     <div class="intro">[m
[31m-        <p>Additional methods include <code>convert(...)</code>, <code>toChronoUnit()</code>, and <code>of(ChronoUnit)</code>.</p>[m
[32m+[m[32m        <p>Additional methods include <code>convert(...)</code>, <code>toChronoUnit()</code> and <code>of(ChronoUnit)</code>.</p>[m
         <p class="minor-heading"><strong>19.2 Custom <code>ThreadFactory</code></strong></p>[m
     </div>[m
     <div class="section code-section">[m
[36m@@ -6723,7 +6723,7 @@[m [mheartbeat.cancel(); <span class="code-comment">Later: stops future runs, returns[m
         </div>[m
     </div>[m
     <div class="intro">[m
[31m-        <p>Thread factories are especially valuable for executor naming, diagnostics, and exception handlers.</p>[m
[32m+[m[32m        <p>Thread factories are especially valuable for executor naming, diagnostics and exception handlers.</p>[m
         <p class="minor-heading"><strong>19.3 Thread-safe random generation</strong></p>[m
     </div>[m
     <div class="section code-section">[m
[36m@@ -6752,7 +6752,7 @@[m [mheartbeat.cancel(); <span class="code-comment">Later: stops future runs, returns[m
         </div>[m
     </div>[m
     <div class="intro">[m
[31m-        <p><code>ThreadMXBean</code> also provides methods for thread CPU-time monitoring, blocked/waited counts, and stack inspection, subject to JVM support and permissions.</p>[m
[32m+[m[32m        <p><code>ThreadMXBean</code> also provides methods for thread CPU-time monitoring, blocked/waited counts and stack inspection, subject to JVM support and permissions.</p>[m
     </div>[m
 [m
     <div class="subheading">20. Common concurrency exceptions</div>[m
[36m@@ -6883,7 +6883,7 @@[m [mheartbeat.cancel(); <span class="code-comment">Later: stops future runs, returns[m
 [m
     <div class="subheading">23. Official API references</div>[m
     <div class="intro">[m
[31m-        <p>These are the authoritative starting points for method overloads, inheritance, memory semantics, and version-specific changes.</p>[m
[32m+[m[32m        <p>These are the authoritative starting points for method overloads, inheritance, memory semantics and version-specific changes.</p>[m
         <div class="gpt-table-wrap"><table class="gpt-table">[m
             <thead><tr><th>Reference</th><th>Official documentation</th></tr></thead>[m
             <tbody>[m
[36m@@ -6899,8 +6899,8 @@[m [mheartbeat.cancel(); <span class="code-comment">Later: stops future runs, returns[m
                 <tr><td>Java Memory Model</td><td>Java Language Specification — Chapter 17</td></tr>[m
             </tbody>[m
         </table></div>[m
[31m-        <p>This is a broad reference of Java&rsquo;s core thread, locking, and concurrency API families, with executable examples for the major mechanisms. It groups related overloads and advanced methods rather than reproducing every inherited method and Javadoc signature individually.</p>[m
[31m-        <p>For backend engineering, the highest-value sequence to master is <strong>Java Memory Model → synchronized/volatile → ReentrantLock/Condition → ExecutorService/ThreadPoolExecutor → Atomic/CAS → ConcurrentHashMap/BlockingQueue → CompletableFuture → Virtual Threads → ForkJoinPool → AQS</strong>. Those concepts form the foundation for reasoning about Spring Boot concurrency, request handling, parallel processing, asynchronous workflows, and shared-state correctness.</p>[m
[32m+[m[32m        <p>This is a broad reference of Java&rsquo;s core thread, locking and concurrency API families, with executable examples for the major mechanisms. It groups related overloads and advanced methods rather than reproducing every inherited method and Javadoc signature individually.</p>[m
[32m+[m[32m        <p>For backend engineering, the highest-value sequence to master is <strong>Java Memory Model → synchronized/volatile → ReentrantLock/Condition → ExecutorService/ThreadPoolExecutor → Atomic/CAS → ConcurrentHashMap/BlockingQueue → CompletableFuture → Virtual Threads → ForkJoinPool → AQS</strong>. Those concepts form the foundation for reasoning about Spring Boot concurrency, request handling, parallel processing, asynchronous workflows and shared-state correctness.</p>[m
     </div>[m
 <!-- chatgpt-guide:end -->[m
 </div>[m

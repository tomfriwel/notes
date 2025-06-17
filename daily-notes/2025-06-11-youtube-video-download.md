# Youtube视频下载

macOS 15 Apple Silicon

安装：
`brew install yt-dlp`

查看可供下载：
`yt-dlp -F 'https://www.youtube.com/watch?v=视频ID'`

链接加引号，不然会报错，我遇到了。

运行上面命令会得到：
```sh
ID      EXT   RESOLUTION FPS CH │   FILESIZE    TBR PROTO │ VCODEC           VBR ACODEC      ABR ASR MORE INFO
────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
sb3     mhtml 48x27        0    │                   mhtml │ images                                   storyboard
sb2     mhtml 80x45        0    │                   mhtml │ images                                   storyboard
sb1     mhtml 160x90       0    │                   mhtml │ images                                   storyboard
sb0     mhtml 320x180      0    │                   mhtml │ images                                   storyboard
233     mp4   audio only        │                   m3u8  │ audio only           unknown             [en] Default, low
234     mp4   audio only        │                   m3u8  │ audio only           unknown             [en] Default, high
249-drc webm  audio only      2 │    3.48MiB    48k https │ audio only           opus        48k 48k [en] low, DRC, webm_dash
250-drc webm  audio only      2 │    4.60MiB    63k https │ audio only           opus        63k 48k [en] low, DRC, webm_dash
249     webm  audio only      2 │    3.46MiB    47k https │ audio only           opus        47k 48k [en] low, webm_dash
250     webm  audio only      2 │    4.58MiB    63k https │ audio only           opus        63k 48k [en] low, webm_dash
140-drc m4a   audio only      2 │    9.47MiB   129k https │ audio only           mp4a.40.2  129k 44k [en] medium, DRC, m4a_dash
251-drc webm  audio only      2 │    9.10MiB   124k https │ audio only           opus       124k 48k [en] medium, DRC, webm_dash
140     m4a   audio only      2 │    9.47MiB   129k https │ audio only           mp4a.40.2  129k 44k [en] medium, m4a_dash
251     webm  audio only      2 │    9.07MiB   124k https │ audio only           opus       124k 48k [en] medium, webm_dash
602     mp4   256x144     15    │ ~  6.32MiB    86k m3u8  │ vp09.00.10.08    86k video only
269     mp4   256x144     30    │ ~ 12.44MiB   170k m3u8  │ avc1.4D400C     170k video only
160     mp4   256x144     30    │    3.58MiB    49k https │ avc1.4d400c      49k video only          144p, mp4_dash
603     mp4   256x144     30    │ ~ 12.27MiB   168k m3u8  │ vp09.00.11.08   168k video only
278     webm  256x144     30    │    4.57MiB    62k https │ vp9              62k video only          144p, webm_dash
394     mp4   256x144     30    │    4.14MiB    57k https │ av01.0.00M.08    57k video only          144p, mp4_dash
229     mp4   426x240     30    │ ~ 22.73MiB   310k m3u8  │ avc1.4D4015     310k video only
133     mp4   426x240     30    │    7.86MiB   107k https │ avc1.4d4015     107k video only          240p, mp4_dash
604     mp4   426x240     30    │ ~ 22.06MiB   301k m3u8  │ vp09.00.20.08   301k video only
242     webm  426x240     30    │    6.54MiB    89k https │ vp9              89k video only          240p, webm_dash
395     mp4   426x240     30    │    5.90MiB    81k https │ av01.0.00M.08    81k video only          240p, mp4_dash
230     mp4   640x360     30    │ ~ 55.63MiB   760k m3u8  │ avc1.4D401E     760k video only
134     mp4   640x360     30    │   15.53MiB   212k https │ avc1.4d401e     212k video only          360p, mp4_dash
18      mp4   640x360     30  2 │   38.00MiB   519k https │ avc1.42001E          mp4a.40.2       44k [en] 360p
605     mp4   640x360     30    │ ~ 54.68MiB   747k m3u8  │ vp09.00.21.08   747k video only
243     webm  640x360     30    │   15.82MiB   216k https │ vp9             216k video only          360p, webm_dash
396     mp4   640x360     30    │   11.77MiB   161k https │ av01.0.01M.08   161k video only          360p, mp4_dash
231     mp4   854x480     30    │ ~ 80.48MiB  1100k m3u8  │ avc1.4D401F    1100k video only
135     mp4   854x480     30    │   24.97MiB   341k https │ avc1.4d401f     341k video only          480p, mp4_dash
606     mp4   854x480     30    │ ~ 86.72MiB  1185k m3u8  │ vp09.00.30.08  1185k video only
244     webm  854x480     30    │   23.85MiB   326k https │ vp9             326k video only          480p, webm_dash
397     mp4   854x480     30    │   20.77MiB   284k https │ av01.0.04M.08   284k video only          480p, mp4_dash
232     mp4   1280x720    30    │ ~116.78MiB  1596k m3u8  │ avc1.4D401F    1596k video only
136     mp4   1280x720    30    │   41.57MiB   568k https │ avc1.4d401f     568k video only          720p, mp4_dash
609     mp4   1280x720    30    │ ~155.38MiB  2123k m3u8  │ vp09.00.31.08  2123k video only
247     webm  1280x720    30    │   45.91MiB   628k https │ vp9             628k video only          720p, webm_dash
398     mp4   1280x720    30    │   39.00MiB   533k https │ av01.0.05M.08   533k video only          720p, mp4_dash
270     mp4   1920x1080   30    │ ~343.86MiB  4698k m3u8  │ avc1.640028    4698k video only
137     mp4   1920x1080   30    │  145.87MiB  1994k https │ avc1.640028    1994k video only          1080p, mp4_dash
614     mp4   1920x1080   30    │ ~242.64MiB  3315k m3u8  │ vp09.00.40.08  3315k video only
248     webm  1920x1080   30    │   81.05MiB  1108k https │ vp9            1108k video only          1080p, webm_dash
399     mp4   1920x1080   30    │   72.14MiB   986k https │ av01.0.08M.08   986k video only          1080p, mp4_dash
620     mp4   2560x1440   30    │ ~692.42MiB  9460k m3u8  │ vp09.00.50.08  9460k video only
271     webm  2560x1440   30    │  286.06MiB  3910k https │ vp9            3910k video only          1440p, webm_dash
400     mp4   2560x1440   30    │  214.39MiB  2930k https │ av01.0.12M.08  2930k video only          1440p, mp4_dash
625     mp4   3840x2160   30    │ ~  1.35GiB 18852k m3u8  │ vp09.00.50.08 18852k video only
313     webm  3840x2160   30    │  751.04MiB 10266k https │ vp9           10266k video only          2160p, webm_dash
401     mp4   3840x2160   30    │  431.85MiB  5903k https │ av01.0.12M.08  5903k video only          2160p, mp4_dash
```

字段解析：
在使用 yt-dlp -F（或 yt-dlp --list-formats）命令查看视频可下载的格式时，输出的表格包含多个列，每一列代表视频格式的不同属性。以下是各列的详细解释：

​​1. ID​​
​​含义​​：格式的唯一标识符（数字或字符串）。
​​作用​​：用于指定下载的格式，例如 yt-dlp -f 137+140 表示下载 ID=137 的视频流和 ID=140 的音频流。
​​示例​​：137、250、140 等。

​​2. EXT​​
​​含义​​：文件的扩展名（格式类型）。
​​常见值​​：
mp4：MPEG-4 视频格式。
webm：Google 开发的视频格式，通常用于 VP8/VP9 编码。
m4a：MPEG-4 音频格式。
flv：Flash 视频格式（逐渐淘汰）。
​​作用​​：帮助识别文件的容器格式。

​​3. RESOLUTION​​
​​含义​​：视频的分辨率（宽度 × 高度）。
​​常见值​​：
1920x1080：Full HD（1080p）。
1280x720：HD（720p）。
854x480：SD（480p）。
640x360：SD（360p）。
256x144：低清（144p）。
​​作用​​：选择适合你需求的清晰度。

​​4. FPS​​
​​含义​​：视频的帧率（Frames Per Second，每秒帧数）。
​​常见值​​：
24：电影常用帧率。
25：PAL 制式（欧洲等地区）。
30：NTSC 制式（北美等地区）。
60：高帧率（流畅运动）。
​​作用​​：影响视频的流畅度，高帧率适合动作视频。

​​5. CH​​
​​含义​​：音频的声道数（Channels）。
​​常见值​​：
1：单声道（Mono）。
2：立体声（Stereo）。
6：5.1 环绕声（6 声道）。
​​作用​​：影响音频的立体感和沉浸感。

​​6. FILESIZE​​
​​含义​​：文件的大致大小。
​​单位​​：MiB（Mebibyte，1 MiB ≈ 1.048 MB）。
​​作用​​：帮助你预估下载所需的空间和流量。

​​7. TBR​​
​​含义​​：目标比特率（Target Bitrate）。
​​单位​​：kbps（千比特每秒）。
​​作用​​：影响视频/音频的质量和文件大小，比特率越高，质量越好，文件越大。

​​8. PROTO​​
​​含义​​：传输协议（Protocol）。
​​常见值​​：
https：加密的 HTTP 协议（安全）。
http：未加密的 HTTP 协议（不推荐）。
DASH：Dynamic Adaptive Streaming over HTTP（动态自适应流媒体，用于分段下载）。
HLS：HTTP Live Streaming（苹果的流媒体协议）。
​​作用​​：影响下载方式和兼容性。

​​9. VCODEC​​
​​含义​​：视频编码格式（Video Codec）。
​​常见值​​：
h264（AVC）：广泛使用的视频编码，兼容性好。
h265（HEVC）：高效视频编码，压缩率更高，但需要较新的设备支持。
vp9：Google 开发的开源编码，用于 WebM 格式。
av1：新一代开源编码，压缩率高，但解码需要较强硬件支持。
​​作用​​：影响视频质量和兼容性。

​​10. VBR​​
​​含义​​：视频的比特率（Variable Bitrate，可变比特率）。
​​单位​​：kbps 或 Mbps。
​​作用​​：影响视频质量，比特率越高，质量越好。

​​11. ACODEC​​
​​含义​​：音频编码格式（Audio Codec）。
​​常见值​​：
aac：Advanced Audio Coding，广泛使用的音频编码。
opus：高效音频编码，适用于低延迟场景（如语音）。
mp3：MPEG-1 Audio Layer III，兼容性好但效率较低。
​​作用​​：影响音频质量和文件大小。

​​12. ABR​​
​​含义​​：音频的比特率（Average Bitrate，平均比特率）。
​​单位​​：kbps。
​​作用​​：影响音频质量，比特率越高，音质越好。

​​13. ASR​​
​​含义​​：音频的采样率（Audio Sample Rate）。
​​常见值​​：
44100 Hz：CD 音质标准采样率。
48000 Hz：专业音频常用采样率。
22050 Hz：较低质量采样率。
​​作用​​：影响音频的清晰度和保真度。

​​14. MORE INFO​​
​​含义​​：额外的格式信息（可能包含编码参数、DRM 保护状态等）。
​​常见值​​：
DASH video：表示该格式是 DASH 流媒体的一部分。
DASH audio：表示该格式是 DASH 流媒体的音频部分。
progressive：表示视频和音频是合并的（非流媒体）。
​​作用​​：帮助判断格式是否适合直接下载或需要额外处理。


我单独下载一个mp4没声音，之后加了一个audio，有了。

下载视频+音频：
`yt-dlp -f '401+140' 'https://www.youtube.com/watch?v=视频ID'`
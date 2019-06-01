# LuaFFIJson

LuaFFIJson is a Fast JSON parser library written in LUA FFI. It uses LUA FFI to make JSON decoding very fast. 

It requires <a href="http://luajit.org/luajit.html">LUA JIT</a> and it's also tested with <a href="http://openresty.org/en/">OpenResty</a>.

JSON decode function is very fast compared to existing LUA/C based JSON decoders.

JSON encode function is slow because it is written in pure LUA.

It has no other external dependencies.

It is single file library.

It supports UTF-8 and Unicode.

<b>Sample code:</b>
<pre>
local json = require("JsonParser")
local json_decode = json.decode
local body = [[{
  "en":"I can eat glass and it doesn't hurt me.",
  "zh-Hant":"我能吞下玻璃而不傷身體。",
  "zh-Hans":"我能吞下玻璃而不伤身体。",
  "ja":"私はガラスを食べられます。それは私を傷つけません。",
  "ko":"나는 유리를 먹을 수 있어요. 그래도 아프지 않아요"
}]]
local j = json_decode(body)
print(j)
</pre>
Output:
<pre>
{
  en = "I can eat glass and it doesn't hurt me.",
  ja = "私はガラスを食べられます。それは私を傷つけません。",
  ko = "나는 유리를 먹을 수 있어요. 그래도 아프지 않아요",
  ["zh-Hans"] = "我能吞下玻璃而不伤身体。",
  ["zh-Hant"] = "我能吞下玻璃而不傷身體。"
}
</pre>
Code:
<pre>
print(j["ko"])
</pre>
Output:
<pre>
나는 유리를 먹을 수 있어요. 그래도 아프지 않아요
</pre>
Code:
<pre>
local json_encode = json.encode
local s = json.encode(j)
print(s)
</pre>
Output:
<pre>
{"en":"I can eat glass and it doesn't hurt me.","zh-Hans":"我能吞下玻璃而不伤身体。","ko":"나는 유리를 먹을 수 있어요. 그래도 아프지 않아요","zh-Hant":"我能吞下玻璃而不傷身體。","ja":"私はガラスを食べられます。それは私を傷つけません。"}
</pre>


<b>Benchmark (decode):</b>
<table>
<tr>
<td></td>
<td><b>JsonParser</b></td>
<td><b>cjson</b></td>
<td><b>rapidjson</b></td>
</tr>

<tr>
<td>int test</td>
<td>50ms</td>
<td>91ms</td>
<td>55ms</td>
</tr>

<tr>
<td>float test</td>
<td>64ms</td>
<td>212ms</td>
<td>59ms</td>
</tr>

<tr>
<td>bool test</td>
<td>38ms</td>
<td>69ms</td>
<td>30ms</td>
</tr>

<tr>
<td>utf8 test</td>
<td>22ms</td>
<td>14ms</td>
<td>15ms</td>
</tr>

<tr>
<td>mixed small test</td>
<td>48ms</td>
<td>60ms</td>
<td>47ms</td>
</tr>

<tr>
<td>mixed medium test</td>
<td>133ms</td>
<td>143ms</td>
<td>134ms</td>
</tr>

<tr>
<td>large para test</td>
<td>1260ms</td>
<td>823ms</td>
<td>206ms</td>
</tr>

</table>

<b>Test condition:</b>

10000 iteration for each input type with code warmup on my VM machine (2 core) on Mac OS with openresty/1.13.6.1

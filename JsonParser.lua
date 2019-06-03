local ffi = require("ffi")
local C = ffi.C

-- http://bitop.luajit.org/api.html
local bit = require("bit")
local bit_rshift = bit.rshift
local bit_and = bit.band
local bit_or = bit.bor
local bit_lshift = bit.lshift

-- local NGX = require("NGX")

local string_byte = string.byte
-- local string_sub = string.sub
local string_char = string.char

-- function string_sub( s,i,j )
--   return ""
-- end

local newtab = require "table.new"
local cleartab = require "table.clear"
local table_concat = table.concat

local to_number = tonumber
local to_string = tostring
local t_next = next
local t_pairs = pairs
local v_type = type

local throw_exception = error

local _M = newtab(0, 3)

local OBJECT_START_BYTE = 123
local OBJECT_END_BYTE = 125

local STRING_START_BYTE = 34
local STRING_END_BYTE = 34

local ARRAY_START_BYTE = 91
local ARRAY_END_BYTE = 93

local NULL_START_BYTE = 110
local NULL_END_BYTE = 108

local INT_START_BYTE = 48
local INT_END_BYTE = 57
local MINUS_BYTE = 45
local PLUS_BYTE = 43
local DOT_BYTE = 46
local EXPONENT_UPPER_BYTE = 69
local EXPONENT_LOWER_BYTE = 101

local COMMA_BYTE = 44
local COLON_BYTE = 58

local TRUE_START_BYTE = 116
local TRUE_END_BYTE = 101

local FALSE_START_BYTE = 102
local FALSE_END_BYTE = 101

local Z_LOWER_BYTE = 122

local A_UPPER_BYTE = 65
local Z_UPPER_BYTE = 90

local F_LOWER_BYTE = 102
local A_LOWER_BYTE = 97
local L_LOWER_BYTE = 108
local S_LOWER_BYTE = 115
local E_LOWER_BYTE = 101

local T_LOWER_BYTE = 116
local R_LOWER_BYTE = 114
local U_LOWER_BYTE = 117

local N_LOWER_BYTE = 110

local CONTROL_CHAR_START_BYTE = 0
local CONTROL_CHAR_END_BYTE = 31

local ESCAPE_BYTE = 92

-- whitespace
local SPACE_BYTE = 32
local NEWLINE_BYTE = 10
local CARRIGE_RETURN_BYTE = 13
local TAB_HZ_BYTE = 9

local NULL_TERMINATOR_BYTE = 0

-- NULL placeholder to differentiate with lua nil
local NULL_VALUE = ffi.new("uint8_t[5]", {110,117,108,108,0})

-- double of client_max_body_size = 64k (for compressed request)
local BUFF_MAX_SIZE = 1048576 --1MB
local c_buff = ffi.new("uint8_t[?]", BUFF_MAX_SIZE) -- decode
local string_buff = ffi.new("uint8_t[?]", BUFF_MAX_SIZE)
local out_buff = ffi.new("uint8_t[?]", BUFF_MAX_SIZE * 2) -- encode

local WHITESPACE_ARRAY = {  false,false,false,false,false,false,false,false,true,true,
                            false,false,true,false,false,false,false,false,false,false,
                            false,false,false,false,false,false,false,false,false,false,
                            false,true,
                        }

-- local ESCAPE_CHAR_ARRAY = { false,false,false,false,false,false,false,false,false,false,
--                             false,false,false,false,false,false,false,false,false,false,
--                             false,false,false,false,false,false,false,false,false,false,
--                             false,false,false,'\"',false,false,false,false,false,false,
--                             false,false,false,false,false,false,"/",false,false,false,
--                             false,false,false,false,false,false,false,false,false,false,
--                             false,false,false,false,false,false,false,false,false,false,
--                             false,false,false,false,false,false,false,false,false,false,
--                             false,false,false,false,false,false,false,false,false,false,
--                             false,'\\',false,false,false,false,false,'\b',false,false,
--                             false,'\f',false,false,false,false,false,false,false,'\n',
--                             false,false,false,'\r',false,'\t',
--                         }

local ESCAPE_CHAR_INT_ARRAY = { false,false,false,false,false,false,false,false,false,false,
                            false,false,false,false,false,false,false,false,false,false,
                            false,false,false,false,false,false,false,false,false,false,
                            false,false,false,34,false,false,false,false,false,false,
                            false,false,false,false,false,false,47,false,false,false,
                            false,false,false,false,false,false,false,false,false,false,
                            false,false,false,false,false,false,false,false,false,false,
                            false,false,false,false,false,false,false,false,false,false,
                            false,false,false,false,false,false,false,false,false,false,
                            false,92,false,false,false,false,false,8,false,false,
                            false,12,false,false,false,false,false,false,false,10,
                            false,false,false,13,false,9,
                        }

local NUMBER_ALLOWED_BYTE = { false,false,false,false,false,false,false,false,false,false,
                              false,false,false,false,false,false,false,false,false,false,
                              false,false,false,false,false,false,false,false,false,false,
                              false,false,false,false,false,false,false,false,false,false,
                              false,false,true,false,true,true,false,true,true,true,
                              true,true,true,true,true,true,true,false,false,false,
                              false,false,false,false,false,false,false,false,true,false,
                              false,false,false,false,false,false,false,false,false,false,
                              false,false,false,false,false,false,false,false,false,false,
                              false,false,false,false,false,false,false,false,false,false,
                              true,
                        }

local POW_OF_10 = {
        1e-100, 1e-99, 1e-98, 1e-97, 1e-96, 1e-95, 1e-94, 1e-93, 1e-92, 1e-91,
        1e-90, 1e-89, 1e-88, 1e-87, 1e-86, 1e-85, 1e-84, 1e-83, 1e-82, 1e-81,
        1e-80, 1e-79, 1e-78, 1e-77, 1e-76, 1e-75, 1e-74, 1e-73, 1e-72, 1e-71,
        1e-70, 1e-69, 1e-68, 1e-67, 1e-66, 1e-65, 1e-64, 1e-63, 1e-62, 1e-61,
        1e-60, 1e-59, 1e-58, 1e-57, 1e-56, 1e-55, 1e-54, 1e-53, 1e-52, 1e-51,
        1e-50, 1e-49, 1e-48, 1e-47, 1e-46, 1e-45, 1e-44, 1e-43, 1e-42, 1e-41,
        1e-40, 1e-39, 1e-38, 1e-37, 1e-36, 1e-35, 1e-34, 1e-33, 1e-32, 1e-31,
        1e-30, 1e-29, 1e-28, 1e-27, 1e-26, 1e-25, 1e-24, 1e-23, 1e-22, 1e-21,
        1e-20, 1e-19, 1e-18, 1e-17, 1e-16, 1e-15, 1e-14, 1e-13, 1e-12, 1e-11,
        1e-10, 1e-9,  1e-8,  1e-7,  1e-6,  1e-5,  1e-4,  1e-3,  1e-2,  1e-1,
        1e+0,  
        1e+1,  1e+2,  1e+3,  1e+4,  1e+5,  1e+6,  1e+7,  1e+8,  1e+9,  1e+10,
        1e+11, 1e+12, 1e+13, 1e+14, 1e+15, 1e+16, 1e+17, 1e+18, 1e+19, 1e+20,
        1e+21, 1e+22, 1e+23, 1e+24, 1e+25, 1e+26, 1e+27, 1e+28, 1e+29, 1e+30,
        1e+31, 1e+32, 1e+33, 1e+34, 1e+35, 1e+36, 1e+37, 1e+38, 1e+39, 1e+40,
        1e+41, 1e+42, 1e+43, 1e+44, 1e+45, 1e+46, 1e+47, 1e+48, 1e+49, 1e+50,
        1e+51, 1e+52, 1e+53, 1e+54, 1e+55, 1e+56, 1e+57, 1e+58, 1e+59, 1e+60,
        1e+61, 1e+62, 1e+63, 1e+64, 1e+65, 1e+66, 1e+67, 1e+68, 1e+69, 1e+70,
        1e+71, 1e+72, 1e+73, 1e+74, 1e+75, 1e+76, 1e+77, 1e+78, 1e+79, 1e+80,
        1e+81, 1e+82, 1e+83, 1e+84, 1e+85, 1e+86, 1e+87, 1e+88, 1e+89, 1e+90,
        1e+91, 1e+92, 1e+93, 1e+94, 1e+95, 1e+96, 1e+97, 1e+98, 1e+99, 1e+100,
    }

local CHAR_ESCAPE_UNICODE = {
    "\\u0000",
    "\\u0001","\\u0002", "\\u0003","\\u0004", "\\u0005", "\\u0006", "\\u0007","\\b", "\\t","\\n", 
    "\\u000b","\\f", "\\r", "\\u000e", "\\u000f","\\u0010", "\\u0011", "\\u0012", "\\u0013","\\u0014",
    "\\u0015","\\u0016", "\\u0017","\\u0018", "\\u0019", "\\u001a", "\\u001b","\\u001c", "\\u001d", "\\u001e",
    "\\u001f",false, false, "\\\"", false, false, false, false, false,false,
    false, false, false, false, false, false, "\\/", false, false, false,
    false, false, false, false, false, false, false, false, false, false,
    false, false, false, false, false, false, false, false, false, false,
    false, false, false, false, false, false, false, false, false, false,
    false, false, false, false, false, false, false, false, false, false,
    false, "\\\\", false, false, false, false, false, false, false, false,
    false, false, false, false, false, false, false, false, false, false,
    false, false, false, false, false, false, false, false, false, false,
    false, false, false, false, false, false, "\\u007f",
};

local POW_2_4 = 16
local POW_2_8 = 256
local POW_2_12 = 4096

local ARRAY_SIZE_4 = newtab(4,0)

_M.NULL = NULL_VALUE

local function debug_log( msg )
  -- NGX.error(msg)
end

local parseValue

local function SkipWhitespace(s,i)
  -- body
  local c = c_buff[i-1]
  -- while (c == SPACE_BYTE or c == NEWLINE_BYTE or c == CARRIGE_RETURN_BYTE or c == TAB_HZ_BYTE) do
  -- http://lua-users.org/wiki/OptimisationCodingTips
  -- for loops are quite a bit faster than while loops, since they have specialized virtual machine instructions.
  -- while WHITESPACE_ARRAY[c] do
  for j=1,BUFF_MAX_SIZE do
    if not WHITESPACE_ARRAY[c] then break end
    c = c_buff[i]
    i = i + 1
  end
  return i
end

-- https://tools.ietf.org/html/rfc3629
-- need more strict rules
-- The octet values C0[192], C1[193], F5 to FF [245-255] must never appear.
----------------------------------
-- Syntax of UTF-8 Byte Sequences
----------------------------------
-- UTF8-octets = *( UTF8-char )
-- UTF8-char   = UTF8-1 / UTF8-2 / UTF8-3 / UTF8-4
-- UTF8-1      = %x00-7F
-- UTF8-2      = %xC2-DF UTF8-tail
-- UTF8-3      = %xE0 %xA0-BF UTF8-tail / %xE1-EC 2( UTF8-tail ) / %xED %x80-9F UTF8-tail / %xEE-EF 2( UTF8-tail )
-- UTF8-4      = %xF0 %x90-BF 2( UTF8-tail ) / %xF1-F3 3( UTF8-tail ) / %xF4 %x80-8F 2( UTF8-tail )
-- UTF8-tail   = %x80-BF
function utf8_byte_count(buff,i)
  local c1 = buff[i]
  local c2 = buff[i+1]
  local c3 = buff[i+2]
  local c4 = buff[i+3]
  local bytes = 0
  -- 0xxxxxxx [0-127]
  -- %x00-7F
  if c1 < 128 then
    bytes = 1
  -- 110xxxxx 10xxxxxx [128-191]
  -- %xC2-DF
  elseif c1 >= 194 and c1 <= 223 then
    -- 10xxxxxx
    -- %x80-BF
    if c2 >= 128 and c2 <= 191 then
      bytes = 2
    else
      throw_exception("Invalid UTF-8 second byte:"..c2)
    end
  -- 1110xxxx 10xxxxxx 10xxxxxx
  -- %xE0-EF
  elseif c1 >= 224 and c1 <= 239 then
    -- %xE0 %xA0-BF UTF8-tail
    if c1 == 224 and (c2 >= 160 and c2 <= 191) and (c3 >= 128 and c3 <= 191) then
      bytes = 3
    -- %xE1-EC 2( UTF8-tail )
    elseif (c1 >= 225 and c1 <= 236) and (c2 >= 128 and c2 <= 191) and (c3 >= 128 and c3 <= 191) then
      bytes = 3
    -- %xED %x80-9F UTF8-tail
    elseif c1 == 237 and (c2 >= 128 and c2 <= 159) and (c3 >= 128 and c3 <= 191) then
      bytes = 3
    -- %xEE-EF 2( UTF8-tail )
    elseif c1 >= 238 and c1 <= 239 and (c2 >= 128 and c2 <= 191) and (c3 >= 128 and c3 <= 191) then
      bytes = 3
    else
      throw_exception("Invalid UTF-8 second/third byte:"..c2.." "..c3)
    end
  -- 11110xxx 10xxxxxx 10xxxxxx 10xxxxxx
  elseif c1 >= 240 and c1 <= 244 then
    -- %xF0 %x90-BF 2( UTF8-tail )
    if c1 == 240 and (c2 >= 144 and c2 <= 191) and (c3 >= 128 and c3 <= 191) and (c4 >= 128 and c4 <= 191) then
      bytes = 4
    -- %xF1-F3 3( UTF8-tail )
    elseif (c1 >= 241 and c1 <= 243) and (c2 >= 128 and c2 <= 191) and (c3 >= 128 and c3 <= 191) and (c4 >= 128 and c4 <= 191) then
      bytes = 4
    -- %xF4 %x80-8F 2( UTF8-tail )
    elseif c1 == 244 and (c2 >= 128 and c2 <= 143) and (c3 >= 128 and c3 <= 191) and (c4 >= 128 and c4 <= 191) then
      bytes = 4
    else
      throw_exception("Invalid UTF-8 second/third/fourth byte:"..c2.." "..c3.." "..c4)
    end
  else
    throw_exception("Invalid UTF-8 first byte:"..c1)
  end
  return bytes
end

local function consume_value_utf8(s,i,s_i)
  local p
  local shift = 0
  local c = c_buff[i-1]
  local b_a, b_i
  string_buff[s_i] = c
  s_i = s_i + 1
  if c >= 128 then
    repeat
      c = c_buff[i + shift]
      shift = shift + 1
      string_buff[s_i] = c
      s_i = s_i + 1
    until (c < 128 or c > 191)
    shift = shift - 1
    s_i = s_i - 1
  end
  i = i + shift
  -- if value then tablepool_release("consume_value_utf8_char", b_a) end
  return i, s_i
end

-- https://en.wikipedia.org/wiki/UTF-8
-- http://lua-users.org/wiki/LuaUnicode
-- UTF-8 code point either begins with a byte from 0 to 127,
-- or with a byte from 194 to 244 followed by one or several bytes from 128 to 191
-- UTF8 to ASCII
local function consume_value_utf8_strict(s,i,s_i)
  local shift = utf8_byte_count(c_buff,i-1)

  string_buff[s_i] = c_buff[i-1]
  s_i = s_i + 1
  i = i + 1
  for j=2,shift do
    string_buff[s_i] = c_buff[i-1]
    s_i = s_i + 1
    i = i + 1
  end
  return i-1, s_i
end

local function skipWhitespaceAndComments(s,i)
  -- @TODO skip comment
  return SkipWhitespace(s,i)
end

local function parseArray(s, i)
  -- -- debug_log("parseArray enter")
  local v = newtab(2,0)
  local c
  local v_i = 1
  local tmp
  i = i + 1
  for g=1,BUFF_MAX_SIZE do
    i = skipWhitespaceAndComments(s,i)

    c = c_buff[i-1]

    -- end of array
    if c == ARRAY_END_BYTE then
      v[v_i] = tmp
      return v, i
    end
    if c == COMMA_BYTE then
      v[v_i] = tmp
      v_i = v_i + 1
    else
      tmp, i = parseValue(s,i)
    end
    i = i + 1
  end

end

local function hexToDecimal(c)
  if c >= INT_START_BYTE and c <= INT_END_BYTE then
    return c - INT_START_BYTE
  end
  if c >= A_LOWER_BYTE and c <= F_LOWER_BYTE then
    return 10 + c - A_LOWER_BYTE
  end
  throw_exception("Invalid hex char:"..string_char(c))
end

-- UTF-8 range is U+0000 to U+10FFFF [1114111]
-- UTF-8 prohibits encoding character numbers between
-- U+D800[55296] and U+DFFF[57343], which are reserved for use with the UTF-16
-- encoding form (as surrogate pairs) and do not directly represent characters.
function codepoint_to_utf8(c)
  if(c < 55296 or c > 57343) and c < 1114112 then
    -- 0xxxxxxx or 7F
    if c < 128 then
      return c
    -- 110xxxxx 10xxxxxx
    elseif c < 2048 then
      return 192 + c/64, 128 + c%64
    -- 1110xxxx 10xxxxxx 10xxxxxx
    elseif c < 55296 or 57343 < c and c < 65536 then
      return 224 + c/4096, 128 + c/64%64, 128 + c%64
    -- 11110xxx 10xxxxxx 10xxxxxx 10xxxxxx
    elseif c < 1114112 then
      return 240 + c/262144, 128 + c/4096%64, 128 + c/64%64, 128 + c%64
      -- return 240 + c/2^18, 128 + c/2^12%64, 128 + c/2^6%64, 128 + c%64
    end
  else
    throw_exception("Bad Unicode code point: "..c)
  end
end


function codepoint_to_utf8_new(c)
  if(c < 55296 or c > 57343) and c < 1114112 then
    -- 0xxxxxxx or 7F
    if c < 128 then
      return c
    -- 110xxxxx 10xxxxxx
    elseif c < 2048 then
      return 192 + bit_rshift(c,6), 128 + bit_and(c, 0x3F)
    -- 1110xxxx 10xxxxxx 10xxxxxx
    elseif c < 55296 or 57343 < c and c < 65536 then
      return 224 + bit_rshift(c,12), 128 + bit_and(bit_rshift(c,6), 0x3F), 128 + bit_and(c, 0x3F)
    -- 11110xxx 10xxxxxx 10xxxxxx 10xxxxxx
    elseif c < 1114112 then
      return 240 + bit_rshift(c,18), 128 + bit_and(bit_rshift(c,12), 0x3F), 128 + bit_and(bit_rshift(c,6), 0x3F), 128 + bit_and(c, 0x3F)
      -- return 240 + c/2^18, 128 + c/2^12%64, 128 + c/2^6%64, 128 + c%64
    end
  else
    throw_exception("Bad Unicode code point: "..c)
  end
end

-- @TODO add validation for unicode
-- https://github.com/openresty/lua-cjson/blob/master/lua_cjson.c#L910
local function unicodeToUTF8(s, i, s_i)
  -- NGX.error("unicodeToUTF8 inside")
  local byte = 0;
  local c
  local p = ARRAY_SIZE_4
  for j=1,4 do
    c = c_buff[i]
    i = i + 1

    p[j] = hexToDecimal(c)
    -- NGX.error(t(p[j]))
  end
  local a,b,c,d = codepoint_to_utf8_new(p[1] * POW_2_12 + p[2] * POW_2_8 + p[3] * POW_2_4 + p[4])
  -- local a,b,c,d = codepoint_to_utf8_new(bit.lshift(p[1],12) + bit.lshift(p[2],8) + bit.lshift(p[3],4) + p[4])
  -- NGX.error((p[1] * POW_2_12 + p[2] * POW_2_8 + p[3] * POW_2_4 + p[4]).." "..(bit.lshift(p[1],12) + bit.lshift(p[2],8) + bit.lshift(p[3],4) + p[4]))
-- NGX.error(t(a).." "..t(b).." "..t(c).." "..t(d).." "..t(p[1] * 2^12 + p[2] * 2^8 + p[3] * 2^4 + p[4]))
  if a then
    string_buff[s_i] = a
    s_i = s_i + 1
  end
  if b then
    string_buff[s_i] = b
    s_i = s_i + 1
  end
  if c then
    string_buff[s_i] = c
    s_i = s_i + 1
  end
  if d then
    string_buff[s_i] = d
    s_i = s_i + 1
  end
  return s_i
end

-- @TODO add unicode support
-- try SIMD
-- refer: https://github.com/xpol/lua-rapidjson/blob/master/rapidjson/include/rapidjson/reader.h#L1061
local function parseString(s, i)
  -- debug_log("parseString enter")
  local j = i
  local c = c_buff[i-1]
  if c ~= STRING_START_BYTE then
    throw_exception("Invalid char. expected:\" found:"..string_char(c).." at index:"..i)
  end
  i = i + 1
  local s_i = 0
  local sc

  for g=1,BUFF_MAX_SIZE do
    c = c_buff[i-1]
    -- skip escaped quote
    if c == ESCAPE_BYTE then
      c = c_buff[i]
      i = i + 1
      sc = ESCAPE_CHAR_INT_ARRAY[c]
      if sc then
        string_buff[s_i] = sc
        s_i = s_i + 1
      -- unicode read 4-byte
      elseif c == U_LOWER_BYTE then
        s_i = unicodeToUTF8(s,i,s_i)
        i = i + 4
        -- throw_exception("unicode not supported. found at index:"..i)
      else
        throw_exception("escape char: "..string_char(c).." not supported at index:"..i)
      end
    -- end of object
    elseif c == STRING_END_BYTE then
      local tmp = ffi.string(string_buff, s_i)
      return tmp, i
    else
      -- @TODO improve this
      i , s_i = consume_value_utf8_strict(s,i,s_i) --utf8_char(c)
    end
    i = i + 1
  end
end

local function parseTrue(s, i)
  -- debug_log("parseTrue enter")

  if c_buff[i] == R_LOWER_BYTE and c_buff[i+1] == U_LOWER_BYTE and c_buff[i+2] == E_LOWER_BYTE then
    return true, i + 3
  else
    -- debug_log("parseFalse val:")
    throw_exception("Invalid true")
  end
end

local function parseFalse(s, i)
  -- debug_log("parseFalse enter")

  if c_buff[i] == A_LOWER_BYTE and c_buff[i+1] == L_LOWER_BYTE and c_buff[i+2] == S_LOWER_BYTE and c_buff[i+3] == E_LOWER_BYTE then
    return false, i + 4
  else
    -- debug_log("parseFalse val:")
    throw_exception("Invalid false")
  end
end

local function parseNull(s, i)
  -- debug_log("parseNull enter")

  if c_buff[i] == U_LOWER_BYTE and c_buff[i+1] == L_LOWER_BYTE and c_buff[i+2] == L_LOWER_BYTE then
    return NULL_VALUE, i + 3
  else
    -- debug_log("parseFalse val:")
    throw_exception("Invalid null")
  end
end

-- @TODO hex support
-- @TODO NaN and Inf support (although not in json standard)
-- @TODO handle number underflow & overflow
local function parseNumber(s, i)
  -- debug_log("parseNumber enter")
  local j = i
  local c = c_buff[i-1]
  local int = 0
  local minus = 1

  if c == MINUS_BYTE then
    minus = -1
    c = c_buff[i]
    i = i + 1
  end

  -- parse int part
  if c == INT_START_BYTE then
    int = 0
    c = c_buff[i]
    i = i + 1
  elseif c > INT_START_BYTE and c <= INT_END_BYTE then
    while c >= INT_START_BYTE and c <= INT_END_BYTE do
      int = int * 10 + (c - INT_START_BYTE)
      c = c_buff[i]
      i = i + 1
    end
  else
    throw_exception("Invalid char "..string_char(c).." at index:"..i)
  end
  
  -- NGX.error("Int part:"..int)
  --parse decimal part
  local d = int
  local ef = 0
  if c == DOT_BYTE then
    c = c_buff[i]
    i = i + 1
    while c >= INT_START_BYTE and c <= INT_END_BYTE do
      d = d * 10.0 + (c - INT_START_BYTE)
      ef = ef - 1
      c = c_buff[i]
      i = i + 1
    end
  end
  -- NGX.error("d part:"..d)
  -- parse exponential part
  local e = 0
  if c == EXPONENT_LOWER_BYTE or c == EXPONENT_UPPER_BYTE then
    local expMinus = 1;
    c = c_buff[i]
    i = i + 1
    if c == PLUS_BYTE then
      c = c_buff[i]
      i = i + 1
    elseif c == MINUS_BYTE then
      expMinus = -1;
      c = c_buff[i]
      i = i + 1
    end

    if c >= INT_START_BYTE and c <= INT_END_BYTE then
      while c >= INT_START_BYTE and c <= INT_END_BYTE do
        e = e * 10 + (c - INT_START_BYTE)
        c = c_buff[i]
        i = i + 1
      end
    else
      throw_exception("Invalid char "..string_char(c).." at index:"..i)
    end
    e = e * expMinus
  end

  local exp = e + ef

  if exp > 100 or exp < -100 then
    throw_exception("Exponential > 100 or < -100 not supported. exp:"..exp)
  end

  -- NGX.error("ef part:"..ef.." e:"..e)
  local tmp = minus * d * POW_OF_10[exp + 1 + 100]
-- NGX.error("final:"..tmp)
  return tmp, i-1
end

local function parseObject(s, i)
  -- debug_log("parseObject enter")
  local c, index, key, value
  local result = newtab(0,2)
  for g=1,BUFF_MAX_SIZE do
    i = i + 1

    i = skipWhitespaceAndComments(s,i)

    c = c_buff[i-1]

    -- empty object
    if c == OBJECT_END_BYTE then
      -- debug_log("object exit 1")
      return result,i
    end

    -- get key
    key, index = parseString(s, i)
    i = index + 1
    -- result[key] = {}

    i = skipWhitespaceAndComments(s,i)

    -- debug_log("parseObject key:"..t(key))

    c = c_buff[i-1]

    if c ~= COLON_BYTE then
      -- debug_log("colon missing")
      throw_exception("Invalid byte: colon missing")
    end

    -- skip colon
    i = i + 1

    i = skipWhitespaceAndComments(s,i)

    -- get value
    value, index = parseValue(s, i)
    result[key] = value
    i = index + 1

    i = skipWhitespaceAndComments(s,i)

    -- end of object
    c = c_buff[i-1]

    -- debug_log("object before next loop:"..t(utf8_char(c)))

    if c ~= OBJECT_END_BYTE and c ~= COMMA_BYTE then
      -- debug_log("object end missing. found:"..t(utf8_char(c)))
      throw_exception("object end missing. found:"..string_char(c))
    end

    if c == COMMA_BYTE then
      i = skipWhitespaceAndComments(s,i)
    elseif c == OBJECT_END_BYTE then
      -- debug_log("object exit 2")
      return result, i
    end
  end

  return i

end

local VALUE_PARSE_METHOD = {false,false,false,false,false,false,false,false,false,false,
                            false,false,false,false,false,false,false,false,false,false,
                            false,false,false,false,false,false,false,false,false,false,
                            false,false,false,parseString,false,false,false,false,false,false,
                            false,false,false,false,parseNumber,false,false,parseNumber,parseNumber,parseNumber,
                            parseNumber,parseNumber,parseNumber,parseNumber,parseNumber,parseNumber,parseNumber,false,false,false,
                            false,false,false,false,false,false,false,false,false,false,
                            false,false,false,false,false,false,false,false,false,false,
                            false,false,false,false,false,false,false,false,false,false,
                            parseArray,false,false,false,false,false,false,false,false,false,
                            false,parseFalse,false,false,false,false,false,false,false,parseNull,
                            false,false,false,false,false,parseTrue,false,false,false,false,
                            false,false,parseObject,false,false,false,false,
                          }

parseValue = function(s, i)
    local parser
    local c = c_buff[i-1]
    parser = VALUE_PARSE_METHOD[c]
    if parser then
      return parser(s, i)
    end
      -- debug_log("Unknown type:"..c.." "..utf8_char(c))
    throw_exception("Invalid value: "..string_char(c).." at index:"..i)
  end

-- https://www.ietf.org/rfc/rfc4627.txt
function _M.decode(s)

  -- Insignificant whitespace is allowed before or after any of the six
  -- structural characters
  -- These are the six structural characters:

  --  begin-array     = ws %x5B ws  ; [ left square bracket
  --  begin-object    = ws %x7B ws  ; { left curly bracket
  --  end-array       = ws %x5D ws  ; ] right square bracket
  --  end-object      = ws %x7D ws  ; } right curly bracket
  --  name-separator  = ws %x3A ws  ; : colon
  --  value-separator = ws %x2C ws  ; , comma
  local len = #s
  if len >= BUFF_MAX_SIZE then
    throw_exception("String max size supported exceed. max supported size:"..BUFF_MAX_SIZE.." Actual size:"..len)
  end

  -- copy data in c_buff
  ffi.copy(c_buff,s)
  local result,index = parseValue(s, skipWhitespaceAndComments(s, 1))

  -- we may skip last 3 lines for performance
  index = skipWhitespaceAndComments(s, index + 1)
  index = index - 1
  -- check if we have parsed all bytes
  if index ~= len then
    throw_exception("Not all byte parsed. Malformed string. read count:"..index.." actual string byte count:"..#s)
  end

  return result
end

-----------------------------------------------------
-- encode
-----------------------------------------------------

local function addUnicodeToBuffer(buff,s,i)
  local len = #s
  local c
  local index = 1
  while index <= len do
    c = string_byte(s,index)
    buff[i] = c
    i = i + 1
    index = index + 1
  end
  return i
end

local function addToBuffer(buff,v,i,is_byte)
  if is_byte then
    buff[i] = v
    return i + 1
  end
  local s = to_string(v)
  local c, esc
  local len = #s
  local index = 1
  while index <= len do
    -- NGX.error("i:"..i..",v:"..string.sub(s,j,j))
    c = string_byte(s,index)
    esc = CHAR_ESCAPE_UNICODE[c + 1]
    -- if esc then
    --   c = esc
    -- end
    -- NGX.error(string_char(c)..",esc:"..t(esc))
    if esc then
      -- index = index + 1
      -- c = string.byte(s,index)
      -- -- convert to unicode
      -- c = ESCAPE_CHAR_INT_ARRAY[c]
      -- if not c then
      --   c = string.byte(s,index)
      i = addUnicodeToBuffer(buff,esc,i)
      -- c = string.byte(s,index)
      -- NGX.error(string_char(c).." "..c)
        -- throw_exception("escape char: \\"..string_char(string.byte(s,index)).." not supported")
      -- end
    else
      buff[i] = c
      i = i + 1
    end
    index = index + 1
  end
  return i
end

local function table_string(t,i,o_buff)

  if t == nil then
    return i
  end

  if t_next(t) == nil then
   i = addToBuffer(o_buff,OBJECT_START_BYTE,i,true)
   i = addToBuffer(o_buff,OBJECT_END_BYTE,i,true)
   return i 
  end

  local remeber = {}
  local a = false
  local t_v
  local len = #t
  for j=1,len do
    local v = t[j]
    if not a then
      i = addToBuffer(o_buff,ARRAY_START_BYTE,i,true)
      a = true
    end
    t_v = v_type(v)
    if t_v == 'table' then
      i = table_string(v,i,o_buff)
    elseif v == NULL_VALUE then
      -- NGX.error(k.." - ".."null")
      i = addToBuffer(o_buff,N_LOWER_BYTE,i,true)
      i = addToBuffer(o_buff,U_LOWER_BYTE,i,true)
      i = addToBuffer(o_buff,L_LOWER_BYTE,i,true)
      i = addToBuffer(o_buff,L_LOWER_BYTE,i,true)
    elseif t_v == 'string' then
      -- NGX.error(k.." - "..tostring(v))
      i = addToBuffer(o_buff,STRING_START_BYTE,i,true)
      i = addToBuffer(o_buff,v,i)
      i = addToBuffer(o_buff,STRING_END_BYTE,i,true)
    else
      -- NGX.error(k.." - "..tostring(v))
      i = addToBuffer(o_buff,v,i)
    end
    -- NGX.error("k --:"..k)
    remeber[j] = true
    i = addToBuffer(o_buff,COMMA_BYTE,i,true)
  end
  if a then
    i = i - 1
    i = addToBuffer(o_buff,ARRAY_END_BYTE,i,true)
  end

  local b = false
  for k,v in t_pairs(t) do
  if not remeber[k] then
    if not b then
      if a then i = addToBuffer(o_buff,COMMA_BYTE,i,true) end
      i = addToBuffer(o_buff,OBJECT_START_BYTE,i,true)
      b = true
    end
    i = addToBuffer(o_buff,STRING_START_BYTE,i,true)
    i = addToBuffer(o_buff,k,i)
    i = addToBuffer(o_buff,STRING_END_BYTE,i,true)
    i = addToBuffer(o_buff,COLON_BYTE,i,true)
    t_v = v_type(v)
    if t_v == 'table' then
      i = table_string(v,i,o_buff)
    elseif v == NULL_VALUE then
      -- NGX.error(k.." -> ".."null")
      i = addToBuffer(o_buff,'null',i)
    elseif t_v == 'string' then
      -- NGX.error(k.." -> "..tostring(v))
      i = addToBuffer(o_buff,STRING_START_BYTE,i,true)
      i = addToBuffer(o_buff,v,i)
      i = addToBuffer(o_buff,STRING_END_BYTE,i,true)
    else
      -- NGX.error(k.." -> "..tostring(v))
      i = addToBuffer(o_buff,v,i)
    end
    i = addToBuffer(o_buff,COMMA_BYTE,i,true)
    -- NGX.error("k ->:"..k)
  end
  end
  if b then
    i = i - 1
    i = addToBuffer(o_buff,OBJECT_END_BYTE,i,true)
  end
  -- NGX.error("return i:"..i)
  return i
end

function _M.encode(t)

  if v_type(t) ~= 'table' then
    throw_exception("Invalid type. expected: table, found:"..v_type(t))
  end

  local i = table_string(t,0,out_buff)

  -- NGX.error("i:"..i)

  local str = ffi.string(out_buff,i)
  return str
end

return _M

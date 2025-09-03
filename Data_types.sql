-- ============================ Character/String Types ============================
CHAR(n) 									
-- Fixed-length, n characters.
   
VARCHAR(n) / CHARACTER VARYING(n) 		
-- Variable length, up to n characters.

TEXT	
-- Variable-length text of any size.
   
ENUM 									
-- MySQL-specific enumerated（枚举值）values. 
-- PostgreSQL also supports ENUM, but it requires CREATE TYPE first.
   
-- LONGTEXT 		
-- Large text data, MySQL-specific. Use TEXT in PostgreSQL

-- CLOB 			
-- Character Large Object, Oracle/DB2 specific. Use TEXT in PostgreSQL.

-- NCHAR(n) / NVARCHAR(n) 				
-- Unicode character types.
-- All character types in PostgreSQL are UTF-8, so CHAR/VARCHAR can be used directly for Unicode
	
-- ============================ Numeric Types ============================
-- -------------------- Integer Types --------------------
-- TINYINT / INT1 			
-- 1 byte, typically -128 to 127 or 0 to 255.

SMALLINT / INT2 			
-- 2 bytes, typically -32,768 to 32,767.

INT / INTEGER / INT4 		
-- 4 bytes, typically approx. ±2.1 billion.

BIGINT / INT8 			
-- 8 bytes, very large integer range.

BOOLEAN 					
-- Represents true or false.

-- -------------------- Decimal Types --------------------
-- Stores each digit precisely, akin to a string.
-- Can exactly represent any number within its defined precision.
-- Slower calculations, results are exact with no rounding error. 
-- Financial calculations or other scenarios requiring precise results.

DECIMAL(p, s) / NUMERIC(p, s)
-- p: precision (total number of digits)
-- s: scale (number of digits after the decimal point)
-- Example:
DECIMAL(10, 2) 
-- Can store a value like 12345678.99

-- -------------------- Floating Point Types --------------------
-- Uses the IEEE 754 standard, stored as sign bit + exponent + significand (mantissa) 符号位+指数位+尾数位.
-- Cannot precisely represent all decimal fractions.
-- Example: 0.1 cannot be represented exactly in binary floating-point, leading to a tiny rounding error.
-- Faster (hardware supported), but may accumulate rounding errors. 
-- Suitable for scientific calculations or scenarios where absolute precision is not critical.

FLOAT(n) 
-- (In PostgreSQL, FLOAT(p) only accepts a precision p between 1 and 53).

REAL 
-- (Typically 4 bytes, approx. 7 decimal digits of precision).

DOUBLE PRECISION / FLOAT8 
-- (Typically 8 bytes, approx. 15 decimal digits of precision).

-- -------------------- Binary Types --------------------
-- 二进制类型

-- BINARY(n) 
-- Fixed-length binary data.

-- VARBINARY(n) 
-- Variable-length binary data.

-- BLOB / LONGBLOB 
-- Binary Large Object.

-- RAW 
-- Oracle's binary data type.

BYTEA 
-- PostgreSQL's binary data type.

-- ============================ Date/Time Types ============================
DATE 
-- Date only (no time).
-- YYYY-MM-DD

TIME 
-- Time only (no date).

TIMESTAMP 
-- Date and time (often auto-updated, can be with or without time zone).
-- YYYY-MM-DD HH:MM:SS
-- YYYY-MM-DD HH:MM:SS+HH

INTERVAL 
-- A span of time.
-- EXP:
-- 6 days 01:48:08
-- 00:51:03

-- DATETIME 
-- MySQL-specific, date and time.

-- YEAR 
-- MySQL-specific, year value.

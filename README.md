#  Complex-number-lua-system

Making complex number for lua with lua built in Library

`Example How To Use`

- Creating  new complex class
```lua
	local C1 = complex.new(1,2) --1 + 2i
	local C2 = complex.new(2,1) --2 + 1i
```
 - Arithmetic operation
```lua
	local C1 = complex.new(1,2) --1 + 2i
	local C2 = complex.new(2,1) --2 + 1i
	local Add = C1 + C2 --  3 + 3i
	local Del = C1 - C2 -- -1 + 1i
	local Mul = C1 * C2 -- 0 + 5i
	local Div = C1 / C2 -- 4/5 + 3i/5
	local Pow = C1^2 -- -3 + 4i
```
 - Property
```lua
	local C1 = complex.new(3,4) -- 3 + 4i
	local C2 = complex.new(1,0) -- 1 + 0i
	local Size,Range = C1.Size,C1.Range --Same each other
	local Angle_1 = C1.Angle -- 53.13 degrees
	local Angle_2 = C2.Angle -- 0 degrees
	local Polar_1 = C1.Polar -- 5(cos(53) + sin(53)i)
	local Polar_2 = C2.Polar -- 1(cos(0) + sin(0))
```
  

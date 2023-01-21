meta = {}
meta.__add = function(a,b)
 local re = a[1] + b[1]
 local im = a[2] + b[2]
 
 return complex.new(re,im)
end

meta.__sub = function(a,b)
 local re = a[1] - b[1]
 local im = a[2] - b[2]
 
 return complex.new(re,im)
end

meta.__mul = function(a,b)
 local re
 local im
    if type(b) == "number" then 
        re = a[1] * b 
        im = a[2] * b
    else
        re = (a[1]*b[1]) - (a[2] * b[2])
        im = (a[1]*b[2]) + (a[2] * b[1])

end
 
 return complex.new(re,im)
end
meta.__div = function(a,b)
 local re
 local im
 local new_complex
    if type(b) == "number" then 
        re = a[1]/b 
        im = a[2]/b
    else
        return (a * b.Conjugate) / (b.Size^2)
    end 
    
 return complex.new(re,im)
end 
meta.__tostring = function(a)
    if a[2] < 0 then 
        return a[1].." - "..math.abs(a[2]) .."i"
    else
        return a[1].." + "..a[2] .."i"
    end 
 
end
meta.__index = function(a,key)
if key == "Range" or key == "Size" then
 return (a[1]^2 + a[2]^2)^(1/2)
 elseif key == "Angle" then
   local a_tan = math.atan(a[2]/a[1])
   if a[1] < 0 then 
        return 180+math.deg(a_tan),a_tan
   else
    if a[2] < 0 then
        return 360+math.deg(a_tan),a_tan
    end
   end 
   
  return math.deg(a_tan),a_tan
 elseif key:lower():find("polar") then
   local angle = a.Angle
  return a.Size.."(cos("..angle..") + i*sin("..angle.."))"
  elseif key == "Conjugate" then
    return complex.new(a[1],-a[2])
end
end


complex= {}
complex.new = function(re,im)
 local matrix = {re,im}
 
 setmetatable(matrix,meta)
 return matrix
end

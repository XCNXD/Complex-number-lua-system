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
meta.__pow = function(a,b)
    local comp = a
    if b == 0 then 
        return complex.new(1,0)
    elseif b == 1 then 
        return a 
    elseif b>0 and b<1 then 
        return "Support soon"
    else
        local temp = a
        for i = 2,b do 
            comp = comp*temp
        end 
    end 

    return comp
end 
meta.__tostring = function(a)
    if a[2] < 0 then 
        return a[1].." - "..math.abs(a[2]) .." i"
    elseif a[2] == 0 then 
        return a[1].." + ".."0 i"
    else 
        return a[1].." + "..a[2] .." i"
    end 
 
end

meta.__index = function(a,key)
if key == "Range" or key == "Size" then
 return (a[1]^2 + a[2]^2)^(1/2)

 elseif key == "Angle" then
    local re = a[1]
    local im = a[2]
    local atan = math.atan2(im,re)
    if atan < 0 then 
        atan = (atan+2*math.pi)
    end 
  return math.deg(atan);
 elseif key == "Polar" then
   local angle = a.Angle
  return a.Size.."(cos("..angle..") + i*sin("..angle.."))";

  elseif key == "Conjugate" then
    return complex.new(a[1],-a[2]);

end
end


complex= {}
complex.new = function(re,im)
 local matrix = {re,im}
 
 setmetatable(matrix,meta)
 return matrix
end


getgenv().complex = complex

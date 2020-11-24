Vector = {};
Vector.__index = Vector;

local kEpsilon = 0.00001;
local kEpsilonNormalSqrt = 1e-15;

function Vector:Create(x, y, z)
    local v = setmetatable({}, Vector);

    v.size = 1;

    if(type(x)=="number")then
        v.x = x;
        if(y)then v.y = y; v.size = v.size+1; end;
        if(z)then v.z = z; v.size = v.size+1; end;
    elseif(type(x)=="table")then
        v.x = x[1] or 0;
        if(x[2])then v.y = x[2]; v.size = v.size+1; end;
        if(x[3])then v.z = x[3]; v.size = v.size+1; end;
    else
        error("Vector: Expected number or table value");
        return false;
    end

    return v;
end

function setElementVectorPosition(e, v)
    setElementPosition(e, v.x, v.y, v.z)
end

function getElementVectorPosition(e)
    return vector:create(getElementPosition(e));
end
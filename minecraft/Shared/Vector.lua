Vector = {};
Vector.__index = Vector;

local kEpsilon = 0.00001;
local kEpsilonNormalSqrt = 1e-15;

function Vector:Create(x, y, z)
    local v = setmetatable({}, Vector);

    v.size = 1;

    if(type(x)=="number")then
        v.x = x;
        if(y)then v.y = y; v.size = v.size+1; else v.y = false; end;
        if(z)then v.z = z; v.size = v.size+1; else v.z = false; end;
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

function Vector:Clone()
    return Vector:Create(self.x, (self.size>1 and self.y), (self.size>2 and self.z));
end

function is_vector(v)
    return getmetatable(v)==Vector;
end

function Vector.__add(v1, v2)
    if(is_vector(v1) and type(v2)=="number")then
        return Vector:Create(v1.x+v2, (v1.size>1 and v1.y+v2), (v1.size>2 and v1.z+v2));
    elseif(is_vector(v2) and type(v1)=="number")then
        return Vector:Create(v2.x+v1, (v2.size>1 and v2.y+v1), (v2.size>2 and v2.z+v1));
    else
        if(v1.size==v2.size)then
            return Vector:Create(v1.x+v2.x, (v1.size>1 and v1.y+v2.y), (v1.size>2 and v1.z+v2.z));
        else
            error("Vector sizes incompatible");
        end
    end
end

function Vector.__sub(v1, v2)
    if(is_vector(v1) and type(v2)=="number")then
        return Vector:Create(v1.x-v2, (v1.size>1 and v1.y-v2), (v1.size>2 and v1.z-v2));
    elseif(is_vector(v2) and type(v1)=="number")then
        return Vector:Create(v2.x-v1, (v2.size>1 and v2.y-v1), (v2.size>2 and v2.z-v1));
    else
        if(v1.size==v2.size)then
            return Vector:Create(v1.x-v2.x, (v1.size>1 and v1.y-v2.y), (v1.size>2 and v1.z-v2.z));
        else
            error("Vector sizes incompatible");
        end
    end
end

function Vector.__mul(v1, v2)
    if(is_vector(v1) and type(v2)=="number")then
        return Vector:Create(v1.x*v2, (v1.size>1 and v1.y*v2), (v1.size>2 and v1.z*v2));
    elseif(is_vector(v2) and type(v1)=="number")then
        return Vector:Create(v2.x*v1, (v2.size>1 and v2.y*v1), (v2.size>2 and v2.z*v1));
    else
        if(v1.size==v2.size)then
            return Vector:Create(v1.x*v2.x, (v1.size>1 and v1.y*v2.y), (v1.size>2 and v1.z*v2.z));
        else
            error("Vector sizes incompatible");
        end
    end
end

function Vector.__unm(v1)
    if(is_vector(v1))then
        return Vector:Create(-v1.x, (v1.size>1 and -v1.y), (v1.size>2 and -v1.z));
    else
        error("Vector expected");
    end
end

function setElementVectorPosition(e, v)
    setElementPosition(e, v.x, v.y, v.z)
end

function getElementVectorPosition(e)
    return vector:create(getElementPosition(e));
end
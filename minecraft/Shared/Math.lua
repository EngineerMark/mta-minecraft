Deg2Rad = math.pi*2/360;
Rad2Deg = 1/Deg2Rad;

function math.clamp(value, min, max)
    return math.min(max, math.max(min, value));
end

function math.clamp01(value)
    return math.clamp(value, 0, 1);
end

function math.lerp(a, b, t)
    return a+(b-a)*math.clamp01(t);
end

function math.lerpUnclamped(a, b, t)
    return a+(b-a)*t;
end

function math._repeat(t, length)
    return math.clamp(t-math.floor(t/length)*length, 0, length);
end

function math.lerpAngle(a, b, t)
    local delta = math._repeat((b-a), 360);
    if(delta>180)then
        delta = delta-180;
    end
    return a+delta*math.clamp01(t);
end

function math.sign(value)
    if(value<0)then
        return -1;
    end
    return 1;
end

function math.moveTowards(current, target, maxDelta)
    if(math.abs(target-current)<=maxDelta)then
        return target;
    end
    return current+math.sign(target-current)*maxDelta;
end

function math.moveTowardsAngle(from, to, t)
    t = math.clamp01(t);
    t = -2*t*t*t+3*t*t;
    return to*t+from*(1-t);
end

function math.gamma(value, absmax, gamma)
    local negative = value<0;
    local absval = math.abs(value);
    if(absval>absmax)then
        return (negative and -absval or absval);
    end
    local result = math.pow(absval/absmax, gamma)*absmax;
    return (negative and -result or result);
end
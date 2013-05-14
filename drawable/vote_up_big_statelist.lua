---
-- @usage exported
function createDrawable(Drawables)
    local drawable = Drawables:StateListDrawable()
    
    drawable:addState("state_pressed", "black")
    drawable:addState("*", "red")
    
    return drawable
end

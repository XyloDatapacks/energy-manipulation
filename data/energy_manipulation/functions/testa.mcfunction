data merge storage xylo_retina:input {HorizontalCount:1b,VerticalCount:1b,CenteredCount:0b,SpreadFactor:[100,100],EndpointEntity:0b,MaxRecursionDepth:50,TargetEntities:true,OverrideExecutingEntity:true}
tag @s add retina.executing
execute anchored eyes positioned ^ ^ ^ run function xylo_retina:traverse/setup_no_entity
tag @s remove retina.executing


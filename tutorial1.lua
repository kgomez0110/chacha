scriptId = 'com.thalmic.examples.myfirstscript'  
    scriptTitle = "My First Script"  
    scriptDetailsUrl = ""

    function onForegroundWindowChange(app, title)  
        myo.debug("onForegroundWindowChange: " .. app .. ", " .. title)
        return true
    end

    function onPoseEdge(pose, edge)
    	myo.debug("Current Pose: " .. pose .. " Edge: " .. edge)
    	return true
    end
